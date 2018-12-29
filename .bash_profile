#
# .bash_profile
#

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
# texinfo
export PATH="/usr/local/opt/texinfo/bin:$PATH"

# rbenv
eval "$(rbenv init -)"

# Go lang
# インストール場所をいじらなければ関係ない？
# export GOROOT="go env GOROOT" or "/usr/local/opt/go/libexec"

export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin:/usr/local/opt/go/libexec/bin

# Microsoft .Net Core Runtime
export PATH=/usr/local/share/dotnet:$PATH

# nodebrewのPATH
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Javaのバージョン管理
export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`
export PATH="${JAVA_HOME}/bin:${PATH}"

# tcl-tk
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"

#
# GNU/Linux系列のコマンド用のPATH
#

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="/usr/local/opt/unzip/bin:$PATH"

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/grep/libexec/gnuman:$MANPATH"

#
# less関連
#

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
# export LESS='-I -R -M -W -x2'
if type -a source-highlight >& /dev/null;then
    if type -a lesspipe >& /dev/null;then
        export LESSOPEN='| ~/.config/terminal/lesspipe %s'
        elif type -a src-hilite-lesspipe.sh >& /dev/null;then
        export LESSOPEN='| src-hilite-lesspipe.sh %s'
    fi
fi
# export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
export LESSCHARSET='utf-8'

alias less='less -m -N -g -i -J --underline-special --SILENT'

# man with color
export LESS_TERMCAP_mb=$(printf "\e[1;36m")
export LESS_TERMCAP_md=$(printf "\e[1;36m")
export LESS_TERMCAP_so=$(printf "\e[1;44;33m")
export LESS_TERMCAP_us=$(printf "\e[1;32m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_ue=$(printf "\e[0m")

#
# history
#

export HISTCONTROL=ignoreboth:erasedups # 重複履歴を無視
export HISTSIZE=5000 # historyに記憶するコマンド数
export HISTIGNORE="fg*:bg*:history*:h*" # historyなどの履歴を保存しない
export HISTTIMEFORMAT='%Y.%m.%d %T: ' # historyに時間を追加

#
# fzf
#

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#
# enhancd
#

[ -f ~/.dotfiles/lib/enhancd/init.sh ] && source ~/.dotfiles/lib/enhancd/init.sh

#
# python3
#

# homebrewのpython3を`python`で使用するため
export PATH=$(brew --prefix)/opt/python3/libexec/bin:$PATH

# pipvenvなどで.venvをプロジェクトディレクトリ以下に作成するために
export PIPENV_VENV_IN_PROJECT=True

# pipenvの補完機能
eval "$(pipenv --completion)"

# .bash_profile最後に.bashrcの読み込み設定
test -r ~/.bashrc && . ~/.bashrc
