# install build dependencies
sudo apt install build-essential libfftw3-dev libasound2-dev libpulse-dev libtool automake autoconf-archive libiniparser-dev libsdl2-2.0-0 libsdl2-dev libpipewire-0.3-dev libjack-jackd2-dev pkgconf

# clone repo
git clone git@github.com:karlstav/cava.git
cd cava

# Build
./autogen.sh
./configure
make

# Install
make install
