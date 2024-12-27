# Dockerfile
FROM docker:latest

# Install bash and other dependencies
RUN apk add --no-cache bash

# Copy our run script
COPY run.sh /
RUN chmod a+x /run.sh

# Command to run the application
CMD [ "/run.sh" ]