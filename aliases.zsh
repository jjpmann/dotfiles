#### GLOBAL
alias sudo='sudo'
alias l='clear; echo ""; echo -------------- `pwd`; echo ""; ls -lah; echo ""';
alias fs='clear; echo ""; echo -------------- `pwd`; echo ""; du -hd1; echo ""';
alias myip="echo INTERNAL && ifconfig | grep 'inet ' && echo PUBLIC && echo '       ' \`dig +short myip.opendns.com @resolver1.opendns.com\`"
alias psg='ps aux | head -n 1; ps aux | grep -v grep | grep -i'
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadcli="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias flushdns='dscacheutil -flushcache && sudo killall -HUP mDNSResponder &&say done'
alias ll="$(brew --prefix coreutils)/libexec/gnubin/ls -ahlF --color --group-directories-first"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias mykey="cat ~/.ssh/id_rsa.pub | pbcopy"
alias jjpkey="cat ~/.ssh/jjpmann-4096-rsa.pub | pbcopy"
alias supportkey="cat ~/.ssh/id_rsa_wdgdc.pub | pbcopy"
alias wdgkey="cat ~/.ssh/wdg_id_rsa.pub | pbcopy"
#alias psql='/Applications/Postgres.app/Contents/Versions/9.4/bin/psql -p5432'
alias hg='history | grep '
alias ping='ping -c 3'
alias weather="curl -4 http://wttr.in"
alias py='python '
alias trashcan='open vnc://10.130.204.128'
alias new='ls -laht | head'


alias p='php-version '

alias my='mysql -u root -psecret '
alias code='/usr/local/bin/code-insiders'

alias dd_mysql='mysql -h 127.0.0.1 -P 33068 -u drupaluser --password="" '
alias dd_mysqldump='mysqldump -h 127.0.0.1 -P 33068 -u drupaluser --password="" '

## GIT or SVN
ignore() { echo -n "\n$1" >> .gitignore }
alias commits="svn log -v --xml | grep '<author.*/author>' | sort $* | uniq -c | sort -rn";
alias gitsvn="/usr/local/Cellar/git/2.6.2/bin/git svn "
alias git-log='git log --pretty=format:"%h - %an, %ar : %s" '
alias gcp='git checkout production'
alias gs='git status'
alias conflicts='git --no-pager diff --name-only --diff-filter=U'
alias git-large-files="git rev-list --objects --all \
| git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' \
| sed -n 's/^blob //p' \
| sort --numeric-sort --key=2 \
| cut -c 1-12,41- \
| $(command -v gnumfmt || echo numfmt) --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest"



# git log --pretty=format:"%h - %aD, %ar : %s"

alias bfg='java -jar ~/bfg-1.12.8.jar '
alias selenium='nohup java -jar ~/bin/selenium-server-standalone.jar > ~/selenium.log &'
#alias chrome='nohup chromedriver --port=4446 --log=~/chrome.log > ~/chrome.log &'

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
alias _dns="subl /Users/jerryprice/.config/valet/dnsmasq.conf"
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
alias bs="brew services "
alias bsl="brew services list"
alias bsr="brew services restart "
alias bsstart="brew services start "
alias bsstop="brew services stop "
alias sbsr="sudo brew services restart "
alias sbsstart="sudo brew services start "
alias sbsstop="sudo brew services stop "

# Varnish/HAproxy
alias check-varnish='varnishd -C -f /usr/local/etc/varnish/default.vcl -p vcc_err_unref=off'
alias check-haproxy='/usr/local/bin/haproxy -c -V -f /usr/local/etc/haproxy.cfg'

# Vagrant
alias v='vagrant'
alias vup="vagrant up"
alias vhalt="vagrant halt"
alias vssh="vagrant ssh"
alias vreload="vagrant reload"
alias vrebuild="vagrant destroy --force && vagrant up"




