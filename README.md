# paper-server

# Running the server

The startup for the first time is some what diffrent compared to every next startup. So hereby a small guide how to, and what to do. Most of these steps are also listed in the console itself;
- Run `./start.sh`. If you get a message that `tmux` is not recognized, run `sudo apt-get install tmux` first;
- You will see a message which states that you need to accept the EULA, which is located in `eula.txt`;
  - In this file set `eula=false` to `eula=true`, hereby you accept all terms and conditions listed in the link given;
- Run `./start.sh` again; 
- Attach to the background-session with: `tmux attach -t minecraft-server`;
