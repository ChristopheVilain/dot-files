### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/cvn/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
PATH=/Users/cvn/.rd/bin:/Users/cvn/.local/bin:${PATH}

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

eval "$(/opt/homebrew/bin/brew shellenv)"
#eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export XDG_CONFIG_HOME="${HOME}/.config"


focksmash() {
  local context=$(kubectl config current-context | ggrep -P "^gke_[\w\d\-]+$")

  if [ -n "${context}" ]; then
    wall << EOF
/!\ Attention /!\\

Current K8S context pointing towards a GKE instance !

=> ${context}

EOF

  fi
}

check_main_shell() {
  if [[ $! -eq 0 ]]; then
    echo "Is main shell, fool"
  else
    exit 0
  fi
}

alias ll="ls -ltra"
alias punk="sudo !!"
alias lg="/opt/homebrew/Cellar/lazygit/0.40.2/bin/lazygit"
#alias exit="[ $! -eq 0 ] && echo 'Is main shell, fool !'"
alias exit="check_main_shell"
alias fexit="builtin exit"
alias coolbash='/opt/homebrew/Cellar/bash/5.2.26/bin/bash'
alias vi="nvim"

alias switch-accounts='. /Users/cvn/switch_accounts'

source <(kubectl completion bash)
source <(helm completion bash)

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

if [[ -f ~/.bashrc ]]; then
  source ~/.bashrc
fi

if [[ -s "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]]; then
  source "$(brew --prefix)/etc/profile.d/bash_completion"
fi

# [ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cvn/google-cloud-sdk/path.bash.inc' ]; then . '/Users/cvn/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/cvn/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/cvn/google-cloud-sdk/completion.bash.inc'; fi

focksmash