function importdb() {
	if [ $# -ne 2 ]; then
		echo "Usage: importdb database sqlfile"
	fi

	# check if file

	echo #
	echo "Drop/Create DB $1 and Import $2"
	read "brave?Are you sure?. [y/Y] "

	if [[ "$brave" =~ ^[Yy]$ ]]; then
		# mysql -e 'drop database nfwf_dev' && mysql -e 'create database nfwf_dev' && mysql nfwf_dev < nfwf-2019_dev_2020-01-20T01-00-00_UTC_database.sql
		mysql -e "drop database $1" && mysql -e "create database $1" && mysql $1 < $2
	else 
		return 1;
	fi

	

}




# Swap contents of two files
function swap() {
	if [ $# -ne 2 ]; then
		echo "Usage: swap file1 file2"
	else
		local tmpfile=$(mktemp)
		mv "$1" $tmpfile && mv "$2" "$1" && mv $tmpfile "$2"
	fi
}


function logout() {
	sudo launchctl bootout user/$(id -u jerryprice)
}

function git-orphan() {
	if [ $# -lt 1 ]; then
		echo "Missing argument";
		echo "git-orphan new-orphan-branch";
		return 1;
	fi

	git checkout --orphan $1
	git rm -rf .
	rm '.gitignore'
}




# create file with folders if needed
function mktouch() {
	if [ $# -lt 1 ]; then
		echo "Missing argument";
		return 1;
	fi

	for f in "$@"; do
		mkdir -p -- "$(dirname -- "$f")"
		touch -- "$f"
	done
}

function showcert() {
	if [ $# -lt 1 ]; then
		echo "Missing argument";
		return 1;
	fi
	echo | openssl s_client -showcerts -servername $1 -connect $1:443 2>/dev/null | openssl x509 -inform pem -noout -text
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


function crawl () {
	if [ $# -lt 1 ]; then
		echo "Missing argument";
		echo "crawl links.txt";
		return 1;
	fi
	echo 'Response Code, Current URL, Redirect URL\n'  | tee $1.csv
	xargs -n1 -P 10 curl -o /dev/null --silent --head --insecure --write-out '%{http_code},%{url_effective},%{redirect_url}\n' < $1 | tee $1.csv && open $1.csv

}

function _f() {
	if [ $# -lt 1 ]; then
		echo "Missing argument";
		echo "$0 pdf";
		return 1;
	fi
	find . -type f -iname "*.$1"
}

function _fd() {
	if [ $# -lt 1 ]; then
		echo "Missing argument";
		echo "$0 pdf";
		return 1;
	fi

	echo  '     ______   __     __         ______        _____     ______     __         ______     ______   ______    '
	echo  '    /\  ___\ /\ \   /\ \       /\  ___\      /\  __-.  /\  ___\   /\ \       /\  ___\   /\__  _\ /\  ___\   '
	echo  '    \ \  __\ \ \ \  \ \ \____  \ \  __\      \ \ \/\ \ \ \  __\   \ \ \____  \ \  __\   \/_/\ \/ \ \  __\   '
 	echo  '     \ \_\    \ \_\  \ \_____\  \ \_____\     \ \____-  \ \_____\  \ \_____\  \ \_____\    \ \_\  \ \_____\ '
  	echo  '      \/_/     \/_/   \/_____/   \/_____/      \/____/   \/_____/   \/_____/   \/_____/     \/_/   \/_____/ '

	find . -type f -iname "*.$1"

	read "delete?Are you sure you want to delete *.$1?. [y/n] "

	if [[ "$delete" =~ ^[Yy]$ ]]; then
		find . -type f -iname "*.$1" -delete
	else 
		return 1;
	fi
}

function video() {
	if [ $# -lt 1 ]; then
		echo "Missing argument";
		echo "video movie.mov";
		return 1;
	fi

	ffmpeg -i $1 $1.mp4
}


function redirect_check () {

	if [ $# -lt 1 ]; then
		echo "Missing argument";
		return 1;
	fi

	curl -ILks $1 | grep 'HTTP\|Location'
}

function php-fix-arrays () {

	if [ $# -lt 1 ]; then
		echo "Missing argument";
		return 1;
	fi

	phpcbf $1 --standard=Generic --sniffs=Generic.Arrays.DisallowLongArraySyntax
}

function restart-php () {
	/usr/local/bin/brew services restart php@7.1 && 
	/usr/local/bin/brew services restart php@7.2 && 
	/usr/local/bin/brew services restart php@7.3 && 
	/usr/local/bin/brew services restart php@7.4
}

function unserialize() {

	if [[ $1 ]];
	then
		php -r " echo print_r(unserialize('"$1"')); echo \"\\n\";"
	else
		STRING=`pbpaste`
		php -r " echo print_r(unserialize('"$STRING"')); echo \"\\n\";"
	fi

}

function pantheon_logs() {

	if [ $# -ne 2 ]; then
		echo "Usage: pantheon_logs site env"
		return 1;
	fi

	#!/bin/bash
	# Site UUID from Dashboard URL, eg 12345678-1234-1234-abcd-0123456789ab
	SITE=$1
	ENV=$2

	SITE_UUID=`terminus site:lookup $1`

	APP_SERVERS=`dig +short appserver.$ENV.$SITE_UUID.drush.in` 

	echo "Site: $1 ($SITE_UUID) Env: $2"
	echo "$APP_SERVERS"
	read "brave?Continue?. [n/y] "

	if [[ "$brave" =~ ^[Yy]$ ]]; then

		for app_server in `dig +short appserver.$ENV.$SITE_UUID.drush.in`;
		do
			rsync -rlvz --size-only --ipv4 --progress -e 'ssh -p 2222' $ENV.$SITE_UUID@${app_server}:logs app_server_${app_server}
		done

		#Include MySQL logsls -l
		db_server=`dig dbserver.$ENV.$SITE_UUID.drush.in +short`
		rsync -rlvz --size-only --ipv4 --progress -e 'ssh -p 2222' $ENV.$SITE_UUID@dbserver.$ENV.$SITE_UUID.drush.in:logs db_server_$db_server
	fi
}

function show_folders(){
	# shopt -s globstar nullglob
	for dir in ./**/;do
		echo "$dir" # dir is directory only because of the / after **
	done
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

function haa-counts(){
	if [ $# -lt 1 ]; then
		echo "Missing argument: path";
		return 1;
	fi

	while read p; do
		c=`grep -r --exclude=\*.wsdl.xml --exclude=\*.sql $p $1  | wc -l`
		echo "$p - $c"
	done <~/Desktop/projects/haa-fields.txt
}

# h=()
# if [[ -r ~/.ssh/config ]]; then
#   h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
# fi
# if [[ -r ~/.ssh/known_hosts ]]; then
#   h=($h ${${${(f)"$(cat ~/.ssh/known_hosts{,2} || true)"}%%\ *}%%,*}) 2>/dev/null
# fi
# if [[ $#h -gt 0 ]]; then
#   zstyle ':completion:*:ssh:*' hosts $h
#   zstyle ':completion:*:slogin:*' hosts $h
# fi

