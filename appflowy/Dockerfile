ROM appflowyio/appflowy_client:main

# Install required dependencies
RUN apt-get update && apt-get install -y \
    dbus \
    && rm -rf /var/lib/apt/lists/*

# Copy our run script
COPY run.sh /
RUN chmod a+x /run.sh

# Command to run the application
CMD [ "/run.sh" ]

# run.sh
#!/usr/bin/with-contenv bashio
bashio::log.info "Starting AppFlowy..."

# Create necessary directories
mkdir -p /home/appflowy

# Start AppFlowy
exec docker run --rm \
  -v /root/.Xauthority:/root/.Xauthority:rw \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/dri:/dev/dri \
  -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
  -v appflowy-data:/home/appflowy \
  -e DISPLAY=${DISPLAY} \
  appflowyio/appflowy_client:main