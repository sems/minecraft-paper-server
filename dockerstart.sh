#!/bin/bash

# Parse memory argument (default to 8G if not provided)
MEMORY=${1:-8G}

# Start Minecraft server using tmux
tmux new -d -s minecraft-server "java -Xmx$MEMORY -Xms$MEMORY -jar paper.jar"
