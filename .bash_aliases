alias sudo='sudo -E'
alias ll='ls -hal --color=auto'
alias pt7='. /opt/pt/packettracer &'
alias keepy="keepassx --keyfile ~/Persoonlijk.kdbx &"
alias toetsenbordus="setxkbmap us"
alias toetsenbordbe="setxkbmap be"
alias bustwickrclient="kill -n 9 \$(ps -C wickr-me | awk 'BEGIN {RS=\"\\n\"; FS=\" \"} FNR==2 {print \$1}')"
alias addgithubkey="ssh-add -t 18000 ~/.ssh/github_id_rsa"
alias envdocu="source ~/docu/sphinx/env/bin/activate"
alias cddocu="cd $HOME/docu/sphinx/"
alias pimpen='sudo apt update;sudo apt upgrade;sudo apt clean;sudo apt autoremove'
alias startpgadmin4='python3 /home/patrick/.local/lib/python3.5/site-packages/pgadmin4/pgAdmin4.py'
alias connect_pgsql_cloud='psql "sslmode=disable dbname=postgres user=postgres hostaddr=35.195.23.178"'
alias logout="xfce4-session-logout"
alias history="history | awk '{\$1=\"\";print substr(\$0,2)}'"
alias installhistory="cat /var/log/apt/history.log | grep 'apt-get install'"
alias kommit="git commit -m updatingdocu; git push"
