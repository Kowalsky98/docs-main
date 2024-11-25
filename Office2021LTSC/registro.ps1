
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}


$registryPaths = @(
    "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{0D34D278-5FAF-4159-A4A0-4E2D2C08139D}_is1",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Mesh Agent"
)


foreach ($registryPath in $registryPaths) {
    if (Test-Path $registryPath) {
        
        Remove-ItemProperty -Path $registryPath -Name "DisplayName" -ErrorAction SilentlyContinue
        Write-Host "El valor DisplayName ha sido eliminado de: $registryPath"
    } else {
        Write-Host "La clave de registro no fue encontrada en: $registryPath"
    }
}
