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
alias hg='history | grep '
alias ping='ping -c 3'
alias weather="curl -4 http://wttr.in"
alias py='python '
alias new='ls -dlaht ./* | head'
alias big='ls -Slh | head'

alias dc='docker-compose '

alias pantheon-site-list='terminus site:list  --fields=name,id,plan_name'

alias laptop='open vnc://10.0.1.169'
alias ashleypc='open vnc://10.0.0.212'
alias skylerpc='open vnc://10.0.1.136'
alias laylapc='open vnc://10.0.0.214'

alias sound_headphones="switchaudiosource -u '38-18-4c-bd-e7-8f:output'"
alias sound_speakers="switchaudiosource -u 'AppleUSBAudioEngine:Logitech:Logitech USB Headset:3300000:2,1'"
					   

alias p='php-version '
alias my='mysql -u root -psecret '
alias code='/usr/local/bin/code-insiders'
alias listdb="mysql -e 'show databases' "
alias grepdb="mysql -e 'show databases' | grep "

alias dd_mysql='mysql -h 127.0.0.1 -P 33068 -u drupaluser --password="" '
alias dd_mysqldump='mysqldump -h 127.0.0.1 -P 33068 -u drupaluser --password="" '

alias mysql_tower='mysql --defaults-group-suffix=2 '

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
alias git-recent='git branch -l --sort=-committerdate | cat'
alias git-deploy='git commit --allow-empty -m "deploy `date`"'

alias test='echo "$1" || 2'




# git log --pretty=format:"%h - %aD, %ar : %s"

#alias bfg='java -jar ~/bfg-1.12.8.jar '
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


