# MBLP213 Final Ödevi Dökümantasyonu

## Grup Üyeleri:
1. Fatma Yıldız Akçiçek
2. Uğur Can Göker
3. Batuhan Caner Şimşek
4. Ebrar Gül
5. Yusuf Taha Günay
6. Kerem Zakout
7. Halil İbrahim Okumuş
8. Batur Yüceal
9. Emircan Çetinkaya
10. Deniz Önalp
11. Berke Abike
12. Berkcan Karabulut
## Ödev Konusu:

#### Powershell scripti ile powershell schedule job tasarlanacakır job ın çalıştırcağı komut içerik olarak; İşletim sisteminde arkada çalışan programları task manager mantığı ile izleyerek Cpu yüzdesi %10 veya yukarı işlemleribir log dosyası oluşturulup Örnek: "Task.log", içine  zaman damgası ile "2021-01-10 13:12:04,634 text.exe Cpu 20%" uygulama isimleri ve cpu yüzdeleri kaydedilecektir
## PowerShell Script Çalışma Mantığı

![mantik](https://drive.google.com/uc?export=view&id=17oE33WJaIo1PY_8-Og6pKS8NsktbY0BA)
## Kullanılan CMDLET

#### Get-WMIObject Win32_ComputerSystem: Bilgisayarın statik özelliklerini listeler.
#### (Get-WMIObject Win32_ComputerSystem).NumberOfLogicalProcessors: İşlemcinin çekirdek sayısını getirir.
#### Get-Counter "\Process(*)\% Processor Time": Bilgisayarın kullanım sayaçlarının içinden işlemci kullanımı değişkenini getirir.
#### $_.CookedValue: Get-Counter ile gelen verinin kullanılabilir hale getirir.
