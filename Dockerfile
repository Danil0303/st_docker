FROM ubuntu:18.04

# Install wget
RUN apt-get update
RUN apt-get install -y wget

# Add 32-bit architecture
RUN dpkg --add-architecture i386
RUN apt-get update

# Install Wine
RUN apt-get install -y software-properties-common gnupg2
RUN wget -nc https://dl.winehq.org/wine-builds/winehq.key
RUN apt-key add winehq.key
RUN apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
RUN apt-get install -y --install-recommends winehq-stable winbind

# Turn off Fixme warnings
ENV WINEDEBUG=fixme-all

# Setup Wine prefix
ENV WINEPREFIX=/root/.7z
ENV WINEARCH=win64
RUN winecfg

# Download MSI installer
RUN wget https://www.7-zip.org/a/7z1900-x64.msi

# Install 7z
RUN wineboot -u && msiexec /i /7z1900-x64.msi

# Run application
ENTRYPOINT ["wine", "/root/.7z/drive_c/Program Files/7-Zip/7z"]