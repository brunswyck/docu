alias docuserver='cddocu;envdocu;sphinx-autobuild -b html -H 127.0.0.1 -p 6666 ./ _build/html/'
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
alias pimp_pip_packages="source ~/docu/sphinx/env/bin/activate && pip list --outdated | cut -d' ' -f1 | xargs pip install --upgrade"
alias pimpen='sudo apt update;sudo apt upgrade;sudo apt clean;sudo apt autoremove'
alias startpgadmin4='python3 /home/patrick/.local/lib/python3.5/site-packages/pgadmin4/pgAdmin4.py'
alias connect_pgsql_cloud='psql "sslmode=disable dbname=postgres user=postgres hostaddr=35.195.23.178"'
alias logout="xfce4-session-logout"
alias history="history | awk '{\$1=\"\";print substr(\$0,2)}'"
alias installhistory="cat /var/log/apt/history.log | grep 'apt-get install'"
alias cdpdf2txt="cd $HOME/Downloads/firefox_dlds/pdf2txt"
alias cddisplay="cd $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/"
