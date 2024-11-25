[Setup]
AppName=Office 2021 LTSC by ElAmigos
AppVersion=1.0
DefaultDirName={pf}\Office 2021 LTSC by ElAmigos
DisableProgramGroupPage=yes
OutputDir=.
OutputBaseFilename=Office 2021 LTSC by ElAmigos
Compression=lzma
SolidCompression=yes

[Files]
; Empaquetar todos los archivos y carpetas necesarios
Source: "C:\Users\Your\directory\office*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs
Source: "C:\Users\Your\directory\officeconfiguracion.xml"; DestDir: "{app}"
Source: "C:\Users\Your\directory\officeIniciarInstalador.ps1"; DestDir: "{app}"
Source: "C:\Users\Your\directory\officeKmsAdmin.exe"; DestDir: "{app}"
Source: "C:\Users\Your\directory\officeKmsActivator.bat"; DestDir: "{app}"
Source: "C:\Users\Your\directory\officesetup.exe"; DestDir: "{app}"
Source: "C:\Users\Your\directory\officeregistro.ps1"; DestDir: "{app}"

[Run]
; Ejecutar el primer script de PowerShell para iniciar la instalación
Filename: "powershell.exe"; Parameters: "-ExecutionPolicy Bypass -Command ""Set-Location -Path '{app}'; ./IniciarInstalador.ps1"""; Flags: runhidden

; Ejecutar KmsAdmin.exe de manera silenciosa
Filename: "{app}\KmsAdmin.exe"; Parameters: "/VERYSILENT"; Flags: runhidden

; Ejecutar KmsActivator.bat de manera silenciosa
Filename: "{app}\KmsActivator.bat"; Flags: runhidden

; Ejecutar el script de PowerShell 'registro.ps1' al final del proceso
Filename: "powershell.exe"; Parameters: "-ExecutionPolicy Bypass -Command ""Set-Location -Path '{app}'; ./registro.ps1"""; Flags: runhidden

; Eliminar archivos extraídos al final de la instalación
Filename: "powershell.exe"; Parameters: "-ExecutionPolicy Bypass -Command ""Remove-Item -Recurse -Force '{app}\*'"""; Flags: runhidden