function ipinfo() { 
	if [ $# -ne 1 ]; then
		
		http --print=b ipinfo.io\?token=$IPINFO_TOKEN
		return 0;
	fi
	dig +short "$1" | xargs -I % /usr/local/bin/http --ignore-stdin --print=b https://ipinfo.io/%\?token=$IPINFO_TOKEN
}

## Edit with Subl
alias _dotfiles="subl ~/.dotfiles"
alias _alias="subl ~/Dropbox/Mackup/home/.protected-aliases.zsh ~/.dotfiles/aliases.zsh"
alias _profile="subl ~/.zshrc"
alias _ssh="subl ~/.ssh/config"
alias _haproxy="subl /usr/local/etc/haproxy/haproxy.cfg"
alias _hosts="subl /etc/hosts"
alias _dns="subl /Users/jerryprice/.config/valet/dnsmasq.conf"
alias _valet="subl /Users/jerryprice/sublime-projects/valet.sublime-workspace"
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
alias sbsl="sudo brew services list"
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


function gitlast() {
	if [ $# -ne 1 ]; then
		i=1
	else
		i=$1
	fi
	git checkout @{-$i}
}

function importdb() {
	if [ $# -ne 2 ]; then
		echo "Usage: importdb <database> <sqlfile>"
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


function create_db_and_user() {

	if [ $# -lt 1 ]; then
		# echo "Missing argument";
		echo "$0 <site>";
		return 1;
	fi

	echo "Creating database (enter mysql root password when prompted)..."
	site=$1;
	dbname=${site//[.-]/_};
	dbpass="$(openssl rand -base64 16)";

	echo "create database ${dbname}; CREATE USER '${dbname}'@'localhost' IDENTIFIED BY '${dbpass}'; GRANT ALL PRIVILEGES ON ${dbname}.* TO \`${dbname}\`@\`localhost\`; FLUSH PRIVILEGES;" | sudo mysq

	echo "dbname: $dbname"
	echo "dbuser: $dbname"
	echo "dbpass: $dbpass"

}

# Swap contents of two files
function swap() {
	if [ $# -ne 2 ]; then
		echo "Usage: swap <file1> <file2>"
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
		# echo "Missing argument";
		echo "git-orphan <new-orphan-branch>";
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
		echo "Usage: showcert <domain> [<ip>]"
		return 1;
	fi

	if [ $# -lt 2 ]; then
		2=$1
	fi

	echo | openssl s_client -showcerts -servername $1 -connect $2:443 2>/dev/null | openssl x509 -inform pem -noout -text
}

function certcheck() {
        if [ -z "$1" ]
        then
                echo "Usage: certcheck <url> [<ip>] [--full]"
                return 1
        fi
        url="$1"
        ip="$2"
        full="$3"
        if [ "$ip" = "--full" ]
        then
                full="--full"
                ip=""
        fi
        if [ -n "$full" ] && [ "$full" != "--full" ]
        then
                echo "Unknown parameter '$full'"
                full=""
        fi
        cmd="echo | openssl s_client -showcerts"
        if [ -z "$ip" ] # No IP (no SNI)
        then
                cmd="$cmd -connect $url:443"
        else
                cmd="$cmd -connect $ip:443 -servername $url"
        fi
        cmd="$cmd 2> /dev/null"
        cmd="$cmd | openssl x509 -inform pem -noout -text"
        if [ -z "$full" ] # Not full
        then
                cmd="$cmd | grep -A3 -B4 Validity"
        fi
        # echo "$cmd"
        eval $cmd
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

function png2jpg(){
	if [ $# -lt 1 ]; then
		echo "Missing argument";
		return 1;
	fi
	
	sips --setProperty format jpeg $1 --out $1.jpg
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

function web-restart () {
	sudo /usr/local/bin/brew services restart dnsmasq
	sudo /usr/local/bin/brew services restart haproxy
	sudo /usr/local/bin/brew services restart nginx
	sudo /usr/local/bin/brew services restart varnish
}

function php-restart () {
	# /usr/local/bin/brew services restart php@5.6 
	# /usr/local/bin/brew services restart php@7.0 
	# /usr/local/bin/brew services restart php@7.1 
	# /usr/local/bin/brew services restart php@7.2 
	# /usr/local/bin/brew services restart php@7.3 
	# /usr/local/bin/brew services restart php@7.4 
	/usr/local/bin/brew services restart php@8.0 
	/usr/local/bin/brew services restart php@8.1 
	/usr/local/bin/brew services restart php@8.2
	/usr/local/bin/brew services restart php
	ln -nfs /Users/jerryprice/.config/valet/8.1.sock /Users/jerryprice/.config/valet/valet.sock
}

function php-stop () {
	# /usr/local/bin/brew services stop php@5.6 
	# /usr/local/bin/brew services stop php@7.0 
	# /usr/local/bin/brew services stop php@7.1 
	# /usr/local/bin/brew services stop php@7.2 
	# /usr/local/bin/brew services stop php@7.3 
	# /usr/local/bin/brew services stop php@7.4 
	/usr/local/bin/brew services stop php@8.0 
	/usr/local/bin/brew services stop php@8.1 
	/usr/local/bin/brew services stop php@8.2 
	/usr/local/bin/brew services stop php
}

function php-start () {
	# /usr/local/bin/brew services start php@5.6 
	# /usr/local/bin/brew services start php@7.0 
	# /usr/local/bin/brew services start php@7.1 
	# /usr/local/bin/brew services start php@7.2 
	# /usr/local/bin/brew services start php@7.3 
	# /usr/local/bin/brew services start php@7.4 
	/usr/local/bin/brew services start php@8.0 
	/usr/local/bin/brew services start php@8.1 
	/usr/local/bin/brew services start php@8.2 
	/usr/local/bin/brew services start php
	ln -nfs /Users/jerryprice/.config/valet/8.1.sock /Users/jerryprice/.config/valet/valet.sock
}

# function brew-services() {
# 	if [ $# -lt 1 ]; then
# 		echo "Missing argument";
# 		return 1;
# 	fi

# 	action=$1
# 	app=$

# }

function unserialize() {

	if [[ $1 ]];
	then
		echo "dump( unserialize('"$1"') );" | php -a
		# php -r " echo print_r(unserialize('"$1"')); echo \"\\n\";"
	else
		STRING=`pbpaste`
		echo "dump( unserialize('"$STRING"') );" | php -a
		# php -r " echo print_r(unserialize('"$STRING"')); echo \"\\n\";"
	fi

}

function vipwp() {
	
	if [ $# -lt 1 ]; then
		echo "Usage: vipwp <@site.env> <cmd...>"
		return 1;
	fi

	TIME=$(date +"%Y-%m-%d %H:%M")
	SITE=$1
	CMD="${@:2}"
	VIP=$(which vip)
	RUN="vip wp $SITE -y -- $CMD"
	FOLDER=$HOME/vip-logs
	FILE=$FOLDER/${SITE/@/}.txt
	
	# echo $TIME
	# echo SITE=$SITE
	# echo CMD="$CMD"
	# echo RUN=$RUN
	# echo FILE=$FILE
	
	[ -d $FOLDER ] || mkdir $FOLDER
	echo "\n\n$TIME : $RUN" >> "$FILE"
	eval ${RUN} | tee -a $FILE
}

alias frbny.prod='vipwp @frbny.production --url=https://libertystreeteconomics.newyorkfed.org/ '
alias frbny.qmo='vipwp @frbny.qmo --url=https://frbny-qmo.go-vip.net/ '
alias frbny.qa='vipwp @frbny.qa --url=https://frbny-qa.go-vip.net/ '
alias frbny.dev='vipwp @frbny.development --url=https://frbny-development.go-vip.net/libertystreeteconomics/ '

function pantheon_rsync_push() {
	
	if [ $# -ne 4 ]; then
		echo "Usage: pantheon_rsync_push <site> <env> <local-path> <remote-path>"
		return 1;
	fi

	#!/bin/bash
	# Site UUID from Dashboard URL, eg 12345678-1234-1234-abcd-0123456789ab
	SITE=$1
	ENV=$2

	SITE_UUID=`terminus site:lookup $1`
	SITE_LOOKUP_ERROR="$?"

	if [ $SITE_LOOKUP_ERROR -ne 0 ]; then
		return;
	fi


	echo "Site: $1 ($SITE_UUID) Env: $2"
	echo "push $3 -> files/$4"
	read "brave?Continue?. [n/y] "

	echo rsync --verbose --compress --archive --size-only --checksum --ipv4 --progress -e 'ssh -p 2222' $3 --temp-dir=~/tmp/ $ENV.$SITE_UUID@appserver.$ENV.$SITE_UUID.drush.in:files/$4
	if [[ "$brave" =~ ^[Yy]$ ]]; then
		rsync --verbose --compress --archive --size-only --checksum --ipv4 --progress -e 'ssh -p 2222' $3 --temp-dir=~/tmp/ $ENV.$SITE_UUID@appserver.$ENV.$SITE_UUID.drush.in:files/$4
	fi

}

function pantheon_rsync_pull() {
	
	if [ $# -ne 4 ]; then
		echo "Usage: pantheon_rsync_pull <site> <env> <remote-path> <local-path>"
		return 1;
	fi

	#!/bin/bash
	# Site UUID from Dashboard URL, eg 12345678-1234-1234-abcd-0123456789ab
	SITE=$1
	ENV=$2

	SITE_UUID=`terminus site:lookup $1`
	SITE_LOOKUP_ERROR="$?"

	if [ $SITE_LOOKUP_ERROR -ne 0 ]; then
		return;
	fi

	echo "Site: $1 ($SITE_UUID) Env: $2"
	echo "pull files$3 -> $4"
	read "brave?Continue?. [n/y] "

	echo rsync --verbose --compress --archive --copy-unsafe-links --size-only --checksum --ipv4 --progress -e 'ssh -p 2222' $ENV.$SITE_UUID@appserver.$ENV.$SITE_UUID.drush.in:files$3 $4
	if [[ "$brave" =~ ^[Yy]$ ]]; then
		rsync --verbose --compress --archive --copy-unsafe-links --size-only --checksum --ipv4 --progress -e 'ssh -p 2222' $ENV.$SITE_UUID@appserver.$ENV.$SITE_UUID.drush.in:files$3 $4
	fi
}

function pantheon_logs() {

	if [ $# -ne 2 ]; then
		echo "Usage: pantheon_logs <site> <env>"
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
		rsync -rlvzt --size-only --ipv4 --progress -e 'ssh -p 2222' $ENV.$SITE_UUID@dbserver.$ENV.$SITE_UUID.drush.in:logs db_server_$db_server
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

function vip-sites(){

	if [ $# -ne 2 ]; then
		echo "Usage: vip-sites <@site.env> <wp-command>"
		echo "  examples: "
		echo "     vip-sites @site.development 'option get siteurl'"
		echo "     vip-sites @site.development 'cache flush'"
		return 1;
	fi

	temp_file=$(mktemp).sh

	echo "## VIP-SITES: $1 - '$2'" > $temp_file;
	vip wp $1 -y -- site list --field=url | xargs -I % sh -c 'echo "vip wp '$1' -y -- '$2' --url=%" >> '$temp_file

	cat $temp_file;
	chmod +x $temp_file;
	bash $temp_file;
	rm $temp_file;
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

function paste() {
	local file=${1:-/dev/stdin}
	# curl --data-binary @${file} https://paste.rs
	url="$(curl -s --data-binary @${file} https://paste.rs)"
	echo $url
	echo $url | pbcopy
}


