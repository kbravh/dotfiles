# Install Debian packages
echo "Installing Debian packages"
# Update Ubuntu and get standard repository programs
sudo apt update && sudo apt full-upgrade -y

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

install kitty
install tmux
install libevent
install ncurses
install bat
install git
install chromium-browser
install curl
install file
install gimp
install figlet
install lolcat
install neovim
install librsvg2-bin
install rar
install unrar

# Fix misnaming of bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# Install youtube-dl
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
chmod a+rx /usr/local/bin/youtube-dl

# Run all scripts in programs/
for f in programs/*.sh; do bash "$f" -H; done

# Get all upgrades
apt upgrade -y
apt autoremove -y

figlet "Systems are go." | lolcat
