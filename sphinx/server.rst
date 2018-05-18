#############
debian server
#############

******
system
******

test
====

some
----

.. code::
   
   test
   ----

**********
networking
**********

ssh server
==========

generate your key

.. code::

   keygen -t rsa -b 4096

   chmod 0600 /home/patrick/.ssh/labo_rsa.pub

copy it over to the ssh-server

.. code::

   ssh-copy-id -i ~/.ssh/labo_rsa.pub patrick@192.168.4.101

client conf
-----------

.. code::

   $ vim ~/.ssh/config 
   Host github github.com
     HostName github.com
     IdentityFile ~/.ssh/github_id_rsa
   User brunswyck
   
   Host srv2 srv2.home
     HostName srv2.home
     IdentityFile ~/.ssh/labo_rsa.key
   User patrick
   
   $ sudo vim /etc/ssh/ssh_config
   ------------------------------
   Host *
   ServerAliveInterval 100

using ssh-agent
^^^^^^^^^^^^^^^

.. code::
   
   echo 'alias addlabkey="ssh-add -t 18000 ~/.ssh/labo_rsa"' >>  ~/.bash_aliases

   $ source ~/.bash_aliases
   $ addlabkey 
   Enter passphrase for /home/patrick/.ssh/labo_rsa: 
   Identity added: /home/patrick/.ssh/labo_rsa (/home/patrick/.ssh/labo_rsa)
   Lifetime set to 18000 seconds
   
   verify
   ------ 
   $ ssh-add -l
   4096 SHA256:uk2+a8VSFuNhD/gfjuqNdF/bGOAK9rGCkiuxGlSubLM /home/patrick/.ssh/labo_rsa (RSA)

server conf changes
-------------------

``/etc/ssh/sshd_config``

.. code::

   #Is there to ensure that certain firewalls don't drop idle connections
   TCPKeepAlive yes
   # server will wait 60 seconds before sending a null packet to the client to keep the connection alive
   ClientAliveInterval 60
   # send alive messages to the client even though it has not received any message back from the client
   ClientAliveCountMax 10000
   
   

restart ssh service

.. code::

   patrick@lab:~$ sudo systemctl restart sshd.service 
   patrick@lab:~$ sudo systemctl status sshd.service
   ● ssh.service - OpenBSD Secure Shell server
      Loaded: loaded (/lib/systemd/system/ssh.service; enabled; vendor preset: enabled)
      Active: active (running) since Fri 2018-05-18 12:19:48 CEST; 17s ago
     Process: 1132 ExecReload=/bin/kill -HUP $MAINPID (code=exited, status=0/SUCCESS)
     Process: 1123 ExecReload=/usr/sbin/sshd -t (code=exited, status=0/SUCCESS)
     Process: 1408 ExecStartPre=/usr/sbin/sshd -t (code=exited, status=0/SUCCESS)
    Main PID: 1409 (sshd)
       Tasks: 1 (limit: 6143)
      Memory: 1.3M
      CGroup: /system.slice/ssh.service
              └─1409 /usr/sbin/sshd -D
   
   mei 18 12:19:48 lab systemd[1]: Starting OpenBSD Secure Shell server...
   mei 18 12:19:48 lab sshd[1409]: Server listening on 0.0.0.0 port 22.
   mei 18 12:19:48 lab sshd[1409]: Server listening on :: port 22.
   mei 18 12:19:48 lab systemd[1]: Started OpenBSD Secure Shell server.
   
