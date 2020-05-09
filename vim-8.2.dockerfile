FROM dock-vim-base

RUN cat /helpers/buildvim.sh && cd /build/vim \
    && git checkout tags/v8.2.0718 \
    && sh /helpers/buildvim.sh
