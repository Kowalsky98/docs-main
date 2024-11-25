# Instrucciones de Instalación de Office 2021 LTSC

Este instalador de Office 2021 LTSC automatiza el proceso de instalación y activación mediante el activador KMS local.

## Contenido del Paquete de Instalación

Dentro de la carpeta de instalación, se encuentran los siguientes archivos:
- **Office/**: Carpeta que contiene los archivos del instalador de Office.
- **configuracion.xml**: Archivo XML que contiene la configuración de instalación de Office.
- **IniciarInstalador.ps1**: Script PowerShell que inicia la instalación de Office.
- **KmsActivator.bat**: Script batch para la activación de Office mediante KMS.
- **setup.exe**: Instalador de Office.
- **registro.ps1**: Script PowerShell que ejecuta la exclusión de Windows Defender y otros ajustes posteriores a la instalación.

## Pasos Automáticos del Instalador

1. **Extracción de Archivos**: 
   - Los archivos se extraen en la siguiente ruta: `C:\Program Files (x86)\Office 2021 LTSC by ElAmigos`.

2. **Ejecutar el Script de Instalación**:
   - El archivo `IniciarInstalador.ps1` se encarga de ejecutar el siguiente comando:
     ```bash
     ./setup.exe /configure ./configuracion.xml
     ```
   - Este comando inicia la instalación de Office con la configuración definida en `configuracion.xml`.

3. **Activación de Office**:
   - El script `KmsActivator.bat` se ejecuta automáticamente para activar Office usando un servidor KMS local.

## Instrucciones Manuales para el Usuario

1. Desactivar temporalmente el antivirus si este detecta una amenaza durante la instalación.

2. Ejecutar el archivo IniciarInstalador.ps1 como administrador para iniciar el proceso de instalación.

3. Esperar a que el proceso de instalación finalice y Office se active automáticamente.

4. Reactivar el antivirus después de que finalice el proceso de instalación y activación.

5. Si es necesario, eliminar la exclusión de Windows Defender ejecutando el script o comando mencionado anteriormente.

## Advertencia

El activador KMS puede ser detectado como una amenaza por los antivirus debido a su naturaleza. Si confías en el origen del instalador, agrega una excepción en tu antivirus o desactívalo temporalmente durante la instalación.

# NOTA
1. - El uso de este instalador queda bajo el uso del CODIGO_CONDUCTA ya que su uso es estrictamente para usos especificos. No nos hacemos resposables por el uno inadecuado de esta herramienta en actos ilicitos fuera del codigo de conducta antes ya mencionado y descrito en este repositorio.

2. - Si por alguna razon no manejas o tienes la carpeta de office 2021 LTSC puedes descargarla siguiendo estas intrucciones directamente desde la pagina de microsoft (https://learn.microsoft.com/es-es/office/ltsc/2021/deploy)