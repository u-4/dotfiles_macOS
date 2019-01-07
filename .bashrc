#
# bashrcとbash_profileを使い分ける
#

#
# system bashrc
#
if [ -r "/etc/bashrc" ];then
    source /etc/bashrc
fi

##
## .bashrc再読み込み時のPATH重複追加を回避
##
#
#function _reset_path {
#  local p
#  for p in PATH LD_LIBRARY_PATH PYTHONPATH PKG_CONFIG_PATH;do
#    local ip=$(eval echo "\$INIT_$p")
#    if [ -z "$ip" ];then
#      # Set initial values
#      eval export INIT_$p="\$$p"
#    else
#      # Reset paths
#      eval export $p="$ip"
#    fi
#  done
#}
#_reset_path

#
# Homebrew Github access token (public repo)
# このファイルはGitHubでpublicで管理するのでAPI tokenは別ファイルに
#

if [ -f ~/.brew_api_token ];then
    source ~/.brew_api_token
fi

#
# bash-powerline
#

if [ -f ~/.bash-powerline.sh ];then
    source ~/.bash-powerline.sh
fi

#
# bash-completion
#

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

#
# ls color solarized
#

if [ -f ~/.config/gls/dircolors-solarized ];then
    eval `/usr/local/opt/coreutils/libexec/gnubin/dircolors ~/.config/gls/dircolors-solarized`
fi





#
# command alias and function
#

#
# pyenvやGNU/LinuxコマンドとHomebrewの共存用
#
alias brew='PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin brew'

alias ..='cd ..'
alias ls='gls --color=auto'
alias ld='ls -ld'          # Show info about the directory
alias lla='ls -lAF'        # Show hidden all files
alias ll='ls -lF'          # Show long file information
alias l='ls -1F'          # Show long file information
alias la='ls -AF'          # Show hidden files
alias lx='ls -lXB'         # Sort by extension
alias lk='ls -lSr'         # Sort by size, biggest last
alias lc='ls -ltcr'        # Sort by and show change time, most recent last
alias lu='ls -ltur'        # Sort by and show access time, most recent last
alias lt='ls -ltr'         # Sort by date, most recent last
alias lr='ls -lR'          # Recursive ls

# The ubiquitous 'll': directories first, with alphanumeric sorting:
# alias ll='ls -lv --group-directories-first'

alias cp="cp -i"
alias mv="mv -i"

alias du='du -h'
alias job='jobs -l'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Use if colordiff exists
# if has 'colordiff'; then
#     alias diff='colordiff -u'
# else
#     alias diff='diff -u'
# fi

alias vi="vim"

# alias for youtube-dl
alias youtubemp4="youtube-dl -f mp4"
alias youtubem4a="youtube-dl -x --audio-format m4a"
alias youtubemp3="youtube-dl -x --audio-format mp3"

# ripgrep from VSCode
alias rg="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/node_modules.asar.unpacked/vscode-ripgrep/bin/rg"

#
# stty
#

tty -s && stty stop undef # C-s
tty -s && stty start undef # C-q
if [[ "$OSTYPE" =~ "darwin" ]];then
    tty -s && stty discard undef # C-o
fi

#
# R
#

alias R='R --no-save --no-restore-data'

#
# reset path
# https://qiita.com/key-amb/items/ce39b0c85b30888e1e3b
# .bashrcの末尾につけておくこと

_path=""
for _p in $(echo $PATH | tr ':' ' '); do
    case ":${_path}:" in
        *:"${_p}":* )
        ;;
        * )
            if [ "$_path" ]; then
                _path="$_path:$_p"
            else
                _path=$_p
            fi
        ;;
    esac
done
PATH=$_path

unset _p
unset _path


