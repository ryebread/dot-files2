PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/mongodb/bin:/usr/local/pgsql/bin:/usr/X11/bin:/opt/local/bin:${PATH}"
CDPATH=".:${HOME}"

source $DOT_FILES/$CURRENT_SHELL/config.*sh
source $DOT_FILES/shell/exports.sh
source $DOT_FILES/shell/aliases.sh
source $DOT_FILES/shell/functions.sh
source $DOT_FILES/shell/save-directory.sh
source $DOT_FILES/shell/prompt.sh
source $DOT_FILES/shell/git.sh

[[ $OS == "Windows_NT" ]] && source $DOT_FILES/shell/windows.sh
[[ `uname -s` == 'Darwin' ]] && source $DOT_FILES/shell/osx.sh
