FROM dock-vim-base

RUN cd /build/vim \
        && git checkout tags/v8.0.1850 \
        && sh /helpers/buildvim.sh
