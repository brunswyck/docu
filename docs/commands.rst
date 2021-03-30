########
commands
########

***************
Tips and Tricks
***************

great shortcuts
===============

ctrl-u & ctrl-y
---------------
when typing a long command you need to interrupt it bc you want to do something else first then:

.. code::
   
   ctrl+e # go to end of cmd if you're not allready
   ctrl+u # get clean line
   echo "got to do this first" # execute you're interrupting command
   ctrl+y # now you are back at work on your last command :)

**********************
modify kernel settings
**********************

sysctl
======

.. code::

   sysctl -a | grep ipv6

**********
networking
**********


ip utility
==========

show mac table
--------------
.. code::

   sudo ip maddress show dev enp0s25
   2:	enp0s25
	link  01:00:5e:00:00:01
	link  33:33:00:00:00:fb
	link  33:33:00:00:00:01
	link  33:33:ff:18:b4:a0
	link  01:00:5e:00:00:fb
	inet  224.0.0.251 users 2
	inet  224.0.0.1
	inet6 ff02::1:ff18:b4a0
	inet6 ff02::fb users 2
	inet6 ff02::1
	inet6 ff01::1

show neighbors
--------------

.. code::
  
   ip neigh show dev enp0s25
   172.31.69.41  FAILED
   172.31.69.241  FAILED
   172.31.69.82  FAILED
   172.31.69.229  FAILED
   172.31.69.160  FAILED
   172.31.69.234  FAILED
   172.31.69.247  FAILED
   172.31.69.80  FAILED
   172.31.69.204  FAILED
   172.31.69.177  FAILED
   172.31.69.63  FAILED
   172.31.69.165  FAILED
   172.31.69.249  FAILED
   172.31.69.164  FAILED
   172.31.69.238  FAILED
   172.31.69.211  FAILED
   172.31.69.187  FAILED
   172.31.69.23  FAILED
   172.31.69.181  FAILED
   172.31.69.210  FAILED
   172.31.69.33 lladdr 90:1b:0e:0d:11:d2 STALE
   172.31.69.186  FAILED
   172.31.69.22  FAILED
   172.31.69.175  FAILED
   172.31.69.32 lladdr 00:19:99:ff:ac:c7 STALE
   172.16.4.254 lladdr 52:54:10:ff:10:02 REACHABLE
   172.31.69.39 lladdr 00:19:99:b0:c2:86 STALE
   172.31.69.184  FAILED
   172.31.69.173  FAILED
   172.31.69.14  FAILED
   172.31.69.201  FAILED
   172.31.69.243  FAILED
   172.31.69.121  FAILED
   172.31.69.200  FAILED
   172.31.69.31 lladdr 00:19:99:ec:95:e2 STALE

watch your neighbors ;)
-----------------------

.. code::
   
   watch -n 2 "ip neigh show dev enp0s25"
  


******************
Package Management
******************

apt-utils
=========

apt-cache
---------

.. code::

   apt-cache search 'PDF' | grep ' - .*PDF'


apt-get
-------

apt-get remove package
   will remove binaries but not conf files or data files of package. Will also leave dependencies installed;

apt-get purge package | apt-get remove --purge package
   will remove all except the depencies installed with it on installation

.. note:: Particularly useful when you want to 'start all over' with an application because you messed up the configuration.

apt-get autoremove
   will remove orphaned packages e.g. the dependencies no longer required by an app that got removed since


install from different repository
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

   sudo apt-get install -t unstable flashplugin-nonfree

aliases
=======

escaping characters for aliases
-------------------------------
.. code::

   read -d '' KICKASSCOMMAND <<"EOF"
   alias bustwickrclient="kill -n 9 \\$(ps -C wickr-me | awk 'BEGIN {RS=\\"\\\\n\\"; FS=\\" \\"} FNR==2 {print \\$1}')"
   EOF
   echo $KICKASSCOMMAND 
   alias bustwickrclient="kill -n 9 \$(ps -C wickr-me | awk 'BEGIN {RS=\"\\n\"; FS=\" \"} FNR==2 {print \$1}')"
   echo $KICKASSCOMMAND >> ~/.bash_aliases 
   source ~/.bash_aliases
   alias
   alias bustwickrclient='kill -n 9 $(ps -C wickr-me | awk '\''BEGIN {RS="\n"; FS=" "} FNR==2 {print $1}'\'')'
   alias ll='ls -hal --color=auto'

***
AWK
***

General Syntax
==============

`gawk.pdf <https://www.gnu.org/software/gawk/manual/gawk.pdf>`_

