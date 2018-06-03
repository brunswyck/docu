Diagrams in Sphinx
##################

installation and configuration
******************************

graphviz blockdiag nwdiag and actdiag
=====================================

add the installed diagram modules to the extensions section in your conf.py

.. code::

   extensions = ['sphinx.ext.autodoc', 'sphinx.ext.graphviz', 'sphinx.ext.githubpages', 
          'sphinxcontrib.nwdiag', 'sphinxcontrib.rackdiag', 'sphinxcontrib.packetdiag', 
          'sphinxcontrib.seqdiag','sphinxcontrib.blockdiag','sphinxcontrib.actdiag']


installation
------------
installing graphviz doesn't work from pip install, you have to install it systemwide (pip doesn't install a .dot binary for some reason.

.. code::

   sudo apt-get install graphviz



configuration
-------------

you need to autobuild it with the following configuration in your sphinx virtual environment if you want to use graphviz. For the network diagrams this is not required

.. code::

   sphinx-autobuild -b html -D graphviz_dot=/usr/bin/dot -H 127.0.0.1 -p 6666 ./ _build/html/




demonstration of diagrams
=========================

graphviz
--------

.. graphviz::

   digraph foo {
      "bar" -> "baz";
   }

.. graph:: foo

   "bar" -- "baz";

.. digraph:: foo

   "bar" -> "baz" -> "quux";

.. graphviz::

   digraph example {
       a [label="sphinx", href="http://sphinx-doc.org", target="_top"];
       b [label="other"];
       a -> b;
   }

.. graphviz::

   digraph Flatland {
   
      a -> b -> c -> g; 
      a  [shape=polygon,sides=4]
      b  [shape=polygon,sides=5]
      c  [shape=polygon,sides=6]
   
      g [peripheries=3,color=yellow];
      s [shape=invtriangle,peripheries=1,color=red,style=filled];
      w  [shape=triangle,peripheries=1,color=blue,style=filled];
      
      }

nwdiag
------

simple diagram
^^^^^^^^^^^^^^

.. nwdiag::
   :desctable:

   nwdiag {
      network {
        A [address = 192.168.0.1, description = "web server01"];
        B [address = 192.168.0.2, description = "web server02"];
      }
      network {
        A [address = 172.0.0.1];
        C [address = 172.0.0.2, description = "database server"];
      }
   }

define multiple addresses
^^^^^^^^^^^^^^^^^^^^^^^^^

.. nwdiag::

   nwdiag {
     network dmz {
         address = "210.x.x.x/24"
   
         // set multiple addresses (using comma)
         web01 [address = "210.x.x.1, 210.x.x.20"];
         web02 [address = "210.x.x.2"];
     }
     network internal {
         address = "172.x.x.x/24";
   
         web01 [address = "172.x.x.1"];
         web02 [address = "172.x.x.2"];
         db01;
         db02;
     }
   }

grouping nodes
^^^^^^^^^^^^^^

.. nwdiag::

   nwdiag {
     network Sample_front {
       address = "192.168.10.0/24";
   
       // define group
       group web {
         web01 [address = ".1"];
         web02 [address = ".2"];
       }
     }
     network Sample_back {
       address = "192.168.20.0/24";
       web01 [address = ".1"];
       web02 [address = ".2"];
       db01 [address = ".101"];
       db02 [address = ".102"];
   
       // define network using defined nodes
       group db {
         db01;
         db02;
       }
     }
   }

define group at outside nw definitions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. nwdiag::

   nwdiag {
    group {
      color = "#FF7777";

      web01;
      web02;
      db01;
    }

    network dmz {
      web01;
      web02;
    }
    network internal {
      web01;
      web02;
      db01;
    }
   }

peer networks
^^^^^^^^^^^^^

.. nwdiag::

   nwdiag {
     inet [shape = cloud];
     inet -- router;
   
     network {
       router;
       web01;
       web02;
     }
   }

http://blockdiag.com/en/nwdiag/sphinxcontrib.html#install
http://blockdiag.com/en/nwdiag/
 
rackdiag
--------

simple diagram
^^^^^^^^^^^^^^

.. rackdiag::

   rackdiag {
     // define height of rack
     16U;
   
     // define rack items
     1: UPS [2U];
     3: DB Server
     4: Web Server
     5: Web Server
     6: Web Server
     7: Load Balancer
     8: L3 Switch
   }


rack attributes
^^^^^^^^^^^^^^^

