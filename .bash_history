clear
vim conf.py 
cd backup/
ll
vim index.rst 
cd ..
vim .gitignore
ll
cd ..
ll
vim .gitignore 
git status
git add sphinx/conf.py 
git commit -m 'excluded include/*.rst files '
git push
kill -s 9 `ps -u guru | grep firefox | awk '{ print $1 }'`
git status

history
apt-cache search 'PDF' | grep ' - .*PDF'
cddocu 
ls
ll
vim ~/docu/sphinx/vim.rst 
vim ~/.bash_aliases 
source ~/.bash_aliases 
cddocu 
ll
cd sphinx/
ll
envdocu 
rstcheck commands.rst 
rstcheck vim.rst 
vim vim.rst 
rstcheck vim.rst 
vim vim.rst 
rstcheck vim.rst 
git status
git add index.rst 
git add vim.rst 
git add commands.rst 
cd
git status
git add *
git status
git add .bash_aliases 
git rm .bash_history 
git status
git checkout -- .bash_history
git status
sudo rm -rf /home/guru/browser_dlds/LGPL/
sudo rm -rf /home/guru/browser_dlds/usr/
git status
git checkout browser_dlds/*
git status
git checkout -- browser_dlds/*
git checkout -- browser_dlds/
git status
git rm browser_dlds/
git rm -r browser_dlds/
git status
git rm -r browser_dlds/*
git rm -rf browser_dlds/*
git status
git add browser_dlds/
git status
git commit -m 'upping stuff'
git push
git status
push_docs2github 
vim index.rst
git status
git add index.rst 
git commit -m 'update';ssh-add-github;git push
ll
vim index.rst_backup 
ll
rm index.rst_backup 
ll
vim index.md 
git status
git rm index.rst_backup 
vim index.md 
vim index.rst 
git status
git add index.*
git status
echo 'alias="git commit -m updatingdocu; git push"' >> ~/.bash_aliases 
source ~/.bash_aliases 
vim ~/.bash_aliases 
source ~/.bash_aliases 
kommit 
ll
push_docs2github 
vim ~/.vimrc 
clear
cd _static/
ll
rstcheck ../cisco.rst 
source ~/.bashrc 
envdocu 
grep -r ../cisco.rst ".. image::"
grep -r ../cisco.rst ".. image"
grep -r ".. image" ../cisco.rst 
sed -i 's/_RemoteNetwork/_static\/RemoteNetwork/' ../cisco.rst 
vim ../cisco.rst 
:q
clear
vim ../cisco.rst 
clear
exit
jobs
exit
ll
cddocu 
cd sphinx/
vim cisco.rst 
clear
jobs
fg 1
exit
jobs
exit
kill -s 9 `ps -u guru | grep firefox | awk '{ print $1 }'`
ls
ll
cd ..
pwd
cd ~
ls
cd docu/
ls
cd docs/
cd ..
cd sphinx/
ll
sudo vim conf.py 
sudo vim index.
sudo vim index.rst
envdocu 
rstcheck commands.rst 
vim commands.rst 
rstcheck commands.rst 
vim commands.rst 
rstcheck commands.rst 
vim commands.rst 
rstcheck commands.rst 
vim commands.rst 
rstcheck commands.rst 
vim commands.rst 
rstcheck commands.rst 
vim commands.rst 
rstcheck commands.rst 
vim commands.rst 
git status
vim cisco.rst 
clear
vim cisco.rst 
exit
vim sphinx/index.md 
git add sphinx/index.md
git status
git commit -m 'index push'
git push
git status
sudo apt-get update 
sudo apt-get upgrade 
sudo apt-file search adobe-flashplugin
sudo apt-file search adobe
sudo vim /etc/apt/sources.list
sudo apt-get update
sudo vim /etc/apt/sources.list
sudo apt-get update
sudo vim /etc/apt/sources.list
sudo vim /etc/apt/sources.list.d/
vim ~/.vim/bundle/nerdtree/lib/nerdtree/ui.vim
sudo vim ~/.vim/bundle/nerdtree/lib/nerdtree/ui.vim
sudo apt-get update
sudo cp /etc/apt/preferences.d/jessie-backports.pref /etc/apt/preferences.d/unstable.pref
sudo vim /etc/apt/preferences.d/unstable.pref 
sudo apt-get update
sudo apt-cache policy flashplugin-nonfree
cat /etc/apt/sources.list.d/unstable.list /etc/apt/preferences.d/unstable.pref 
sudo apt-cache policy flashplugin-nonfree

update-alternatives --list flash-mozilla.so
sudo update-alternatives --list flash-mozilla.so
sudo update-alternatives --config flash
sudo updatedb
sudo apt-get install locate
sudo updatedb
sudo locate flash-mozilla.so
sudo locate libflashplayer.so
cd /usr/lib/flashplugin-nonfree/
ll
sudo apt-cache policy flashplugin-nonfree
sudo apt-get install apt-url
sudo apt-get install apturl
sudo apt-cache policy apt-url
sudo apt-cache policy url
sudo apt-cache search url
sudo apt-cache policy apturl
sudo apt-get install apturl
cd ~/browser_dlds/
ll
sudo apt-get remove flashplugin-nonfree 
sudo apt-get purge flashplugin-nonfree 
sudo apt-get autoremove 
sudo su
exit
kill -s 9 `ps -u guru | grep firefox | awk '{ print $1 }'`
cd 
ls
cd Documenten/
ll
vim othercommands.txt 
jobs
clear
git status
exit
sudo aptitude search '~i!~M'
dpkg --get-selections
grep ' installed ' /var/log/dpkg.log /var/log/dpkg.log.1 | awk '{print $5}' | sort -u
cat /var/log/apt/history.log | grep 'apt-get install '
cat /var/log/apt/history.log | grep 'apt-get install ' | cut -f 2
cat /var/log/apt/history.log | grep 'apt-get install ' | cut -f2
cat /var/log/apt/history.log | grep 'apt-get install ' | cut -d ':' -f2
cat /var/log/apt/history.log | grep 'apt-get install ' | cut -d ':' -f2| cut f2
cat /var/log/apt/history.log | grep 'apt-get install ' | cut -d ':' -f2| cut -f2
cat /var/log/apt/history.log | grep 'apt-get install ' | cut -d ':' -f2| tr -d [:space:]
cat /var/log/apt/history.log | grep 'apt-get install ' | cut -d ':' -f2| tr -d '^[:space:]'
man tr
cat /var/log/apt/history.log | grep 'apt-get install '| cut -f2 |sed -i 's/^ *//'
cat /var/log/apt/history.log | grep 'apt-get install '| cut -f2 |sed 's/^ *//'
cat /var/log/apt/history.log | grep 'apt-get install '| cut -f2 |sed -n 's/^ *//'
cat /var/log/apt/history.log | grep 'apt-get install '| cut -f2 |sed -e 's/^ *//'
cat /var/log/apt/history.log | grep 'apt-get install '| cut -d ': ' -f2 | sed -e 's/^ *//'
cat /var/log/apt/history.log | grep 'apt-get install '| cut -d ':' -f2 | sed -e 's/^ *//'
grep 'apt-get install ' /var/log/apt/history.log | cut -d ':' -f2 | sed -e 's/^ *//'
vim ~/.bash_aliases 
source ~/.bash_aliases 
showinstalled 
vim ~/.bash_aliases 
source ~/.bash_aliases 
showinstalled 
;
vim ~/.bash_aliases 
source ~/.bash_aliases 
showinstalled 
;
showinstalled
grep 'apt-get install ' /var/log/apt/history.log | cut -d ':' -f2 |awk '!seen[$0]++'| sed -e 's/^ *//'
grep 'apt-get install ' /var/log/apt/history.log | cut -d ':' -f2 |awk '!seen[$0]++'
vim ~/.bash_aliases 
grep 'apt-get install ' /var/log/apt/history.log | cut -d ':' -f2 |awk '!seen[$0]++':q
clear
vim ~/.bash_aliases 
source ~/.bash_aliases 
alias
showinstalled 
grep 'apt-get install ' /var/log/apt/history.log | cut -d ':' -f2 |awk '!seen[$0]++'
grep 'apt-get install ' /var/log/apt/history.log | cut -d ':' -f2 |awk '!seen[$0]++' | sed -e 's/^ //'
nano ~/.bash_aliases
source ~/.bash_aliases
ls
showinstalled 
grep 'apt-get install ' /var/log/apt/history.log | cut -d ':' -f2 |awk '!seen[$0]++' | sed -e 's/^ //'
vim ~/bashrc_addons/myfunctions.sh 
vim ~/.bash_aliases
source ~/.bashrc 
vim ~/bashrc_addons/myfunctions.sh 
clear
tr --help
ping 208.67.222.222
sudo ip addr sho
dig monkeynews.com
update-alternatives --config flash-mozilla.so
sudo apt-cache policy flashplugin-nonfree
git status
git pull
alias
history 
git status
rm .bash_history 
clear
git status
git pull
ssh-add-github 
git pull
git status
vim .psql_history 
vim ~/.vimrc 
clear
ll
vim .vimrc
history
cd
git clone git@github.com:brunswyck/docu.git
source ~/.bashrc 
cddocu 
vim ~/.bash_aliases 
jobs
fg 1
LATEST_FLASH_VERSION=$(curl -s http://get.adobe.com/flashplayer/about/ | awk 'c&&!--c; /Firefox/{c=2}' | head -n1 | tr -d '[:space:]' | sed 's/<[^>]\+>//g')
echo $LATEST_FLASH_VERSION 
git status
cd 
git status
git add Documents/
git status
ls
ll
chmod 0700 ~/.ssh/
trap 'test -n "$SSH_AGENT_PID" && eval `/usr/bin/ssh-agent -k`' 0
ssh-add -l
ssh-add -L
vim ~/.bash_logout
echo $SHLVL 
cddocu 
git status
git add vim.rst 
git status
git commit -m 'updating docu git'
git push 
sudo apt-vim install -y https://github.com/scrooloose/nerdtree.git
sudo apt-get install apt-vim
:q
vim .viminfo 
vim ~/.vimrc
cd ~/.vim/
ll
cd bundle/
ll
sudo apt-get install curl
cd ~/.vim/bundle/
git status
ll
cd .vundle/
ll
vim ~/.bash_aliases 
cd
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim ~/.xsession-errors
nano ~/.vimrc
git status
cddocu 
history
jobs
git status
cd Music/
ll
git add ~/.python_history 
git add ~/.psql_history 
cat .pgpass
cat ~/.pgpass
vim ~/.pgpass 
jobs
git status
cd ../.pgadmin/
ll
vim pgadmin4.db 
git status
git add fuck/
git checkout ../github/*
git add ../.bash_*
git status
git add ../.vim*
git status
git add ../bashrc_addons/*
git status
cd ~ 
ll Desktop/
vim Desktop/queries 
cddocu 
pwd
source ~/.bashrc 
cddocu 
ll
vim vim.rst 
git status
git add vim.rst 
git status
cd
git status
vim ~/bashrc_addons/myfunctions.sh 
source ~/.bashrc 
vim ~/.bashrc 
commitall 
git add bashrc_addons/*
vim .gitignore 
git status
vim github/docu/
cd
cd github/
cd docu/
ll
cd con
cd sphinx/
ll
cd
ll
vim set_github.sh 
git add set_github.sh 
git status
cd ..
ll
cd
ll
git add set_github.sh 
git status
git add .gitignore 
cd /github
cd github/
cd docu/
git status
ll
cd
alias
ll ~/.ssh/
alias
rm -rf github/
ll
git status
git rm github/*
git status
commitall 
ssh-add -L
ssh-add -l
ssh-add-github 

ssh-add-github 
ssh-ident
sudo apt-cache search ssh-ident
vim ~/.bash_aliases
man ssh-add 
vim ~/.bash_aliases
vim ~/.bash_logout 
git status
git add ~/.bash_aliases 
git add ~/.bash_logout 
git add -f ~/.bash_logout 
git status
commitall 
git status
cd Document
cd Documents/
ll
rm SMAAKTEST.ods 
open setup_postgresql.odt 
vim ~/.gitignore 
git status
cd ../fuck/
ll
vim commands.json 
git add ../.pgpass 
git add ../fuck/
cd 
cd Videos/
ll
rm \[\ www.CpasBien.cm\ \]\ Demain.2015.FRENCH.BDRip.XviD.AC3-SVR.avi 
ll
cd ..
git status
git add .gitignore 
cd Desktop/
ll
cat queries 
vim queries 
rm queries 
cd ../Music/
ll
git status
cd ..
git status
git add Music/
git status
commitall 
git status
git add .bash_history 
clear
source ~/.bashrc 
clear
jobs
exit
cddocu
cd ~
cd
clear
source ~/.bashrc 
vim ~/.bashrc 
show_repository 
show_repository 
cat ~/bashrc_addons/myfunctions.sh
vim ~/bashrc_addons/myfunctions.sh
source ~/bashrc_addons/myfunctions.sh
show_repository 
clear
cat ~/.bash_profile 
cat ~/.bashrc 
vim ~/.bash_profile 
cd /home/patrick/docu/sphinx/
ll
sudo ip addr show dev eno2
sudo dhclient -4 eno2
sudo ip addr show dev eno2
dig 208.67.222.222
push_docs2github 
pgrep ssh-agent -u $USER
pgrep ssh-agent
man trap
trap --help
pgrep instantRst
ll
pgrep --help
pgrep -i 'instantrst'
pgrep -i 'firefox'
pgrep -i -f 'firefox'
pgrep -i -f 'firefox-esr'
pgrep -i -f 'instant'
pgrep -i -f 'instantrst'
ll
cd ..
cd ~/.vim/bundle/InstantRst/
ll
cd after/
ll
cd ftplugin/
ll
cd rst/
ll
cd ..
ll
cd ..
ll
vim README.rst 
curl -X DELETE http://localhost:5676
sudo curl -X DELETE http://localhost:5676
cd
clear
clear
vim ~/.bash_profile 
clear
source ~/.bash_profile 
vim ~/.bash_profile 
source ~/.bash_profile 
vim ~/.bashrc 
source ~/.bash_profile 
vim ~/.config/xfce4/terminal/terminalrc 
vim ~/.config/xfce4/help.rc 
vim ~/.config/xfce4/Verve/history
vim ~/.config/xfce4/xfconf/xfce-perchannel-xml/displays.xml 
vim cisco.rst 
envdocu 
man sphinx-autobuild
vim cisco.rst 
vim ~/.bash_aliases 
exit
