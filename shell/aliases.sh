alias gi='sudo gem install'
alias ls='ls --color=auto'
alias ll='ls -lah'
alias ..='cd ..;' # can then do .. .. .. to move up multiple directories.
alias ...='.. ..'
alias g='grep -i'  #case insensitive grep
alias h='history|g'
alias ducks='du -cks * | sort -rn |head -11' # Lists the size of all the folders
alias et="$EDITOR ."

alias sprof="reload"

alias home="cd $HOME" # the tilde is too hard to reach
alias systail='tail -f -n0 /var/log/system.log'
alias aptail='tail -f -n0 /var/log/apache*/*log'
alias l='ls'
alias b='cd -'
alias e='LC_CTYPE=zh_CN.UTF-8 emacs &'

alias c='clear' # shortcut to clear your terminal

# useful command to find what you should be aliasing:
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# rails stuff
alias log='tail -f -0 ./log/*.log'
alias ss='ruby ./script/server'
alias sc='ruby ./script/console'
alias gen='script/generate'
alias migration='script/generate migration'
alias migrate='rake db:migrate && rake db:migrate RAILS_ENV=test'
alias rollback='rake db:rollback'
alias r='rake'
alias webshare='python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"'

alias pubkey="cat $HOME/.ssh/*.pub"
alias colorslist="set | egrep 'COLOR_\w*'"  # lists all the colors
