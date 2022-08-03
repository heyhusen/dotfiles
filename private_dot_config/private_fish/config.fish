# Remove greeting message
set -U fish_greeting


# Set fish shell
set -g fish_prompt_pwd_dir_length 0


# GPG TTY
set -gx GPG_TTY (tty)


# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

starship init fish | source

# pnpm
set -gx PNPM_HOME "/home/hapakaien/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end