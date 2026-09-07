@echo off
setlocal
cd /d "%~dp0"
set "MYSQL=C:\Program Files\MariaDB 12.3\bin\mariadb.exe"

echo ==================================================
echo JUTI-HI rAthena - Local MariaDB Setup
echo ==================================================
echo.
echo MariaDB root password is required once for database/user creation.
echo.
"%MYSQL%" -h 127.0.0.1 -P 3306 -u root -p -e "SOURCE D:/JUTI-HI_Server-Client/JUTI-HI Server/setup_admin.sql;"
if errorlevel 1 goto :dbfail

echo.
echo [1/3] Importing main database...
"%MYSQL%" -h 127.0.0.1 -P 3306 -u rathena ragnarok_db < "%~dp0sql-files\main_db.sql"
if errorlevel 1 goto :dbfail

echo [2/3] Importing log database...
"%MYSQL%" -h 127.0.0.1 -P 3306 -u rathena ragnarok_log < "%~dp0sql-files\logs.sql"
if errorlevel 1 goto :dbfail

echo [3/3] Verifying database...
"%MYSQL%" -h 127.0.0.1 -P 3306 -u rathena -e "SELECT table_schema,COUNT(*) AS tables_count FROM information_schema.tables WHERE table_schema IN ('ragnarok_db','ragnarok_log') GROUP BY table_schema; SELECT account_id,userid,sex FROM ragnarok_db.login WHERE sex='S';"
if errorlevel 1 goto :dbfail

echo.
echo [OK] Database setup completed.
echo Starting rAthena login / char / map servers...
call "%~dp0runserver.bat" start
exit /b 0

:dbfail
echo.
echo [ERROR] Database setup failed. Check the message above.
pause
exit /b 1
