import requests

API_URL = "https://api.gana-loterias.com/v4/geolocation"

def evaluate_system_status(cpu_usage, cpu_temp, memory_usage, disk_usage):
    alert = False
    alert_type = []

    if cpu_usage > 85:
        alert = True
        alert_type.append("CpuCritico")

    if cpu_temp and cpu_temp > 70:
        alert = True
        alert_type.append("CpuCritico")

    if memory_usage > 85:
        alert = True
        alert_type.append("MemoriaCritico")

    if disk_usage > 90:
        alert = True
        alert_type.append("DiskCritico")

    return alert, ", ".join(alert_type) if alert else "Hardware en buen estado"

def send_alert(serial, alert, alert_type, latitude=0, longitude=0):
    data = {
        "serial": serial,
        "alert": alert,
        "alertType": alert_type,
        "latitude": latitude if latitude is not None else 0,
        "longitude": longitude if longitude is not None else 0
    }
    response = requests.post(API_URL, json=data)
    return response.status_code, response.json()
