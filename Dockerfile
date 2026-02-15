FROM ubuntu:24.04

# Скачиваем архив и распаковываем его
RUN mkdir -p /tmp/download && \\
    cd /tmp/download && \\
    curl -LJO "https://downloads.sourceforge.net/project/p7zip/p7zip/16.02/p7zip_16.02_src_all.tar.bz2" && \\
    tar xfJ p7zip_16.02_src_all.tar.bz2 && \\
    cd p7zip_16.02 && make && make install

# Проверка установки
RUN 7z --help