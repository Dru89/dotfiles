#################
# variables and conditional scripts

# PATH setup
export PATH="./node_modules/.bin:$HOME/.rbenv/shims:$HOME/bin:$HOME/.local/bin:$HOME/.rbenv/bin:$HOME/Library/Android/sdk/platform-tools:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# node modules
export NODE_PATH="/usr/local/lib/node_modules"

# 256 color terminal
export TERM='xterm-256color'

# Keep aliases separate
source ~/.aliases

# Enabling some scripts if they exist.
test -f /usr/local/bin/virtualenvwrapper.sh && source /usr/local/bin/virtualenvwrapper.sh
test -f ~/.localprofile && source ~/.localprofile

ARCANIST_COMPLETION=/usr/local/Cellar/arcanist/HEAD/arcanist/resources/shell/bash-completion
test -f $ARCANIST_COMPLETION && source $ARCANIST_COMPLETION

# Set up our EDITOR variable
# neovim if it exists, otherwise vim, otherwise leave it unset
if command -v nvim > /dev/null; then
    export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    export EDITOR='nvim'
elif command -v vim > /dev/null; then
    export EDITOR='vim'
else
    echo "You're missing both neovim and vim.  You're going to have a bad time."
    echo "Not setting \$EDITOR (Previous value: $EDITOR)"
fi

# I don't want to source ~/.profile twice, and ~/.zprofile just sources this file.  So just in case there could ever be
# a case where this wouldn get sourced twice, I'll drop this variable here.  To prevent the file from getting sourced
# twice, you can use:
#       test -z $PROFILE_SOURCED && source ~/.profile
export PROFILE_SOURCED=1
