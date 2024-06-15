################################################################################
### oh-my-zsh configs

export ZSH="$HOME/.oh-my-zsh"

plugins=(
  aws
  docker
  fluxcd
  gcloud
  git
  helm
  kubectl
  podman
  rust
  toolbox
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

################################################################################
### user configs

export VISUAL=vim
export EDITOR="$VISUAL"

export KUBECONFIG=~/.kube/config

################################################################################
### starship prompt

eval "$(starship init zsh)"
