FROM dock-vim-base

RUN mkdir build && cd build \
        && git clone https://github.com/vim/vim.git
        && git checkout tags/v8.2.0718
        && cd vim
        && wget <TODO>
        && chmod +x buildvim.sh 
        && ./buildvim.sh
