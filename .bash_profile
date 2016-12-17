function ffile () { echo $(ls -t | head -n1); }
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"
HISTSIZE=50000
HISTFILESIZE=500000
shopt -s histappend

export PATH="$PATH:~/Dropbox/bin/:~/go/bin/"
export GOROOT="/usr/local/go"
export PATH=$PATH:$GOROOT/bin
export GOBIN=~/go/bin
export GOPATH=~/go
function snap () { ps aux | awk '{print $3,$4,$1,$2,$11}'| sort -rnk1,1 | grep -v '0.0 0.0' && echo bk && vm_stat && echo bk &&  osascript -e 'path to frontmost application as text' ; }
function wet () { wget -nc -c -r -A'*.flv' -A'*mp4' -A'*mkv' -A'*wmv' -A'*webm' -A'*.mpg' -A'*.mov' -A'.gif' -A'.jpg' -A'.wmv' $@ ;}
gitall () { git add . && git commit -m "$@" && git push origin master;}
function csvcount () { head -n1 "$@" | grep -o , | tr -d "\n" | wc -c; }
