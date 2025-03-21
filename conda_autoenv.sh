# conda auto envs
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup

conda config --set auto_activate_base false

function auto_activate_conda_env() {
    if [ -f .env ]; then
        local env_name=$(grep CONDA_ENV_NAME .env | cut -d '=' -f2)
        if [ -n "$env_name" ]; then
            if [[ "$CONDA_DEFAULT_ENV" != "$env_name" ]]; then
                conda activate "$env_name"
            fi
        fi
    fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd auto_activate_conda_env
auto_activate_conda_env