.. rackdiag::

   rackdiag {
     // Change order of rack-number as ascending
     ascending;
   
     // define height of rack
     12U;
   
     // define description of rack
     description = "Tokyo/1234 East";
   
     // define rack units
     1: UPS [2U];   // define height of unit
     3: DB Server [5kg]  // define weight of unit
     4: Web Server [0.5A]  // define ampere of unit
     5: Web Server
     6: Web Server
     7: Load Balancer
     8: L3 Switch
   }
   

multiple units in rack-level
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. rackdiag::

   rackdiag {
     // define height of rack
     16U;
   
     // define rack items
     1: UPS [2U];
     3: DB Server
     4: Web Server 1  // put 2 units to rack-level 4
     4: Web Server 2
     5: Web Server 3
     5: Web Server 4
     7: Load Balancer
     8: L3 Switch
   }

multiple racks
^^^^^^^^^^^^^^

.. rackdiag::

   rackdiag {
     // define 1st rack
     rack {
       16U;
   
       // define rack items
       1: UPS [2U];
       3: DB Server
       4: Web Server
       5: Web Server
       6: Web Server
       7: Load Balancer
       8: L3 Switch
     }
   
     // define 2nd rack
     rack {
       12U;
   
       // define rack items
       1: UPS [2U];
       3: DB Server
       4: Web Server
       5: Web Server
       6: Web Server
       7: Load Balancer
       8: L3 Switch
     }
   }

define na units
^^^^^^^^^^^^^^^

.. rackdiag::

   rackdiag {
     12U;
   
     1: Server
     2: Server
     3: Server
     4: Server
     5: N/A [8U];
   }

packetdiag
----------

.. packetdiag::

   packetdiag header {
       colwidth = 32
       node_height = 72
   
       0-15: Source Port
       16-31: Destination Port
       32-63: Sequence Number
       64-95: Acknowledgment Number
       96-99: Data Offset
       100-105: Reserved
       106: URG 
       107: ACK 
       108: PSH 
       109: RST 
       110: SYN 
       111: FIN 
       112-127: Window
       128-143: Checksum
       144-159: Urgent Pointer
       160-191: (Options and Padding)
       192-223: data [colheight = 3]
   }

blockdiag
---------

http://blockdiag.com/en/blockdiag/index.html
http://blockdiag.com/en/blockdiag/attributes/index.html

.. blockdiag::

   blockdiag {
     blockdiag -> generates -> "block-diagrams";
     blockdiag -> is -> "very easy!";

     blockdiag [color = "greenyellow"];
     "block-diagrams" [color = "pink"];
     "very easy!" [color = "orange"];
   }

node_width and node_height attribute to diagram
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      // Set node metrix
      node_width = 200;
      node_height = 100;
   
      A -> B;
   }

span_width and span_height attribute to diagram
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      // Set span metrix
      span_width = 240;
      span_height = 120;
   
      A -> B, C;
   }

default_fontsize attribute to diagram
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      // Set fontsize
      default_fontsize = 24;
   
      A -> B;
   }

default_shape attribute to diagram
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      // set default shape
      default_shape = roundedbox
   
      A -> B;
   }

orientation attribute to diagram
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      orientation = portrait
   
      A -> B -> C;
           B -> D;
   }

default_node_color, default_group_color, default_linecolor and default_textcolor attribute
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
     default_node_color = lightyellow;
     default_group_color = lightgreen;
     default_linecolor = magenta;
     default_textcolor = red;
   
     A -> B -> C;
          B -> D;
     group {
       C; D;
     }
   }

label attribute to nodes
^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::
   
   blockdiag {
      // Set labels to nodes.
      B [label = "foo"];
      C [label = "bar"];
   
      A -> B -> C;
   }

style attribute to nodes
^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      // Set boder-style to nodes.
      B [style = dotted];
      C [style = dashed];
      D [style = "3,3,3,3,15,3"];
   
      A -> B -> C -> D;
   }


color attribute to nodes
^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      // Set backgroun-color to nodes.
      B [color = none];
      C [color = pink];
      D [color = "#888888"];
   
      A -> B -> C -> D;
   }

numbered attribute to nodes
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      // Set numbered-badge to nodes.
      B [numbered = 99];
      C [numbered = A];
   
      A -> B -> C;
   }

