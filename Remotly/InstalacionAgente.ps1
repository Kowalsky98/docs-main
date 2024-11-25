$organizationID = "XXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
$serverURL = "https://Your_Domain"
$installScriptURL = "https://Your_Domain/api/ClientDownloads/WindowsInstaller/$organizationID"

Invoke-WebRequest -Uri $installScriptURL -OutFile "${env:TEMP}\Install-Remotely.ps1" -UseBasicParsing

Start-Process -FilePath 'powershell.exe' -ArgumentList ("-executionpolicy", "bypass", "-File", "${env:TEMP}\Install-Remotely.ps1", "-organizationid", $organizationID, "-serverurl", $serverURL) -Verb RunAs
