# MBLP213 Final Ödevi Dökümantasyonu

## Grup Üyeleri:

![ekip](https://drive.google.com/uc?export=view&id=1FbO1EvGYAAAvNWumVvaYAbtoCQ_uLVdO)
## Ödev Konusu:

#### Powershell scripti ile powershell schedule job tasarlanacakır job ın çalıştırcağı komut içerik olarak; İşletim sisteminde arkada çalışan programları task manager mantığı ile izleyerek Cpu yüzdesi %10 veya yukarı işlemleribir log dosyası oluşturulup Örnek: "Task.log", içine  zaman damgası ile "2021-01-10 13:12:04,634 text.exe Cpu 20%" uygulama isimleri ve cpu yüzdeleri kaydedilecektir
## PowerShell Script Çalışma Mantığı

![mantik](https://drive.google.com/uc?export=view&id=17oE33WJaIo1PY_8-Og6pKS8NsktbY0BA)
## Kullanılan CMDLET

#### Get-WMIObject Win32_ComputerSystem
#### Get-Counter "\Process(*)\% Processor Time"
#### $_.CookedValue / $CpuCores