BEGIN and END
-------------

`GNUawk <https://www.gnu.org/software/gawk/manual/html_node/Using-BEGIN_002fEND.html>`_
BEGIN and END statements are help full in displaying information before and after executing actual AWK script.

BEGIN block Uses:

Declaring variables.
Initialization variables for doing increment/decrements operations in main AWK code.
Printing Headings/info before actual AWK code output.
    

END block Uses:

Printing final results, after doing operations in main AWK block.
Printing Completion/info after actual AWK code output.
    

awk 'BEGIN{awk initializing code}{actual AWK code}' filename.txt

.. code::

   awk 'BEGIN{s=0}{s=s+$3}END{print s}' db.txt

   awk 'BEGIN{print "######################noutput of filtered datan###########################";print "NamesttotaltPPTtDoctxls"}{printf "%st%dt%dt%dt%dn", $1,$2,$3,$4,$5}END{print "###########################nCompleted filtered datan###########################"}' db.txt
    
   Output:
   #######################
   output of filtered data
   #######################
   Names total PPT Doc xls
   Jones 21 78 84 77
   Gondrol 23 56 58 45
   RinRao 25 21 38 37
   Edwin 25 87 97 95
   Dayan 24 55 30 47
   #######################
   Completed filtered data
   #######################

Seperators
----------
`seperators_gawk <http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_06_03.html>`_



stripping | removing
====================

remove duplicate lines
----------------------

.. code::

   sudo awk '!seen[$0]++' /etc/apt/sources.list

****
find
****

removing files
==============

remove files with same extension
--------------------------------

.. code::

   find . -maxdepth 1 -name "*.html" -type f -delete


remove all but 1
----------------

.. code::

   files
   -----
   find . ! -name 'PacketTracer71_64bit_linux.tar.gz' -type f -exec rm -f {} +

   directories
   -----------
   find . ! -name 'PacketTracer71_64bit_linux.tar.gz' -type d -exec rm -rf {} +

   nonposix alternative
   --------------------
   shopt -s extglob 
   rm -- !(file.txt)

****
grep
****

finding stuff
=============
include files ending on x and containing y
------------------------------------------

.. code::

   grep -r --include '*.list' '^deb ' /etc/apt/sources.list /etc/apt/sources.list.d/

*************
substitutions
*************

proces substitution
===================
Ever wanted to diff the outputs of two commands quickly? Of course, you could redirect the output to a temporary file for both of them, and diff those files, like this:

 .. code::

    find /etc | sort > local_etc_files
    find /mnt/remote/etc | sort > remote_etc_files
    diff local_etc_files remote_etc_files
    rm local_etc_files remote_etc_files

This would tell you the differences between which files are in /etc on the local computer and a remote one. It takes four lines, however. Using process substitution, we can do this is just a single line:

 .. code::

    diff <(find /etc | sort) <(find /mnt/remote/etc | sort)

What’s that <(…) syntax? It means “run the command inside it, connect the output to a temporary pipe file and give that as an argument”. To understand this more thoroughly, try running this:

 .. code::

    echo <(echo test)

Instead of printing “test”, this will print something like “/dev/fd/63”. You see now that the <(…) part is actually replaced by a file. This file is a stream from which the output of the command inside <(…) can be read, like this:

 .. code::

    cat <(echo test)

Now this does print “test”! Bash redirects the output of “echo test” to /dev/fd/<something>, gives the path of that file to cat, and cat reads the output of echo from that file. The shortened diff command above does the same, only for two slightly more complicated commands. This technique can be applied in any place where a temporary file is needed, but it does have a limitation. The temporary file can only be read once before it disappears. There’s no use in saving the name of the temporary file. If you need multiple accesses to the output of a program, use an old-fashioned temporary file or see if you can use pipes instead.

********************
system configuration
********************

sudo
====

run commands in script as sudo
------------------------------


.. note:: Always use the command visudo to edit the sudoers file to make sure you do not lock yourself out of the system – just in case you accidentally write something incorrect to the sudoers file. visudo will save your modified file to a temporary location and will only overwrite the real sudoers file if the modified file can be parsed without errors.

**Using /etc/sudoers.d instead of modifying /etc/sudoers**


example for DHCP

::

  # User alias specification
  User alias specification User_Alias DHCPUSERS = guru, patrick

*********************
system administration
*********************

git
===

reset your remote git
---------------------

.. code::

   git remote -v 
   git remote remove origin 
   git remote add origin git@github.com:user/repo.git  
   
