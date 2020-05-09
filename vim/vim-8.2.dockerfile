FROM dock-vim-base

RUN cd /build/vim \
    && git checkout tags/v8.2.0718 \
    && sh /helpers/vim/buildvim.sh
