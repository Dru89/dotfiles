#!/usr/bin/env zsh
# Most of this was taken from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

# Determine what character to use in place of the '$' for my prompt.
function repo_char {
git branch >/dev/null 2>/dev/null && echo '±' && return
echo '○'
}

# Display any virtual env stuff with python.
function virtualenv_info {
[ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

# All of my git variables.
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg[red]%}↑%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg[red]%}↓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg[red]%}↕%{$reset_color%}"

# I like a new line between my result and the next prompt. Makes it easier to see
PROMPT='
%{$fg[red]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)$(git_remote_status)
$(virtualenv_info)$(repo_char) '
