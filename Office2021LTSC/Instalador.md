# Instrucciones para Crear Instalador de Office 2021 LTSC con Activador KMS

Esta guía detalla los pasos necesarios para crear un instalador personalizado de Office 2021 LTSC, utilizando herramientas de Microsoft y un activador KMS.

## Requisitos

1. **Inno Setup** – Puedes descargarlo [aquí](https://jrsoftware.org/isinfo.php).
2. **Office 2021 LTSC** – Sigue esta guía de Microsoft para obtener los archivos necesarios: [Guía de Office LTSC 2021](https://learn.microsoft.com/es-es/office/ltsc/2021/deploy).
3. **Archivos adicionales** – Asegúrate de tener los siguientes scripts:
   - `IniciarInstalador.ps1`
   - `registro.ps1`
   - Otros archivos opcionales según tus necesidades.

## Pasos para Crear el Instalador

### 1. Preparación de Archivos

Descarga los archivos de instalación de Office 2021 LTSC utilizando la guía oficial de Microsoft. Entre estos archivos, deberás encontrar uno llamado `configuracion.xml` (puede tener otro nombre, pero debe ser un archivo XML). Este archivo es crucial, ya que define la configuración necesaria para instalar Office. 

> **Nota**: Antes de continuar, desactiva temporalmente el antivirus y OneDrive para evitar interferencias en el proceso de instalación.

### 2. Organización de los Archivos

Crea una carpeta llamada `Office` y coloca dentro de ella todos los archivos de Office descargados, junto con los scripts adicionales (`IniciarInstalador.ps1`, `registro.ps1`, etc.). Asegúrate de conocer las rutas completas de cada archivo, ya que las necesitarás para el código en Inno Setup.

### 3. Creación del Script en Inno Setup

1. Abre **Inno Setup** y selecciona la opción para crear un nuevo script (archivo `.iss`).
2. Copia el contenido del script proporcionado en este repositorio en el archivo nuevo. Si no tienes un script, puedes utilizar la plantilla de código disponible [aquí](https://jrsoftware.org/isdl.php) como punto de partida.
3. Modifica las rutas de los archivos según la estructura de carpetas que has creado en el paso anterior.

### 4. Importancia de la Ejecución de Archivos

Es fundamental que los archivos clave, como los scripts de PowerShell (`IniciarInstalador.ps1`, `registro.ps1`), se ejecuten correctamente, ya que automatizan procesos críticos como la instalación silenciosa y la configuración del sistema. Para asegurar la correcta ejecución:

- **Permisos de PowerShell**: Asegúrate de que el sistema permita la ejecución de scripts de PowerShell. Esto se puede lograr ejecutando `Set-ExecutionPolicy RemoteSigned` en una ventana de PowerShell con permisos de administrador.
  
- **Privilegios de administrador**: El instalador debe ejecutarse con privilegios de administrador, ya que varias acciones como la instalación de Office y la activación KMS requieren acceso elevado al sistema.

### 5. Compilación del Instalador

Una vez que hayas configurado el archivo `.iss`, procede a compilar el proyecto en Inno Setup. El proceso generará un archivo `.exe` en el directorio de salida que seleccionaste. Este será el instalador de Office 2021 LTSC con activador KMS.

> **Nota**: Durante la compilación, asegúrate de que todas las rutas y permisos estén configurados correctamente. Cualquier error en la ejecución de los scripts puede interrumpir el proceso de instalación.

### 6. Personalización del Icono (Opcional)

Si deseas cambiar el ícono del instalador, puedes hacerlo modificando el parámetro correspondiente en el script de Inno Setup. Si prefieres mantener el ícono predeterminado, no es necesario realizar ningún cambio en esta sección.

### 7. Prueba del Instalador

Ejecuta el archivo `.exe` generado para verificar que el instalador funcione correctamente. Revisa los logs o utiliza la función de depuración de Inno Setup para identificar posibles errores o fallos durante la instalación.

> **Importante**: Asegúrate de ejecutar el instalador como **administrador** para evitar problemas con los permisos y garantizar que todos los componentes, incluidos los scripts de PowerShell, se ejecuten correctamente.

## Consideraciones Finales

- Asegúrate de que los permisos de ejecución de los scripts PowerShell estén correctamente configurados.
- Revisa la configuración del antivirus para evitar bloqueos inesperados durante la ejecución.
- Mantén siempre una copia de seguridad de los archivos de instalación en caso de necesitar hacer modificaciones adicionales.

¡Listo! Has creado un instalador personalizado de Office 2021 LTSC con activador KMS.
