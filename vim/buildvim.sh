# We're assuming we're already in the cheched-out vim dir
cd src
./configure --with-features=huge --enable-multibyte \
    --enable-python3interp=yes --prefix=/usr/local
make
make install

