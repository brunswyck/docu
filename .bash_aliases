alias sudo='sudo -E'
alias ll='ls -hal --color=auto'
alias pt7='. /opt/pt/packettracer &'
alias keepy="keepassx --keyfile ~/Persoonlijk.kdbx &"
alias toetsenbordus="setxkbmap us"
alias toetsenbordbe="setxkbmap be"
alias bustwickrclient="kill -n 9 \$(ps -C wickr-me | awk 'BEGIN {RS=\"\\n\"; FS=\" \"} FNR==2 {print \$1}')"
alias ssh-add-github="eval \$(ssh-agent -s);ssh-add ~/.ssh/github_id_rsa"
alias goto-sphinx="cd ~/github/docu/sphinx/"
alias envdocu="source ~/github/docu/env/bin/activate"
alias cddocu="cd $HOME/github/docu/"
alias upd8virtualenv_docu='source ~/github/docu/env/bin/activate'
alias pimpen='sudo apt update;sudo apt upgrade;sudo apt clean;sudo apt autoremove'
alias startpgadmin4='python3 /home/patrick/.local/lib/python3.5/site-packages/pgadmin4/pgAdmin4.py'
alias connect_pgsql_cloud='psql "sslmode=disable dbname=postgres user=postgres hostaddr=35.195.23.178"'