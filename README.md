# docu
documentation on networking and debian linux

# use python's virtualenv to install sphinx
# http://www.sphinx-doc.org/
sudo pip3 install virtualenv
# go to you git project directory and create the env folder
cd ~/github/docu/
virtualenv env
# now install Sphinx in it with the virtual environment pip binary
env/bin/pip install Sphinx
# set the environment variables::

patrick@debian:~/github/docu$ which python
/usr/bin/python
patrick@debian:~/github/docu$ source env/bin/activate
(env) patrick@debian:~/github/docu$ which python
/home/patrick/github/docu/env/bin/python

