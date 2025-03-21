# Use an official AdoptOpenJDK image as the base image
FROM openjdk:23-jdk

# Set environment variables
ENV MEMORY=2G

# Set the working directory
WORKDIR /minecraft

# Copy the entrypoint script
COPY entrypoint.sh /minecraft/entrypoint.sh
RUN chmod +x /minecraft/entrypoint.sh

# Expose necessary ports
EXPOSE 25565
EXPOSE 8123

# Entrypoint command
CMD ["/minecraft/entrypoint.sh"]