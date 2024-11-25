import psutil

def get_cpu_usage_and_temp():
    cpu_usage = psutil.cpu_percent(interval=1)
    
    if hasattr(psutil, "sensors_temperatures"):
        temps = psutil.sensors_temperatures()
        cpu_temp = temps['coretemp'][0].current if 'coretemp' in temps else None
    else:
        cpu_temp = None 
    return cpu_usage, cpu_temp
