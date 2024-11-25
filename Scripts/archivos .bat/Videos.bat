@echo off
rem Este script extrae el contenido de un archivo .rar a una ubicación específica

rem Establece la ubicación del archivo .rar que quieres extraer y la ubicación de destino
set "archivo_origen=C:\Videos.rar"
set "ubicacion_destino=%USERPROFILE%\Desktop"

rem Crea la carpeta de destino si no existe
if not exist "%ubicacion_destino%" mkdir "%ubicacion_destino%"

rem Usa WinRAR para extraer el contenido del archivo .rar
"C:\Program Files\WinRAR\WinRAR.exe" x "%archivo_origen%" "%ubicacion_destino%\" -y

rem Muestra un mensaje de finalización
echo Archivo .rar extraído exitosamente a "%ubicacion_destino%"
exit /b
