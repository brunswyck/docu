##########
cumulocity
##########

****************************************
installing and registering an IOT device
****************************************

installation (beaglebone black)
===============================

install the iot debian 9 os
---------------------------

source: https://beagleboard.org/latest-images

#. insert the microsd card and verify its existence on your OS
   
   .. code::

      patrick@stretch:~/docu/sphinx[brunswyck:docu.git master|!?]$ sudo lsblk /dev/mmc*;sudo blkid /dev/mmc*;sudo fdisk -l | grep mmc
      NAME        MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
      mmcblk0     179:0    0  29G  0 disk 
      └─mmcblk0p1 179:1    0  29G  0 part 
      mmcblk0p1   179:1    0  29G  0 part 
      /dev/mmcblk0: PTUUID="00016d8d" PTTYPE="dos"
      /dev/mmcblk0p1: LABEL="bblack" UUID="0740b41b-fe58-458e-865d-61119442a26d" TYPE="ext4" PARTUUID="00016d8d-01"
      Disk /dev/mmcblk0: 29 GiB, 31104958464 bytes, 60751872 sectors
      /dev/mmcblk0p1       2048 60751871 60749824  29G 83 Linux

#. pick/download/verify your image (see source url) and burn it to the sd card

   .. code::
   
      patrick@stretch:~/Downloads$ wget http://debian.beagleboard.org/images/bone-debian-9.3-iot-armhf-2018-03-05-4gb.img.xz
      --2018-05-30 15:01:58--  http://debian.beagleboard.org/images/bone-debian-9.3-iot-armhf-2018-03-05-4gb.img.xz
      Resolving debian.beagleboard.org (debian.beagleboard.org)... 52.26.75.20
      Connecting to debian.beagleboard.org (debian.beagleboard.org)|52.26.75.20|:80... connected.
      HTTP request sent, awaiting response... 200 OK
      Length: 462639124 (441M) [application/octet-stream]
      Saving to: ‘bone-debian-9.3-iot-armhf-2018-03-05-4gb.img.xz’

      bone-debian-9.3-iot-armhf-2018-03-05-4 100%[===========================================================================>] 441.21M  4.18MB/s    in 2m 46s  

      2018-05-30 15:04:44 (2.66 MB/s) - ‘bone-debian-9.3-iot-armhf-2018-03-05-4gb.img.xz’ saved [462639124/462639124]

      patrick@stretch:~/Downloads$ sha256sum bone-debian-9.3-iot-armhf-2018-03-05-4gb.img.xz 
      33fc557f32005c811bd449a59264da6b4a9b4ea9f87a1ee0aa43ae651c7f33d1  bone-debian-9.3-iot-armhf-2018-03-05-4gb.img.xz

      patrick@stretch:~/Downloads$ xzcat  bone-debian-9.3-iot-armhf-2018-03-05-4gb.img.xz | sudo dd of=/dev/mmcblk0
      6963200+0 records in
      6963200+0 records out
      3565158400 bytes (3.6 GB, 3.3 GiB) copied, 1143.18 s, 3.1 MB/s

#. Boot it up on the BBlack and configure basics, default user=debian password=temppwd

   .. code::

      as root (sudo su)
      apt-get update;apt-get upgrade -y

      apt-get install keyboard-configuration console-setup
      dpkg-reconfigure keyboard-configuration
      service keyboard-setup restart
      
      deluser debian
      adduser patrick
      usermod -aG sudo patrick
      exit

      login as the user to test

#. copy your public key to the node so you can ssh

   .. code::

      patrick@beaglebone:~$ sudo ip addr show
      1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1
          link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
          inet 127.0.0.1/8 scope host lo
             valid_lft forever preferred_lft forever
          inet6 ::1/128 scope host 
             valid_lft forever preferred_lft forever
      2: eth0: <BROADCAST,MULTICAST,DYNAMIC,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
          link/ether 50:72:24:b7:3b:af brd ff:ff:ff:ff:ff:ff
          inet 192.168.2.102/24 brd 192.168.2.255 scope global eth0
             valid_lft forever preferred_lft forever

      patrick@stretch:~/Downloads$ ssh-copy-id -i ~/.ssh/labo_rsa.pub patrick@192.168.2.102
      ssh patrick@192.168.2.102

      for ease adjust your /etc/hosts file

#. install java

   .. code::

      patrick@beaglebone:~$ sudo apt-get update;sudo apt-get install oracle-java8-installer -y
      patrick@beaglebone:~# sudo apt install oracle-java8-set-default
      patrick@beaglebone:~$ java -version
      java version "1.8.0_171"
      Java(TM) SE Runtime Environment (build 1.8.0_171-b11)
      Java HotSpot(TM) Client VM (build 25.171-b11, mixed mode)


