@echo off

REM Definir las URLs y rutas de los accesos directos
set "pagina2Url=https://pagolisto.com.ve/login"
set "pagina3Url=https://bemovil.net/"
set "pagina4Url=https://www.flashscore.com.ve/"
set "pagina5Url=https://supergana.com.ve/resultados.php"
set "pagina6Url=https://panel.payall.com.ve/login"
set "pagina7Url=https://gana-loterias.com/"
set "pagina2Shortcut=%USERPROFILE%\Desktop\PagoListo.lnk"
set "pagina3Shortcut=%USERPROFILE%\Desktop\Bemovil.lnk"
set "pagina4Shortcut=%USERPROFILE%\Desktop\MisMarcadores.lnk"
set "pagina5Shortcut=%USERPROFILE%\Desktop\SuperGana.lnk"
set "pagina6Shortcut=%USERPROFILE%\Desktop\Payall.lnk"
set "pagina7Shortcut=%USERPROFILE%\Desktop\Visitanos en Gana Loterias.lnk"
set "pagina2Icon=C:\Iconos\Pagolisto.ico"
set "pagina3Icon=C:\Iconos\bemovil.ico"
set "pagina4Icon=C:\Iconos\Marca.ico"
set "pagina5Icon=C:\Iconos\super.ico"
set "pagina6Icon=C:\Iconos\payall.ico"
set "pagina7Icon=C:\Iconos\Gabo.ico"

REM Crear los accesos directos
call :CrearAccesoDirecto "%pagina2Url%" "%pagina2Shortcut%" "%pagina2Icon%"
call :CrearAccesoDirecto "%pagina3Url%" "%pagina3Shortcut%" "%pagina3Icon%"
call :CrearAccesoDirecto "%pagina4Url%" "%pagina4Shortcut%" "%pagina4Icon%"
call :CrearAccesoDirecto "%pagina5Url%" "%pagina5Shortcut%" "%pagina5Icon%"
call :CrearAccesoDirecto "%pagina6Url%" "%pagina6Shortcut%" "%pagina6Icon%"
call :CrearAccesoDirecto "%pagina7Url%" "%pagina7Shortcut%" "%pagina7Icon%"

echo Accesos directos creados correctamente.
exit

:CrearAccesoDirecto
set "Url=%~1"
set "ShortcutPath=%~2"
set "IconPath=%~3"

REM Crear el acceso directo
echo Set oWS = WScript.CreateObject("WScript.Shell") > %temp%\Shortcut.vbs
echo sLinkFile = "%ShortcutPath%" >> %temp%\Shortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %temp%\Shortcut.vbs
echo oLink.TargetPath = "C:\Program Files\Google\Chrome\Application\chrome.exe" >> %temp%\Shortcut.vbs
echo oLink.Arguments = Chr(34) ^& "%Url%" ^& Chr(34) >> %temp%\Shortcut.vbs
echo oLink.IconLocation = "%IconPath%" >> %temp%\Shortcut.vbs
echo oLink.Save >> %temp%\Shortcut.vbs
cscript /nologo %temp%\Shortcut.vbs
del %temp%\Shortcut.vbs
exit /b
