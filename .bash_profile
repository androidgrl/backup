
# support for postgres
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"
export PGHOST=localhost

export PATH="$HOME/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# git prompt settings
parse_git_branch() {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export -f parse_git_branch

# prompt
export CLICOLOR=1
export PS1="\[\033[36m\][\w]\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \n\$\[\033[00m\] "

# hubsupport
eval "$(hub alias -s)"
#directories
alias v="vim"
alias bsh='vim ~/.bash_profile'
alias vconf='vim ~/.vimrc'
alias bund='vim ~/.vimrc.bundles'
alias rbp="source ~/.bash_profile"
alias blog='cd ~/turing/androidgrl.github.io'
alias exr='cd ~/exercism/ruby'
alias alg='cd ~/practice/algorithms'
#git
alias pull='git pull origin master'
alias gcb='git checkout -b'
alias gs='git status'
alias ga='git add -A'
alias gcm='git checkout master'
alias gc='git commit'
alias gck='git checkout'
alias deleteallbranches='git branch | grep -v "master" | xargs git branch -D'
alias gs='git status'
alias gclean="git branch --merged master | ag -v '\* master' | xargs -n 1 git branch -d"
alias gm='git merge'
alias gd='git diff'
#tmux
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias ts="tmux switch -t"
alias tsess="tmux list-sessions"
alias td="tmux detach"
alias tks="tmux kill-server"
alias x="exit"
alias nw='tmux new-window -c "$PWD"'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
