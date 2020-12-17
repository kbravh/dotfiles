!#/usr/bin bash

function install {
	which $1 &> /dev/null

	if [ $? -ne 0]; then
		echo "Installing: ${1}..."
		#TODO - decide package manager based on distro
		apt install -y $1
	else
		echo "Already installed: ${1}"
	fi
}

check_root () {
  if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 
    exit 1
  fi
}

