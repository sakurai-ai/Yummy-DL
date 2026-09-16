#!/bin/bash
cd "$(dirname "$0")"

if [ ! -d "venv" ]; then
    echo "🌸 Создаю виртуальное окружение (первый запуск)..."
    python3 -m venv venv
    venv/bin/pip install -r requirements.txt
    venv/bin/playwright install chromium
fi

source venv/bin/activate

# Запускаем Yummy-DL
python3 main.py
