#
# ~/.bashrc
#

# # If not running interactively, don't do anything
# [[ $- != *i* ]] && return



###########################################################################
## Inspired by https://github.com/ChrisTitusTech/mybash
iatest=$(expr index "$-" i)

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# Disable the bell
if [[ $iatest -gt 0 ]]; then bind "set bell-style visible"; fi


# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest -gt 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest -gt 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Alias cat to bat
alias cat='bat'

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias mkdir='mkdir -p'

# Search files in the current folder
alias f="find . | grep "

###########################################################################


# #########################################################################
# # # ref: https://github.com/akinomyoga/ble.sh?tab=readme-ov-file#set-up-bashrc
# # # This is a dependency for atuin
# # Add this lines at the top of .bashrc:
# [[ $- == *i* ]] && source /path/to/blesh/ble.sh --noattach
#
# # your bashrc settings come here...
#
# # Add this line at the end of .bashrc:
# [[ ${BLE_VERSION-} ]] && ble-attach
# #########################################################################

# This is needed for ranger to open files using neovim editor
export VISUAL=nvim;
export EDITOR=nvim;


alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load starship prompt if starship is installed
if  [ -x /usr/bin/starship ]; then
    __main() {
        local major="${BASH_VERSINFO[0]}"
        local minor="${BASH_VERSINFO[1]}"

        if ((major > 4)) || { ((major == 4)) && ((minor >= 1)); }; then
            source <("/usr/bin/starship" init bash --print-full-init)
        else
            source /dev/stdin <<<"$("/usr/bin/starship" init bash --print-full-init)"
        fi
    }
    __main
    unset -f __main
fi
# Advanced command-not-found hook
# source /usr/share/doc/find-the-command/ftc.bash

## Useful aliases

# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.='exa -ald --color=always --group-directories-first --icons .*' # show only dotfiles

# Replace some more things with better alternatives
alias cat='bat --style header --style snip --style changes --style header'
# [ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

# Common use
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias rmpkg="sudo pacman -Rdd"
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias upd='/usr/bin/garuda-update'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='ugrep --color=auto'
alias fgrep='ugrep -F --color=auto'
alias egrep='ugrep -E --color=auto'
alias hw='hwinfo --short'                          # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"     # Sort installed packages according to size in MB (expac must be installed)
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
alias ip='ip -color'

# Get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Help people new to Arch
alias apt='man pacman'
alias apt-get='man pacman'
alias please='sudo'
alias tb='nc termbin.com 9999'
alias helpme='cht.sh --shell'
alias pacdiff='sudo -H DIFFPROG=meld pacdiff'

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

###############################################################################
#My custom stuff
alias v='nvim'
alias syu='sudo pacman -Syu'
alias pas='sudo pacman -S -i'
alias q='exit'
alias r='ranger_cd'
alias ti='terraform init'
alias tp='terraform plan'
alias ta='terraform apply'
alias lg='lazygit'
alias tma='tmux attach'
alias g-off='gsettings set org.gnome.shell disable-user-extensions true'
alias g-version='gsettings set org.gnome.shell disable-extension-version-validation "false"'
alias t='tmux'
alias c='clear'
alias d='yy'

# #Make your shell change to ranger’s directory on quit
# #ref: https://github.com/ranger/ranger/wiki/Integration-with-other-programs#make-your-shell-change-to-rangers-directory-on-quit
# alias ranger='source ranger ranger'

# alias ranger='ranger_cd'
ranger_cd() {
    temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
    ranger --choosedir="$temp_file" -- "${@:-$PWD}"
    if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
        cd "$chosen_dir"
    fi
    /bin/rm -f -- "$temp_file" # Custom change made to directly use 'rm' command instead of aliased 'trash' command
}

# # Source: https://github.com/TrudeEH/dotfiles/blob/a3431cca314551675f3c671c76b6fbd5a1f37aa4/dotfiles/.bashrc
# hex2color(){
#     hex=${1#"#"}
#     r=$(printf '0x%0.2s' "$hex")
#     g=$(printf '0x%0.2s' ${hex#??})
#     b=$(printf '0x%0.2s' ${hex#????})
#     printf '%03d' "$(( (r<75?0:(r-35)/40)*6*6 +
#                        (g<75?0:(g-35)/40)*6   +
#                        (b<75?0:(b-35)/40)     + 16 ))"
# }

# Yazi - stay in current dierctory
# ref: https://yazi-rs.github.io/docs/quick-start#shell-wrapper
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	/bin/rm -f -- "$tmp"
}


#Gives the name of the terminal emulator as output
which_term(){
    term=$(perl -lpe 's/\0/ /g' \
           /proc/$(xdotool getwindowpid $(xdotool getactivewindow))/cmdline)

    ## Enable extended globbing patterns
    shopt -s extglob
    case $term in
        ## If this terminal is a python or perl program,
        ## then the emulator's name is likely the second
        ## part of it
        */python*|*/perl*    )
         term=$(basename "$(readlink -f $(echo "$term" | cut -d ' ' -f 2))")
         version=$(dpkg -l "$term" | awk '/^ii/{print $3}')
         ;;
        ## The special case of gnome-terminal
        *gnome-terminal-server* )
          term="gnome-terminal"
        ;;
        ## For other cases, just take the 1st
        ## field of $term
        * )
          term=${term/% */}
        ;;
     esac
     version=$(dpkg -l "$term" | awk '/^ii/{print $3}')
     echo "$term  $version"
}
# which_term(){
#      term=$(ps -p $(ps -p $$ -o ppid=) -o args=);
#      found=0;
#      case $term in
#          *gnome-terminal*)
#              found=1
#              echo "gnome-terminal " $(dpkg -l gnome-terminal | awk '/^ii/{print $3}')
#              ;;
#          *lxterminal*)
#              found=1
#              echo "lxterminal " $(dpkg -l lxterminal | awk '/^ii/{print $3}')
#              ;;
#          rxvt*)
#              found=1
#              echo "rxvt " $(dpkg -l rxvt | awk '/^ii/{print $3}')
#              ;;
#          ## Try and guess for any others
#          *)
#              for v in '-version' '--version' '-V' '-v'
#              do
#                  $term "$v" &>/dev/null && eval $term $v && found=1 && break
#              done
#              ;;
#      esac
     ## If none of the version arguments worked, try and get the
#      ## package version
#      [ $found -eq 0 ] && echo "$term " $(dpkg -l $term | awk '/^ii/{print $3}')
#  }
#
# . "$HOME/.cargo/env"
#
# Created by `pipx` on 2024-02-03 19:32:41
export PATH="$PATH:/home/ram/.local/bin"

#zoxide
eval "$(zoxide init bash --cmd 'cd')"
alias cdi='__zoxide_zi'

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# eval "$(atuin init bash)"
# [[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
# source /usr/share/nvm/init-nvm.sh

# For 1Password ssh agent
# export SSH_AUTH_SOCK=~/.1password/agent.sock

export ANDROID_HOME="/home/ram/Android/Sdk"
export CHROME_EXECUTABLE="/bin/google-chrome-stable"
export ANDROID_SDK_ROOT="/home/ram/Android/Sdk"

export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

#
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#
# pnpm
export PNPM_HOME="/home/ram/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export MANPAGER='nvim +Man!'
