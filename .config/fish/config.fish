# Remove greeting message
set -U fish_greeting

# Set PATH
set -x GOROOT /usr/lib/go
set -x GOPATH $HOME/go

set -x PATH $PATH $GOROOT/bin $GOPATH/bin $HOME/.node_modules/bin

set -x npm_config_prefix $HOME/.node_modules

# Set fish shell
set -g fish_prompt_pwd_dir_length 0


# Set bobthefish theme
set -g theme_color_scheme nord
set -g theme_date_timezone Asia/Jakarta
set -g theme_powerline_fonts yes
set -g theme_display_git yes
set -g theme_newline_cursor clean
