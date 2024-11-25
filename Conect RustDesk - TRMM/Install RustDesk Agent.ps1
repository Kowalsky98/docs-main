$ErrorActionPreference= 'silentlycontinue'

If (!(Test-Path c:\Temp)) {
  New-Item -ItemType Directory -Force -Path c:\Temp > null
}

cd c:\Temp

powershell Invoke-WebRequest "https://github.com/rustdesk/rustdesk/releases/download/1.2.2/rustdesk-1.2.2-x86_64.exe" -Outfile "rustdesk.exe"
Start-Process .\rustdesk.exe --silent-install -wait

$ServiceName = 'Rustdesk'
$arrService = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue

if ($arrService -eq $null)
{
    Start-Sleep -seconds 100
}

while ($arrService.Status -ne 'Running')
{
    Start-Service $ServiceName
    Start-Sleep -seconds 5
    $arrService.Refresh()
}

net stop rustdesk

$username = ((Get-WMIObject -ClassName Win32_ComputerSystem).Username).Split('\')[1]
Remove-Item C:\Users\$username\AppData\Roaming\RustDesk\config\RustDesk2.toml
New-Item C:\Users\$username\AppData\Roaming\RustDesk\config\RustDesk2.toml
Set-Content C:\Users\$username\AppData\Roaming\RustDesk\config\RustDesk2.toml "rendezvous_server = 'IPADRESS' `nnat_type = 1`nserial = 0`n`n[options]`ncustom-rendezvous-server = 'IPADRESS'`nkey = 'KEY='`nrelay-server = 'IPADRESS'`napi-server = 'https://IPADRESS'"
Remove-Item C:\Windows\ServiceProfiles\LocalService\AppData\Roaming\RustDesk\config\RustDesk2.toml
New-Item C:\Windows\ServiceProfiles\LocalService\AppData\Roaming\RustDesk\config\RustDesk2.toml
Set-Content C:\Windows\ServiceProfiles\LocalService\AppData\Roaming\RustDesk\config\RustDesk2.toml "rendezvous_server = 'IPADRESS' `nnat_type = 1`nserial = 0`n`n[options]`ncustom-rendezvous-server = 'IPADRESS'`nkey = 'KEY='`nrelay-server = 'IPADRESS'`napi-server = 'https://IPADRESS'"

net start rustdesk
