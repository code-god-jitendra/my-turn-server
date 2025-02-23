# Use Ubuntu 20.04 as the base image
FROM ubuntu:20.04

# Disable interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update packages and install coturn
RUN apt-get update && \
    apt-get install -y coturn && \
    rm -rf /var/lib/apt/lists/*

# Copy your custom TURN server configuration file into the container
COPY turnserver.conf /etc/turnserver.conf

# Expose the default TURN port for both UDP and TCP
EXPOSE 3478/udp
EXPOSE 3478/tcp

# Start coturn with the configuration file in verbose mode
CMD ["turnserver", "-c", "/etc/turnserver.conf", "-v"]
