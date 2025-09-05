FROM ubuntu:jammy

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:0

# Install dependencies, including dbus and related tools
RUN apt update -y && \
    apt install -y \
    gnupg \
    software-properties-common \
    dbus-x11 \
    dbus-user-session \
    lxde-core \
    lxde-common \
    novnc \
    websockify \
    tightvncserver \
    && rm -rf /var/lib/apt/lists/*

# Add Cubic PPA and install Cubic
RUN add-apt-repository universe && \
    add-apt-repository ppa:cubic-wizard/release -y && \
    apt update && \
    apt install -y cubic
RUN export XDG_CACHE_HOME=/tmp/.cache

# Create a non-root user and set permissions
RUN useradd -ms /bin/bash cubic && \
    echo "cubic ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    mkdir -p /home/cubic/.cache && \
    chown -R cubic:cubic /home/cubic

# Set working dir
WORKDIR /home/cubic

USER cubic
ENV HOME /home/cubic

# Start everything
CMD ["cubic"]
