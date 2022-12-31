function deb_install {
	echo "Installing $1"
	
	if ! command -v $1 &> /dev/null; then
		echo "Installing: ${1}..."
		#TODO - decide package manager based on distro
		sudo apt install -y $1 || echo "Can´t install $1"
	else
		echo "Already installed: ${1}"
	fi
}
