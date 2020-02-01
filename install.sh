mkdir -p ~/local

# Emacs
if [ ! -d ~/.emacs.d ]; then
    curl -sSL -o ~/emacs-26.3.tar.gz http://gnu.mirrors.pair.com/emacs/emacs-26.3.tar.gz
    tar -zxf ~/emacs-26.3.tar.gz -C ~
    cd ~/emacs-26.3
    ./configure --with-gif=no --with-tiff=no --prefix=$HOME/local && make # required gnutls, xpm
    make install
fi

# pyenv
if [ ! -d ~/.pyenv ]; then
    echo "pyenv not found, so installing it now."
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    echo "pyenv installed"
else
    echo "found pyenv"
fi

# goenv
if [ ! -d ~/.goenv ]; then
    echo "goenv not found, so installing it now."
    git clone https://github.com/wfarr/goenv.git ~/.goenv
    echo "goenv installed"
else
    echo "found goenv"
fi

# rustup
if [ ! -d ~/.rustup ]; then
    echo "rustup not found, so installing it now."
    curl https://sh.rustup.rs -sSf | sh
    echo "generate a completion script for Bash"
    mkdir -p ~/.local/share/bash-completion/completions
    rustup completions bash > ~/.local/share/bash-completion/completions/rustup
    echo "generate a completion script for cargo"
    rustup completions bash cargo >> ~/.local/share/bash-completion/completions/cargo
    echo "rustup installed"
else
    echo "found rustup"
fi

# opam
if [ ! -d ~/.opam ]; then
    echo "opam not found, so installing it now."
    curl -sSL -o ~/opam-full-2.0.6.tar.gz https://github.com/ocaml/opam/releases/download/2.0.6/opam-full-2.0.6.tar.gz
    tar -zxf ~/opam-full-2.0.6.tar.gz -C ~
    cd ~/opam-full-2.0.6/
    ./configure --prefix=$HOME/local && make lib-ext && make
    make install
    ~/opam-full-2.0.6/opam init
    echo "opam installed"
else
    echo "found opam"
fi

# update .bashrc
# cat .bashrc >> ~/.bashrc
. ~/.bashrc

echo "all done"
