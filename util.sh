function _install {
	echo "Installing $1"

	if ! command -v $1 &> /dev/null; then
		echo "Installing: ${1}..."
		yay -S --noconfirm $1 || echo "Can't install $1"
	else
		echo "Already installed: ${1}"
	fi
}
