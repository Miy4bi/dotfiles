# pyenv
if [ ! -d ~/.pyenv ]; then
    echo "pyenv not found, so installing it now."
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
else
    echo "found pyenv"
fi

# goenv
if [ ! -d ~/.goenv ]; then
    echo "goenv not found, so installing it now."
    git clone https://github.com/wfarr/goenv.git ~/.goenv
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
else
    echo "found rustup"
fi