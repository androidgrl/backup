alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias v="/Applications/MacVim.app/Contents/MacOS/Vim"

export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# support for postgres
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"
export PGHOST=localhost

# prompt
parse_git_branch() {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export -f parse_git_branch
export CLICOLOR=1
export PS1="\[\033[36m\][\w]\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \n\$\[\033[00m\] "

#directories
alias vconf="vim ~/.vimrc"
alias rbp="source ~/.bash_profile"
alias bund="vim ~/.vimrc.bundles"
alias bsh='vim ~/.bashrc'
alias rbp="source ~/.bash_profile"
#bundle
alias bi="bundle install"
alias ber='bundle exec rspec'
alias bert='bundle exec rake test'
alias berf='bundle exec rake fe:tests:run'
alias be='bundle exec'
#git
alias gpo='git push origin'
alias gpull='git pull origin master'
alias gcm='git checkout master'
alias gcb='git checkout -b'
alias gf='git fetch'
alias gs='git status'
alias ga='git add -A'
alias gc='git commit'
alias gck='git checkout'
alias glo='git log --oneline'
alias gcleanallmerged="git branch --merged master | ag -v '\* master' | xargs -n 1 git branch -d"
alias gd='git diff'
#heroku
alias gphm='git push heroku master'
alias hdbm='heroku run rake db:migrate'
alias hdbs='heroku run rake db:seed'
alias ho='heroku open'
#tmux
alias ta="tmux attach -t"
alias ts="tmux switch -t"
alias tsess="tmux list-sessions"
alias tks="tmux kill-server"