shape attribute to nodes
^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      // standard node shapes
      box [shape = "box"];
      roundedbox [shape = "roundedbox"];
      diamond [shape = "diamond"];
      ellipse [shape = "ellipse"];
      note [shape = "note"];
   
      cloud [shape = "cloud"];
      mail [shape = "mail"];
      beginpoint [shape = "beginpoint"];
      endpoint [shape = "endpoint"];
      minidiamond [shape = "minidiamond"];
      actor [shape = "actor"];
      dots [shape = "dots"];
   
      box -> roundedbox -> diamond -> ellipse;
      cloud -> note -> mail -> actor;
      minidiamond -> beginpoint -> endpoint -> dots;
   
      // node shapes for flowcharts
      condition [shape = "flowchart.condition"];
      database [shape = "flowchart.database"];
      input [shape = "flowchart.input"];
      loopin [shape = "flowchart.loopin"];
      loopout [shape = "flowchart.loopout"];
      terminator [shape = "flowchart.terminator"];
   
      condition -> database -> terminator -> input;
      loopin -> loopout;
   }

background attribute to nodes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      // Set background image to nodes (and erase label).
      A [label = "", background = "_static/img/logo/python-logo.gif"];
   }

stacked attribute to nodes
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      // Set stacked to nodes.
      stacked [stacked];
      ellipse [shape = "ellipse", stacked];
   
      stacked -> ellipse;
   }

description attribute to nodes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      // Set numbered-badge and description to nodes.
      A [numbered = 1, label = "Input", description = "Beef, carrots, potatoes, curry powder and water"];
      B [numbered = 2, label = "Process", description = "Simmer and simmer"];
      C [numbered = 3, label = "Output", description = "yum-yum curry"];
   
      A -> B -> C;
   }

Icon attributes to nodes
^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::
    
   blockdiag {
     A -> B -> C;
   
     A [icon = "_static/img/icons/feed-icon-legacy_orange.png"];
     B [icon = "_static/img/icons/feed-icon-legacy_blue.png"];
     C [icon = "_static/img/icons/feed-icon-legacy_purple.png"];
   }


color attributes to nodes
^^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
     A -> B;
   
     A[textcolor=blue];
     B[textcolor='#FF00FF'];
   }

width and height attributes to nodes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
     A -> B;
   
     A[width=192];
     B[height=64];
   }

fontsize attributes to nodes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      A -> B;
   
      A[fontsize=20];
   }

label attribute to edges
^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      // Set labels to edges. (short text only)
      A -> B -> C [label = "foo"];
      C -> A [label = "bar"];
   }

style attribute to edges
^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      // Set style to edges.
      A -> B [style = dotted];
      B -> C [style = dashed];
      C -> D [style = none];
      D -> E [style = "3,3,3,3,15,3"];
   }

hstyle attribute to edges
^^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      // Set head shapes to edges.
      A -> B [hstyle = generalization];
      B -> C [hstyle = composition];
      C -> D [hstyle = aggregation];
   }

color attribute to edges
^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      // Set color to edges.
      A -> B [color = "#0000FF"];
      B -> C [color = "red"];
   }

dir attribute to edges
^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      // Set arrow direction to edges.
      A -> B [dir = none];
      B -> C [dir = forward];
      C -> D [dir = back];
      D -> E [dir = both];
   
      // Same meaning
      F -- G -> H <- I <-> J;
   }

folded attribute to edges
^^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      A -> B -> C -> D -> E;
   
      // fold edge at C to D (D will be layouted at top level; left side)
      C -> D [folded];
   }

text color attribute to edges
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      A -> B[label=foo, textcolor=pink];
   }

font size attribute to edges
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      A -> B [label='text', fontsize=16];
   }

thick attribute to edges
^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      A -> B -> C;
           B -> D[thick];
   }

style attributes to nodes and edges
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
      // Set boder-style, backgroun-color and text-color to nodes.
      A [style = dotted];
      B [style = dashed];
      C [color = pink, style = "3,3,3,3,15,3"]; //dashed_array format style
      D [color = "#888888", textcolor="#FFFFFF"];
   
      // Set border-style and color to edges.
      A -> B [style = dotted];
      B -> C [style = dashed];
      C -> D [color = "red", style = "3,3,3,3,15,3"]; //dashed_array format style
   
      // Set numbered-badge to nodes.
      E [numbered = 99];
   
      // Set background image to nodes (and erase label).
      F [label = "", background = "_static/img/logo/python-logo.gif"];
      G [label = "", background = "_static/img/logo/python-logo.gif"];
      H [icon = "_static/img/icons/help-browser.png"];
      I [icon = "_static/img/icons/internet-mail.png"];
   
      // Set arrow direction to edges.
      E -> F [dir = none];
      F -> G [dir = forward];
      G -> H [dir = back];
      H -> I [dir = both];
   
      // Set width and height to nodes.
      K [width = 192]; // default value is 128
      L [height = 64]; // default value is 40
   
      // Use thick line
      J -> K [thick]
      K -> L;
   }

