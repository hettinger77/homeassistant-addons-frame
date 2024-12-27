# run.sh
#!/usr/bin/with-contenv bashio

# Basic docker run command
DOCKER_CMD="docker run --rm \
  -v tolgee_data:/data/ \
  -p 8085:8080"

# Add the image name and execute
DOCKER_CMD="$DOCKER_CMD tolgee/tolgee"
exec $DOCKER_CMD
