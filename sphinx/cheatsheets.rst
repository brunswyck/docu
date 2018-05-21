###########
cheatsheets
###########

***************
screen sessions
***************

tmux shortcuts & cheatsheet
===========================

start new:

::

   tmux

start new with session name:

::

   tmux new -s myname

attach:

::

   tmux a  #  (or at, or attach)

attach to named:

::

   tmux a -t myname

list sessions:

::

   tmux ls

kill session:

::

   tmux kill-session -t myname

Kill all the tmux sessions:

::

   tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill

In tmux, hit the prefix ``ctrl+b`` (my modified prefix is ctrl+a) and
then:

Sessions
--------

::

   :new<CR>  new session
   s  list sessions
   $  name session

Windows (tabs)
--------------

::

   c  create window
   w  list windows
   n  next window
   p  previous window
   f  find window
   ,  name window
   &  kill window

Panes (splits)
--------------

::

   %  vertical split
   "  horizontal split

   o  swap panes
   q  show pane numbers
   x  kill pane
   +  break pane into window (e.g. to select text by mouse to copy)
   -  restore pane from window
   ⍽  space - toggle between layouts
   <prefix> q (Show pane numbers, when the numbers show up type the key to goto that pane)
   <prefix> { (Move the current pane left)
   <prefix> } (Move the current pane right)
   <prefix> z toggle pane zoom

Sync Panes
----------

You can do this by switching to the appropriate window, typing your Tmux
prefix (commonly Ctrl-B or Ctrl-A) and then a colon to bring up a Tmux
command line, and typing:

::

   :setw synchronize-panes

You can optionally add on or off to specify which state you want;
otherwise the option is simply toggled. This option is specific to one
window, so it won’t change the way your other sessions or windows
operate. When you’re done, toggle it off again by repeating the command.
`tip source`_

Resizing Panes
--------------

You can also resize panes if you don’t like the layout defaults. I
personally rarely need to do this, though it’s handy to know how. Here
is the basic syntax to resize panes:

::

   PREFIX : resize-pane -D (Resizes the current pane down)
   PREFIX : resize-pane -U (Resizes the current pane upward)
   PREFIX : resize-pane -L (Resizes the current pane left)
   PREFIX : resize-pane -R (Resizes the current pane right)
   PREFIX : resize-pane -D 20 (Resizes the current pane down by 20 cells)
   PREFIX : resize-pane -U 20 (Resizes the current pane upward by 20 cells)
   PREFIX : resize-pane -L 20 (Resizes the current pane left by 20 cells)
   PREFIX : resize-pane -R 20 (Resizes the current pane right by 20 cells)
   PREFIX : resize-pane -t 2 20 (Resizes the pane with the id of 2 down by 20 cells)
   PREFIX : resize-pane -t -L 20 (Resizes the pane with the id of 2 left by 20 cells)

Copy mode:
----------

Pressing PREFIX [ places us in Copy mode. We can then use our movement
keys to move our cursor around the screen. By default, the arrow keys
work. we set our configuration file to u

.. _tip source: http://blog.sanctum.geek.nz/sync-tmux-panes/

**********************
second section here
**********************

display
=======

test
----

change display color profile following the sun

subtest
^^^^^^^

