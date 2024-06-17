#!bin/bash

# Create the $HOME/opt destination folder
mkdir -p ~/opt
# Download the AppImage inside it
wget -O ~/opt/Espanso.AppImage 'https://github.com/federico-terzi/espanso/releases/download/v2.2.1/Espanso-X11.AppImage'
# Make it executable
chmod u+x ~/opt/Espanso.AppImage
# Create the "espanso" command alias
sudo ~/opt/Espanso.AppImage env-path register

# Register espanso as a systemd service (required only once)
sudo ~/opt/Espanso.AppImage service register

# Start espanso
sudo ~/opt/Espanso.AppImage start
