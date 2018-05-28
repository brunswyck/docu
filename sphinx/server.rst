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


*********************
System Administration
*********************

http://docs.ansible.com/ansible/latest/user_guide/intro_getting_started.html

Ansible
=======

installation
------------

http://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-apt-debian

.. code::

   root@lab:~# echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' >> /etc/apt/sources.list
   
   sudo apt-get install gnupg2
   sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
   sudo apt-get update
   sudo apt-get install ansible

.. code::

   or just install with pip

   sudo pip install ansible

test installation

.. code::

   ansible --version

   ansible 2.5.3
     config file = None
     configured module search path = [u'/home/patrick/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
     ansible python module location = /usr/local/lib/python2.7/dist-packages/ansible
     executable location = /usr/local/bin/ansible
     python version = 2.7.13 (default, Nov 24 2017, 17:33:09) [GCC 6.3.0 20170516]


create files
^^^^^^^^^^^^

.. code::

   sudo mkdir /etc/ansible/;cd /etc/ansible;sudo touch hosts
   sudo vim hosts
     srv2.home

ad-hoc commands
---------------

test ansible with an ad-hoc command

.. note:: you need to have the key in your ssh-agent i do this with an alias ``alias addlabkey='ssh-add -t 18000 ~/.ssh/labo_rsa'`` and you need to have this key in the authorized_keys file on the target host eg via ``ssh-copy-id -i ~/.ssh/lab_rsa.pub patrick@srv2.home``

.. code::

   patrick@stretch:~$ ansible all -m shell -a 'echo $TERM'
   The authenticity of host 'srv2.home (192.168.4.101)' can't be established.
   ECDSA key fingerprint is SHA256:6fcYnPW3MLZTxkzO6oapYXvxFNfhtjErvCaDAXFLnDE.
   Are you sure you want to continue connecting (yes/no)? yes
   srv2.home | SUCCESS | rc=0 >>
   xterm-256color
   

KVM/Libvirt
===========

package install
---------------

.. code::

   sudo apt-get install qemu-kvm libvirt-clients libvirt-daemon-system
   sudo adduser patrick libvirt
   sudo adduser patrick libvirt-qemu


change default storage pool
---------------------------
   
.. code::
   
   Listing current pools:
   
   $ virsh pool-list
   
   Name                 State      Autostart 
   -------------------------------------------
   default              active     yes 
   Destroying pool:
   
   $ virsh pool-destroy default
   Pool default destroyed
   Undefine pool:
   
   $ virsh pool-undefine default
   Pool default has been undefined
   Defining a new pool with name "default":
   
   $ virsh pool-define-as --name default --type dir --target /mnt/store/kvm
   Pool default defined
   Set pool to be started when libvirt daemons starts:
   
   $ virsh pool-autostart default
   Pool default marked as autostarted
   Start pool:
   
   $ virsh pool-start default
   Pool default started
   Checking pool state:
   
   $ virsh pool-list
   Name                 State      Autostart 
   -------------------------------------------
   default              active     yes   

.. code::

   patrick@lab:/var/lib/libvirt$ virsh pool-info default
   Name:           default
   UUID:           19f3c88f-3b84-443e-8bf9-3cebe125b5e7
   State:          running
   Persistent:     yes
   Autostart:      yes
   Capacity:       10.83 TiB
   Allocation:     392.07 MiB
   Available:      10.83 TiB


Configure bridged networking
----------------------------

Between VM host and guests
^^^^^^^^^^^^^^^^^^^^^^^^^^

Setup a macvlan bridge on top of a dummy IF. Afterwards you can set the dummy0 (macvtap) IF in bridged mode

.. code::

   modprobe dummy
   ip link add dummy0 type dummy
   ip link add link dummy0 macvlan0 type macvlan mode bridge
   ifconfig dummy0 up
   ifconfig macvlan0 192.168.1.2 broadcast 192.168.1.255 netmask 255.255.255.0 up


Between VM host, guests & outside world
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

more information on bridges: https://wiki.debian.org/BridgeNetworkConnections

.. code::

   sudo vim /etc/network/interfaces.d/br0

   # my second nic I'll be using for this bridge
   
   allow-hotplug eno2 
   iface eno1 inet manual 
   iface eno1 inet6 manual 
    
   # setup bridge and give it a static ip 
    
   auto br0 
   iface br0 inet manual 
           address 192.168.5.101 
           netmask 255.255.255.0 
           network 192.168.5.0 
           broadcast 192.168.5.255 
           gateway 192.168.5.1 
           bridge_ports eno2 
           bridge_stp off 
           bridge_fd 0 
           bridge_maxwait 0 
           dns-nameservers 192.168.5.1 
    
   #allow autoconf for ipv6 
   iface br0 inet6 auto 
           accept_ra 1

restart networking service

.. code::

   sudo systemctl restart networking.service

see current network settings for KVM

.. code::

   patrick@lab:~$ sudo virsh net-list --all
   Name                 State      Autostart     Persistent
   ----------------------------------------------------------
   default              inactive   no            yes



Change network in virsh
^^^^^^^^^^^^^^^^^^^^^^^

.. code::

   patrick@lab:~$ sudo vim /root/bridged.xml
    <network> 
      <name>br0</name> 
      <forward mode="bridge"/> 
      <bridge name="br0"/> 
    </network>

   patrick@lab:~$ sudo virsh net-define --file /root/bridged.xml
   Network br0 defined from /root/bridged.xml
   
   patrick@lab:~$ sudo virsh net-autostart br0
   Network br0 marked as autostarted
   
   patrick@lab:~$ sudo virsh net-start br0
   Network br0 started

   patrick@lab:~$ sudo virsh net-list --all
    Name                 State      Autostart     Persistent
   ----------------------------------------------------------
    br0                  active     yes           yes
    default              inactive   no            yes

   check existing storage pool path
   --------------------------------
   patrick@lab:/var/lib/libvirt$ virsh pool-dumpxml default | grep -i path
    <path>/mnt/store/kvm</path>

Change default images location
------------------------------

the default location is /var/libvirt/images
I want it to be /mnt/store/images

.. code::

   virsh # pool-edit --pool default
   
   <pool type='dir'> 
     <name>default</name> 
     <uuid>f430f78f-82a0-4844-a769-f3b758fd508f</uuid> 
     <capacity unit='bytes'>0</capacity> 
     <allocation unit='bytes'>0</allocation> 
     <available unit='bytes'>0</available> 
     <source> 
     </source> 
     <target> 
       <path>/mnt/store/kvm/images</path> 
       <permissions> 
         <mode>0711</mode> 
         <owner>0</owner> 
         <group>0</group> 
       </permissions> 
     </target> 
   </pool>
   

Create VM via CLI
-----------------

First you need to know what your os name is for the virt-install command
For that you can use the following package

Read the man for more information https://linux.die.net/man/1/virt-install


.. code::

   patrick@lab:~$ sudo apt-get install libosinfo-bin

the names for debian:

.. code::

   patrick@lab:~$ osinfo-query os | grep debian
    debian1.1            | Debian Buzz                                        | 1.1      | http://debian.org/debian/1.1            
    debian1.2            | Debian Rex                                         | 1.2      | http://debian.org/debian/1.2            
    debian1.3            | Debian Bo                                          | 1.3      | http://debian.org/debian/1.3            
    debian2.0            | Debian Hamm                                        | 2.0      | http://debian.org/debian/2.0            
    debian2.1            | Debian Slink                                       | 2.1      | http://debian.org/debian/2.1            
    debian2.2            | Debian Potato                                      | 2.2      | http://debian.org/debian/2.2            
    debian3              | Debian Woody                                       | 3        | http://debian.org/debian/3              
    debian3.1            | Debian Sarge                                       | 3.1      | http://debian.org/debian/3.1            
    debian4              | Debian Etch                                        | 4        | http://debian.org/debian/4              
    debian5              | Debian Lenny                                       | 5        | http://debian.org/debian/5              
    debian6              | Debian Squeeze                                     | 6        | http://debian.org/debian/6              
    debian7              | Debian Wheezy                                      | 7        | http://debian.org/debian/7              
    debian8              | Debian Jessie                                      | 8        | http://debian.org/debian/8              
    debian9              | Debian Stretch                                     | 9        | http://debian.org/debian/9              
    debiantesting        | Debian Testing                                     | testing  | http://debian.org/debian/testing  

virt-install command
--------------------

.. code::

   patrick@lab:/var/lib/libvirt/boot$ sudo virt-install --virt-type=kvm \
   --name stretch-amd64 \
   --os-variant debiantesting \
   --location /mnt/store/kvm/images/debian-testing-amd64-netinst.iso \
   --memory 8192 \
   --disk pool=default,size=100,format=qcow2 \
   --vcpus=2,maxvcpus=4 --cpu host \
   --check disk_size=off \
   --network=network=br0 \
   --extra-args console=ttyS0 --graphics none

using virt-builder to create a vm
---------------------------------

.. code::

   sudo virt-builder ubuntu-18.04 --size=150G --format qcow2 -o /mnt/store/kvm/images/gns3server.qcow2 --hostname gns3 --network --timezone Europe/Brussels --attach /mnt/store/kvm/images/ubuntu-18.04-live-server-amd64.iso

run guest installed as sudo
---------------------------

.. code::

   export LIBVIRT_DEFAULT_URI=qemu:///system

does the trick

launch vm
---------

.. code::

   virsh # destroy --domain debian9.4 --graceful 

   sudo qemu-img info /var/lib/libvirt/images/debian9.4.qcow2 
   image: /var/lib/libvirt/images/debian9.4.qcow2
   file format: qcow2
   virtual size: 75G (80530636800 bytes)
   disk size: 73G
   cluster_size: 65536
   Format specific information:
       compat: 1.1
       lazy refcounts: true
       refcount bits: 16
       corrupt: false
   
   resize qemu
   sudo qemu-img resize /var/lib/libvirt/images/debian9.4.qcow2 +100G
   Image resized

   now expand filesystem to new available space. I'll do this with virt-resize. You need to install the libguestfs-tools package for that

.. code::

   sudo apt-get install libguestfs-tools

   sudo cp /var/lib/libvirt/images/debian9.4.qcow2 /var/lib/libvirt/images/debian9.4-original.qcow2

   patrick@lab:/var/lib/libvirt/images$ sudo virt-resize --expand /dev/vda1 debian9.4-original.qcow2 debian9.4.qcow2 
   [sudo] password for patrick: 
   [   0.0] Examining debian9.4-original.qcow2
    100% ⟦▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒⟧ --:--
   **********
   
   Summary of changes:
   
   /dev/sda1: This partition will be resized from 67.0G to 167.0G.  The 
   filesystem ext4 on /dev/sda1 will be expanded using the ‘resize2fs’ 
   method.
   
   /dev/sda2: This partition will be left alone.
   
   **********
   [   9.1] Setting up initial partition table on debian9.4.qcow2
   [  10.6] Copying /dev/sda1
    100% ⟦▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒⟧ 00:00
   [ 337.7] Copying /dev/sda2
    100% ⟦▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒⟧ --:--
   [ 376.7] Expanding /dev/sda1 using the ‘resize2fs’ method
   
   Resize operation completed with no errors.  Before deleting the old disk, 
   carefully check that the resized disk boots and works correctly.
  
let's boot her up and check

.. code::

   virsh # start debian9.4 --console

   patrick@ethnode:~$ sudo lsblk 
   NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
   sr0     11:0    1 1024M  0 rom  
   vda    254:0    0  175G  0 disk 
   ├─vda1 254:1    0  167G  0 part /
   ├─vda2 254:2    0    1K  0 part 
   └─vda5 254:5    0    8G  0 part [SWAP]
   patrick@ethnode:~$ 
   patrick@ethnode:~$ ethergo 
   INFO [05-25|09:45:50] Maximum peer count                       ETH=25 LES=0 total=25
   INFO [05-25|09:45:50] Starting peer-to-peer node               instance=Geth/v1.8.9-unstable-55b579e0/linux-amd64/go1.10.1
   INFO [05-25|09:45:50] Allocated cache and file handles         database=/home/patrick/.ethereum/geth/chaindata cache=3072 handles=512
   INFO [05-25|09:46:05] Initialised chain configuration          config="{ChainID: 1 Homestead: 1150000 DAO: 1920000 DAOSupport: true EIP150: 2463000 EIP155: 2675000 EIP158: 2675000 Byzantium: 4370000 Constantinople: <nil> Engine: ethash}"
   INFO [05-25|09:46:05] Disk storage enabled for ethash caches   dir=/home/patrick/.ethereum/geth/ethash count=3
   INFO [05-25|09:46:05] Disk storage enabled for ethash DAGs     dir=/home/patrick/.ethash               count=2
   INFO [05-25|09:46:05] Initialising Ethereum protocol           versions="[63 62]" network=1
   INFO [05-25|09:46:05] Loaded most recent local header          number=5258315 hash=b9e4f9…023c47 td=3054687488633471122397
   INFO [05-25|09:46:05] Loaded most recent local full block      number=0       hash=d4e567…cb8fa3 td=17179869184

mission accomplished!  


see domains as user and connect to console
------------------------------------------

.. code::

   patrick@lab:~$ export LIBVIRT_DEFAULT_URI=qemu:///system
   patrick@lab:~$ virsh
   Welcome to virsh, the virtualization interactive terminal.
   
   Type:  'help' for help with commands
          'quit' to quit
   
   virsh # list --all
    Id    Name                           State
   ----------------------------------------------------
    2     gns3                           running
    -     debian9.4                      shut off
   
   virsh # console --domain debian9.4
   error: The domain is not running
   
   virsh # start --domain debian9.4 
   Domain debian9.4 started
   
   virsh # console debian9.4
   Connected to domain debian9.4
   Escape character is ^]
   
   Debian GNU/Linux buster/sid ethnode ttyS0
   
   ethnode login: 

adjust sources.list
-------------------

.. code::

   $ cat /etc/apt/sources.list
   deb http://deb.debian.org/debian buster main contrib non-free
   deb-src http://deb.debian.org/debian buster main contrib non-free
   
   deb http://deb.debian.org/debian buster-updates main contrib non-free
   deb-src http://deb.debian.org/debian buster-updates main contrib non-free
   
   deb http://security.debian.org/debian-security/ buster/updates main contrib non-free
   deb-src http://security.debian.org/debian-security/ buster/updates main contrib non-free


install basic packages
----------------------

.. code::

   apt-get update
   apt-get install sudo vim git locate

add your user to the sudo group
-------------------------------

.. code::

   usermod -aG sudo patrick
   su patrick


transfer your ssh key to the server
-----------------------------------


