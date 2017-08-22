
VIM
###

********
workflow
********
Escape or not?
==============
.. raw:: html

 <h2><a name="unescapedspecialcharacters">Regular Expression Special Characters Not Requiring Escaping</a></h2>
 <p>The following special characters are interpreted as regular expression operators <u><strong><em>without</em></strong></u> escaping (escaping will result in them being intepreted as literals):</p>
 <table>
 <tbody>
 <tr>
 <td><code>\</code></td>
 <td>Escape next character (use “<code>\\</code>” for literal backslash).</td>
 </tr>
 <tr>
 <td><code>^</code></td>
 <td>Start-of-line (at start of pattern).</td>
 </tr>
 <tr>
 <td><code>$</code></td>
 <td>End-of-line.</td>
 </tr>
 <tr>
 <td><code>.</code></td>
 <td>Matches any character.</td>
 </tr>
 <tr>
 <td><code>*</code></td>
 <td>Matches 0 or more occurrences of the previous atom.</td>
 </tr>
 <tr>
 <td><code>~</code></td>
 <td>Matches last given substitute string.</td>
 </tr>
 <tr>
 <td><code>[</code>…<code>]</code></td>
 <td>Matches any of the characters given within the brackets.</td>
 </tr>
 <tr>
 <td><code>[^</code>…<code>]</code></td>
 <td>Matches any character <em>not</em> given within the brackets.</td>
 </tr>
 <tr>
 <td><code>&amp;</code></td>
 <td>In replacement pattern: insert the whole matched search pattern.</td>
 </tr>
 </tbody>
 </table>
 <h2><a name="escapedspecialcharacters">Regular Expression Special Characters Requiring Escaping</a></h2>
 <p>The following special characters are interpreted as regular expression operators <u><strong><em>only when escaped</em></strong></u> (otherwise they will be interpreted as literals):</p>
 <table>
 <tbody>
 <tr>
 <td><code>\&lt;</code></td>
 <td>Matches beginning of a word (left word break/boundary).</td>
 </tr>
 <tr>
 <td><code>\&gt;</code></td>
 <td>Matches end of a word (right word break/boundary).</td>
 </tr>
 <tr>
 <td><code>\(</code>...<code>\)</code></td>
 <td>Grouping into an atom.</td>
 </tr>
 <tr>
 <td><code>\|</code></td>
 <td>Separating alternatives.</td>
 </tr>
 <tr>
 <td><code>\_.</code></td>
 <td>Matches any single character or end-of-line.</td>
 </tr>
 <tr>
 <td><code>\+</code></td>
 <td>1 or more of the previous atom (greedy).</td>
 </tr>
 <tr>
 <td><code>\=</code></td>
 <td>0 or one of the previous atom (greedy).</td>
 </tr>
 <tr>
 <td><code>\?</code></td>
 <td>0 or one of the previous atom (greedy).</td>
 </tr>
 <tr>
 <td><code>\{</code></td>
 <td>
             Multi-item count match specification (greedy).<p></p>
 </td>
 </tr>
 </tbody>
 </table>
 <table>
 <tbody>
 <tr>
 <td><code>\{</code>n<code>,</code>m<code>}</code></td>
 <td>n to m occurrences of the preceding atom (as many as possible).</td>
 </tr>
 <tr>
 <td><code>\{</code>n<code>}</code></td>
 <td>Exactly n occurrences of the preceding atom.</td>
 </tr>
 <tr>
 <td><code>\{</code>n<code>,}</code></td>
 <td>At least n occurrences of the preceding atom (as many as possible).</td>
 </tr>
 <tr>
 <td><code>\{,</code>m<code>}</code></td>
 <td>0 to n occurrences of the preceding atom (as many as possible).</td>
 </tr>
 <tr>
 <td><code>\{}</code></td>
 <td>0 or more occurrences of the preceding atom (as many as possible).</td>
 </tr>
 </tbody>
 </table>
 <table>
 <tbody>
 <tr>
 <td><code>\{-</code></td>
 <td>
             Multi-item count match specification (non-greedy).<p></p>
 </tr>
 <tr>
 <td><code>\{-</code>n<code>,</code>m<code>}</code></td>
 <td>n to m occurrences of the preceding atom (as few as possible).</td>
 </tr>
 <tr>
 <td><code>\{-</code>n<code>}</code></td>
 <td>Exactly n occurrences of the preceding atom.</td>
 </tr>
 <tr>
 <td><code>\{-</code>n<code>,}</code></td>
 <td>At least n occurrences of the preceding atom (as few as possible).</td>
 </tr>
 <tr>
 <td><code>\{-,</code>m<code>}</code></td>
 <td>0 to n occurrences of the preceding atom (as few as possible).</td>
 </tr>
 <tr>
 <td><code>\{-}</code></td>
 <td>0 or more occurrences of the preceding atom (as few as possible).</td>
 </tr>
 </tbody></table>
 </td>
 </tr>
 </tbody></table>


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

to install all of them

:BundleInstall

.. Place Source links below 

.. |vim_searchnreplace| raw:: html

   <a href="http://vim.wikia.com/wiki/Search_and_replace" target="_blank">more examples here</a>

.. |vim_syntax_ale| raw:: html

   <a href="https://github.com/w0rp/ale" target="_blank">click here for more info</a>
