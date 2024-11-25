$ErrorActionPreference= 'silentlycontinue'

cd $env:ProgramFiles\RustDesk\
.\RustDesk.exe --get-id | out-host