register the device on cumulocity
=================================


download and extract the linux agent
------------------------------------

.. code::

   patrick@beaglebone:~$ mkdir dlds
   patrick@beaglebone:~$ cd dlds/
   patrick@beaglebone:~/dlds$ wget http://resources.cumulocity.com/examples/cumulocity-linux-agent-latest.tar.gz
   --2018-05-30 20:13:06--  http://resources.cumulocity.com/examples/cumulocity-linux-agent-latest.tar.gz
   Resolving resources.cumulocity.com (resources.cumulocity.com)... 54.217.145.105
   Connecting to resources.cumulocity.com (resources.cumulocity.com)|54.217.145.105|:80... connected.
   HTTP request sent, awaiting response... 200 OK
   Length: 12717628 (12M) [application/octet-stream]
   Saving to: ‘cumulocity-linux-agent-latest.tar.gz’
   
   cumulocity-linux-agent-latest.tar.gz   100%[===========================================================================>]  12.13M  11.1MB/s    in 1.1s    
   
   2018-05-30 20:14:20 (11.1 MB/s) - ‘cumulocity-linux-agent-latest.tar.gz’ saved [12717628/12717628]
   
   patrick@beaglebone:~/dlds$ tar -xzf cumulocity-linux-agent-latest.tar.gz 
   patrick@beaglebone:~/dlds$ ls
   c8y-agent-debug.sh  c8y-agent-remote-debug.sh  c8y-agent.sh  cfg  lib  LICENSE
   patrick@beaglebone:~/dlds$ chmod ug+x c8y-agent.sh 


configure the host and launch the agent
---------------------------------------

.. code::

   patrick@beaglebone:~$ vim dlds/cfg/cumulocity.properties 

   enter your hostname so the agent knows where to connect the device to

   patrick@beaglebone:~$ cat dlds/cfg/cumulocity.properties 
   ######### Basic Properties ################################################
   # Fill in your host and uncomment.
   # -------------------------------------------------------------------------
   host = https://goatsndonkeys.cumulocity.com
   ###########################################################################

   ######## Advanced Properties ##############################################
   # There are default bootstrap user credentials set up in the code already.
   # You don't have to worry about the bootstrap options under this line.
   # -------------------------------------------------------------------------
   # bootstrap.tenant = <bootstrap tenant>
   # bootstrap.user = <bootstrap  username>
   # bootstrap.password = <bootstrap password>
   ########################################################################### 

   patrick@beaglebone:~$ tmux new-session -n agent -s cumulocity
   patrick@beaglebone:~$ sh ~/dlds/c8y-agent.sh 


.. code::

   patrick@beaglebone:~/dlds/cfg$ sudo tail -f /var/log/messages 

   May 30 21:17:56 beaglebone patrick: Running the Cumulocity Linux Agent...
   May 30 21:17:59 beaglebone patrick: 21:17:59.817 [main] WARN  c8y.lx.agent.PropUtils - Configuration file ./cfg/device.properties cannot be read, assuming empty configuration
   May 30 21:18:00 beaglebone patrick: 21:18:00.105 [main] WARN  c8y.lx.agent.Agent - Skipping driver class c8y.tinkerforge.TFDriver
   May 30 21:18:01 beaglebone patrick: 21:18:01.119 [main] ERROR c8y.lx.agent.Agent - Unrecoverable error, exiting
   May 30 21:18:01 beaglebone patrick: java.lang.IllegalStateException: None of dirvers implements HardwareProvider interface or there is uninitailized hardware!
   May 30 21:18:01 beaglebone patrick: #011at c8y.lx.agent.Agent.specifyHardware(Agent.java:130) ~[jv-agent-8.17.0-SNAPSHOT.jar:na]
   May 30 21:18:01 beaglebone patrick: #011at c8y.lx.agent.Agent.initializePlatform(Agent.java:111) ~[jv-agent-8.17.0-SNAPSHOT.jar:na]
   May 30 21:18:01 beaglebone patrick: #011at c8y.lx.agent.Agent.<init>(Agent.java:99) ~[jv-agent-8.17.0-SNAPSHOT.jar:na]
   May 30 21:18:01 beaglebone patrick: #011at c8y.lx.agent.Agent.<init>(Agent.java:91) ~[jv-agent-8.17.0-SNAPSHOT.jar:na]
   May 30 21:18:01 beaglebone patrick: #011at c8y.lx.agent.Agent.main(Agent.java:84) ~[jv-agent-8.17.0-SNAPSHOT.jar:na]


