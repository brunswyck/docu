###
VIM
###

********
workflow
********
keyboard shortcuts
==================
exit from insert mode to normal mode
------------------------------------

Add to your .vimrc file::

    inoremap jj <ESC>

file exploring
==============

`NERDTree file explorer <https://github.com/scrooloose/nerdtree>`_
Plugin 'scrooloose/nerdtree'

`NERDTree git plugin <https://github.com/Xuyuanp/nerdtree-git-plugin>`_
Plugin 'Xuyuanp/nerdtree-git-plugin'

`NERD Commenter <https://github.com/scrooloose/nerdcommenter>`_
for more info type :help nerdcommenter
Plugin 'scrooloose/nerdcommenter'



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

search replace
--------------

.. code::

 :s/foo/bar/g    Change each 'foo' to 'bar' in the current line.
 :%s/foo/bar/g   Change each 'foo' to 'bar' in all the lines.
 :5,12s/foo/bar/g    Change each 'foo' to 'bar' for all lines from line 5 to line 12 (inclusive).
 :'a,'bs/foo/bar/g   Change each 'foo' to 'bar' for all lines from mark a to mark b inclusive (see Note below).
 :'<,'>s/foo/bar/g   When compiled with +visual, change each 'foo' to 'bar' for all lines within a visual selection. 
 :.,$s/foo/bar/g     Change each 'foo' to 'bar' for all lines from the current line (.) to the last line ($) inclusive.
 :.,+2s/foo/bar/g    Change each 'foo' to 'bar' for the current line (.) and the two next lines (+2).
 :g/^baz/s/foo/bar/g     Change each 'foo' to 'bar' in each line starting with 'baz'. 

 |vim_searchnreplace|



formatting
==========

adding whitespace across multiple lines
---------------------------------------

ctrl+V selectblock shift+I space ESC

indenting across multiple lines
-------------------------------
ctrl+V selectblock > or < ESC

syntax highlighting & checking
==============================


Asynchronous Lint Engine
------------------------
ALE (Asynchronous Lint Engine) is a plugin for providing linting in NeoVim and Vim 8 while you edit your text files.

Plugin 'w0rp/ale'

|vim_syntax_ale|

show special characters in vim
------------------------------
:set list
:set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<,space:␣

for help
:help listchars
turn off
:set nolist

just show tabs n whitespace
^^^^^^^^^^^^^^^^^^^^^^^^^^^
:syntax on
:set syntax=whitespace

install plugin on vim
---------------------
:PluginInstall


.. |vim_searchnreplace| raw:: html

   <a href="http://vim.wikia.com/wiki/Search_and_replace" target="_blank">more examples here</a>

.. |vim_syntax_ale| raw:: html

   <a href="https://github.com/w0rp/ale" target="_blank">click here for mor info</a>
