# PATH stuff
export PATH="./node_modules/.bin:$HOME/.rbenv/shims:$HOME/bin:$HOME/.local/bin:$HOME/.rbenv/bin:$HOME/Library/Android/sdk/platform-tools:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# Enable rbenv
type rbenv 2>&1 > /dev/null && eval "$(rbenv init -)"

# Neovim variables
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# Make virtualenv work
test -f /usr/local/bin/virtualenvwrapper.sh && source /usr/local/bin/virtualenvwrapper.sh

test -f ~/.localprofile && source ~/.localprofile

# I don't want to source ~/.profile twice, and ~/.zprofile just sources this file.  So just in case there could ever be
# a case where this wouldn get sourced twice, I'll drop this variable here.  To prevent the file from getting sourced
# twice, you can use:
#       test -z $PROFILE_SOURCED && source ~/.profile
export PROFILE_SOURCED=1