branched edges
^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
     // branching edges to multiple children
     A -> B, C;
   
     // branching edges from multiple parents
     D, E -> F;
   }


direction of edges
^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
     A -> B <- C -- D <-> E;
   }

edge folding
^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
     A -> B -> C -> D -> E;
   
     // fold edge at C to D (D will be layouted at top level; left side)
     C -> D [folded];
   }

shape of nodes
^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
     // standard node shapes
     box [shape = box];
     square [shape = square];
     roundedbox [shape = roundedbox];
     dots [shape = dots];
   
     circle [shape = circle];
     ellipse [shape = ellipse];
     diamond [shape = diamond];
     minidiamond [shape = minidiamond];
   
     note [shape = note];
     mail [shape = mail];
     cloud [shape = cloud];
     actor [shape = actor];
   
     beginpoint [shape = beginpoint];
     endpoint [shape = endpoint];
   
     box -> square -> roundedbox -> dots;
     circle -> ellipse -> diamond -> minidiamond;
     note -> mail -> cloud -> actor;
     beginpoint -> endpoint;
   
     // node shapes for flowcharts
     condition [shape = flowchart.condition];
     database [shape = flowchart.database];
     terminator [shape = flowchart.terminator];
     input [shape = flowchart.input];
   
     loopin [shape = flowchart.loopin];
     loopout [shape = flowchart.loopout];
   
     condition -> database -> terminator -> input;
     loopin -> loopout;
   }
   
using stacked attribute
^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
     // Set stacked to nodes.
     stacked [stacked];
     diamond [shape = "diamond", stacked];
     database [shape = "flowchart.database", stacked];
   
     stacked -> diamond -> database;
   }

using dots shape
^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
     A -> B, C, D;
   
     C [shape = "dots"];
   
     // hide edge forward to dots node
     A -> C [style = "none"];
   }

grouping nodes
^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag admin {
      A -> B -> C -> D;
      A -> E;
      A -> H;
   
      // A and B belong to first group.
      group {
         A; B;
      }
   
      // E, F and G belong to second group.
      group second_group {
         // Set group-label
         label = "second group";
   
         // Set background-color to this group.
         color = "#77FF77";
   
         // Set textcolor to this group
         textcolor = "#FF0000";
   
         E -> F -> G;
   
         // H and I belong to third "nested" group.
         group {
             label = "third group";
             color = "#FF0000";
   
             // Set group shape to 'line group' (default is box)
             shape = line;
   
             // Set line style (effects to 'line group' only)
             style = dashed;
   
             H -> I;
         }
      }
   
      // J belongs to second group
      J [group = second_group];
   }

font settings
^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
     // Set fontsize
     default_fontsize = 20;  // default value is 11
   
     A -> B [label = "large"];
     B -> C [label = "small", fontsize = 11];  // change fontsize of edge-label
   
     A [fontsize = 32];  // change fontsize of node-label
   
     group {
       label = "group label";
       fontsize = 16;  // change fontsize of group-label
   
       C;
     }
   }

diagram attributes
^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
     // Set node metrix
     node_width = 200;  // default value is 128
     node_height = 100;  // default value is 40
   
     // Set span metrix
     span_width = 240;  // default value is 64
     span_height = 120;  // default value is 40
   
     // set default shape
     default_shape = roundedbox;  // default value is 'box'
   
     // set default colors
     default_node_color = lightblue;
     default_group_color = "#7777FF";
     default_linecolor = blue;
     default_textcolor = red;
   
     A -> B [label = "Use long long\nedge label"];
     A -> C;
   
     group {
       C;
     }
   }

define classes
^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
     // Define class (list of attributes)
     class emphasis [color = pink, style = dashed];
     class redline [color = red, style = dotted];
   
     A -> B -> C;
   
     // Set class to node
     A [class = "emphasis"];
   
     // Set class to edge
     A -> B [class = "redline"];
   }

