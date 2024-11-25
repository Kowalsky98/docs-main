@echo off
REM Ruta del acceso directo existente
set "origen_post=C:\Win_Apps\Post.lnk"
set "origen_geo=C:\Win_Apps\Geo.lnk"
set "origen_system=C:\Win_Apps\system.lnk"
set "origen_chat=C:\Win_Apps\Chatea Con Nosostros.lnk"

REM Ruta del acceso directo en la carpeta de inicio del menú de inicio
set "destino_post=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Post.lnk"
set "destino_geo=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Geo.lnk"
set "destino_system=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\system.lnk"
set "destino_chat=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Chatea Con Nosostros.lnk.lnk"

REM Copiar el acceso directo Post al directorio de inicio
if exist "%origen_post%" (
    copy "%origen_post%" "%destino_post%"
    echo Acceso directo copiado a: %destino_post%
) else (
    echo No se encontró el acceso directo: %origen_post%
)

REM Copiar el acceso directo Geo al directorio de inicio
if exist "%origen_geo%" (
    copy "%origen_geo%" "%destino_geo%"
    echo Acceso directo copiado a: %destino_geo%
) else (
    echo No se encontró el acceso directo: %origen_geo%
)

REM Copiar el acceso directo system al directorio de inicio
if exist "%origen_system%" (
    copy "%origen_system%" "%destino_system%"
    echo Acceso directo copiado a: %destino_system%
) else (
    echo No se encontró el acceso directo: %origen_system%
)

REM Copiar el acceso directo Post al directorio de inicio
if exist "%origen_chat%" (
    copy "%origen_chat%" "%destino_chat%"
    echo Acceso directo copiado a: %destino_post%
) else (
    echo No se encontró el acceso directo: %origen_post%
)
exit /b
