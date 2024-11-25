# Guía para Modificar una ISO de Windows con NTLite y Win Toolkit

## Introducción

Este documento describe los pasos necesarios para modificar una ISO de Windows utilizando dos herramientas populares: **NTLite** y **Win Toolkit**. Estas herramientas permiten personalizar una imagen de instalación de Windows, agregar o eliminar componentes, integrar controladores, parches y realizar otras personalizaciones.

### Requisitos

- Una copia de la **ISO de Windows** que desees modificar (para nuestro caso de uso usamos una iso base original e integramos el wintoolkit de dprojects).
- **NTLite** (Descargar en: https://www.ntlite.com)
- **Win Toolkit** (Descargar en: https://www.wincert.net/forum/files/file/5-win-toolkit/)
- Una PC con Windows 10 o superior.
- Dependiendo del hardware tardara mas o menos en compilar 

---

## Paso 1: Preparar el entorno

### 1.1 Descargar y extraer la ISO de Windows

1. Descarga la ISO de Windows desde una fuente confiable (Nota: La iso base puede ser una ya modificada pero tienes que tomar en cuenta que usar iso que previamente ya fue modificada, puede tener servicios con alta importancia que realizan que no funcione bien la instalacion o no puedes realizar una instalacion semi-desatendida ya que al momento de instalar podemos tener una gran cantidad de errores).

2. Extrae el contenido de la ISO en una carpeta. Puedes hacerlo con herramientas como **7-Zip** o **WinRAR**.
   - Crea una carpeta en tu escritorio, por ejemplo, `C:\Win7_ISO`, y extrae el contenido de la ISO en esta carpeta.

### 1.2 Instalar NTLite y Win Toolkit

1. Descarga e instala **NTLite** desde su página oficial.
2. Descarga **Win Toolkit** desde su página oficial. No requiere instalación, solo extraer los archivos en una carpeta.

---

## Paso 2: Modificar la ISO con NTLite

NTLite es una herramienta potente para integrar controladores, actualizaciones y ajustes en la ISO de Windows.

### 2.1 Abrir NTLite y cargar la imagen de Windows

1. Inicia **NTLite**.
2. En el panel de la izquierda, haz clic en **Agregar** y selecciona la carpeta donde extrajiste la ISO (por ejemplo, `C:\WindowsISO`) para este punto tambien puedes cargar la imagen directamente con la iso este creara directamente una capeta cache que contiene el mismo contenido que extrajimos ademas del cambio de formato esd a wim.
3. NTLite cargará la imagen de Windows. Selecciona la edición de Windows que deseas modificar.

### 2.2 Personalizar la imagen de Windows

1. **Integración de controladores**:
   - Ve a la sección de **Controladores** en NTLite.
   - Haz clic en **Agregar** para integrar controladores específicos que necesites (!!!IMPORTANTE: agregar controladores o drivers incompatibles puede generar una cantidad grande de problemas al momento de instalar o al momento de inciar el equipo por primera vez!!!).
   
2. **Integración de actualizaciones**:
   - Ve a la sección de **Actualizaciones** y selecciona los parches de Windows (.msu o .cab) que desees integrar (!!!IMPORTANTE: LAS ACTUALIZACIONES PUEDEN GENERAR INESTABILIDAD EN EL SO, SOLO INTENGRA ACTUALIZACIONES SENSIBLES QUE SEAN NECESARIAS EN EL SISTEMA OPERATIVO SIEMPRE ES BUENO INVESTIGAR QUE HACE LA ACTUALIZACION ANTES DE USARLA).


3. **Pre y Post - Instalacion**
    - En la seccion de **Despues de la instalacion** tenemos dos opciones *Antes de iniciar sesion* y *Despues de iniciar sesion* en cada una podemos agregar un comando, archivo o carpeta, decide en que punto quieres que se ejecute el archivo y simplemente selecionamos agregar y el tipo de "archivo" que sea este mismo (para el caso de instaladores .exe podemos obtener *Informacion del parametro* donde cada instalador nos entrega el comando o los comandos para poder obtener un tipo de instalacion especifica que podemos colocar en el apartado de parametros simplemente escribiendo por ejemplo /quiet, que es un comando en algunas aplicaciones para ejecutar una instalacion de manera silenciosa)

4. **Eliminar componentes**:
   - En la sección de **Componentes**, selecciona los componentes de Windows que no necesitas y elimínalos en este punto debes tener mucho cuidado con que componenetes eliminar ya que muchos son delicados y la compatibilidad es escencial para tener un sistema ligero y limpio.

5. **Tareas Programadas**
    - En la seccion de **Tareas Programadas** (Solo aplicada en la version Home o Pro de NTLITE), Aqui tenemos las opciones mas delicadas de cualquier SO, donde tenemos opciones de firmaware en cada servicio tales como puedes ser WindowsUpdate, TPM, Chkdsk, asi que se debe investigar cada servicio y su utilidad ya que modificarlos genera un cambio en la base del sistema operativo. 
6. **Caracteristicas**
    - En la seciccion de **Caracteristicas** tenemos lo mismo que en el *Panel de Control-Activar o desactivar las caracteristicas de Windows* 

7. **Configuraciones**
    - Cambiar las configuraciones de windows alternamos cada una de las opciones para modificar desde *Canales de virsor de eventos hasta windows update* cada apartado tienes opciones unicas y propios que podemos activar, desactivar, manual o predeterminado (en la mayoria de opciones). Es necesario leer bien que configuraciones activar o desactivar.

8. **Servicios** 
    - Este apartado mas alla de ser muy parecido a las configuraciones, tenemos los servicios que podemos obtener revisando tambien services en sistema ya dentro de windows

9. **Servicios Extra**
    - En esta seccion tenemos la version extendida de los servicios que se aplica lo mismo que los anteriores pasos.

10. **Desatendido** 
    - para este apartado se realiza normalmente una configuracion estandarizada para cada SO.
        - Localizaqcion de windows:
            Entrada local (Español)
            Sistema local (Español)
            Idioma de interfaz de ususario (Español)
            Usuario local (Español)
        - Opciones del interprete de comandos
            Zona horaria (Caracas)
        - Experiencia del consumidor
            Omitir la pagina EULA (Verdadero)
            Saltar la instalacion de la cienta en linea (Verdadero) 
            Omitir "Ir Rapido" (Esta opcion solo es para W11) (Verdadero)
        Windows PE 
            - Localizacion de Windows
                - Idioma de la interfaz del usuario (Español)
        Opciones de instalacion de Windows
            - Informar sobre las estadisticas de instalacion 
                - Enviar informe a Microsoft (False)
            - Configurar usuario
                -Omitir la pagina EULA (Verdadero)

. **Aplicar ajustes**:
   - NTLite permite aplicar diversos ajustes y configuraciones, aparte de ello nos permite eliminar ediciones no esenciales.
   - El formato de imagen puede cambiarse segun sea necesaria en estas estan (WIM, ESD, SWM)
   - En la cola del proceso de la imagen veremos las integraciones necesarias para integrar en la imagen
   - Al final tenemos la opcion para "Crear ISO", en el mismo tenemos para crear la etiqueta personalizada de la misma y el nombre de la ISO

### 2.3 Guardar y generar la imagen modificada

1. Una vez que hayas hecho las modificaciones, haz clic en **Aplicar** en la barra superior.
2. Elige la opción **Crear ISO** y selecciona una ubicación para guardar la nueva imagen de instalación de Windows.

---

## Paso 3: Modificar la ISO con Win Toolkit

Win Toolkit es otra herramienta útil que permite realizar modificaciones adicionales, como agregar programas al instalador de Windows, el enfoque que le damos nosotros al uso de Win toolkit esta enfocado en el uso creacion de aplicativos e integrarlo al sistema operativo antes de bootear un usb o grabar el iso en un disco.

### 3.1 Iniciar Win Toolkit

1. Ejecuta **Win Toolkit**.
2. Primero buscamos la seccion de Tools>Misc>Addon Maker para crear un archivo 
    - Aqui tendremos una ventana nos enfocaremos en las éstañas de "copy files" y "copy folders"
    - define las carpetas y archivos a agregar una vez terminado le daremos a "save"
3. En el menú principal, selecciona la opción **All-In-One Integrator**.
    - En este apartado buscaremos el archivo .wim de la iso ya previamente modificada y extraida esta esta en la carpeta "sourse" 
    - Selecciona la version de la imagen que vamos a utilizar y agregamos el archivo de aplicativos para luego iniciar la integracion
4. Una vez realizado todos estos pasos buscaremos **ISO Maker** en esta ventana tendremos 3 opciones 
    - la primera sera la carpeta de integracion donde ya tenemos el sistema y el addon (o las aplicaciones o archivos que agregamos)
    - la segunda sera la salida de la iso ya compilada.
    - la tercera sera una opcion para crear una etiqueta interna que quedara siempre ligada a la ISO, esta etiqueta es totalmente personalizada
    - y solo le damos a run :) 

### 3.2 Integrar controladores, actualizaciones y programas

Por otra parte Win Toolkit tambien tiene la opcion de crear o controlar el tema de controladores actualizaciones y programas predeterminados, pero mas alla de esas funciona realmente se recomienda encarecidamente el uso de NTLITE para este trabajo.

1. **Controladores**:
   - Haz clic en **Drivers** y agrega los controladores que quieras incluir en la ISO.
   
2. **Actualizaciones**:
   - Haz clic en **Updates** para integrar actualizaciones de Windows.

3. **Programas**:
   - Usa la opción **Silent Installers** para agregar programas que se instalarán automáticamente durante la instalación de Windows.


## Paso 4: Probar la ISO modificada

1. Una vez que hayas generado la ISO modificada, puedes probarla en una máquina virtual usando herramientas como **VirtualBox** o **VMware**.
2. Si todo funciona correctamente, puedes usar la ISO para crear un USB de instalación con herramientas como **Rufus** , **Yumi exFat** o grabarla en un DVD.