portrait mode
^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
     orientation = portrait
   
     A -> B -> C;
          B -> D;
   }


portrait group
^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag {
     A -> B -> C;
   
     group {
       orientation = portrait
   
       C -> D -> E;
     }
   }

simple diagram for master data manager
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. blockdiag::

   blockdiag admin {
     index [label = "List of FOOs"];
     add [label = "Add FOO"];
     add_confirm [label = "Add FOO (confirm)"];
     edit [label = "Edit FOO"];
     edit_confirm [label = "Edit FOO (confirm)"];
     show [label = "Show FOO"];
     delete_confirm [label = "Delete FOO (confirm)"];
   
     index -> add  -> add_confirm  -> index;
     index -> edit -> edit_confirm -> index;
     index -> show -> index;
     index -> delete_confirm -> index;
   }

seqdiag
-------

simple diagram
^^^^^^^^^^^^^^

.. seqdiag::

   seqdiag {
     browser  -> webserver [label = "GET /index.html"];
     browser <-- webserver;
     browser  -> webserver [label = "POST /blog/comment"];
                 webserver  -> database [label = "INSERT comment"];
                 webserver <-- database;
     browser <-- webserver;
   }

edge types
^^^^^^^^^^

.. seqdiag::

   seqdiag {
     // normal edge and doted edge
     A -> B [label = "normal edge"];
     B --> C [label = "dotted edge"];
   
     B <-- C [label = "return dotted edge"];
     A <- B [label = "return edge"];
   
     // asynchronus edge
     A ->> B [label = "asynchronus edge"];
     B -->> C [label = "asynchronus dotted edge"];
   
     B <<-- C [label = "return asynchronus doted edge"];
     A <<- B [label = "return asynchronus edge"];
   
     // self referenced edge
     A -> A [label = "self reference edge"];
   }

attributes of edges
^^^^^^^^^^^^^^^^^^^

.. seqdiag::

   seqdiag {
     // edge label
     A -> B [label = "call"];
     A <- B [label = "return"];
   
     // diagonal edge
     A -> B [diagonal, label = "diagonal edge"];
     A <- B [diagonal, label = "return diagonal edge"];
   
     // color of edge
     A -> B [label = "colored label", color = red];
   
     // failed edge
     A -> B [label = "failed edge", failed];
   }

auto return edge and nested sequense
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. seqdiag::

   seqdiag {
     // auto return edge
     A => B [label = "call", return = "return"];
   
     // nested auto return edge
     A => B => C [label = "call", return = "return"];
   
     // nested sequence
     A => B [label = "nested call"]{
        B => C [label = "call 1"];
        B => D [label = "call 2"];
        B => E [label = "call 3"];
     }
   }

separators
^^^^^^^^^^

.. seqdiag::

   seqdiag {
     A -> B;
   
     // Separator
     === Separator line ===
   
     A -> B;
   
     // Delay separator
     ... Separator line ...
   
     A -> B;
   }

edge notes
^^^^^^^^^^

.. seqdiag::

   seqdiag {
     // Use note (put note on rightside)
     browser -> webserver [note = "request\nGET /"];
     browser <- webserver;
   
     // Use leftnote and rightnote
     browser -> webserver [leftnote = "send request"];
     browser <- webserver [rightnote = "send response"];
   }

diagram attributes
^^^^^^^^^^^^^^^^^^

.. seqdiag::

   seqdiag {
     // Set edge metrix.
     edge_length = 300;  // default value is 192
     span_height = 80;  // default value is 40
   
     // Set fontsize.
     default_fontsize = 16;  // default value is 11
   
     // Do not show activity line
     activation = none;
   
     // Numbering edges automaticaly
     autonumber = True;
   
     // Change note color
     default_note_color = lightblue;
   
     browser  -> webserver [label = "GET \n/index.html"];
     browser <-- webserver [note = "Apache works!"];
   }

TIPS: changing order of elements
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you want to changing order of elements, define elements you want to layout. seqdiag sorts elements by order they appear

.. seqdiag::

   seqdiag {
     # define order of elements
     # seqdiag sorts elements by order they appear
     browser; database; webserver;
   
     browser  -> webserver [label = "GET /index.html"];
     browser <-- webserver;
     browser  -> webserver [label = "POST /blog/comment"];
                 webserver  -> database [label = "INSERT comment"];
                 webserver <-- database;
     browser <-- webserver;
   }


