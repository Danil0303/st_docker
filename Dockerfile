FROM debian:buster-slim


# Устанавливаем 7-Zip из backports
RUN apt-get install -y p7zip-full

# Проверяем версию утилиты
RUN 7z -v