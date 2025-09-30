# Create a new session named "stable"
new-session -n stable -s stable

# Send the "stable" command to the first pane
send-keys 'automatic' Enter

# Split the window vertically
split-window -v

# In the new window, run the command "ngrok http 7860"
send-keys 'ngrok http 7860' Enter

# Select the first pane
select-pane -t 0

