FROM europe-west3-docker.pkg.dev/rasa-releases/rasa-pro/rasa-pro:3.12.13

# Copy configuration files
COPY endpoints.yml /app/
COPY credentials.yml /app/
COPY actions.py /app/

# Copy model (or mount via persistent disk)
COPY models/model.tar.gz /app/models/

# Expose the port
EXPOSE 5005

# Set working directory
WORKDIR /app

# Start Rasa server
CMD ["run", "--enable-api", "--cors", "*", "--debug"]
