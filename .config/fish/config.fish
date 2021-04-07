# Remove greeting message
set -U fish_greeting


# Set PATH
set -x npm_config_prefix $HOME/.node_modules

set -x GOROOT /usr/lib/go
set -x GOPATH $HOME/.go

set -x PATH $PATH $GOROOT/bin $GOPATH/bin $npm_config_prefix/bin $HOME/.config/composer/vendor/bin $HOME/.local/bin

# Set fish shell
set -g fish_prompt_pwd_dir_length 0


# Set bobthefish theme
set -g theme_color_scheme nord
set -g theme_date_timezone Asia/Jakarta
set -g theme_powerline_fonts yes
set -g theme_display_git yes
set -g theme_newline_cursor clean
set -g theme_display_git_default_branch yes


# GPG TTY
set -gx GPG_TTY (tty)
