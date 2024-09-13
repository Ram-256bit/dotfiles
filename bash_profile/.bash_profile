#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:~/.cargo/bin/

# Created by `pipx` on 2024-05-01 15:03:33
export PATH="$PATH:/home/ram/.local/bin"
. "$HOME/.cargo/env"
export PATH="~/development/flutter/bin:$PATH"


export ANDROID_HOME="/home/ram/Android/Sdk"
export CHROME_EXECUTABLE="/bin/google-chrome-stable"
export ANDROID_SDK_ROOT="/home/ram/Android/Sdk"

export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

