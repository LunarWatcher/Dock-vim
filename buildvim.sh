apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev \
    python3-dev

# We're assuming we're already in the cheched-out vim dir
cd src
./configure --with-features=huge --enable-multibyte \
    --enable-python3interp=yes --prefix=/usr/local
make
sudo make install

