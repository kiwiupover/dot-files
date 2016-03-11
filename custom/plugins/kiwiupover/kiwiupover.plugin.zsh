
export GEM_EDITOR='atom'

c() { cd ~/code/$1; }

_c() { _files -W ~/code -/; }
compdef _c c

p() { cd ~/Projects/$1;  }


_p() { _files -W ~/Projects -/; }
compdef _p p

alias crc='cd ~/code/client'
alias crs='cd ~/code/server && nvm use'
alias crm='cd ~/code/mock-api'

alias rs='rails s'
alias rc='rails c'
alias rj='rake jobs:work'

alias pgs='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log stop'

# git alias files
alias gco='git checkout'
alias gcb='git checkout -b'
alias gpr='git pull --rebase'
alias gst='git staus -s'
alias gs='git status'

alias gcm='git commit -m'
alias gam='git commit -am'
alias gcam='git commit --amend'
alias gad='git add --all'

alias gd='git diff'

alias gup='git smart-pull'
alias gm='git smart-merge'
alias gl='git smart-log'
alias gap='git add -p'
alias gcp='git commit -p'
alias gll='git pull -p'

alias gbsort="git for-each-ref --sort=-committerdate --format='%1B[32m%(committerdate:iso8601) %1B[34m%(committerdate:relative) %1B[0;m%(refname:short)' refs/heads/"

alias redis='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist'

alias zs="zeus start"
alias z="zeus"
alias zss="zeus s"
alias zsd="zeus s -p 3500"

alias bower='noglob bower'

alias tc='top-commands'
alias tcg='top-non-git'

alias e='ember'
alias es="ember server"
alias eg='ember generate'
alias edp="ember build --environment=production"
alias eb='ember build -w --output-path="../server/dist"'

alias testp="ember t -s --launch PhantomJS"
alias testc="ember t -s --launch Chrome"
alias tests="ember t -s --launch Safari"
alias testcc="ember t -s --launch Chrome\ Canary"
alias testf="ember t -s --launch Firefox"
alias testa="ember t -s"

alias nvm10="nvm use 0.10"
alias nvm12="nvm use 0.12"
alias nvm4="nvm use 4"

alias gdev="grunt dev"

alias a='atom .'

alias dnsflush='sudo discoveryutil mdnsflushcache;sudo discoveryutil udnsflushcaches;say flushed'

alias bt='broccoli-taco'
alias bts='broccoli-taco serve'
alias btbp='BROCCOLI_TACO_ENV=production broccoli-taco build dist'

alias bower='noglob bower'

alias ls="clear && ls -pal"
alias ..="cd ../ && ls -al"
alias ...="cd ../../ && ls -al"
alias ....="cd ../../../ && ls -al"

alias server="python -m SimpleHTTPServer 3456"

alias cdndev="mkdir /Volumes/Images && mount -t smbfs \"//devimages/Images\" /Volumes/Images/"
alias cdnprod="mkdir /Volumes/Corpimages && mount -t smbfs \"//JOMAX;$USER@64.202.167.131/images\" /Volumes/Corpimages"

function lc () {
  cd $1;
  ls
}

alias tc='top-commands'
alias tcg='top-non-git'

alias npm-bower='reinstall-npm-bower'

function command-frequency() {
  tail -n 10000 ~/.zsh_history | cut -d ';' -f 2 | awk '{print $1 " " $2}' | sort | uniq -c | sort -rn
}

# List the most-frequently used commands
function top-commands() {
  command-frequency | head -n 15
}

# List the most-frequently used non-Git commands
function top-non-git() {
  command-frequency | grep -v ' g ' | grep -v ' git ' | head -n 15
}



function reinstall-npm-bower() {
  CONT=
  vared -p "Are you sure you want to update npm and bower dependancies? (y/n)? " CONT
  if [ "$CONT" == "y" ]; then
    echo $fg[green] "Removing the node_modules and bower_components folders"
    rm -rf node_modules
    rm -rf bower_components
    echo $fg[green] "Clean and clear the caches"
    npm cache clear
    bower cache clean

    npm-bower-install
    echo "\n\n\n"
    echo $fg[green] "Done!"
  else
    echo $fg[green] "Ok then!"
  fi
}

function npm-bower-install() {
  echo $fg[green] "Installing NPM and Bower dependancies"
  npm set progress=false
  npm install
  bower install
  npm set progress=true
}
