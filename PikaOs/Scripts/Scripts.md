# Scripts en Uso para PikaOs (Windows 7, 8.1 y 11)

Este repositorio contiene los scripts y herramientas utilizados para la personalización y mantenimiento de PikaOs en sus versiones para Windows 7, 8.1 y 11. Los scripts están desarrollados principalmente en Python y están diseñados para tareas de automatización, monitoreo del sistema, geolocalización y post-instalación.

## Tabla de Contenidos

1. [Chat Widget](#chat-widget)
2. [System](#system)
3. [PostInstalación](#postinstalación)
4. [Geolocalización](#geolocalización)

---

## 1. Chat Widget

El **Chat Widget** es una aplicación desarrollada en Python utilizando las librerías **Tkinter** para la interfaz gráfica y **WebView** para la integración del widget de chat con el CRM de Ganaloterías. Permite interactuar directamente desde la interfaz de PikaOs con el sistema de atención al cliente.

### Arquitectura del Proyecto

ChatWidget/ 
├── build/ 
│ └── main/ 
├── dist/ 
│ └── main.exe 
├── chat_widget.html 
├── main.py 
└── main.spec

### Dependencias
- **Python 3.x**
- **Tkinter**
- **WebView**

### Funcionalidad
El widget se conecta al CRM y ofrece una interfaz de chat en tiempo real para interactuar con el soporte técnico.

---

## 2. System

El proyecto **System** es una solución de monitoreo del sistema, desarrollada en Python, que verifica la integridad de los componentes del sistema operativo y del hardware. Genera alertas sobre el estado de los equipos e incluye el número de serie del dispositivo en los reportes enviados.

### Arquitectura del Proyecto

SystemMonitoring/ 
├── config/ 
│ └── config.json
├── services/ 
│ ├── cpu_service.py
│ ├── memory_service.py
│ ├── disk_service.py
│ ├── system_info_service.py
│ ├── alert_service.py
└── main.py

### Funcionalidad
- Monitorea el uso de CPU, memoria y disco.
- Verifica la información del sistema.
- Envia alertas cuando se detectan fallos en los componentes monitoreados.

---

## 3. PostInstalación

El **PostInstalador** es un script utilizado después de la instalación inicial de PikaOs en equipos nuevos. Este se ejecuta para asegurar la estandarización del sistema y la instalación de todos los componentes requeridos antes de que el equipo sea utilizado en producción. También está vinculado al proyecto de **Geolocalización**, ya que detecta la ausencia de ciertos directorios y ejecuta las acciones necesarias para corregir cualquier deficiencia de instalación de forma automática.

### Arquitectura del Proyecto

VerificadorDeInstalacion/ 
├── main.py 
├── verificador.py 
├── instalador.py 
├── dist/ 
│ └── main/ 
│ └── main.exe 
└── main.spec

### Funcionalidad
- Verifica la presencia de archivos y directorios clave.
- Instala componentes faltantes silenciosamente.
- Garantiza la integridad del sistema antes de su uso.

---

## 4. Geolocalización

El proyecto de **Geolocalización** realiza la verificación de estructuras de directorios y rastrea ubicaciones geográficas de los dispositivos. Este script registra eventos relacionados con la integridad de los directorios y toma acciones correctivas automáticamente cuando es necesario. También envía alertas cuando se detectan irregularidades.

### Arquitectura del Proyecto

GeoVerificationProject/ 
├── config/ 
│ └── config.py 
├── logs/ 
│ └── app.log 
├── models/ 
│ └── database.py 
├── services/ 
│ ├── alert_service.py 
│ ├── directory_service.py 
│ ├── geo_service.py 
│ └── system_service.py 
│── main.py 
├── requirements.txt 
└── README.md


### Funcionalidad
- Verifica la existencia de directorios prohibidos o faltantes.
- Rastrea la ubicación geográfica del dispositivo.
- Envía alertas si se detectan irregularidades en el sistema o en la estructura de archivos.

### Resultados
- **Verdadero**: Directorios no permitidos detectados, se ejecutan acciones correctivas.
- **Falso**: El sistema está en orden o las acciones correctivas ya se han ejecutado.

---

## Requisitos Generales

- **Python 3.x** instalado.
- Librerías necesarias (definidas en `requirements.txt` para cada proyecto).
- Acceso administrativo para la ejecución de ciertos scripts.

---

## Contacto

Si tienes preguntas o necesitas soporte técnico, por favor contacta al equipo de desarrollo o soporte técnico de PikaOs.
