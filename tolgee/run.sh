# run.sh
#!/usr/bin/with-contenv bashio
bashio::log.info "Starting Tolgee..."

# Get config values
SSL=$(bashio::config 'ssl')
CERTFILE=$(bashio::config 'certfile')
KEYFILE=$(bashio::config 'keyfile')

# Basic docker run command
DOCKER_CMD="docker run --rm \
  -v tolgee_data:/data/ \
  -p 8085:8080"

# Add SSL configuration if enabled
if [ "$SSL" = true ]; then
    DOCKER_CMD="$DOCKER_CMD \
    -v /ssl/$CERTFILE:/ssl/cert.pem:ro \
    -v /ssl/$KEYFILE:/ssl/key.pem:ro \
    -e SERVER_SSL_ENABLED=true \
    -e SERVER_SSL_KEY_STORE=/ssl/cert.pem \
    -e SERVER_SSL_KEY_STORE_PASSWORD=/ssl/key.pem"
fi

# Add the image name and execute
DOCKER_CMD="$DOCKER_CMD tolgee/tolgee"
exec $DOCKER_CMD
