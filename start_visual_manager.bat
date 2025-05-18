@echo off
REM MCP Visual Manager Launcher for Windows

echo Starting MCP Visual Manager...
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python is not installed or not in PATH
    pause
    exit /b 1
)

REM Check if gateway file exists
if not exist "mcp_gateway_simple.py" (
    echo Error: Gateway file not found
    echo Please run this script from the mcp_servers_collection directory
    pause
    exit /b 1
)

REM Check if port 8002 is already in use
netstat -an | findstr :8002 | findstr LISTENING >nul
if %errorlevel% equ 0 (
    echo Gateway is already running on port 8002
) else (
    echo Starting MCP Gateway...
    start /b python mcp_gateway_simple.py
    
    REM Wait a moment for the gateway to start
    echo Waiting for gateway to start...
    timeout /t 3 /nobreak >nul
)

REM Open visual manager in browser
echo Opening Visual Manager...
start visual_manager.html

echo.
echo MCP Visual Manager is ready!
echo.
echo Gateway URL: http://localhost:8002
echo Visual Manager: file://%cd%\visual_manager.html
echo.
echo Press any key to stop the gateway...
pause >nul

REM Kill Python processes (be careful with this)
taskkill /f /im python.exe >nul 2>&1