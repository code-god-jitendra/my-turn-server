#!/bin/bash
# Start a simple HTTP server on port 80 for health checks (runs in background)
python3 -m http.server 80 &
# Start coturn with your configuration in verbose mode
turnserver -c /etc/turnserver.conf -v
