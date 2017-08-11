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
VIM
###

********
workflow
********

using relative line numbers
===========================
lines spanning from 10 to 15 lines above::
   
   :-15,-10y

for more help::
   
   :help cmdline-ranges

replacing
=========
replace tabs with spaces
------------------------
select your block with ctrl+v
now enter :retab

should look like
.. code::

 :'<,'>retab

awesome feature

formatting
==========

adding whitespace across multiple lines
---------------------------------------

ctrl+V selectblock shift+I space ESC

indenting across multiple lines
-------------------------------
ctrl+V selectblock > or < ESC

visualizing/syntax highlighting
===============================


I like using special characters to show whitespace, is more clear. Even a map to toggle is a key feature, for a quick check.
add this to ~/.vimrc

.. code::
 Plugin 'albfan/cream-invisibles'
 let g:creamInvisibleShortCut = "<F5>" "for my F4 goto next error

install plugin on vim

:PluginInstall

