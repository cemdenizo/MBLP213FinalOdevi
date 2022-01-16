#Cem Deniz Önalp 20MY93301
#MBLP213 final ödevi
#
#Powershell scripti ile powershell schedule job tasarlanacakır
#job ın çalıştırcağı komut içerik olarak;
#İşletim sisteminde arkada çalışan programları task manager 
#mantığı ile izleyerek Cpu yüzdesi %10 veya yukarı işlemleri
#bir log dosyası oluşturulup Örnek: "Task.log", 
#içine  zaman damgası ile 
#"2021-01-10 13:12:04,634 text.exe Cpu 20%"  
#uygulama isimleri ve cpu yüzdeleri kaydedilecektir


do{
    $CpuCores = (Get-WMIObject Win32_ComputerSystem).NumberOfLogicalProcessors
    $CpuTime = (Get-Counter "\Process(*)\% Processor Time" -ErrorAction SilentlyContinue).CounterSamples | Select InstanceName, 
    @{Name="CPU %";Expression={[Decimal]::Round(($_.CookedValue / $CpuCores), 2)}} `
     | sort *CPU* -Descending | select -First 10 `
     | where-object{ $_.InstanceName -ne "_total" -and $_.InstanceName -ne "idle"}
  

     foreach($sonuc in $CpuTime){
        if($sonuc.'CPU %' -gt 3){
            Write-Output "Alarm" $sonuc  "$(Get-Date -Format "yyyy/MM/dd HH:mm:ss")" | Out-file C:\Users\cdona\Documents\PoweShell\CpuLog.txt -append
            Write-Host "Alarm" $sonuc  "$(Get-Date -Format "yyyy/MM/dd HH:mm:ss")"
        }
     }
     sleep 5
    }
while($true)