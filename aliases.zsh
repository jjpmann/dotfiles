#### GLOBAL
alias sudo='sudo'
alias l='clear; echo ""; echo -------------- `pwd`; echo ""; ls -lah; echo ""';
alias fs='clear; echo ""; echo -------------- `pwd`; echo ""; du -sch .[!.]* * |gsort -h; echo ""';
alias myip="echo INTERNAL && ifconfig | grep 'inet ' && echo PUBLIC && echo '       ' `dig +short myip.opendns.com @resolver1.opendns.com`"
alias psg='ps aux | head -n 1; ps aux | grep -v grep | grep -i'
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadcli="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias flushdns='dscacheutil -flushcache && sudo killall -HUP mDNSResponder &&say done'
alias ll="$(brew --prefix coreutils)/libexec/gnubin/ls -ahlF --color --group-directories-first"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias mykey="cat ~/.ssh/id_rsa.pub | pbcopy"
alias jjpkey="cat ~/.ssh/jjpmann-4096-rsa.pub | pbcopy"
#alias psql='/Applications/Postgres.app/Contents/Versions/9.4/bin/psql -p5432'
alias hg='history | grep '
alias ping='ping -c 3'
alias weather="curl -4 http://wttr.in"
alias p='python '
alias trashcan='open vnc://10.130.204.128'

## GIT or SVN
ignore() { echo -n "\n$1" >> .gitignore }
alias commits="svn log -v --xml | grep '<author.*/author>' | sort $* | uniq -c | sort -rn";
alias gitsvn="/usr/local/Cellar/git/2.6.2/bin/git svn "
alias git-log='git log --pretty=format:"%h - %an, %ar : %s" '
alias gcp='git checkout production'
alias gs='git status'

# git log --pretty=format:"%h - %aD, %ar : %s"

alias bfg='java -jar ~/bfg-1.12.8.jar '
alias selenium='nohup java -jar ~/bin/selenium-server-standalone.jar > ~/selenium.log &'
alias chrome='nohup chromedriver --port=4446 --log=~/chrome.log > ~/chrome.log &'

## INFO
alias publicip='dig +short myip.opendns.com @resolver1.opendns.com'                # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs
alias finderShowHidden='defaults write com.apple.finder AppleShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder AppleShowAllFiles FALSE'

## Edit with Subl
alias _dotfiles="subl ~/.dotfiles"
alias _alias="subl ~/.dotfiles/aliases.zsh"
alias _profile="subl ~/.zshrc"
alias _ssh="subl ~/.ssh/config"
alias _hosts="subl /etc/hosts"
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias sites="cd $HOME/Sites"
alias _ee="cd $HOME/Sites/_ee"

# PHP Laravel
alias a="php artisan"
alias phpunit="phpunit --colors"
alias pc="composer"
alias pa="php artisan"
alias tinker="php artisan tinker"

# Brew
alias bs="brew services list"
alias bsr="brew services restart "
alias bsstart="brew services start "
alias bsstop="brew services stop "
alias sbsr="sudo brew services restart "
alias sbsstart="sudo brew services start "
alias sbsstop="sudo brew services stop "

# Vagrant
alias v='vagrant'
alias vup="vagrant up"
alias vhalt="vagrant halt"
alias vssh="vagrant ssh"
alias vreload="vagrant reload"
alias vrebuild="vagrant destroy --force && vagrant up"


# Swap contents of two files
function swap() {
    if [ $# -ne 2 ]; then
        echo "Usage: swap file1 file2"
    else
        local tmpfile=$(mktemp)
        mv "$1" $tmpfile && mv "$2" "$1" && mv $tmpfile "$2" 
    fi
}

# create file with folders if needed
mktouch() {
    if [ $# -lt 1 ]; then
        echo "Missing argument";
        return 1;
    fi

    for f in "$@"; do
        mkdir -p -- "$(dirname -- "$f")"
        touch -- "$f"
    done
}

export JPGQUALITY='90'
export PNGQUALITY='75-80'

function png-new(){
    if [ $# -lt 1 ]; then
        echo "Missing argument";
        return 1;
    fi

    for f in "$@"; do
        name=$(basename $f .png)
        new=$name-new.png
        cp $f $new
        pngquant --quality=$PNGQUALITY --ext=.png --force $new
        optipng -quiet -o7 $new
    done
}

function png(){
    if [ $# -lt 1 ]; then
        echo "Missing argument";
        return 1;
    fi

    for f in "$@"; do
        pngquant --quality=$PNGQUALITY --ext=.png --force $f
        optipng -quiet -o7 $f
    done
}

function jpg-new(){
    if [ $# -lt 1 ]; then
        echo "Missing argument";
        return 1;
    fi

    for f in "$@"; do
        name=$(basename $f .jpg)
        new=$name-new.jpg
        cp $f $new
        jpegtran -copy none -outfile /dev/null -optimize -progressive $new
        jpegoptim -m $JPGQUALITY --strip-all -q $new
    done
}

function jpg(){
    if [ $# -lt 1 ]; then
        echo "Missing argument";
        return 1;
    fi

    for f in "$@"; do
        jpegtran -copy none -outfile /dev/null -optimize -progressive $f
        jpegoptim -m $JPGQUALITY --strip-all -q $f
    done
}

function rom-search() {
    search="$@"
    echo $search
    emuparadise.py -s $search
}

function rom-download() {
    rom="$@"
    echo $rom
    curl -L -O --cookie "downloadcaptcha=1" --referer https://www.emuparadise.me $(emuparadise.py -d $rom)
}

function blog-download() {
    if [ $# -lt 1 ]; then
        echo "Missing argument";
        return 1;
    fi

    echo "$1""$2"

    mkdir -p $1/$2

    cd $1/$2

    wget $3
    wget $4

    cd ...
}


function gitFixTags() {
    # Loop over tags
    git tag -l | while read -r tag
    do

        # get the commit hash of the current tag
        COMMIT_HASH=$(git rev-list -1 $tag)

        # get the commit date of the tag and create a new tag using
        # the tag's name and message. By specifying the environment
        # environment variable GIT_COMMITTER_DATE before this is
        # run, we override the default tag date. Note that if you
        # specify the variable on a different line, it will apply to
        # the current environment. This isn't desired as probably
        # don't want your future tags to also have that past date.
        # Of course, when you close your shell, the variable will no
        # longer persist.
        echo GIT_COMMITTER_DATE=\"$(git show $COMMIT_HASH --format=%aD | head -1)\" git tag -a -f $tag -m"$tag" $COMMIT_HASH


    done

    # Force push tags and overwrite ones on the server with the same name
    # git push --tags --force
}

function __dotfiles_update_check() {
    if (builtin cd $DOTFILES && git fetch && git status) | grep 'Your branch is behind'; then
        echo '\n\n\n------------------------------------------------------------------------\n';
        echo '\tYour .dotfiles should be updated!';
        echo '\n------------------------------------------------------------------------\n\n';
    fi
}
__dotfiles_update_check

