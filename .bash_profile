function ffile () { echo $(ls -t | head -n1); }
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"
HISTSIZE=50000
HISTFILESIZE=500000
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export PATH="$PATH:~/Dropbox/bin/:~/go/bin/"
export GOROOT="/usr/local/go"
export PATH=$PATH:$GOROOT/bin
export GOBIN=~/go/bin
export GOPATH=~/go
function snap () { ps aux | awk '{print $3,$4,$1,$2,$11}'| sort -rnk1,1 | grep -v '0.0 0.0' && echo bk && vm_stat && echo bk &&  osascript -e 'path to frontmost application as text' ; }
function wet () { wget -nc -c -r -A'*.flv' -A'*pnga' -A'*avi' -A'*ogg' -A'*ogv' -A'*gifv' -A'*mng' -A'*qt' -A'*mp4' -A'*mkv' -A'*wmv' -A'*webm' -A'*.mpg' -A'*.mov' -A'.gif' -A'.wmv' $@ ;}
function gitall () { git add . && git commit -m "$@" && git push origin master;}
function csvcount () { head -n1 "$@" | grep -o , | tr -d "\n" | wc -c; }
function tbin () { open $(cat $@ | nc termbin.com 9999); }
export PATH="/Users/dusty/bin/Sencha/Cmd:$PATH"
function findmovies () { printf "find $(pwd) -type f \\( -name \"*mpg\" $( cat ~/filetypes | grep -o "A\'\*[A-Za-z0-9]\+'" | sed -e "s/A'\*\([a-zA-Z0-9]\{1,\}\)'/\-o \-name \"\*\1\" /" | tr -d '\n')" | sed 's/$/ \\) \-exec vlc {} +/'; }
#function findmovies () { printf "find $(pwd) -type f \\( -name \"*mpg\" $(cat filetypes | ggrep -P -o "A\'\*\w+" | gsed "s/A'\*\([a-z0-9]\+\)/\-o \-name \"\*\1\" /"| tr -d '\n')" | gsed 's/$/ \\) \-exec mpv {} +/'; }
function playmovies () { eval "$(findmovies)";  }
alias ue='date "+%s"'
export WEBSPHEREHTML=/Users/dustycarver/go/src/github.com/bsdpunk/webSphere/
<<<<<<< HEAD
export QUSER=bsdpunk
export QHOST=localhost
export QPASSWORD=hammer
alias thehugo='hugo --theme=hugo-theme-cactus-plus -D -E -F --forceSyncStatic'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
=======
>>>>>>> c6e3f8571898ea299d6be7e02684d6290d9d09af
