$ErrorActionPreference= 'silentlycontinue'

$confirmation_file = "C:\program files\RustDesk\rdrunonce.txt"

if ([System.IO.File]::Exists($confirmation_file)) {
    echo "Confirmation file exists"
    exit 0
}
else
{
    echo "Confirmation file doesn't exists"
    exit 1
}