@echo off
set "imagen=C:\WALLPAPER GANA.png"

REM Comprueba si la imagen existe
if not exist "%imagen%" (
    echo La imagen especificada no existe.
    exit /b
)

REM Cambia el fondo de pantalla
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%imagen%" /f

REM Actualiza el fondo de pantalla
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

echo Fondo de pantalla cambiado correctamente a %imagen%.
