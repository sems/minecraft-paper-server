# Use an official AdoptOpenJDK image as the base image
FROM openjdk:23-jdk

# Labels
LABEL org.opencontainers.image.source=https://github.com/sems/minecraft-paper-server/

# Set environment variables
ENV MEMORY=2G
ENV OP_USERNAME=""
ENV OP_UUID=""

# Set the working directory
WORKDIR /minecraft

# Copy the entrypoint script
COPY entrypoint.sh /minecraft/entrypoint.sh
RUN chmod +x /minecraft/entrypoint.sh

# Create plugins directory and copy JAR files
RUN mkdir -p /minecraft/plugins
COPY plugins/*.jar /minecraft/plugins/

# Expose necessary ports
EXPOSE 25565
EXPOSE 8123

# Entrypoint command
CMD ["/minecraft/entrypoint.sh"]
