FROM python:3.11-slim-bullseye


# Устанавливаем 7-Zip из backports
RUN apt-get install -y -t bullseye-backports p7zip-full

# Проверяем версию утилиты
RUN 7z -v