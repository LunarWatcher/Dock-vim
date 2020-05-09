FROM dock-vim-base

RUN cd /build/vim \
        && git checkout tags/v8.1.2424 \
        && sh /helpers/buildvim.sh
