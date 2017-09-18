#########
Scripting
#########

****
BASH
****
functions
=========

.. code:: bash

   funcky() { echo "this is a funky function"; echo; } # compacted needs semicolon

   a function call is the equivalent to a command

   simple functions
   ----------------

   #!/bin/bash
   JUST_A_SECOND=1 # uppercase for constant

   funcky()
   {
     echo "simple function."
   } # function call --> after declaration!

   fun ()
   { 
     i=0
     REPEATS=30
   
     echo "And now the fun really begins."
   
     sleep $JUST_A_SECOND
     while [ $i -lt $REPEATS ]
     do
       echo "<-------i is $i--------->"
       echo "<-- $REPEATS-$i: left -->"
       let "i+=1"
     done
   }
   
   funky
   fun
   
   exit $?

run commands in script as sudo
------------------------------


**Use the NOPASSWD directive**

You can use the NOPASSWD directive in your ``/etc/sudoers file``.

If your user is called user and your host is called host you could add these lines to /etc/sudoers:

.. code:: bash

   user host = (root) NOPASSWD: /sbin/shutdown
   user host = (root) NOPASSWD: /sbin/reboot

This will allow the user user to run the desired commands on host without entering a password. All other sudoed commands will still require a password.

The commands specified in the sudoers file must be fully qualified (i.e. using the absolute path to the command to run) as described in the sudoers man page. Providing a relative path is considered a syntax error.

If the command ends with a trailing / character and points to a directory, the user will be able to run any command in that directory (but not in any sub-directories therein). In the following example, the user user can run any command in the directory /home/someuser/bin/:

``user host = (root) NOPASSWD: /home/someuser/bin/``

.. note:: Always use the command visudo to edit the sudoers file to make sure you do not lock yourself out of the system – just in case you accidentally write something incorrect to the sudoers file. visudo will save your modified file to a temporary location and will only overwrite the real sudoers file if the modified file can be parsed without errors.

**Using /etc/sudoers.d instead of modifying /etc/sudoers**

As an alternative to editing the /etc/sudoers file, you could add the two lines to a new file in /etc/sudoers.d e.g. /etc/sudoers.d/shutdown. This is an elegant way of separating different changes to the sudo rights and also leaves the original sudoers file untouched for easier upgrades.

``sudo visudo -f /etc/sudoers.d/shutdown``

This also automatically ensures that the owner and permissions of the new file is set correctly.


If sudoers is messed up
^^^^^^^^^^^^^^^^^^^^^^^

If you did not use visudo to edit your files and then accidentally messed up /etc/sudoers or messed up a file in /etc/sudoers.d then you will be locked out of sudo.

The solution could be to fix the files using pkexec which is an alternative to sudo.

To fix /etc/sudoers:

``pkexec visudo``

To fix /etc/sudoers.d/shutdown:

``pkexec visudo -f /etc/sudoers.d/shutdown``

If the ownership and/or permissions are incorrect for any sudoers file, the file will be ignored by sudo so you might also find yourself locked out in this situation. Again, you can use pkexec to fix this.

The correct permissions should be like this:

.. code:: bash

   $ls -l /etc/sudoers.d/shutdown 
   -r--r----- 1 root root 86 Jul 16 15:37 /etc/sudoers.d/shutdown
   
   Use pkexec like this to fix ownership and permissions:
   
   pkexec chown root:root /etc/sudoers.d/shutdown
   pkexec chmod 0440 /etc/sudoers.d/shutdown


