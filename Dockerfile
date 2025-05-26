FROM europe-west3-docker.pkg.dev/rasa-releases/rasa-pro/rasa-pro:3.12.13

RUN mkdir -p /app/models /app/actions

COPY endpoints.yml /app/
COPY credentials.yml /app/
COPY actions/ /app/actions/
COPY models/model.tar.gz /app/models/

EXPOSE 5005
WORKDIR /app

# Bind to all interfaces, not just localhost
CMD ["run", "--enable-api", "--cors", "*", "--debug", "--port", "5005"]
