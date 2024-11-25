# Instalación de Ubuntu Server 22.04.4 LTS x64

Este documento proporciona una guía paso a paso para la instalación de Ubuntu Server 22.04.4 LTS en una máquina. Esta guía está destinada a usuarios con conocimientos básicos de administración de sistemas y puede ser adaptada para diferentes entornos.

## Requisitos Previos

- **Hardware:**
  - Procesador compatible con x64.
  - Al menos 2 GB de RAM (4 GB recomendados).
  - Espacio en disco de al menos 20 GB (40 GB recomendados).
  - Acceso a Internet.

- **Software:**
  - Imagen ISO de Ubuntu Server 22.04.4 LTS. [Descargar desde la página oficial](https://releases.ubuntu.com/22.04/).
  - Herramienta para crear medios de instalación (Rufus, Etcher, Yumi ExFat, etc.).

## Pasos de Instalación

### 1. Preparar el Medio de Instalación

1. Descarga la imagen ISO de Ubuntu Server 22.04.4 LTS desde el [sitio oficial de Ubuntu](https://releases.ubuntu.com/22.04/).

2. Utiliza una herramienta como [Rufus](https://rufus.ie/) o [Etcher](https://www.balena.io/etcher/) para crear un USB booteable con la imagen ISO descargada.

### 2. Configurar la Máquina para el Arranque desde USB

1. Inserta el USB booteable en la máquina donde se instalará Ubuntu Server.

2. Accede a la BIOS/UEFI de la máquina (generalmente presionando una tecla como F2, F12, DEL o ESC durante el arranque).

3. Cambia el orden de arranque para que el USB sea el primer dispositivo en la lista.

4. Guarda los cambios y reinicia la máquina.

### 3. Iniciar la Instalación

1. La máquina debería arrancar desde el USB y mostrar el menú de instalación de Ubuntu Server. Selecciona "Install Ubuntu Server" y presiona `Enter`.

### 4. Configurar el Idioma y tipo de instalacion

1. Selecciona el idioma deseado y presiona `Enter`.

2. Seleccione el tipo de instalacion que va a utilizar (ubuntu server o ubuntu server minimized)

### 5. Configuración de Red

1. Selecciona la interfaz de red que deseas configurar. Puedes optar por configurar una red estática o usar DHCP.

2. Proporciona la configuración necesaria si eliges una IP estática.

3. Confirma el proxy utilizado (lo puedes dejar en blanco si no se utiliza, ninguno)

### 6. Confirme la direccion del mirror

1. Se deja estandar si no se usa ninguno

### 7. Configuración del Disco

1. Elige cómo deseas particionar el disco. Puedes seleccionar "Utilizar disco completo" para una instalación sencilla o "Particionamiento manual" si necesitas una configuración más personalizada.

2. Revisa la configuración del disco y confirma para proceder con la partición.

### 8. Instalación de Paquetes Adicionales

1. Selecciona los paquetes adicionales que deseas instalar, como el servidor OpenSSH. Esto te permitirá gestionar la máquina de forma remota.

### 9. Finalizar la Instalación

1. Espera a que el proceso de instalación finalice.

2. Cuando se te solicite, retira el USB y reinicia la máquina.

### 10. Server Saps
 
IMPORTANTE: Tenga en cuenta que tras este paso se realiza la instalación y se descargan archivos de Internet por lo que la duración de este paso puede variar bastante, dependiendo de la conexión a Internet y del estado de los servidores de Ubuntu. Puede hacer una prueba con el valor propuesto aquí (600 s) y aumentarlo si fuera necesario.

### 11. Post-Instalación

1. Accede a la máquina utilizando el nombre de usuario y la contraseña que configuraste.

2. Realiza actualizaciones del sistema ejecutando:
   ```bash
   sudo apt update
   sudo apt upgrade

3. Configura cualquier software adicional o ajustes del sistema según tus necesidades.