# Load Node global installed binaries
PATH="$HOME/.node/bin:$PATH"

# Use project specific binaries before global ones
PATH="node_modules/.bin:vendor/bin:includes/vendor/bin:$PATH"

PATH="$HOME/bin:$PATH"

# global composer path
PATH="$HOME/.composer/vendor/bin:$PATH";
# for php apps
PATH="./vendor/bin:$PATH";
# add Terminus for Pantheon
PATH="$HOME/.terminus/vendor/bin:$PATH";
# add Drush for Pantheon
PATH="$HOME/git/drush:$PATH";



# Make sure coreutils are loaded before system commands
# I've disabled this for now because I only use "ls" which is
# referenced in my aliases.zsh file directly.
#PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Local bin directories before anything else
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Load custom commands
# Disabled this because I have no custom binaries at the moment.
#PATH="$DOTFILES/bin:$PATH"

# rvm
#PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting

if [ -d "/usr/local/opt/chruby/share/chruby" ] 
then
    source /usr/local/opt/chruby/share/chruby/chruby.sh
    source /usr/local/opt/chruby/share/chruby/auto.sh
fi

# git 
PATH="/usr/local/git/bin:$PATH";
# go code
PATH="$HOME/gocode/bin:$PATH";
# google cloud SDK
PATH="$HOME/google-cloud-sdk/bin:$PATH";
# my user shortcuts/apps
PATH="$HOME/bin:$PATH";

# spark
# PATH="$HOME/.spark-installer:$PATH";

## Custom Valet
PATH="/Users/jerryprice/git/valet;$PATH";

export PATH=$PATH;



## OTHERS

export JPGQUALITY="90";
export PNGQUALITY="70-85";
export GOPATH="$HOME/gocode";
export TZ="America/New_York";
export COMPOSER_HOME="$HOME/.composer"
export EDITOR='subl'

export SLIMERJSLAUNCHER=/Applications/Firefox50.app/Contents/MacOS/firefox

# Make sure PHP 7.1 is loaded
source ~/git/php-version/php-version.sh && php-version 7.3