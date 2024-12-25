ARG BUILD_FROM
FROM $BUILD_FROM

# Install required dependencies
RUN apt-get update && apt-get install -y \
    dbus \
    && rm -rf /var/lib/apt/lists/*

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

# Command to run the application
CMD [ "/run.sh" ]
