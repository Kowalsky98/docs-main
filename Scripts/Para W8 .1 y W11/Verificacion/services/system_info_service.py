import platform
import subprocess

def get_system_serial():
    try:
        if platform.system() == "Windows":
            result = subprocess.check_output('wmic bios get serialnumber', shell=True)
            serial = result.decode().split('\n')[1].strip()
            return serial
        else:
            return "UnknownSerial"
    except Exception as e:
        raise Exception(f"Error al obtener el serial del sistema: {e}")
