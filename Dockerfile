FROM ubuntu:latest


# Устанавливаем 7-Zip из backports
RUN apt-get install -y p7zip

# Проверяем версию утилиты
RUN 7z -v