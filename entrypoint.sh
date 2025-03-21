#!/bin/bash

# Get the Minecraft version from the environment variable
MINECRAFT_VERSION=${MINECRAFT_VERSION:-1.21.4}  # Default version if not provided

# Accept Minecraft EULA
ACCEPT_EULA=${ACCEPT_EULA:-false}  # Default to false if not provided
if [ "$ACCEPT_EULA" != "true" ]; then
  echo "You need to agree to the EULA in order to run the server."
  echo "To accept the EULA, set the ACCEPT_EULA environment variable to 'true'."
  exit 1
fi

# Map version numbers to build numbers
case "$MINECRAFT_VERSION" in
  "1.21.4") PAPER_BUILD=214 ;;
  "1.21.3") PAPER_BUILD=82 ;;
  "1.21.1") PAPER_BUILD=132 ;;
  "1.21") PAPER_BUILD=130 ;;
  "1.20.6") PAPER_BUILD=151 ;;
  "1.20.5") PAPER_BUILD=22 ;;
  "1.20.4") PAPER_BUILD=499 ;;
  "1.20.2") PAPER_BUILD=318 ;;
  "1.20.1") PAPER_BUILD=196 ;;
  "1.20") PAPER_BUILD=17 ;;
  "1.19.4") PAPER_BUILD=550 ;;
  "1.19.3") PAPER_BUILD=448 ;;
  "1.19.2") PAPER_BUILD=307 ;;
  "1.19.1") PAPER_BUILD=111 ;;
  "1.19") PAPER_BUILD=81 ;;
  *) echo "Unsupported Minecraft version"; exit 1 ;;
esac

# Download Paper jar
curl -o paper.jar -L "https://api.papermc.io/v2/projects/paper/versions/$MINECRAFT_VERSION/builds/$PAPER_BUILD/downloads/paper-$MINECRAFT_VERSION-$PAPER_BUILD.jar"

# Accept Minecraft EULA
echo "eula=true" > eula.txt

# Setup operator if username and UUID are provided
if [ ! -z "$OP_USERNAME" ] && [ ! -z "$OP_UUID" ]; then
  echo "Setting up operator: $OP_USERNAME with UUID: $OP_UUID"
  # Create ops.json file if it doesn't exist
  mkdir -p ops
  cat > ops.json << EOF
[
  {
    "uuid": "$OP_UUID",
    "name": "$OP_USERNAME",
    "level": 4,
    "bypassesPlayerLimit": true
  }
]
EOF
  echo "Operator file created successfully."
fi

# Start Minecraft server
java -Xms1G -Xmx${MEMORY} -jar paper.jar