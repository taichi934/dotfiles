if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
export PATH=$HOME/.nodebrew/current/bin:$PATH
eval "$(pipenv --completion)"
export PIPENV_VENV_IN_PROJECT=1
