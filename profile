#################
# variables and conditional scripts

# I don't want to source ~/.profile twice, and ~/.zprofile just sources this file.  So just in case there could ever be
# a case where this wouldn get sourced twice, I'll drop this variable here.  To prevent the file from getting sourced
# twice, you can use:
#       test -z $PROFILE_SOURCED && source ~/.profile
export PROFILE_SOURCED=1
