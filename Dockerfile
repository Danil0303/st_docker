FROM delitescere/7z AS p7zip-source

# Этап 2: Ваша рабочая Ubuntu
FROM ubuntu:24.04

# Копируем исполняемые файлы и библиотеки 7z
COPY --from=p7zip-source /usr/bin/7z /usr/bin/7z
COPY --from=p7zip-source /usr/lib/p7zip /usr/lib/p7zip

# Пример проверки
RUN 7z --help