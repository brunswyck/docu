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
