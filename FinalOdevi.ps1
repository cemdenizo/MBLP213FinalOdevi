#Bu Powershell scripti schedule job başlatır.
#Script, anlık olarak CPU kullanımı %10 u geçtiğinde 
#process adı ve yüzdeleri CpuLog.txt dosyasına yazar.

$taskName = "CpuTask"
#CpuTask in tanımlı olup olmadığına bak
$taskExists = Get-ScheduledTask | Where-Object {$_.TaskName -eq $taskName }
#CpuTask in çalıştırcağı scriptin yeri
$psScript = "C:\Users\cdona\Documents\PoweShell\FinalOdevi.ps1"
#Task, scripti çalıştırsın
$taskAction = New-ScheduledTaskAction -Execute $psScript
#Task her gün saat 12 de 1 kez 1 saat boyunca 5dk da bir çalışacak
$taskTrigger = New-ScheduledTaskTrigger `
    -Once -At 12:00pm `
    -RepetitionInterval (New-TimeSpan -Minutes 5) `
    -RepetitionDuration (New-TimeSpan -Hours 1)
$description = "Yüzde 10 CPU kullanımını geçen processleri loglar"


if($taskExists) {
   #Birşey yapma 
} else {
    #Taski tanımla
    Register-ScheduledTask `
        -TaskName $taskName `
        -Action $taskAction `
        -Trigger $taskTrigger `
        -Description $description
}
while($true){
    $logFile = "C:\Users\cdona\Documents\PoweShell\CpuLog.txt"
    $CpuCores = (Get-WMIObject Win32_ComputerSystem).NumberOfLogicalProcessors
    $CpuTime = (Get-Counter "\Process(*)\% Processor Time" -ErrorAction SilentlyContinue).CounterSamples | Select InstanceName, 
    @{Name="CPU %";Expression={[Decimal]::Round(($_.CookedValue / $CpuCores), 2)}} `
     | sort *CPU* -Descending | select -First 5 `
     | where-object{ $_.InstanceName -ne "_total" -and $_.InstanceName -ne "idle"}
  
  #CpuTime içinde %10 dan fazla varsa log dosyasına yaz
     foreach($sonuc in $CpuTime){
        if($sonuc.'CPU %' -gt 1){
            Write-Output "$sonuc  $(Get-Date -Format "yyyy/MM/dd HH:mm:ss")" | Out-file $logFile -append
            #Write-Host "$sonuc  $(Get-Date -Format "yyyy/MM/dd HH:mm:ss")"
        }
     }
Start-Sleep 3
}
