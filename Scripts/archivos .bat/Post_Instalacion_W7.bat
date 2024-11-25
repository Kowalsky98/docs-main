@echo off
REM Ruta del acceso directo existente
set "origen_post=C:\Win_Apps\Post.lnk"

REM Ruta del acceso directo en la carpeta de inicio del menú de inicio
set "destino_post=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Post.lnk"

REM Copiar el acceso directo Post al directorio de inicio
if exist "%origen_post%" (
    copy "%origen_post%" "%destino_post%"
    echo Acceso directo copiado a: %destino_post%
) else (
    echo No se encontró el acceso directo: %origen_post%
)

exit /b
