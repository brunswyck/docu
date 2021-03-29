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

*************
Network Tools
*************

TCPdump
=======

cli options
-----------

+------------------+-------------------------------------------------------+
| option           | explanation                                           |
+==================+=======================================================+
| -A               | Print frame payload in ASCII                          |
+------------------+-------------------------------------------------------+
| -c <count>       | Exit after capturing count packets                    |
+------------------+-------------------------------------------------------+
| -D               | List available interfaces                             |
+------------------+-------------------------------------------------------+
| -E               | Decrypt IPSEC traffic by providing an encryption key. |
+------------------+-------------------------------------------------------+
| -e               | Print link-level headers                              |
+------------------+-------------------------------------------------------+
| -F <file>        | Use file as the filter expression                     |
+------------------+-------------------------------------------------------+
| -G <n>           | Rotate the dump file every n seconds                  |
+------------------+-------------------------------------------------------+
| -i <iface> (any) | Specifies the capture interface                       |
+------------------+-------------------------------------------------------+
| -K               | Don't verify TCP checksums                            |
+------------------+-------------------------------------------------------+
| -L               | List data link types for the interface                |
+------------------+-------------------------------------------------------+
| -n               | Don't convert addresses to names                      |
+------------------+-------------------------------------------------------+
| -nn              | Don't convert addresses or port names                 |
+------------------+-------------------------------------------------------+
| -p               | Don't capture in promiscuous mode                     |
+------------------+-------------------------------------------------------+
| -q               | Quiet                                                 |
+------------------+-------------------------------------------------------+
| -r <file>        | Read packets from file                                |
+------------------+-------------------------------------------------------+
| -s <len>         | Capture up to len bytes per packet                    |
+------------------+-------------------------------------------------------+
| -S               | Print absolute TCP sequence numbers                   |
+------------------+-------------------------------------------------------+
| -t               | human readable timestamp                              |
+------------------+-------------------------------------------------------+
| -v[v[v]]         | Print more verbose output                             |
+------------------+-------------------------------------------------------+
| -w <file>        | Write captured packets to file                        |
+------------------+-------------------------------------------------------+
| -x               | Print frame payload in hex                            |
+------------------+-------------------------------------------------------+
| -X               | Print frame payload in hex and ASCII                  |
+------------------+-------------------------------------------------------+
| -XX              | same but also show ethernet header                    |
+------------------+-------------------------------------------------------+
| -y <type>        | Specify the data link type                            |
+------------------+-------------------------------------------------------+
| -Z <user>        | Drop privileges from root to user                     |
+------------------+-------------------------------------------------------+

capture filters
---------------

+-------------------------------------------+---------------------------------------------------------------+
| filter                                    | explanation                                                   |
+===========================================+===============================================================+
| [src\|dst] host <host>                    | Matches a host as the IP source, destination, or either       |
+-------------------------------------------+---------------------------------------------------------------+
| ether [src\|dst] host <ehost>             | Matches a host as the Ethernet source, destination, or either |
+-------------------------------------------+---------------------------------------------------------------+
| gateway host <host>                       | Matches packets which used host as a gateway                  |
+-------------------------------------------+---------------------------------------------------------------+
| [src\|dst] net <network>/<len>            | Matches packets to or from an endpoint residing in network    |
+-------------------------------------------+---------------------------------------------------------------+
| [tcp\|udp] [src\|dst] port <port>         | Matches TCP or UDP packets sent to/from port                  |
+-------------------------------------------+---------------------------------------------------------------+
| [tcp\|udp] [src\|dst] portrange <p1>-<p2> | Matches TCP or UDP packets to/from a port in the given range  |
+-------------------------------------------+---------------------------------------------------------------+
| less <length>                             | Matches packets less than or equal to length                  |
+-------------------------------------------+---------------------------------------------------------------+
| greater <length>                          | Matches packets greater than or equal to length               |
+-------------------------------------------+---------------------------------------------------------------+
| (ether\|ip\|ip6) proto <protocol>         | Matches an Ethernet,IPv4, or IPv6 protocol                    |
+-------------------------------------------+---------------------------------------------------------------+
| (ether\|ip) broadcast                     | Matches Ethernet or IPv4 broadcasts                           |
+-------------------------------------------+---------------------------------------------------------------+
| (ether\|ip\|ip6) multicast                | Matches Ethernet, IPv4, or IPv6 multicasts                    |
+-------------------------------------------+---------------------------------------------------------------+
| type (mgt\|ctl\|data) [subtype <subtype>] | Matches 802.11 frames based on type and optional subtype      |
+-------------------------------------------+---------------------------------------------------------------+
| vlan [<vlan>]                             | Matches 802.1Q frames, optionally with a VLAN ID of vlan      |
+-------------------------------------------+---------------------------------------------------------------+
| mpls [<label>]                            | Matches MPLS packets, optionally with a label of label        |
+-------------------------------------------+---------------------------------------------------------------+
| <expr> <relop> <expr>                     | Matches packets by an arbitrary expression                    |
+-------------------------------------------+---------------------------------------------------------------+

cli options
-----------

+----------------+-----------+------------+
| Protocols      | TCP Flags | Modifiers  |
+================+===========+============+
| arp ip6 slip   | tcp-urg   | ! or not   |
+----------------+-----------+------------+
| ether link tcp | tcp-rst   | && or and  |
+----------------+-----------+------------+
| fddi icmp ip   | tcp-ack   | \|\| or or |
+----------------+-----------+------------+
| ppp radio rarp | tcp-syn   |            |
+----------------+-----------+------------+
| tr udp wlan    | tcp-psh   |            |
+----------------+-----------+------------+
|                | tcp-fin   |            |
+----------------+-----------+------------+

Examples


- UDP not bound for port 53
   udp dst port not 53

- Traffic between these hosts
   host 10.0.0.1 && host 10.0.0.2

- Packets to either TCP port
   tcp dst port 80 or 8080


+-------------------+--------------------+------------------+
| ICMP              | Types              |                  |
+===================+====================+==================+
| icmp-echoreply    | icmp-routeradvert  | icmp-tstampreply |
+-------------------+--------------------+------------------+
| icmp-unreach      | icmp-routersolicit | icmp-ireq        |
+-------------------+--------------------+------------------+
| icmp-sourcequench | icmp-timxceed      | icmp-ireqreply   |
+-------------------+--------------------+------------------+
| icmp-redirect     | icmp-paramprob     | icmp-maskreq     |
+-------------------+--------------------+------------------+
| icmp-echo         | icmp-tstamp        | icmp-maskreply   |
+-------------------+--------------------+------------------+

