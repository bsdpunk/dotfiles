HISTSIZE=50000
HISTFILESIZE=500000
shopt -s histappend
gitall () { git add . && git commit -m "$@" && git push origin master;}
function csvcount () { head -n1 "$@" | grep -o , | tr -d "\n" | wc -c; }
alias care='cd ~/github/OurSite'
