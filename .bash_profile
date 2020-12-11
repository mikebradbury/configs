# file here to satisfy macOS login shell pattern 
if [ -f $HOME/.bashrc ]; then
        source $HOME/.bashrc
fi
export PATH="/usr/local/sbin:$PATH"
