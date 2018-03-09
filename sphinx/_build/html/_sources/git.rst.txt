.. highlightlang:: rest
.. using headers 
   ##################
   H1: document title
   ##################
   
   Introduction text.
   
   
   *********
   Sample H2
   *********
   
   Sample content.
   
   
   **********
   Another H2
   **********
   
   Sample H3
   =========
   
   Sample H4
   ---------
   
   Sample H5
   ^^^^^^^^^
   
   Sample H6
   """""""""
   
   And some text.
   


###
GIT
###

********
workflow
********

show current config 
===================

git remote show origin


changed gitignore but folder still in commit
--------------------------------------------

you added eg the folder env/ to your .gitignore file but when checking git status you see git still wants to commit all env/lib/... files
You can fix that by removing the folder from cache:

.. code::

   git rm -r --cached bin

force local changes on remote master with no merge
--------------------------------------------------

.. code::
  
   git push -f <remote> <branch>
   git push -f origin master

Force pushing with a "lease" allows the force push to fail if there are new commits on the remote that you didn't expect (technically, if you haven't fetched them into your remote-tracking branch yet), which is useful if you don't want to accidentally overwrite someone else's commits that you didn't even know about yet, and you just want to overwrite your own:

.. code::

   git push <remote> <branch> --force-with-lease






