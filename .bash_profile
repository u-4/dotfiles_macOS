#
# .bash_profile
# 


# pyenv関連
export PYENV_ROOT=/usr/local/opt/pyenv
eval "$(pyenv init -)"

# rbenv
eval "$(rbenv init -)"

# PATHのexportは.bash_profileで行う
export PATH="$PYENV_ROOT/bin:$PATH"

# .bash_profileの最後
test -r ~/.bashrc && . ~/.bashrc
