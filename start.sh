#!/bin/bash
cd "$(dirname "$0")"

# Заставляем Playwright устанавливать браузеры прямо в папку проекта, а не в системный кэш!
export PLAYWRIGHT_BROWSERS_PATH=0

if [ ! -d "venv" ]; then
    echo "🌸 Создаю виртуальное окружение (первый запуск)..."
    python3 -m venv venv
    venv/bin/pip install -r requirements.txt
    venv/bin/playwright install chromium
fi

source venv/bin/activate
export PLAYWRIGHT_BROWSERS_PATH=0

# Запускаем Yummy-DL
python3 main.py
