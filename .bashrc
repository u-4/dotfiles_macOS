#
# bashrcとbash_profileを使い分ける
#

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
# Brew-fileのラッパー
#
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
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

#
# command alias
#

#
# pyenvとHomebrewの共存用
#
#    alias brew="PATH=\"/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin\" brew"
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

#
# reset path
# https://qiita.com/key-amb/items/ce39b0c85b30888e1e3b

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
