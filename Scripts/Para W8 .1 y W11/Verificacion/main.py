from services.cpu_service import get_cpu_usage_and_temp
from services.memory_service import get_memory_usage
from services.disk_service import get_disk_usage
from services.system_info_service import get_system_serial
from services.alert_service import evaluate_system_status, send_alert

def main():
    try:
        serial = get_system_serial()
        cpu_usage, cpu_temp = get_cpu_usage_and_temp()
        memory_usage = get_memory_usage()
        disk_usage = get_disk_usage()

        alert, alert_type = evaluate_system_status(cpu_usage, cpu_temp, memory_usage, disk_usage)

        status_code, response = send_alert(serial, alert, alert_type)
        print(f"Alert sent with status cod {status_code}: {response}")

    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()
