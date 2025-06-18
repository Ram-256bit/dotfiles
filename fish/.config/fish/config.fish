if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -U fish_greeting
set -g FZF_CTRL_T_COMMAND "command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"
set -Ux EDITOR nvim
set -Ux LANG en_IN.UTF-8

alias v="nvim"
alias c="clear"
alias q="exit"
alias rm="trash -v"
alias mkdri="mkdir -p"
alias f="find . | grep "

# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons' # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons' # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.='exa -ald --color=always --group-directories-first --icons .*' # show only dotfiles

alias cat='bat --style header --style snip --style changes --style header'

alias grep='ugrep --color=auto'
alias fgrep='ugrep -F --color=auto'
alias egrep='ugrep -E --color=auto'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

alias lg='lazygit'

alias t='tmux -u'

alias d="yy"

# Nix alias
alias fs='sudo nixos-rebuild switch --flake ~/my-flake'
alias fb='sudo nixos-rebuild boot --flake ~/my-flake'
alias fm='nvim ~/my-flake/configuration.nix'
alias fu='cd ~/my-flake ; sudo nix flake update ; cd -'
alias fg='lazygit --path ~/my-flake'
alias fus='fu;fs;notify-send "System Updated"'
alias fgc='sudo nix-collect-garbage -d ; fs'

# Yazi - stay in current dierctory
# ref: https://yazi-rs.github.io/docs/quick-start#shell-wrapper
function yy
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

starship init fish | source
zoxide init fish --cmd cd | source
