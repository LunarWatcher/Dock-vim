FROM dock-neovim-base

RUN cd /build/neovim \
        && sh /helpers/neovim/buildneovim.sh
