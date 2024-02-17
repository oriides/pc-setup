#!/bin/bash

if (( $EUID == 0 )); then
    echo "Don't run as root"
    exit
fi

################################################################################
### configure git

if [[ -z "${GIT_NAME+x}" ]]; then
  ## git user.name
  if ! GIT_NAME=$(zenity --entry --title "git User Name" --text "Please enter your name (Firstname Lastname):"); then
    notify-send -i dialog-error "Aborting..." "Please enter your Name to continue"
    exit;
  fi
  export GIT_NAME
else
  echo "> Git user name already set to \"$GIT_NAME\"" 
fi

if [[ -z "${GIT_EMAIL+x}" ]]; then
  ## git user.email
  if ! GIT_EMAIL=$(zenity --entry --title "git User Email" --text "Please enter your Email adress:"); then
    notify-send -i dialog-error "Aborting..." "Please enter your Email to continue"
    exit;
  fi
  export GIT_EMAIL
else
  echo "> Git email already set to \"$GIT_EMAIL\"" 
fi

# ## globally sets git username and email
# git config --global user.name "$GIT_NAME"
# git config --global user.email $GIT_EMAIL

# ## set default pull/rebase strategy
# git config --global pull.rebase true
