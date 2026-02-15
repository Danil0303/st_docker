FROM python:3.11-slim-bullseye

# Установка основных зависимостей и обновление списка пакетов
RUN apt-get update && \\
    apt-get install -y wget gnupg software-properties-common

# Добавляем дополнительный репозиторий, содержащий пакет p7zip
RUN echo 'deb http://deb.debian.org/debian bullseye-backports main' > /etc/apt/sources.list.d/bullseye-backports.list && \\
    apt-get update

# Установка утилиты 7z из нового репозитория
RUN apt-get install -y -t bullseye-backports p7zip-full

# Дополнительная проверка успешной установки
RUN 7z --version