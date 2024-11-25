@echo off
set shortcutName=KingDeportes
set targetPath="C:\Program Files\Google\Chrome\Application\chrome.exe"
set arguments=--app=https://kingdeportes.com/sportbook/
set shortcutLocation=%USERPROFILE%\Desktop\%shortcutName%.lnk
set iconPath=C:\Iconos\king.ico

powershell -command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%shortcutLocation%'); $s.TargetPath = '%targetPath%'; $s.Arguments = '%arguments%'; $s.IconLocation = '%iconPath%'; $s.Save()"

exit /b
