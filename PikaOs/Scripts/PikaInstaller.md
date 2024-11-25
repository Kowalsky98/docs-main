# PikaInstalador

PikaInstalador es una aplicación gráfica en Python que facilita la ejecución de scripts y programas en un entorno Windows. Utiliza la biblioteca `tkinter` para crear una interfaz de usuario simple y amigable que permite automatizar la instalación de aplicaciones y scripts con un solo clic.

## Características

- Interfaz gráfica intuitiva con instrucciones claras.
- Ejecución automática de múltiples scripts y programas.
- Soporte para instalaciones silenciosas con indicadores de progreso.
- Mensajes de error y confirmación en caso de problemas durante la instalación.

## Requisitos

- Python 3.x
- `tkinter` (viene incluido en la instalación de Python por defecto)
- Permisos de administrador en el sistema para ejecutar ciertos scripts y aplicaciones.

## Instalación

1. Asegúrate de tener Python instalado. Si no lo tienes, descárgalo desde [python.org](https://www.python.org/downloads/).
   
2. Instala los requisitos si es necesario:
   ```bash
   pip install tk
3. Asegúrate de que todos los scripts y aplicaciones que se ejecutarán estén ubicados en las rutas especificadas dentro del código:
    "C:\\Win_Apps\\AccesosDirectos.bat"
    "C:\\Win_Apps\\PlanEnergia.bat"
    Y otros archivos de la carpeta C:\\Win_Apps\\.
## Uso

1. En la interfaz de usuario, presiona el botón GO para iniciar la instalación secuencial de los scripts y programas.

## Comandos Soportados
    - AccesosDirectosW: Ejecuta el script AccesosDirectos.bat.
    - PlanEnergia: Ejecuta el script PlanEnergia.bat.
    - Fondo: Cambia el fondo de pantalla ejecutando Fondo.bat.
    - Serial: Ejecuta el script para configurar el serial con Serial.bat.
    - Post_Instalacion_W11: Ejecuta el script de post-instalación para Windows 11.
    - Instalaciones silenciosas: Soporte para programas como aida64.exe y Booster.exe con opciones /SILENT.

## Personalizacion 
     
    Si deseas agregar más programas o scripts, simplemente edita la lista self.commands dentro del archivo PikaInstalador.py, añadiendo el nombre del comando y la ruta correspondiente.
