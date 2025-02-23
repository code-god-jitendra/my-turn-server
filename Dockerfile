FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y coturn python3 && \
    rm -rf /var/lib/apt/lists/*

COPY turnserver.conf /etc/turnserver.conf

# Expose TURN ports and HTTP port 80
EXPOSE 3478/udp
EXPOSE 3478/tcp
EXPOSE 80/tcp

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
