FROM appflowyio/appflowy_client:main

# Install required dependencies
RUN apt-get update && apt-get install -y \
    dbus \
    && rm -rf /var/lib/apt/lists/*

# Copy our run script
COPY run.sh /
RUN chmod a+x /run.sh

# Command to run the application
CMD [ "/run.sh" ]

