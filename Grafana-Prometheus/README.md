# Instalación de Prometheus y Grafana en Portainer

Este archivo `README.md` proporciona una guía paso a paso para la instalación y configuración de Prometheus y Grafana en Portainer utilizando Caddy.

## Requisitos Previos

- Servidor con Ubuntu 22.04 LTS.
- Docker y Docker Compose instalados. 
- Portainer instalado y configurado.

## Información Adicional

1. Instala Caddy Server siguiendo las instrucciones de la [documentación oficial](https://caddyserver.com/docs/install) o revisa el siguiente repositorio [Caddy Server]().
2. Instala Portainer siguiendo las instrucciones de la [documentación oficial](https://docs.portainer.io/) o revisa el siguiente repositorio [Portainer]().

## Paso 1: Instalación de Grafana y Prometheus

1. Inicia sesión en Portainer y dirígete a la sección de "Stacks". Haz clic en "+ Add stack" y configura el nombre del stack, por ejemplo, `rustdesk-server`.

2. En el editor, crea el archivo `docker-compose.yml` (para mas refencia busca el archivo docker-compose.yml alojado en este apartado)

3. Despliega el stack en Portainer:
    - Haz clic en "Deploy the stack".

## Paso 2: Verificación de la Instalación

1. Abre tu navegador y navega a `http://your_domain` para verificar que los servicios están corriendo correctamente tanto Grafana como Prometheus.

## IMPORTANTE

Es crucial monitorear los recursos del servidor ya que tanto Prometheus como Grafana pueden consumir una cantidad significativa de CPU y memoria dependiendo de la cantidad de datos recolectados y visualizados.

## Conclusión

Siguiendo estos pasos, deberías tener Prometheus y Grafana corriendo en Portainer. Para más detalles y opciones de configuración, consulta la [documentación oficial de Prometheus](https://prometheus.io/docs/introduction/overview/) y la [documentación oficial de Grafana](https://grafana.com/docs/grafana/latest/).
