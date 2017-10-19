
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

mnemonics
---------

* a: append or around
* b: before
* c: change
* d: delete
* e: edit
* f: find
* g: go
* h: left
* i: insert or in
* j: down
* k: up
* l: right
* m: mark
* n: next
* o: open a new line
* p: put or paste
* q: (quote/record keystrokes to the register indicated by the next character)
* r: replace
* s: substitute
* t: toward
* u: undo
* v: enter visual mode
* w: word (move right one word at a time)
* x: (delete (or x-out) a single character)
* y: yank
* z: fold, it's visual, it looks like a folded sheet of paper

Movements
=========
jump to previous cursor locations
---------------------------------

* ``''`` go to previous cursor position
* ``g; and g,`` to move back- and forward in the list of your previous edit location

jump-list
---------
lets you navigate back and forth among a number of motions.  see ``:help jump-motions`` for more information.

* ``Ctrl+I`` or ``Ctrl+O``

DRY
===

repeat last command
-------------------
press `.` to repeat last change made in normal mode
eg `dw` to delete a word and `.` to delete some more words$

macro's
-------

start a macro with ``qa`` a is your first macro b your second
do your motions and inserts like ``$a|,``
now execute the macro with ``@a``
now repeat this with ``@@`` or with count ``10@@``

to view your macro's type ``:reg``
or view macros a b c ``:reg abc``

exit from insert mode to normal mode
------------------------------------

Add to your .vimrc file::

    inoremap jj <ESC>

up until next char/word
-----------------------
+ f: moves forward to char
+ F: moves backward to char
+ T: moves backward just right of char
+ t: moves forward just left of char

.. code::

   dt[char] # delete until you encounter next space
   t[char] # jump to just before char
   df[char] # deletes upto and including char
   dfT[char] # deletes back to previous space
   d2t[char] # will delete upto 2 spaces
   
   dW # delete all nonblank chars until and incl space
   dE # same but not the space
   daW # delete from inside a word incl whitespace after word
   diw # deletes word irrespective pos. cursor & go into insert mode

replace all chars up to some character
--------------------------------------

Visual mode is probably the shortest way here:

.. code::

   vt:r 

+ v enter visual mode
+ t: select till :
+ r (note space after r) replace selected region with spaces.

change till some char
---------------------
``cf_`` or ``ct_``

file exploring
==============

`NERDTree file explorer <https://github.com/scrooloose/nerdtree>`_
  Plugin 'scrooloose/nerdtree'

`NERDTree git plugin <https://github.com/Xuyuanp/nerdtree-git-plugin>`_
  Plugin 'Xuyuanp/nerdtree-git-plugin'

`NERD Commenter <https://github.com/scrooloose/nerdcommenter>`_
  for more info type :help nerdcommenter
  Plugin 'scrooloose/nerdcommenter'

open new file from within vim
-----------------------------

.. code::

    :e newfile.rst
    or browse for it
    :Explore <directory> 


There are several window commands that allow you to do this:

  * Ctrl+W +/-: increase/decrease height (ex. 20<C-w>+)
  * Ctrl+W >/<: increase/decrease width (ex. 30<C-w><)
  * Ctrl+W _: set height (ex. 50<C-w>_)
  * Ctrl+W | : set width (ex. 50<C-w>|)
  * Ctrl+W =: equalize width and height of all windows

See also: :help CTRL-W

working with tabs
-----------------
`vim_tabs <http://vim.wikia.com/wiki/Using_tab_pages>`_

Set tab label to show tab number, filename, if modified ('+' is shown if the current window in the tab has been modified):

.. code::

    :set guitablabel=%N/\ %t\ %M

The -p option opens each file in a seperate tab

.. code::

    vim -p file1.rst file2.rst


Once Vim has been launched, there are many commands that directly create or close tabs:
   
.. code::

    :tabedit {file}   edit specified file (or new one) in a new tab
    :tabfind {file}   open a new tab with filename given, searching the 'path' to find it
    :tabclose         close current tab
    :tabclose {i}     close i-th tab
    :tabonly          close all other tabs (show only the current tab)
    :tab sp           split the current window, but open the split in a new tab
    :sp file.txt      creates a new window in the current tab
    :ctrl-W T         move the window to a new tab
    :ctrl-W c         close the current window

