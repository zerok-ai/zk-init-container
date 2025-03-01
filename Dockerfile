# Dockerfile

# Use Alpine as the base image
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the Go executable and config file
ARG APP_FILE
COPY ${APP_FILE} /app/myapp

# Set executable permissions for the Go executable
RUN chmod +x /app/myapp

USER 65532:65532
# Run the Go executable
CMD ["./myapp"]