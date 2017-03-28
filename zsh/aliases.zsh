###Aliases
#

### Enable aliases to be sudo’ed
#   http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

### Go to the /home/$USER (~) directory and clears window of your terminal
#
alias q="~ && clear"

### Ubuntu: Update & Upgrade
#
alias uu='sudo apt-get update && sudo apt-get upgrade -y'
alias uua='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y'

### Folders Shortcuts
#
[ -d ~/Dropbox ]              && alias dr='cd ~/Dropbox'
[ -d ~/Downloads ]            && alias dl='cd ~/Downloads'
[ -d ~/Desktop ]              && alias dt='cd ~/Desktop'
[ -d ~/Projects ]             && alias pj='cd ~/Projects'
[ -d ~/Projects/Personal ]       && alias pjp='cd ~/Projects/Personal'
[ -d ~/Projects/Forks ]       && alias pjf='cd ~/Projects/Forks'
[ -d ~/Projects/Playground ]  && alias pjl='cd ~/Projects/Playground'
[ -d ~/Projects/Job ]         && alias pjj='cd ~/Projects/Job'

### Some more ls aliases
#
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

### Clipboard tools
#
if [ command -v xclip >/dev/null 2>&1 ]; then
	alias xcopy='xclip -selection clipboard'
	alias xpaste='xclip -selection clipboard -o'
fi

### Password generator
# Gemnerate random password, copies it into clipboard and outputs it to terminal
if [ command -v pbcopy >/dev/null 2>&1 ]; then
	alias password='openssl rand -base64 ${1:-9} | pbcopy ; echo "$(pbpaste)"'
fi
if [ command -v xcopy >/dev/null 2>&1 ]; then
	alias password='openssl rand -base64 ${1:-9} | xcopy ; echo "$(xpaste)"'
fi

### Show $PATH in readable view
#
alias path='echo -e ${PATH//:/\\n}'

### Download web page with all assets
#
alias getpage='wget --no-clobber --page-requisites --html-extension --convert-links --no-host-directories'

### Download file with original filename
#
alias get="curl -O -L"
