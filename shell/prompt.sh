if [ `uname -s` = "Darwin" ]; then
    function prompt_pwd() {
        if [ "$PWD" != "$HOME" ]; then
            printf "%s" `echo $PWD|sed -e 's|/private||' -e "s|^$HOME|~|" -e 's-/\(\.\{0,1\}[^/]\)\([^/]*\)-/\1-g'`
            echo $PWD|sed -e 's-.*/\.\{0,1\}[^/]\([^/]*$\)-\1-'
        else
            echo '~'
        fi
    }
else # defined two for diff systems because Fish did (not entirely sure why)
    function prompt_pwd() {
        case "$PWD" in
            $HOME)
    echo '~'
    ;;
    *)
    printf "%s" `echo $PWD|sed -e "s|^$HOME|~|" -e 's-/\(\.\{0,1\}[^/]\)\([^/]*\)-/\1-g'`
    echo $PWD|sed -n -e 's-.*/\.\{0,1\}.\([^/]*\)-\1-p'
    ;;
    esac
    }
fi

# colors
function color {
    local reset='\e[0m'
    local white='\e[1;37m'
    local black='\e[0;30m'
    local blue='\e[0;34m'
    local light_blue='\e[1;34m'
    local green='\e[0;32m'
    local light_green='\e[1;32m'
    local cyan='\e[0;36m'
    local light_cyan='\e[1;36m'
    local red='\e[0;31m'
    local light_red='\e[1;31m'
    local purple='\e[0;35m'
    local light_purple='\e[1;35m'
    local brown='\e[0;33m'
    local yellow='\e[1;33m'
    local gray='\e[0;30m'
    local light_gray='\e[0;37m'

    local chosen="$(eval echo \$$1)"

    if [ $CURRENT_SHELL = 'zsh' ]; then
        echo "%{$chosen%}"
    else
        printf "$chosen"
    fi
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    # echo '○'
    echo '♪'
}

function prompt_color() {
    if [ "$USER" = "root" ]; then
        echo red
    else
        if [ -n "$SSH_TTY" ]; then
            echo blue
        else
            echo green
        fi
    fi
}

function prompt_vcs() {
    local vcs="$(${DOT_FILES}/misc/vcprompt -f -‹%s:%b:%h›)"
        # local vcs="$(eval echo $(${DOT_FILES}/misc/vcprompt.py -f -‹%b:%h›))"

    echo "$vcs"
}

#RPS1='$(${DOT_FILES}/misc/vcprompt.py -f ‹%b:%h›)'

if [[ x$OS == "xWindows_NT" ]]; then
    PS1='\[\033]0;$MSYSTEM:\w\007
\033[32m\]\u@\h \[\033[33m\w$(__git_ps1)\033[0m\]
$ '
else
    if [ $CURRENT_SHELL = 'zsh' ]; then
  # prompt (if running screen, show window #)
        if [ x$WINDOW != x ]; then
            export PS1="%{$fg[white]%}┌─[%{$fg[cyan]%}$WINDOW%{$fg[white]%}:%{$fg[green]%}%n%{$fg[cyan]%}@%{$fg[green]%}%m%{$fg[white]%}:%{$fg[yellow]%}%~%{$fg[white]%}]%{$fg[yellow]%}-%{$fg[red]%}[%{$fg[cyan]%}%*%{$fg[red]%}]%{$fg[red]%}\$(prompt_vcs)%{$reset_color%}%{$reset_color%}"$'\n'"%{$fg[white]%}└─>%{$fg[green]%}$(prompt_char)%{$reset_color%} "
        else
            export PS1="%{$fg[white]%}┌─[%{$fg[green]%}%n%{$fg[cyan]%}@%{$fg[green]%}%m%{$fg[white]%}:%{$fg[yellow]%}%~%{$fg[white]%}]%{$fg[yellow]%}-%{$fg[red]%}[%{$fg[cyan]%}%*%{$fg[red]%}]%{$fg[red]%}\$(prompt_vcs)%{$reset_color%}%{$reset_color%}"$'\n'"%{$fg[white]%}└─>%{$fg[green]%}$(prompt_char)%{$reset_color%} "
        fi
        export RPROMPT="%{$reset_color%}"
    else
#    PS1="\[\$(color blue)\]\$(prompt_pwd)\[\$(color red)\]\$(prompt_vcs) \[\$(color \$(prompt_color))\]\$(prompt_char)\[\$(color reset)\] "
        PS1="\[$(color white)\]┌─[\[$(color green)\]\u\[$(color cyan)\]@\[$(color green)\]\h\[$(color white)\]:\[$(color yellow)\]\w\[$(color white)\]]\[$(color red)\]\$(prompt_vcs)\n\[$(color white)\]└─»\[$(color green)\]\$(prompt_char)\[$(color reset)\] "
    fi
fi
