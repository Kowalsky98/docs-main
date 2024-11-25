# services/geo_service.py
import requests

def get_ip_address():
    """Obtiene la dirección IP pública del dispositivo."""
    response = requests.get("https://api64.ipify.org?format=json")
    response.raise_for_status()
    return response.json()["ip"]

def get_geolocation(ip_address):
    """Obtiene la latitud y longitud de una dirección IP usando IP Geolocation API."""
    api_key = "70d8fb8086de4c69a7e8227f7c3b31c9"
    url = f"https://api.ipgeolocation.io/ipgeo?apiKey={api_key}&ip={ip_address}"
    response = requests.get(url)
    response.raise_for_status()
    data = response.json()
    latitude = data.get("latitude")
    longitude = data.get("longitude")
    if latitude is not None and longitude is not None:
        return float(latitude), float(longitude)
    else:
        return None, None
