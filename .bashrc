#
# bashrcとbash_profileを使い分ける
#


# Homebrew Github access token (public repo)
# このファイルはGitHubでpublicで管理するのでAPI tokenは別ファイルに
if [ -f ~/.brew_api_token ];then
  source ~/.brew_api_token
fi

# Brew-fileのラッパー
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

#
# bash-powerline
#
source ~/.bash-powerline.sh

#
# 言語設定
#

export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LC_NUMERIC=ja_JP.UTF-8
export LC_TIME=ja_JP.UTF-8
export LC_MESSAGES=ja_JP.UTF-8
export LC_MONETARY=ja_JP.UTF-8
export LC_COLLATE=ja_JP.UTF-8

export PAGER=less
# LESS のオプションたち
# -N:行番号を追加
# -M:見ている行数、パーセンテージ、ファイル名を表示する
# -i:検索時に大文字が入っていなければ大文字小文字を区別しない
# -R:ANSI Color Escape Sequenceを色表示する
# -S:1行が画面に入りきらない場合に折り返さない
# -s:空行が複数ある時に表示上は1行にしてくれる
# -F:行数が短くて1画面に収まる場合はlessをすぐに終了
# -X:less終了時に画面をクリアしない
# -g:単語検索時にすべての該当単語ではなく現在フォーカスのあるもののみ反転表示
# -j（数字）:検索時に検索対象単語が上から（数字）行目に表示される
# -p （パターン）:パターンにマッチした行を1行目に表示する
# -u:バックスペースやタブを制御文字として取り扱う
# -q:EOFに着いた時に通り過ぎても音を鳴らさない

export LESS='-q -N -M -i -R -F -X -g'

# 
# 以下は参考にした.bashrcで使われていた設定。
# git logで変な化け方するので上記のようにわかる文だけで設定し直して見た。
#
# export LESS='-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f :stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'
# export LESS='-f -N -X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'
# export LESS='-f -X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'

export LESSCHARSET='utf-8'

# LESS man page colors (makes Man pages more readable).
# export LESS_TERMCAP_mb=$'\E[01;31m'
# export LESS_TERMCAP_md=$'\E[01;31m'
# export LESS_TERMCAP_me=$'\E[0m'
# export LESS_TERMCAP_se=$'\E[0m'
# export LESS_TERMCAP_so=$'\E[01;44;33m'
# export LESS_TERMCAP_ue=$'\E[0m'
# export LESS_TERMCAP_us=$'\E[01;32m'

# Color definitions (taken from Color Bash Prompt HowTo).
# Some colors might look different of some terminals.
# For example, I see 'Bold Red' as 'orange' on my screen,
# hence the 'Green' 'BRed' 'Red' sequence I often use in my prompt.

# Normal Colors
#Black='\033[0;30m'        # Black
#Red='\033[0;31m'          # Red
#Green='\033[0;32m'        # Green
#Yellow='\033[0;33m'       # Yellow
#Blue='\033[0;34m'         # Blue
#Purple='\033[0;35m'       # Purple
#Cyan='\033[0;36m'         # Cyan
#White='\033[0;37m'        # White

# Bold
#BBlack='\033[1;30m'       # Black
#BRed='\033[1;31m'         # Red
#BGreen='\033[1;32m'       # Green
#BYellow='\033[1;33m'      # Yellow
#BBlue='\033[1;34m'        # Blue
#BPurple='\033[1;35m'      # Purple
#BCyan='\033[1;36m'        # Cyan
#BWhite='\033[1;37m'       # White

# Background
#On_Black='\033[40m'       # Black
#On_Red='\033[41m'         # Red
#On_Green='\033[42m'       # Green
#On_Yellow='\033[43m'      # Yellow
#On_Blue='\033[44m'        # Blue
#On_Purple='\033[45m'      # Purple
#On_Cyan='\033[46m'        # Cyan
#On_White='\033[47m'       # White

#NC="\033[m"               # Color Reset
#CR="$(echo -ne '\r')"
#LF="$(echo -ne '\n')"
#TAB="$(echo -ne '\t')"
#ESC="$(echo -ne '\033')"

# If set to a number greater than zero, the value is used as the number of trailing
# directory components to retain when expanding the \w and \W prompt string
# escapes (see PROMPTING below). Characters removed are replaced with an ellipsis.
# if is_at_least 4; then
#     export PROMPT_DIRTRIM=3
# fi

# man bash
#export MYHISTFILE=~/.bash_myhistory
#export HISTCONTROL=ignoreboth:erasedups
#export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "
#export HISTSIZE=50000
#export HISTFILESIZE=50000

#show_exit() {
#    if [ "$1" -eq 0 ]; then
#        return
#    fi
#    echo -e "\007exit $1"
#}
#
#log_history() {
#    echo "$(date '+%Y-%m-%d %H:%M:%S') $HOSTNAME:$$ $PWD ($1) $(history 1)" >> $MYHISTFILE
#}

#prompt_cmd() {
#    local s=$?
#    show_exit $s;
#    log_history $s;
#}
#
#end_history() {
#    log_history $?;
#    echo "$(date '+%Y-%m-%d %H:%M:%S') $HOSTNAME:$$ $PWD (end)" >> $MYHISTFILE
#}
#PROMPT_COMMAND="prompt_cmd;$PROMPT_COMMAND"
#
#_exit() {
#    end_history
#    echo -e  "${BRed}Hasta la vista, baby!"
#    echo -en "\033[m"
#}
#trap _exit EXIT
#
#[ -z "$TMPDIR" ] && TMPDIR=/tmp
#

#
# command alias
#

# pyenvとHomebrewの共存用
    alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin brew"
#    alias brew="env PATH=${PATH/\/Users\/ytamai\/\.pyenv\/shims:/} brew"
    alias ..='cd ..'
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
    alias encfsx='encfs -o local -v -o umask='007' -o uid='0' -o allow_other'

    # Use if colordiff exists
    # if has 'colordiff'; then
    #     alias diff='colordiff -u'
    # else
    #     alias diff='diff -u'
    # fi

    alias vi="vim"


