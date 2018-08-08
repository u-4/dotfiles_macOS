#
# .bash_profile
# 


# pyenv関連
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"

# rbenv
eval "$(rbenv init -)"

# PATHのexportは.bash_profileで行う
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# nodebrewのPATH
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# Javaのバージョン管理
export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`
PATH="${JAVA_HOME}/bin:${PATH}"

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

# .bash_profileの最後
test -r ~/.bashrc && . ~/.bashrc
