@echo off
setlocal
set "PHP=D:\JUTI-HI_Server-Client\php83\php.exe"
set "WEBROOT=D:\JUTI-HI_Server-Client\JUTI-HI Website"
if not exist "%PHP%" (
  echo PHP not found: %PHP%
  pause
  exit /b 1
)
echo Starting JUTI Website at http://127.0.0.1:8080/
start "JUTI Website" /D "%WEBROOT%" "%PHP%" -S 127.0.0.1:8080 -t "%WEBROOT%"
endlocal
