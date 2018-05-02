function ffile () { echo $(ls -t | head -n1); }
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"
HISTSIZE=50000
HISTFILESIZE=500000
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export PATH="$PATH:~/Dropbox/bin:~/go/bin"
#export GOROOT="/usr/local/go"
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOROOT/bin:~/.nvm/versions/node/v8.6.0/bin
export GOBIN=~/go/bin
export GOPATH=~/go
export NVM_DIR="$HOME/.nvm" 
alias nvminit='. $(brew --prefix nvm)/nvm.sh'
function snap () { ps aux | awk '{print $3,$4,$1,$2,$11}'| sort -rnk1,1 | grep -v '0.0 0.0' && echo bk && vm_stat && echo bk &&  osascript -e 'path to frontmost application as text' ; }
function wet () { wget -nc -c -r -A'*.flv' -A'*pnga' -A'*avi' -A'*ogg' -A'*ogv' -A'*gifv' -A'*mng' -A'*qt' -A'*mp4' -A'*mkv' -A'*wmv' -A'*webm' -A'*.mpg' -A'*.mov' -A'.gif' -A'.wmv' $@ ;}
function gitall () { git add . && git commit -m "$@" && git push origin master;}
function csvcount () { head -n1 "$@" | grep -o , | tr -d "\n" | wc -c; }
function tbin () { open $(cat $@ | nc termbin.com 9999); }
export PATH="/Users/dusty/bin/Sencha/Cmd:$PATH"
function findmovies () { printf "find $(pwd) -type f \\( -name \"*mpg\" $( cat ~/filetypes | grep -o "A\'\*[A-Za-z0-9]\+'" | sed -e "s/A'\*\([a-zA-Z0-9]\{1,\}\)'/\-o \-name \"\*\1\" /" | tr -d '\n')" | sed 's/$/ \\) \-exec mpv {} +/'; }
#function findmovies () { printf "find $(pwd) -type f \\( -name \"*mpg\" $(cat filetypes | ggrep -P -o "A\'\*\w+" | gsed "s/A'\*\([a-z0-9]\+\)/\-o \-name \"\*\1\" /"| tr -d '\n')" | gsed 's/$/ \\) \-exec mpv {} +/'; }
function playmovies () { eval "$(findmovies)";  }
alias ue='date "+%s"'
export WEBSPHEREHTML=/Users/dustycarver/go/src/github.com/bsdpunk/webSphere/
export QUSER=bsdpunk
export QHOST=localhost
export QPASSWORD=hammer
alias thehugo='hugo --theme=hugo-theme-cactus-plus -D -E -F --forceSyncStatic'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
#alias kchrome="sudo kill -9 $(sudo ps aux  | grep hrome | awk '{print $2}')"
alias testinet='while TRUE; do ping google.com -c1; done'
function rqc () { awk -F'"' -v OFS='' '{ for (i=2; i<=NF; i+=2) gsub(",", "", $i) } 1' $@ | sed 's/"//g' ;}
#CAML_LD_LIBRARY_PATH="/Users/dusty/.opam/system/lib/stublibs:/usr/local/lib/ocaml/stublibs"; export CAML_LD_LIBRARY_PATH;
#OPAMUTF8MSGS="1"; export OPAMUTF8MSGS;
#MANPATH="/Users/dusty/.opam/system/man:"; export MANPATH;
#PERL5LIB="/Users/dusty/.opam/system/lib/perl5"; export PERL5LIB;
#OCAML_TOPLEVEL_PATH="/Users/dusty/.opam/system/lib/toplevel"; export OCAML_TOPLEVEL_PATH;
#PATH="/Users/dusty/.opam/system/bin:/Users/dusty/bin/Sencha/Cmd:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Library/TeX/texbin:/opt/X11/bin:~/Dropbox/bin:~/go/bin:/usr/local/opt/go/libexec/bin:/Users/dusty/.nvm/versions/node/v8.6.0/bin"; export PATH;
export HOMEBREW_GITHUB_API_TOKEN=$(cat ~/.gh)


function title {
    echo -ne "\033]0;"$*"\007"
}

function upload() {
IFS=$(echo -en "\n\b");for i in $(find /Users/dusty/torrents -cmin -7 | grep -i "torrent$" ); do scp -P 2222 -r $i root@seedbox:/home/user/Watch; done
}
function download() {
IFS=$(echo -en "\n\b"); scp -r -P 2222 root@seedbox:/home/user/Downloads/$@ . ;
}
function upload2() {
IFS=$(echo -en "\n\b");for i in $(find /Users/dusty/torrents -cmin -7 | grep -i "torrent$" ); do scp -P 2222 -r $i root@seedbox2:/home/user/Watch; done
}
function download2() {
IFS=$(echo -en "\n\b"); scp -r -P 2222 root@seedbox2:/home/user/Downloads/$@ . ;
}


#Use is magnet "magnet:magnetinformation"
function magnet() {
    aria2c -d ~/torrents --bt-metadata-only=true --bt-save-metadata=true --listen-port=6881 "$1"
}
#Stolen from MitchWeaver on github, via bin/webmify
webmc () {
    for ext ; do
        find . -name "*.$ext" -exec bash -c \
            'ffmpeg -i "{}" -y -c:v \
            libvpx-vp9 -crf 9 -b:v 0 -c:a \
            libopus -vbr on -b:a 64k \
            "${0/.ext}.webm" && \
            rm "{}"' {} \; &
    done
}
