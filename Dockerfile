FROM python:3.11-slim-bullseye

# Обновляем систему и устанавливаем 7-Zip
RUN apt-get update && apt-get install -y p7zip-full

# Проверка установки утилиты
RUN 7z -v