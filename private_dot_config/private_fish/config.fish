# Remove greeting message
set -U fish_greeting


# Set PATH
set -gx npm_config_prefix $HOME/.node_modules

set -gx GOROOT /usr/lib/go
set -gx GOPATH $HOME/.go

set -gx PATH $PATH $GOROOT/bin $GOPATH/bin $npm_config_prefix/bin $HOME/.config/composer/vendor/bin $HOME/.local/bin


# Set fish shell
set -g fish_prompt_pwd_dir_length 0


# GPG TTY
set -gx GPG_TTY (tty)


# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

starship init fish | source
