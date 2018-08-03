# ----------------------------------
# Wine Dockerfile for Steam Servers
# Environment: debian:9 + Wine
# Minimum Panel Version: 0.7.6
# ----------------------------------
FROM        debian:9

MAINTAINER  Zishan Ansari, <kinnngg786@gmail.com>

# Install Dependencies
RUN         dpkg --add-architecture i386 && \
            apt update && \
            apt upgrade -y && \
            apt install -y software-properties-common && \
            apt update && \
            apt install -y --install-recommends wine wine64 screen unzip sudo wget libstdc++6 lib32gcc1 ca-certificates xvfb rsync curl xorg && \
            useradd -d /home/container -m container && usermod -aG sudo container && \
            cd /home/container

USER        root
ENV         HOME /home/container
ENV         WINEARCH win64
ENV         WINEPREFIX /home/container/.wine64
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
