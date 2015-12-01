# I don't really use bash, unless I have to.
# Do some minimal set up just to make it work.

# source ~/.profile if it wasn't already
test -z $PROFILE_SOURCED && source ~/.profile

# conditional scripts
test -f ~/.fzf.bash && source ~/.fzf.bash
command -v rbenv > /dev/null && eval "$(rbenv init - bash)"
