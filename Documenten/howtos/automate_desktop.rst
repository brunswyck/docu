.. highlight:: rest

automation debian desktop
=========================

apt-get installs
----------------
guru@lab:~[brunswyck:home.git master|!?]$ installhistory 
apt-get install ansible
apt-get install -t jessie-backports libssl1.0.0
apt-get install apt-file
apt-get install bash-completion
apt-get install git
apt-get install vim
apt-get install libqt5webkit5
apt-get install libqt5multimedia5
apt-get install libqt5xml5
apt-get install libqt5script5
apt-get install libqt5scripttools5
apt-get install virtualenv
apt-get install python3-pip
apt-get install curl

sudo apt-get install libevent-dev python-all-dev 

pip installs
------------
cddocu
envdocu

pip install sphinx
pip install sphinx_rtd_theme
pip install rstcheck
pip install sphinx-autobuild



other configurations
--------------------
~/docu/sphinx/virtualenv env
~/docu/sphinx/sphinx-quickstart


sudo sed -n -i -e 's/main/main contrib non-free/p' /etc/apt/sources.list

automation git setup
-----------
todo check that all required packages are installed
virtualenv
if not exist then
apt-get install virtualenv
else
cd $HOME/docu/sphinx
pip install rstcheck
pip install sphinx_rtd_theme
(env) patrick@debian:~/docu[brunswyck:docu.git master]$ pip install sphinx

cd;git clone https://github.com/brunswyck/home.git
cd;git clone https://github.com/brunswyck/docu.git
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
git clone git@github.com:brunswyck/docu.git
patrick@debian:~$ source ~/.bashrc 
chmod 0600 ~/.ssh/*
chmod 0700 ~/.ssh/

(env) patrick@debian:~/docu/sphinx[brunswyck:docu.git master]$ pip2 install rstcheck

------------
chmod 0700 ~/.ssh/
trap 'test -n "$SSH_AGENT_PID" && eval `/usr/bin/ssh-agent -k`' 0


patrick@debian:~$ pkill -f ssh-agent 
patrick@debian:~$ ps -C ssh-agent
