############### oh-my-zsh configs ##############################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git docker docker-compose kubectl zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

############### system configs #################################################

# vulkan fixes
export LIBVA_DRIVER_NAME=iHD
# export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/intel_icd.x86_64.json

############### user configs ###################################################

alias dcd="docker compose down"
alias dcu="docker compose up -d --build"
alias dcr="docker compose down && docker compose up -d --build"
