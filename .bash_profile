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
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Javaのバージョン管理
export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`
PATH=${JAVA_HOME}/bin:${PATH}

# .bash_profileの最後
test -r ~/.bashrc && . ~/.bashrc
