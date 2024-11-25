@echo off

REM Establecer la configuración del plan de energía para que nunca se apague la pantalla y nunca se suspenda el equipo
powercfg /change monitor-timeout-ac 0
powercfg /change monitor-timeout-dc 0
powercfg /change standby-timeout-ac 0
powercfg /change standby-timeout-dc 0

echo La configuración del plan de energía se ha cambiado correctamente.
exit
