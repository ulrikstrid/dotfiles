# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/${USERNAME}/.oh-my-zsh"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='code'
fi

export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# If KUBECONFIG environment variable is defined, make sure az aks get-credentials uses it
az() {
    if [[ $1 == "aks" && $2 == "get-credentials" ]]; then
        if [[ ${KUBECONFIG} != "" ]]; then
            command az $@ --file ${KUBECONFIG}
        else
            command az $@
        fi
    else
        command az $@
    fi
}

# init workspace
init-workspace() {
    curr_path=$(pwd)
    new_path=$(realpath ~/dev/$1)

    if [[ ! $curr_path =~ $new_path ]]; then
        ~/dev/$1
    fi
}

# Create Workspace function
function create-workspace() {
    mkdir -p ~/dev/$1/.ssh
    cd ~/dev/$1/.ssh
    ssh-keygen -b 4096 -t rsa -C $1 -f $1_id_rsa
    cat ~/dev/$1/.ssh/$1_id_rsa.pub | pbcopy
    cp ~/.create_workspace_envrc ~/dev/$1/.envrc
    direnv allow ~/dev/$1/.envrc
    cd ~/dev/$1
}

docker-clean() {
    docker system prune --all
    docker builder prune --all
    docker volume rm $(docker volume ls -qf dangling=true)
}

# Load bash autocompletion
autoload -U +X bashcompinit && bashcompinit
. <(flux completion zsh)

export PATH="/usr/local/sbin:/usr/bin:/usr/sbin:/Applications/Docker.app/Contents/Resources/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export PGOUSER="${HOME}/.pgo/pgo/pgouser"
export PGO_CA_CERT="${HOME}/.pgo/pgo/client.crt"
export PGO_CLIENT_CERT="${HOME}/.pgo/pgo/client.crt"
export PGO_CLIENT_KEY="${HOME}/.pgo/pgo/client.key"
export PGO_APISERVER_URL='https://127.0.0.1:8443'
export PGO_NAMESPACE=pgo

export PATH="${PATH}:${HOME}/.pgo/pgo"

# Use Antonio's cache
cachix use anmonteiro

if [ -e /Users/ulrik.strid/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/ulrik.strid/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
