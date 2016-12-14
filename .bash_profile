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
# pyenvとHomebrewの共存用
alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin brew"

# nodebrewのPATH
export PATH=$HOME/.nodebrew/current/bin:$PATH

# .bash_profileの最後
test -r ~/.bashrc && . ~/.bashrc
