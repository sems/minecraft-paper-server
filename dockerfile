# Use an official OpenJDK image as the base image
FROM adoptopenjdk:16-jre-hotspot

# Set the working directory
WORKDIR /minecraft

# Copy the repository contents into the container
COPY . /minecraft

# Expose necessary ports
EXPOSE 25565
EXPOSE 8123

# Entrypoint command
CMD ["./dockerstart.sh"]