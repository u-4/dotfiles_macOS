#
# .bash_profile
# 

# texinfo
export PATH="/usr/local/opt/texinfo/bin:$PATH"

# pyenv関連
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"

# rbenv
eval "$(rbenv init -)"

# Go lang
# インストール場所をいじらなければ関係ない？
# export GOROOT="go env GOROOT" or "/usr/local/opt/go/libexec"

export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin:/usr/local/opt/go/libexec/bin


# PATHのexportは.bash_profileで行う
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# nodebrewのPATH
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# Javaのバージョン管理
export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`
PATH="${JAVA_HOME}/bin:${PATH}"

# tcl-tk
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"

#
# GNU/Linux系列のコマンド用のPATH
#

PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
PATH="/usr/local/opt/ncurses/bin:$PATH"
PATH="/usr/local/opt/unzip/bin:$PATH"

MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/grep/libexec/gnuman:$MANPATH"

# .bash_profile最後に.bashrcの読み込み設定
test -r ~/.bashrc && . ~/.bashrc
