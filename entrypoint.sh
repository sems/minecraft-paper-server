#!/bin/bash

# Get the Minecraft version from the environment variable
MINECRAFT_VERSION=${MINECRAFT_VERSION:-1.20.1}  # Default version if not provided

# Accept Minecraft EULA
ACCEPT_EULA=${ACCEPT_EULA:-false}  # Default to false if not provided
if [ "$ACCEPT_EULA" != "true" ]; then
  echo "You need to agree to the EULA in order to run the server."
  echo "To accept the EULA, set the ACCEPT_EULA environment variable to 'true'."
  exit 1
fi

# Map version numbers to build numbers
case "$MINECRAFT_VERSION" in
  "1.20.1") PAPER_BUILD=117 ;;
  "1.19") PAPER_BUILD=81 ;;
  "1.19.1") PAPER_BUILD=111 ;;
  "1.19.2") PAPER_BUILD=307 ;;
  "1.19.3") PAPER_BUILD=448 ;;
  "1.19.4") PAPER_BUILD=550 ;;
  "1.20") PAPER_BUILD=17 ;;
  *) echo "Unsupported Minecraft version"; exit 1 ;;
esac

# Download Paper jar
curl -o paper.jar -L "https://api.papermc.io/v2/projects/paper/versions/$MINECRAFT_VERSION/builds/$PAPER_BUILD/downloads/paper-$MINECRAFT_VERSION-$PAPER_BUILD.jar"

# Accept Minecraft EULA
echo "eula=true" > eula.txt

# Start Minecraft server
java -Xms1G -Xmx${MEMORY} -jar paper.jar