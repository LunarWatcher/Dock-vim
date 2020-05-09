FROM dock-neovim-base

RUN cd /build/neovim \
        && git checkout stable \
        && sh /helpers/neovim/buildneovim.sh
