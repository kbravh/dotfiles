# Create a new session named "stable" and run the "stable" command
new-session -n stable -s stable 'stable'

# Split the window horizontally
split-window -h

# In the new window, run the command "ngrok http 7860"
send-keys 'ngrok http 7860' Enter

# Select the first pane
select-pane -t 0

