# Paper server preset

# Setup and running the server

The startup for the first time is some what diffrent compared to every next startup. So hereby a small guide how to, and what to do. Most of these steps are also listed in the console itself;
- Set the correct amount of RAM you want to allocate for the server in the `start.sh` file. 
  - The `Xmx18G`-argument correlates to the maximum amount of memory the minecraft-server may use, and `Xms8G` to the minimum. 
  - Change the `18G` and `8G` to the amount you want to allocate, `G` stands to Gibibytes in this case. 
- Run `./start.sh`. If you get a message that `tmux` is not recognized, run `sudo apt-get install tmux` first;
- You will see a message which states that you need to accept the EULA, which is located in `eula.txt`;
  - In this file set `eula=false` to `eula=true`, hereby you accept all terms and conditions listed in the link given;
- Run `./start.sh` again; 
- Attach to the background-session with: `tmux attach -t minecraft-server`;

# Additional setup
