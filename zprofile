# I'm not sure why, but zsh only checks .zprofile, and not .profile, so I'm just going to have this source .profile
# Any scripts that should be loaded on startup should be going there, instead.
test -z $PROFILE_SOURCED && source ~/.profile