navigation

.. code::

    :tabs         list all tabs including their displayed windows
    :tabm 0       move current tab to first
    :tabm         move current tab to last
    :tabm {i}     move current tab to position i+1
    
    :tabn         go to next tab
    :tabp         go to previous tab
    :tabfirst     go to first tab
    :tablast      go to last tab

In normal mode, you can type:

.. code::

    gt            go to next tab
    gT            go to previous tab
    {i}gt         go to tab in position i

Note that the gt command counts from one. That means 3gt will jump to the third tab. Also note is 0gt and 1gt mean the same thing: jumping to the first tab.

Using recent vim versions, in normal mode and in insert mode, you can type:

.. code::

    Ctrl-PgDn     go to next tab
    Ctrl-PgUp     go to previous tab

Jumping to a specific tab with {i}gt is easier if you set up your tabline to show the tab number. 
    
copy paste
==========
yank line on line x
-------------------
From `:help :yank:`

`:[range]y[ank] [x]`    Yank [range] lines [into register x].

So, to yank line 4, one would type:
.. code::

   :4yank

.. note:: you can easily do this from insert mode with CTRL+o This allows you to execute one command, after which you're returned to insert mode

.. code::

   <C-o>:4yank

You can, of course, also use other ranges:

 * Lines 1 to 3: :1,3yank
 * The entire buffer: :%yank
 * From the current line to the end of the buffer: :.,$:yank
 * The current line and the next 3: :.,+3yank
 * The current line and the previous 3: :-3,.yank
 * The line 3 lines above the current line: :-3yank

If you want to copy line 4 to right below the current line you can do this:

.. code::

   :4t.

or that, if you want to copy that line right above the current line:

.. code::

   :4t-

yank lines relative numbers
---------------------------
lines spanning from 10 to 15 lines above::
   
   :-15,-10y

for more help::
   
   :help cmdline-ranges

yank lines upwards
------------------


You can use the :yank command with a range to accomplish this effect.

:.-6,.yank

The range explanation
 + . or the dot means current line
 + .-6 means current line minus 6
 + .-6,. is current line minus 6 to the current line
 + This can be abbreviated .-6 to just -6 giving us -6,.yank
 + the current line is also assumed in the end of the range so -6,yank
 + the yank command can be shortened to just :y giving us -6,y

Final command:

:-6,y

For more help:

:h :yank
:h [range]

copy/append files to another file
---------------------------------

+ visually select the lines
+ type ``:!> filename.txt``


replacing
=========

replace tabs with spaces
------------------------
select your block with ctrl+v
now enter :retab

should look like
.. code::

 :'<,'>retab
 
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

deleting
========
Delete `{motion}` text [into register x] and start insert

`["x]c{motion}`

.. code::

   :help c
   
use ``d0`` instead of ``d^`` to delete to the real beginning of the line
``d-HOME`` works too


formatting
==========

changing case
-------------

 ~
    Toggle case of the character under the cursor, or all visually-selected characters. 

3~
    Toggle case of the next three characters. 

g~3w
    Toggle case of the next three words. 

g~iw
    Toggle case of the current word (inner word – cursor anywhere in word). 

g~$
    Toggle case of all characters to end of line. 

g~~
    Toggle case of the current line (same as V~). 

The above uses ~ to toggle case. In each example, you can replace ~ with u to convert to lowercase, or with U to convert to uppercase. For example:

U
    Uppercase the visually-selected text. 
    First press v or V then move to select text. 
    If you don't select text, pressing U will undo all changes to the current line. 

gUU
    Change the current line to uppercase (same as VU). 

gUiw
    Change current word to uppercase. 

u
    Lowercase the visually-selected text. 
    If you don't select text, pressing u will undo the last change. 

guu
    Change the current line to lowercase (same as Vu). 

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

install vundle plugin on vim
----------------------------
:PluginInstall

to install all of them

:BundleInstall
