set -x GOROOT /usr/lib/go
set -x GOPATH $HOME/go

set -x PATH $PATH $GOROOT/bin $GOPATH/bin $HOME/.node_modules/bin

set -x npm_config_prefix $HOME/.node_modules


starship init fish | source