tcpdump also shows no additional traffic to gateway is generated by the agent.

.. code::

   patrick@beaglebone:~$ sudo tcpdump -i eth0 host 192.168.2.1
   tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
   listening on eth0, link-type EN10MB (Ethernet), capture size 262144 bytes
   07:31:59.366666 IP 192.168.2.88.bootpc > firewall.home.bootps: BOOTP/DHCP, Request from 50:72:24:b7:3b:af (oui Unknown), length 548
   07:31:59.368318 IP firewall.home.bootps > 192.168.2.88.bootpc: BOOTP/DHCP, Reply, length 300
   07:31:59.372840 IP 192.168.2.88.45186 > firewall.home.domain: 26245+ PTR? 88.2.168.192.in-addr.arpa. (43)
   07:31:59.374096 IP firewall.home.domain > 192.168.2.88.45186: 26245 NXDomain* 0/1/0 (102)
   07:31:59.378904 IP 192.168.2.88.33282 > firewall.home.domain: 26541+ PTR? 1.2.168.192.in-addr.arpa. (42)
   07:31:59.380089 IP firewall.home.domain > 192.168.2.88.33282: 26541* 1/0/0 PTR firewall.home. (69)
   07:32:04.454159 ARP, Request who-has firewall.home tell 192.168.2.88, length 28
   07:32:04.455979 ARP, Reply firewall.home is-at 00:2a:e8:33:cd:89 (oui Unknown), length 46
   
.. note:: At this point I'm not sure how I can get the agent to start communicating from a beaglebone black

#. go register the device on the cumulocity platform

   .. image:: _static/img/newtinxs-cumulocity_device-registration.png

   .. image:: _static/img/newtinxs-cumulocity_device-registration2.png


available libraries

  .. code::

     patrick@beaglebone:~/dlds/lib$ ls
     aopalliance-1.0.jar                                     jersey-multipart-1.8-8.17.0-20171117.084531-31.jar
     bayeux-api-2.8.0.jar                                    jetty-util-7.6.14.v20131031.jar
     cometd-java-client-2.8.0.jar                            joda-time-1.6.2.jar
     cometd-java-common-2.8.0.jar                            json-path-1.2.0-8.17.0-20171117.084528-31.jar
     common-notification-8.17.0-20171117.084909-41.jar       jsr311-api-1.1.1.jar
     common-rest-8.17.0-20171117.084801-47.jar               jssc-2.6.0.jar
     commons-beanutils-1.8.0.jar                             jv-agent-8.17.0-SNAPSHOT.jar
     commons-codec-1.4.jar                                   jv-driver-8.17.0-SNAPSHOT.jar
     commons-httpclient-3.1-8.17.0-20171117.084523-31.jar    logback-classic-1.0.13.jar
     commons-io-2.4.jar                                      logback-core-1.0.13.jar
     com.springsource.javax.validation-1.0.0.GA.jar          mimepull-1.4-8.17.0-20171117.084521-31.jar
     core-model-8.17.0-20171117.084640-38.jar                remote-access-driver-8.17.0-SNAPSHOT.jar
     device-capability-model-8.17.0-SNAPSHOT.jar             rest-representation-8.17.0-20171117.084651-38.jar
     generic-linux-driver-8.17.0-SNAPSHOT.jar                slf4j-api-1.7.0.jar
     googleauth-1.1.1-8.17.0-20171117.084549-31.jar          spring-aop-3.2.18.RELEASE.jar
     grizzly-framework-2.3.15.jar                            spring-beans-3.2.18.RELEASE.jar
     grizzly-http-2.3.15.jar                                 spring-context-3.2.18.RELEASE.jar
     grizzly-http-server-2.3.15.jar                          spring-core-3.2.18.RELEASE.jar
     guava-14.0.1.jar                                        spring-expression-3.2.18.RELEASE.jar
     guava-18.0-8.17.0-20171117.084541-31.jar                svenson-1.3.8-8.17.0-20171117.084527-31.jar
     java-client-8.17.0-SNAPSHOT.jar                         tinkerforge-2.1.2.jar
     javax.websocket-api-1.1.jar                             tinkerforge-driver-8.17.0-SNAPSHOT.jar
     jcl-over-slf4j-1.6.1.jar                                tyrus-client-1.8.2.jar
     jersey-apache-client-1.8-8.17.0-20171117.084531-31.jar  tyrus-container-grizzly-client-1.8.2.jar
     jersey-client-1.8-8.17.0-20171117.084531-31.jar         tyrus-core-1.8.2.jar
     jersey-core-1.8-8.17.0-20171117.084529-31.jar           tyrus-spi-1.8.2.jar
  
