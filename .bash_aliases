alias ll='ls -hal --color=auto'
alias pt7='. /opt/pt/packettracer &'
alias upping="sudo apt-get update;sudo apt-get upgrade -y;sudo apt-get autoclean;sudo apt-get autoremove"
alias keepy="keepassx --keyfile ~/Persoonlijk.kdbx &"
alias toetsenbordus="setxkbmap us"
alias toetsenbordbe="setxkbmap be"
alias bustwickrclient="kill -n 9 \$(ps -C wickr-me | awk 'BEGIN {RS=\"\\n\"; FS=\" \"} FNR==2 {print \$1}')"
alias ssh-add-github="eval \$(ssh-agent -s);ssh-add ~/.ssh/github_id_rsa"
