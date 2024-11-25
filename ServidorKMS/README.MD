# KMS Activation Script

Este script en batch se utiliza para activar productos de Microsoft mediante un servidor KMS (Key Management Service). El script realiza los siguientes pasos:

1. Establece la dirección IP y el puerto del servidor KMS.
2. Asigna una clave de producto (product key) específica.
3. Configura el servidor KMS utilizando la IP y el puerto definidos.
4. Activa el producto utilizando el servidor KMS.

## Requisitos

- Windows debe estar instalado en el sistema.
- Acceso a un servidor KMS válido.
- Permisos de administrador para ejecutar el script.

## Uso

1. Abre una ventana de **Símbolo del Sistema (CMD)** como administrador.
2. Ejecuta el archivo `.bat` (script batch).

### Pasos del script:

1. **Configuración de las variables:**
   - `KMS_SERVER_IP`: Define la IP o el dominio del servidor KMS.
   - `KMS_SERVER_PORT`: Define el puerto para el servidor KMS.
   - `KMS_PRODUCT_KEY`: Clave del producto que se va a activar.

## Nota
- Este script está configurado para usar un servidor KMS específico y una clave de producto de ejemplo. Asegúrate de cambiar la IP, puerto, y clave de producto según tus necesidades.
- La clave de producto en este script es solo de ejemplo y deberá ser reemplazada por una clave válida para el producto de Microsoft que desees activar.

## Importante
Sla clave de producto podremos obtenerlo mediante este link (https://py-kms.readthedocs.io/en/latest/Keys.html)