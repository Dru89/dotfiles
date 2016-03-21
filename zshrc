# source ~/.profile if it wasn't already
test -z $PROFILE_SOURCED && source ~/.profile

# use online help
unalias run-help &> /dev/null
autoload run-help
HELPDIR=/usr/local/share/zsh/help

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

# Oh-my-zsh theme
ZSH_THEME="prose"

# Oh-my-zsh plugins
plugins=(brew git git-extras pip extract)

# conditional scripts
test -f $ZSH/oh-my-zsh.sh && source $ZSH/oh-my-zsh.sh
test -f ~/.keybindings && source ~/.keybindings
test -f ~/.noglob && source ~/.noglob
test -f ~/.antigen.zsh && source ~/.antigen.zsh
test -f ~/.fzf.zsh && source ~/.fzf.zsh
test -f ~/.shellrc && source ~/.shellrc
command -v rbenv > /dev/null && eval "$(rbenv init - zsh)"

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
