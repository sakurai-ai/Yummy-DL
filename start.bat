@echo off
cd /d "%~dp0"

:: Заставляем Playwright устанавливать браузеры прямо в папку проекта!
set PLAYWRIGHT_BROWSERS_PATH=0

if not exist venv\ (
    echo 🌸 Creating virtual environment...
    python -m venv venv
    call venv\Scripts\activate.bat
    pip install -r requirements.txt
    playwright install chromium
) else (
    call venv\Scripts\activate.bat
)

set PLAYWRIGHT_BROWSERS_PATH=0
python main.py
pause
