###########
cheatsheets
###########

***************
screen sessions
***************

tmux shortcuts & cheatsheet
===========================

start new with session name:

::

   tmux new -s patrick

attach:

::

   tmux a  #  (or at, or attach)

attach to named:

::

   tmux a -t patrick

list sessions:

::

   tmux ls

kill session:

::

   tmux kill-session -t patrick

Kill all the tmux sessions:

::

   tmux kill-server 	Destroy all sessions and kill all processes
   or
   tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill


In tmux, hit the prefix ``ctrl+b`` and then:

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


.. note:: prefix + alt+arrow = resize active pane

Here is the basic syntax to resize panes:

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

source: http://blog.sanctum.geek.nz/sync-tmux-panes/


Create a tmux Configuration File
--------------------------------

As you get comfortable with tmux, you may want to change some of the defaults. Using a text editor, create a configuration file in your user’s home directory:

~/.tmux.conf

.. code::

   # Uncomment the lines with the options you want to activate (by deleting the preceding "#")

   # Allow mouse interaction
   # set-option -g mouse on

   # Change prefix key to CTRL+A. "C-" stands for CTRL, "M-" stands for ALT key
   # set-option -g prefix C-a
   # unbind-key C-b
   # bind-key C-a send-prefix

   # Display CPU load average for the last 1,5 and 15 minutes, in the status bar
   set -g status-right "#(cut -d ' ' -f -3 /proc/loadavg) %H:%M %d-%b-%y"

When you have saved your changes to this file, load the new configuration. Enter the tmux command mode by pressing Prefix then :, then use the following command:

::

   source-file ~/.tmux.conf

With the mouse option enabled you can use the pointer to interact with tmux panes, windows and status bar. For example you can click on a window name in the status bar to switch to it or you can click and drag a pane line to resize it.

***************
some other tool
***************

display
=======

test
----

change display color profile following the sun

subtest
^^^^^^^

