import os
import logging
import requests
from services.geo_service import get_ip_address, get_geolocation
from services.system_service import get_system_serial
from services.directory_service import get_directories_from_api, verify_directories, check_missing_directories
from services.alert_service import send_geo_alert  
from config.config import ALERT_API_URL, DIRECTORIES_API_URL, POST_FILE_PATH, ERROR_LOG_FILE, LOG_FILE

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s:%(levelname)s:%(message)s',
    handlers=[
        logging.FileHandler(LOG_FILE),
        logging.StreamHandler()
    ]
)

error_logger = logging.getLogger('errorLogger')
error_handler = logging.FileHandler(ERROR_LOG_FILE)
error_handler.setFormatter(logging.Formatter('%(asctime)s:%(levelname)s:%(message)s'))
error_logger.addHandler(error_handler)
error_logger.setLevel(logging.ERROR)

try:
    serial = get_system_serial()
    if not serial:
        raise ValueError("Serial del sistema no encontrado o está en blanco.")
    logging.info(f"Serial del sistema: {serial}")
except Exception as e:
    error_logger.error(f"Error al obtener el serial del sistema: {e}")
    serial = "1exc100" 

try:
    ip_address = get_ip_address()
    logging.info(f"IP: {ip_address}")
    latitude, longitude = get_geolocation(ip_address)
    logging.info(f"Geo - Latitud: {latitude}, Longitud: {longitude}")

    directories = get_directories_from_api(DIRECTORIES_API_URL)
    invalid_directories = verify_directories(directories)
    missing_directories = check_missing_directories(directories)

    if invalid_directories:
        for directory in invalid_directories:
            send_geo_alert(ALERT_API_URL, serial, f"Alerta: {directory}", float(latitude), float(longitude), True)
            logging.info(f"Alerta: {directory}")
    if missing_directories:
        send_geo_alert(ALERT_API_URL, serial, "Run Post.lnk", float(latitude), float(longitude), False)
        logging.info("Run Post.lnk")
        os.startfile(POST_FILE_PATH) 
    if not missing_directories and not invalid_directories:
        send_geo_alert(ALERT_API_URL, serial, "OK", float(latitude), float(longitude), False)
        logging.info("Sistemas al 100%.")
except requests.RequestException as e:
    error_logger.error(f"Error de conexión o a la API: {e}")
except Exception as e:
    error_logger.error(f"Error inesperado: {e}")
