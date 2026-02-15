FROM python:3.11-slim-bullseye

# Обновляем списки пакетов и добавляем backports
RUN apt-get update && \\
    echo 'deb http://deb.debian.org/debian bullseye-backports main' > /etc/apt/sources.list.d/bullseye-backports.list && \\
    apt-get update

# Устанавливаем 7-Zip из backports
RUN apt-get install -y -t bullseye-backports p7zip-full

# Проверяем версию утилиты
RUN 7z -v