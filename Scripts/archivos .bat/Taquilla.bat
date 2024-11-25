@echo off
setlocal

REM Definir las rutas y nombres de los accesos directos
set "programa1Nombre=GanaT Bolivares"
set "programa1Ruta=C:\GanaT_Bolivares\GanaT.exe"
set "programa1Icono=C:\GanaT_Bolivares\logo-gana-4.ico"
set "programa1InicioEn=C:\GanaT_Bolivares"

set "programa2Nombre=GanaT Pesos"
set "programa2Ruta=C:\GanaT_Pesos\GanaT.exe"
set "programa2Icono=C:\GanaT_Pesos\logo-gana-4.ico"
set "programa2InicioEn=C:\GanaT_Pesos"

set "programa3Nombre=GanaT Dolares"
set "programa3Ruta=C:\GanaT_Dolares\GanaT.exe"
set "programa3Icono=C:\GanaT_Dolares\logo-gana-4.ico"
set "programa3InicioEn=C:\GanaT_Dolares"

set "programa4Nombre=Chatea Con Nosotros"
set "programa4Ruta=C:\Win_Apps\HTML\dist\main.exe"
set "programa4Icono=C:\Win_Apps\HTML\dist\Chat.ico"
set "programa4InicioEn=C:\Win_Apps\HTML\dist"

REM Ruta del escritorio del usuario actual
set "desktop=%USERPROFILE%\Desktop"

REM Crear accesos directos
call :CrearAccesoDirecto "%programa1Ruta%" "%desktop%\%programa1Nombre%.lnk" "%programa1Icono%" "%programa1InicioEn%"
call :CrearAccesoDirecto "%programa2Ruta%" "%desktop%\%programa2Nombre%.lnk" "%programa2Icono%" "%programa2InicioEn%"
call :CrearAccesoDirecto "%programa3Ruta%" "%desktop%\%programa3Nombre%.lnk" "%programa3Icono%" "%programa3InicioEn%"
call :CrearAccesoDirecto "%programa4Ruta%" "%desktop%\%programa4Nombre%.lnk" "%programa4Icono%" "%programa4InicioEn%"

echo Accesos directos creados correctamente.
endlocal
exit /b

:CrearAccesoDirecto
set "programPath=%~1"
set "shortcutPath=%~2"
set "iconPath=%~3"
set "startInPath=%~4"

REM Comprobar si se proporcionó una ruta de inicio personalizada.
if "%startInPath%"=="" (
    REM Si no se proporciona, usar la misma ruta del programa.
    set "startInPath=%programPath%"
)

REM Crear el acceso directo usando VBScript
echo Set oWS = WScript.CreateObject("WScript.Shell") > "%temp%\CrearAccesoDirecto.vbs"
echo sLinkFile = "%shortcutPath%" >> "%temp%\CrearAccesoDirecto.vbs"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%temp%\CrearAccesoDirecto.vbs"
echo oLink.TargetPath = "%programPath%" >> "%temp%\CrearAccesoDirecto.vbs"
echo oLink.IconLocation = "%iconPath%" >> "%temp%\CrearAccesoDirecto.vbs"
echo oLink.WorkingDirectory = "%startInPath%" >> "%temp%\CrearAccesoDirecto.vbs"
echo oLink.Save >> "%temp%\CrearAccesoDirecto.vbs"

cscript /nologo "%temp%\CrearAccesoDirecto.vbs"
del "%temp%\CrearAccesoDirecto.vbs"

exit /b