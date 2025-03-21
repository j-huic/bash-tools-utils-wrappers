# include following in .bashrc / .bash_profile / .zshrc
# usage
# $ mkvenv myvirtualenv # creates venv under ~/.virtualenvs/
# $ venv myvirtualenv   # activates venv
# $ deactivate          # deactivates venv
# $ rmvenv myvirtualenv # removes venv

export VENV_HOME="$HOME/.virtualenvs"
[[ -d $VENV_HOME ]] || mkdir $VENV_HOME

lsvenv() {
  ls -1 $VENV_HOME
}

venv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      source "$VENV_HOME/$1/bin/activate"
  fi
}

mkvenv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      python3 -m venv $VENV_HOME/$1
  fi
}

rmvenv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      rm -r $VENV_HOME/$1
  fi
}

mkdotenv() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    VENV_PATH=$VIRTUAL_ENV
    PYTHON_PATH="$VENV_PATH/bin/python"
  else
    PYTHON_PATH=$(which python)
    if [[ -z "$PYTHON_PATH" ]]; then
      echo "Python not found; unable to set up .env"
      return 1
    fi
  fi

  if [[ ! -f .env ]]; then
    touch .env
  fi

  if ! grep -q "PYTHON_PATH" .env; then
    echo "PYTHON_PATH=\"$PYTHON_PATH\"" >> .env
    echo ".env file updated with PYTHON_PATH=$PYTHON_PATH"
  else
    echo ".env file already contains PYTHON_PATH"
  fi
}
