######
python
######

************
fundamentals
************

modularity
==========

main function & cli arguments
-----------------------------

.. code-block:: python

   import sys

   def main(url):
       print(url)

   if __name__ == '__main__': # the module is being executed directly not imported
       main(sys.argv[1]) # the 0th arg is the module/script filename 
   

more on command-line parsing module: https://docs.python.org/3/howto/argparse.html
an alternative is docopt: https://github.com/docopt/docopt

docstrings
----------

.. code-block:: python

   def some_funtion(items):
       """Print items one per line

       Args:
           An iterable series of printable items
       """
       for item in items:
           print(items)

module docstrings
^^^^^^^^^^^^^^^^^

.. code-block:: python

   """ retrieve and print items from a list

   Usage:

       python3 list.py <list>
   """

   import sys

.. note:: when you now call help on the module you'll get a lot of information


objects
-------

.. code-block:: python

   # id() returns a unique identifier for an object
   a = 300
   id(a)
   4298473345
   b = 1500
   id(b)
   4298222345
   b = a
   id(b)
   4298473345 # same as a
   id(a) == id(b)
   True
   a is b
   True

function default values for arguments
-------------------------------------

.. code:: python

   def banner(message, border='-'): # place after args without defaults
    line = border * len(message)
    print(line)
    print(message)
    print(line)

   banner("Norwegian Blue")
   banner("Sun, Moon and Stars", "*")
   banner("Sun, Moon and Stars", border="*")
   banner(border=".", message="Hello from Earth")

.. warning:: always use immutable objects like ints and strings as default values eg you dont want a function time to always show the time of first function call

collections
===========

tuple
-----

.. code-block:: python

   k = (391,) # use the trailing comma, otherwise it will be an int 
   
   def minmax(items):
       return min(items), max(items) # tuples are useful for multiple return values

   minmax([83, 33, 82, 39, 88, 31, 86])

   # tuple unpacking allows us to destructure into named references
   lower, upper = minmax([83, 33, 82, 39, 88, 31, 86])
   lower
   31
   upper
   86
   # idiomatic python swap
   a = 'jelly'
   b = 'bean'
   a, b = b, a
   a
   'bean'
   # use the tuple() constructor to create tuples from other iterable objects
   tuple([561, 1105, 1219, 2466])
   (561, 1105, 1219, 2466)
   tuple("Patrick")
   ('P', 'a', 't', 'r', 'i', 'c', 'k')
   5 in (2, 3, 5, 18, 22, 55)
   True
   4 not in (2, 3, 5, 18, 22, 55)
   True


string
------

.. code-block:: python
   
   "New" + "found" + "land"
   'Newfoundland'
   # use join
   colors = ';'.join(['#45ff12', '#2323fa', '#1234a2', '#4313ff'])
   '#45ff12;#2323fa;#1234a2;#4313ff'
   # split them up again
   colors.split(';')
   ['#45ff12', '#2323fa', '#1234a2', '#4313ff']
   # using the empty string as a seperator to join
   ''.join(['high', 'way', 'man'])
   'highwayman'
   # partion() divides a string -> prefix,seperator,suffix
   "unforgetable".partition("forget")
   ('un', 'forget', 'able')
   # usage with tuples
   departure, seperator, arrival = "London:Edinburgh".partition(':')
   arrival
   Edinburgh
   # underscore dummy value
   origin, _, destination = "Seattle-Boston".partition('-')
   # use format() to insert values into strings
   "The age of {0} is {1}".format('patrick', 35)
   "The age of {0} is {1}. {0}'s birthday is on {2}".format('Patrick', 35, 'June 1')
   # they can be ommitted when in the exact order and used only once
   "The age of {} is {}".format('patrick', 35)
   # use named fields
   "Current position {latitude} {longitude}".format(latitude="60N",
                                                    longitude="5E")
   'Current position 60N 5E'
   # access values through keys or indexes with []
   pos = (65.2, 23.1, 82.2)
   "Galactic position x={pos[0]} y={pos[1] z={pos[2]}".format(pos=pos)
   'Galactic position x=65.2 y=23.1 z=82.2'
   # replacement field mini-language provides many value n alignment formatting options
   import math
   "Math constants: pi={m.pi:.3f}, e={m.e:.3f}".format(m=math)
   'Math constants: pi=3.142, e=2.718'
   help(str)




range
-----

.. code-block:: python
   
   list(range(5, 10)) # stop is not included
   [5, 6, 7, 8, 9]
   # with step argument
   list(range(0, 10, 2))
   [0, 2, 4, 6, 8]
   # avoid range for iterating over lists
   for item in list:
       print(item)
   # not
   for item in range(len(list)):
       print(item)
   
   # prefer enumerate() for counters
   # enumerate() yields (index, value) tuples
   t = [5, 333, 8888, 144444, 2012011]
   for p in enumerate(t):
       print(p)

   (0, 6)
   (1, 333)
   (2, 8888)
   (3, 144444)
   (4, 2012011)
   # improvement with tuple unpacking
   for i, v in enumerate(t):
       print("i = {}, v = {}".format(i, v))
   
::

   i = 0, v = 6 
   i = 1, v = 333
   i = 2, v = 8888
   i = 3, v = 144444
   i = 4, v = 2012011




list
----

.. code-block:: python
   
   # SHALLOW copying a list (contain same object references as the source list!!)
   copy_list = sequence[:] # full slice
   copy_list = other_list.copy() # use copy method
   copy_list = list(some_other_list) # use the list constructor


shallow copies
--------------

.. code-block:: python
   
   a = [ [1, 2], [3, 4] ]
   b = a[:] # create a shallow copy
   a[0] = [8, 9] # create new list in a at 0
   a[0]
   [8, 9]
   b[0] # b still references to the old list object b4 a created a new one
   [1, 2]
   a[1].append(5) # just appending to the list in a also affects the list for b 
   b
   [[1, 2], [3, 4, 5]] # they both still refer to the same object

list repetition
---------------

.. code-block:: python

   # repeat lists using the * operator
   c = [21, 37]
   d = c * 4
   d
   [21, 37, 21, 37, 21, 37, 21, 37] # this method is often used to zero a list of fixed length
   s = [constant] * size
   [0] * 9 # same principle as with list copying so beware, repetition = shallow
   # repetition repeats the reference without copying the value
   [0, 0, 0, 0, 0, 0, 0, 0, 0]

   s = [ [-1, +1] ] * 5
   [[-1, +1], [-1, +1], [-1, +1], [-1, +1], [-1, +1]]
   s[3].append(7) # because all innerlists refer to same object they are all modified
   s
   [[-1, 1, 7], [-1, 1, 7], [-1, 1, 7], [-1, 1, 7], [-1, 1, 7]]




more on list
------------

.. code::

   w = "the quick brown fox jumps over the lazy dog".split()
   ['the', 'quick', 'brown', 'fox', 'jumps', 'over', 'the', 'lazy', 'dog']
   i = w.index('fox')
   i
   3
   w[i]
   'fox'
   w.index('unicorn')
   Traceback (most recent call last):
     File "<stdin>", line 1, in <module>
   ValueError: 'unicorn' is not in list
   w.count('the')
   2
   # just test membership
   37 in [1, 78, 9, 37, 34, 53]
   True
   78 not in [1, 78, 9, 37, 34, 53]
   True
   u = "jackdaws love my big sphinx of quartz".split()
   u
   ['jackdaws', 'love', 'my', 'big', 'sphinx', 'of', 'quartz']
   del u[3]
   ['jackdaws', 'love', 'my', 'sphinx', 'of', 'quartz']    
   # remove elements by value rather than position
   u.remove('jackdaws')
   u
   ['love', 'my', 'sphinx', 'of', 'quartz']
   # the equivalent to remove using the index:
   del u[u.index('quartz')]
   u
   ['love', 'my', 'sphinx', 'of']
   u.remove('pyramid')
   Traceback (most recent call last):
     File "<stdin>", line 1, in <module>
   ValueError: list.remove(x): x not in list

   # insertion seq.insert(index, item)
   a = "I accidentally the whole universe".split()
   a.insert(2, "destroyed")
   a
   ['I', 'accidentally', 'destroyed', 'the', 'whole', 'universe']
   # use join method on a space seperator
   ' '.join(a)
   'I accidentally destroyed the whole universe'


growing lists
-------------

.. code-block:: python

   # concatenate lists
   m = [2, 1, 3]
   n = [4, 7, 11]
   k = m + n
   k
   [2, 1, 3, 4, 7, 11]
   # using assignment operator
   k += [18, 29, 47]
   [2, 1, 3, 4, 7, 11, 18, 29, 47]
   # or use the extend method
   k.extend([76, 129, 199])
   k
   [2, 1, 3, 4, 7, 11, 18, 29, 47, 76, 129, 199]
   # these techniques work with any iterable series on the righthand side



reversing and sorting lists
---------------------------

.. code-block:: python

   >>> g = [1, 11, 21, 1211, 112111]
   >>> g.reverse()
   >>> g
   [112111, 1211, 21, 11, 1]
   >>> d = [5, 17, 41, 29, 71, 149, 3299, 7, 13, 67]
   >>> d.sort()
   >>> d
   [5, 7, 13, 17, 29, 41, 67, 71, 149, 3299]
   >>> d.sort(reverse=True)
   >>> d
   [3299, 149, 71, 67, 41, 29, 17, 13, 7, 5]
   # key argument to sort() method accepts a function for producing a sort key from an item
   # e.g. sort words in order of length
   >>> h = 'not perplexing do handwriting family where I illegibly know doctors'.split()
   >>> h
   ['not', 'perplexing', 'do', 'handwriting', 'family', 'where', 'I', 'illegibly', 'know', 'doctors']
   >>> h.sort(key=len)
   >>> h
   ['I', 'do', 'not', 'know', 'where', 'family', 'doctors', 'illegibly', 'perplexing', 'handwriting']
   >>> ' '.join(h)
   'I do not know where family doctors illegibly perplexing handwriting'
   # sorted() built-in function sorts any iterable series and returns a list
   >>> x = [4, 9, 2, 1]
   >>> y = sorted(x)
   >>> y
   [1, 2, 4, 9]
   >>> x
   [4, 9, 2, 1]
   # reversed() built-in function reverses any iterable series
   >>> p = [9, 3, 1, 0]
   >>> q = reversed(p)
   >>> q
   <list_reverseiterator object at 0x7ffa18086e48>
   >>> list(q)
   [0, 1, 3, 9]
   # reversed returns an iterator so you need to convert it to a list (explained later)
   # these two sort methods will work on any finite iterable source object


dictionary
----------

.. code::

   # key objects must be immutable! e.g. Str, numbers and tuples NOT lists!
   # value objects can be mutable
   # the order in dictionaries are random, don't rely on it
   # dict() constructor accepts:
   # iterable series of key-vlaue 2-tuples
   # keyword arguments - requires keys are valid Python identifiers
   # a mapping such as another dict
   names_and_ages=[('Alice', 32), ('Bob', 48), ('Charlie', 28), ('Daniel', 33)]
   >>> d = dict(names_and_ages)
   >>> d
   {'Charlie': 28, 'Daniel': 33, 'Alice': 32, 'Bob': 48}
   >>> phonetic = dict(a='alfa', b='bravo', c='charlie', d='delta', e='echo', f='foxtrot')
   >>> phonetic
   {'b': 'bravo', 'a': 'alfa', 'c': 'charlie', 'f': 'foxtrot', 'd': 'delta', 'e': 'echo'}
   # copying dictionaries is also shallow
   e = d.copy()
   e = dict(d) 
   # Extend a dictionary with update()
   f.update(g)
   for key in colors:
       print("{key} = > {value}".format(key=key, value=colors[key]))
   # if you want to iterate only over the values use values()
   for value in colors.values():
       print(value)
   # there is no efficient way to get the key corresponding to a value!!
   for key in colors.keys(): # iterable view onto keys - not often needed
       print(key)
   # adding to a dictionary and using prettyprint
   >>> m = {'H': [1, 2, 3],
   ...      'He': [3, 5],
   ...      'Li': [6, 7],
   ...      'Be': [7, 9, 10],
   ...      'B': [10, 11],
   ...      'C': [11, 12, 13, 14]}
   >>> m['H'] += [4, 5, 6, 7]
   >>> m
   {'B': [10, 11], 'C': [11, 12, 13, 14], 'Be': [7, 9, 10], 'He': [3, 5], 'Li': [6, 7], 'H': [1, 2, 3, 4, 5, 6, 7]}
   >>> m['H'] = [13, 14, 15]
   >>> m['N'] = [13, 14, 15]
   >>> m
   {'B': [10, 11], 'C': [11, 12, 13, 14], 'N': [13, 14, 15], 'Be': [7, 9, 10], 'He': [3, 5], 'Li': [6, 7], 'H': [13, 14, 15]}
   >>> from pprint import pprint as pp
   >>> pp(m)
   {'B': [10, 11],
    'Be': [7, 9, 10],
    'C': [11, 12, 13, 14],
    'H': [13, 14, 15],
    'He': [3, 5],
    'Li': [6, 7],
    'N': [13, 14, 15]}
   
   

set
---

set is an unordered collection of unique, immutable objects
looks like a dict but each item is a single object

.. note:: empty {} create a dict so for empty set use the set() constructor

.. code::
   
   e = set()
   e
   set()
   >>> s = set([2, 4, 16, 64, 4096, 65536, 262144])
   >>> s
   {4096, 64, 2, 65536, 4, 262144, 16}
   >>> for x in s: # order is arbitrary
   ...     print(x)
   ... 
   4096
   64
   2
   65536
   4
   262144
   16
   >>> 
   # duplicates are discarded!
   # so often used to remove duplicates - not order preserving
   >>> t = [1, 4, 2, 1, 7, 9, 9]
   >>> set(t)
   {1, 2, 4, 9, 7}
   >>> for x in s:
   ...     print(x)
   ... 
   4096
   64
   2
   65536
   4
   262144
   16
   >>> 3 in s
   False
   >>> 3 not in s
   True
   >>> s.add(3)
   >>> s
   {4096, 64, 2, 65536, 4, 262144, 3, 16}
   >>> s.add(4)
   >>> s
   {4096, 64, 2, 65536, 4, 262144, 3, 16}
   >>> s.update([5, 55, 555])
   >>> s
   {4096, 64, 2, 65536, 4, 262144, 3, 5, 555, 16, 55}
   >>> s.remove(2)
   >>> s
   {4096, 64, 65536, 4, 262144, 3, 5, 555, 16, 55}
   >>> s.remove(2)
   Traceback (most recent call last):
     File "<stdin>", line 1, in <module>
   KeyError: 2
   # discard doesn't throw an error if item not present and so always succeeds
   >>> k.discard(2)
   # shallow copies	   
   .copy()
   >>> n
   {4096, 64, 65536, 262144, 4, 3, 5, 555, 16, 55}
   >>> m = set(n)
   >>> m
   {4096, 64, 65536, 262144, 4, 3, 5, 555, 16, 55}

   # set algebra showcase
   >>> blue_eyes = {'Olivia', 'Harry', 'Lily', 'Jack', 'Amelia'}
   >>> blond_hair = {'Harry', 'Jack', 'Amelia', 'Mia', 'Joshua'}
   >>> can_smell_hidrogencyanide = {'Harry', 'Amelia'}
   >>> taste_ptc = {'Harry' , 'Lily', 'Amelia', 'Lola'}
   >>> o_blood = {'Mia', 'Josjua', 'Lily', 'Olivia'}
   >>> b_blood = {'Amelia', 'Jack'}
   >>> a_blood = {'Harry'}
   >>> ab_blood = {'Joshua', 'Lola'}
   # find people with blond hair, blue eyes or both -> use union method
   # is commutative
   >>> blue_eyes.union(blond_hair)
   {'Amelia', 'Mia', 'Harry', 'Olivia', 'Joshua', 'Jack', 'Lily'}
   >>> blue_eyes.union(blond_hair) == blond_hair.union(blue_eyes)
   True
   # find people with blond hair AND blue eyes -> use intersection method
   >>> blue_eyes.intersection(blond_hair)
   {'Harry', 'Jack', 'Amelia'}
   >>> blue_eyes.intersection(blond_hair) == blond_hair.intersection(blue_eyes)
   True
   # find people with blond hair who don't have blue eyes -> use difference method
   # non-commutative because people who have blue eyes but not blond hair is not the same
   >>> blond_hair.difference(blue_eyes)
   {'Joshua', 'Mia'}
   >>> blond_hair.difference(blue_eyes) == blue_eyes.difference(blond_hair)
   False
   # exclusively blond hair OR blue_eyes but not both -> symmetric_difference() method
   # commutative
   >>> blond_hair.symmetric_difference(blue_eyes)
   {'Mia', 'Olivia', 'Joshua', 'Lily'}
   >>> blond_hair.symmetric_difference(blue_eyes) == blue_eyes.symmetric_difference(blond_hair)
   True
   # 3 predicates to tell us about the relationship between sets
   # check is one set is a subset of a set -> issubset() method
   >>> can_smell_hidrogencyanide.issubset(blond_hair)
   True
   # test if people who can taste ptc can also taste hydrogencyanide -> use issuperset() method
   >>> taste_ptc.issuperset(can_smell_hidrogencyanide)
   True
   # test that sets have no members in common -> isdisjoint() method
   >>> a_blood.isdisjoint(o_blood)
   True
   

collection protocols
--------------------

+------------------+-------------------------------------------+
| Protocol         | Implementing Collections                  |
+==================+===========================================+
| Container        | str, list, range, tuple, set, bytes, dict |
+------------------+-------------------------------------------+
| Sized            | str, list, range, tuple, set, bytes, dict |
+------------------+-------------------------------------------+
| Iterable         | str, list, range, tuple, set, bytes, dict |
+------------------+-------------------------------------------+
| Sequence         | str, list, range, tuple, set, bytes       |
+------------------+-------------------------------------------+
| Mutable Sequence | list                                      |
+------------------+-------------------------------------------+
| Mutable Set      | set                                       |
+------------------+-------------------------------------------+
| Mutable Mapping  | dict                                      |
+------------------+-------------------------------------------+

Protocols
 • To implement a protocol, objects must support certain operations.
 • Most collections implement container , sized and iterable.
 • All except dict are sequences.

Container Protocol
 • Membership testing using in and not in

Sized Protocol
 • Determine number of elements with len(s)

Iterable Protocol
 • Can produce and iterator with iter(s)

   .. code-block:: python
     
      for item in iterable:
          do_something(item)

Sequence Protocol

 • Retrieve elements by index
   `item = seq[index]`

 • Find items by value
   `index = seq.index(item)`
 
 • Count items
   `num = seq.count(item)`

 • Produce a reversed sequence
   `r = reversed(seq)`

* Collections Summary
  - Tuples are immutable sequence types
  - Literal syntax: optional parentheses around a comma separated list
  - Single element tuples must use trailing comma
* Tuple unpacking - return values and idiomatic swap
  - Strings are immutable sequence types of Unicode codepoints
  - String concatenation is most efficiently performed with join() on an empty separator
  - The partition() method is a useful and elegant string parsing tool.
  - The format() method provides a powerful way of replacing placeholders with values.
* Ranges represent integer sequences with regular intervals
  - Ranges are arithmetic progressions
  - The enumerate() function is often a superior alternative to range()
* Lists are heterogeneous mutable sequence types
  - Negative indexes work backwards from the end.
  - Slicing allows us to copy all or part of a list.
  - The full slice is a common idiom for copying lists, although the copy() method and list() constructor are less obscure.
  - List (and other collection) copies are shallow.
  - List repetition is shallow.
* Dictionaries map immutable keys to mutable values
  - Iteration and membership testing is done with respect to the keys.
  - Order is arbitrary
  - The keys(), values() and items() methods provide views onto different aspects of a dictionary, allowing convenient iteration.
* Sets store an unordered collection of unique elements
  - Sets support powerful and expressive set algebra operations and predicates.
* Protocols such as iterable, sequence and container characterise the collections.

handling exceptions
===================

**Raise** an exception to interrupt program flow
**Handle** an exception to resume control
**Unhandled exceptions** will terminate the program
**exception objects** contain information about the exceptional event

exception and control flow
--------------------------

.. code-block:: python
 
   '''A module for demonstrating exceptions.'''
   
   def convert(s):
       '''Convert to an integer.'''
       x = int(s) # int contstructor will raise an exception upon entering a string
       return x
   # type of exception object
   # ValueError: invalid literal for int() with base 10: 'somestring'


handling raised exceptions
--------------------------

.. code-block:: python

   def convert(s):
       '''Convert a string to an integer.'''
       try: # try block contains code that can raise an exception
           x = int(s) # print("Conversion succeeded! x = ", x) #  the print won't execute when the exception is raised
       except ValueError: # except block performs error handling in the event an exception is raised
           # print("conversion failed!")
           x = -1
       return x

Trying to convert a list with numbers will raise another exception
`convert([4, 5, 6])`
TypeError: int() argument must be a string, a bytes-like object or a number, not 'list'

.. note:: the except statement excepts a tuple of exception types


.. code-block:: python

   def convert(s):
       '''Convert a string to an integer.'''
       x = -1
       try:
           x = int(s)
           print("Conversion succeeded! x =", x)
       except (ValueError, TypeError):
           print("Conversion failed!")
       return x


programmer errors
-----------------

IndentationError, SyntaxError and NameError are programmer errors and should be corrected during development

you can use pass when you have an empty except block

.. code-block:: python

   def convert(s):
       '''Convert a string to an integer.'''
       x = -1
       try:
           x = int(s)
       except (ValueError, TypeError):
           pass
       return x

when you want to interrogate the exception object for more detail use as

.. code-block:: python

   import sys
   
   def convert(s):
       '''Convert a string to an integer.'''
       try:
           return int(s)
       except (ValueError, TypeError) as e:
           print("Conversion error: {}".format(str(e)), file=sys.stderr)
           return -1


re-raising exceptions
---------------------

.. code-block:: python

   from math import log
   import sys
   
   
   def convert(s):
       '''Convert a string to an integer.'''
       try:
           return int(s)
       except (ValueError, TypeError) as e:
           print("Conversion error: {}".format(str(e)), file=sys.stderr)
           raise # instead of returning an unpythonic error code emit the error msg and reraise the exception object
   
   
   def string_log(s):
       v = convert(s)
       return log(v)

exceptions as APIs
------------------

Callers need to know what exceptions to expect and when

.. code-block:: python

   def sqrt(x):
       '''Compute square roots using the method of Heron of Alexandria.
   
       Args:
           x: The number for which the square root is to be computed.
   
       Returns:
           The square root of x.
   
       Raises:
           ValueError: If x is negative.
       '''
   
       if x < 0:
           raise ValueError("Cannot compute square root of negative number {}".format(x))
   
       guess = x
       i = 0
       while guess * guess != x and i < 20:
           guess = (guess + x / guess) / 2.0
           i += 1
       return guess
   
   
   def main():
       try:
           print(sqrt(9))
           print(sqrt(2))
           print(sqrt(-1))
           print("This is never printed.")
       except ValueError as e:
           print(e, file=sys.stderr)
   
       print("Program execution continues normally here.")
   
   
   if __name__ == '__main__':
       main()

.. note:: it's usually not worth checking types, this can limit your functions unnecessarily

.. note:: it's Easier to Ask Forgiveness than Permission (example 2)

example1

.. code-block:: python

   import os
   
   p = '/path/to/datafile.dat'
   # only check for existence, what if file is garbage, what if path refers to dir instead of file
   
   if os.path.exists(p):
       process_file(p)
   else:
       print('No such file as {}'.format(p))
   
example2

.. code-block:: python
   
   p = '/path/to/datafile.dat'
   
   # no checks in advance 
   try:
       process_file(f)
   except OSError as e:
       print('Could not process file because {}'.format(str(e)))

Error codes require interspersed, local handling
Error codes are silent by default
Exceptions allow centralized, non-local handling
Exceptions require explicit handling

so we work with exceptions in python


clean-up actions
----------------

try...finally lets you clean up whether an exception occurs or not

.. code-block:: python

   import os
   
   def make_at(path, dir_name):
       original_path = os.getcwd() 
       os.chdir(path)
       os.mkdir(dir_name) # if this fails then
       os.chdir(original_path) # this won't happen

.. note:: finally-block is executed no matter how the try-block exits

.. code-block:: python

   import os
   import sys
   
   def make_at(path, dir_name):
       original_path = os.getcwd()
       try:
           os.chdir(path)
           os.mkdir(dir_name)
       except OSError as e:
           print(e, file=sys.stderr)
           raise
       finally:
           os.chdir(original_path) # runs even if OSError is thrown and handled

platform-specific code
----------------------

.. code-block:: python

   """keypress - A module for detecting a single keypress."""
   
   try:
       import msvcrt
   
       def getkey():
           """Wait for a keypress and return a single character string."""
           return msvcrt.getch()
   
   except ImportError: # when importing the windos module fails, the error is silenced explicitely, if this fails it will not be silenced
   
       import sys
       import tty
       import termios
   
       def getkey():
           """Wait for a keypress and return a single character string."""
           fd = sys.stdin.fileno()
           original_attributes = termios.tcgetattr(fd)
           try:
               tty.setraw(sys.stdin.fileno())
               ch = sys.stdin.read(1)
           finally:
               termios.tcsetattr(fd, termios.TCSADRAIN, original_attributes)
           return ch
   
       # If either of the Unix-specific tty or termios are not found,
       # we allow the ImportError to propagate from here

Comprehensions, iterables and generators
========================================

list comprehensions
-------------------

[ expr(item) for item in iterable ]
for each item in the iterable object on the right evaluate the expression on the left

.. code-block:: python

   ['Why', 'sometimes', 'I', 'have', 'believed', 'as', 'many', 'as', 'six', 'possible', 'things', 'before', 'breakfast']
   [len(word) for word in words]
   [3, 9, 1, 4, 8, 2, 4, 2, 3, 8, 6, 6, 9]
   from math import factorial
   f = [ len(str(factorial(x))) for x in range(20) ]
   f
   [1, 1, 1, 1, 2, 3, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15, 16, 18]
   type(f)
   #<class 'list'>


set comprehensions
------------------

{ expr(item) for item in iterable }

.. code-block:: python

   { len(str(factorial(x))) for x in range(20) }
   {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15, 16, 18}


dictionary comprehensions
-------------------------

{ key_expr:value_expr for item in iterable }

If we want both the keys and the values we should use the items() method and then use tuple unpacking country, capital

.. code-block:: python

   country_to_capital = {'United Kingdom': 'London',
                         'Brazil': 'Brazilia',
                         'Morocco': 'Rabat',
                         'Sweden': 'Stockholm'}
   from pprint import pprint as pp
   capital_to_country = { capital: country for country, capital in country_to_capital.items() }
   pp(capital_to_country)
   {'Brazilia': 'Brazil',
    'London': 'United Kingdom',
    'Rabat': 'Morocco',
    'Stockholm': 'Sweden'}

.. note:: duplicates: later keys overwrite earlier keys

e.g. only key  that begins with first letter x[0] store that word, duplicates will be gone

.. code-block:: python

   words = ["hi", "hello", "foxtrot", "hotel"]
   { x[0]: x for x in words }
   {'h': 'hotel', 'f': 'foxtrot'}


filtering predicates
--------------------

there is an optional filtering clause

[ expr(item) for item in iterable if predicate(item) ]

.. code-block:: python

   from math import sqrt
   
   def is_prime(x):
       if x < 2:
           return False
       for i in range(2, int(sqrt(x)) + 1):
           if x % i == 0:
               return False
       return True
   
   [x for x in range(101) if is_prime(x)]
   [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]

   # numbers with only 3 divisors

   from pprint import pprint as pp
   prime_square_divisors = { x*x:(1, x, x*x) for x in range(101) if is_prime(x)}
   pp(prime_square_divisors)
   {4: (1, 2, 4),
    9: (1, 3, 9),
    25: (1, 5, 25),
    49: (1, 7, 49),
    121: (1, 11, 121),
    169: (1, 13, 169),
    289: (1, 17, 289),
    361: (1, 19, 361),
    529: (1, 23, 529),
    841: (1, 29, 841),
    961: (1, 31, 961),
    1369: (1, 37, 1369),
    1681: (1, 41, 1681),
    1849: (1, 43, 1849),
    2209: (1, 47, 2209),
    2809: (1, 53, 2809),
    3481: (1, 59, 3481),
    3721: (1, 61, 3721),
    4489: (1, 67, 4489),
    5041: (1, 71, 5041),
    5329: (1, 73, 5329),
    6241: (1, 79, 6241),
    6889: (1, 83, 6889),
    7921: (1, 89, 7921),
    9409: (1, 97, 9409)}


iteration protocols
-------------------


**iterable protocol**
iterable objects can be passed to the built-in `iter()` function to get an iterator 

iterator = iter(iterable)                                                                                                                                               
**iterator protocol**
Iterator objects can be passed to the built-in `next()` function to fetch the next item.
item = next(iterator)


.. code-block:: python

   iterable = ['Spring', 'Summer', 'Autumn', 'Winter']
   iterator = iter(iterable)
   next(iterator)
   'Spring'
   next(iterator)
   'Summer'
   next(iterator)
   'Autumn'
   next(iterator)
   'Winter'
   next(iterator)
   # Traceback (most recent call last):
   #  File "<stdin>", line 1, in <module>
   #  StopIteration


   def first(iterable):
       iterator = iter(iterable)
       try:
           return next(iterator)
       except StopIteration:
           raise ValueError("iterable is empty")
   
   first(["1st", "2nd", "3rd"])
   '1st'
   first(["1st", "2nd", "3rd"])
   '1st'
   first(set())
   #Traceback (most recent call last):
   #  File "<stdin>", line 4, in first
   #StopIteration
   #
   #During handling of the above exception, another exception occurred:
   #
   #Traceback (most recent call last):
   #  File "<stdin>", line 1, in <module>
   #  File "<stdin>", line 6, in first
   #ValueError: iterable is empty

generators
----------

specify iterable sequences
 - all generators are iterators

are lazily evaluated
 - they only computate the next value on demand

can model infinite sequences
 - such as data streams from a sensor with no definite end

are composable into pipelines
 - for natural stream processing


.. code-block:: python

   def gen123():
       yield 1
       yield 2
       yield 3
       # return
       # implicit return at the end

   g = gen123()
   g
   # <generator object gen123 at 0x7f3f662e8fc0>
   # pass the generator to the function
   next(g)
   1
   next(g)
   2
   next(g)
   3
   # now StopIteration exception
   #
   # Traceback (most recent call last):
   #   File "<stdin>", line 1, in <module>
   #   StopIteration
   for v in gen123(): 
       print(v)
   
   1
   2
   3
   # remember each call to function creates a new generator object
   h = gen123()
   i = gen123()
   h
   #generator object gen123 at 0x7f3f66302048>
   i
   #generator object gen123 at 0x7f3f663020a0>

.. code-block:: python

   def gen246():
       print("about to yield 2")
       yield 2
       print("about to yield 4")
       yield 4
       print("about to yield 6")
       yield 6
   
   g = gen246() # generator = created and returned but non of the code has yet been executed
   next(g)
   "about to yield 2"
   2
   next(g) # generator resumes at the point we left off
   "about to yield 4"                                                                                    
   2              
   next(g)
   "about to yield 6"
   6

stateful generators
-------------------

- Generators resume execution
- Can maintain state in local variables
- Complex control flow
- Lazy evaluation


take generator

.. code-block:: python

   def take(count, iterable):
       """Take items from the front of an iterable.
   
       Args:
           count: maximum number of items to retrieve
           iterable: the source series
   
       Yields:
            at most 'count' items from 'iterable'
       """
   
       counter = 0
       for item in iterable:
           if counter == count:
               return # end sequence when we reach specified count
               # return raises StopIteration which is caught internally by the for loop in run_take()
           counter += 1 # how many items have been yielded so far
           yield item # contains a generator bc it has at least one yield statement
   
   
   def run_take(): # generators are lazy and only generate values on request
       items = [2, 4, 6, 8, 10]
       for item in take(3, items):  # take(count, iterable) # return raises StopIteration which is caught by
           print(item)
   
   
   if __name__ == "__main__":
           run_take()


distinct generator

.. code-block:: python

   # 2nd generator
   def distinct(iterable):
       """Return unique items by eliminating duplicates
   
       Args:
           iterable: source series
   
       Yields:
           Unique elements in order from 'iterable'
       """
   
       seen = set()
       for item in iterable:
           if item in seen:
               continue # finishes current iteration of the loop an begins next iteration immediately!
               # execution will be transferred back to the for statement to begin next iteration
           yield item
           seen.add(item) # next call from for loop in run_distinct() will resume here with remembered
           # item 5 just yielded
           # and then moves up to beginning of for loop again where item is reassigned to second value 7
   
   def run_distinct():
       items = [5, 7, 7, 6, 5, 5]
       for item in distinct(items):
           print(item)
   
   if __name__ == '__main__':
       run_distinct()

both combined in pipeline

.. code-block:: python

   def take(count, iterable):
       counter = 0
       for item in iterable:
           if counter == count:
               return # end sequence when we reach specified count
               # return raises StopIteration which is caught internally by the for loop in run_take()
           counter += 1 # how many items have been yielded so far
           yield item # contains a generator bc it has at least one yield statement
   
   
   def run_take(): # generators are lazy and only generate values on request
       items = [2, 4, 6, 8, 10]
       for item in take(3, items):  # take(count, iterable) # return raises StopIteration which is caught by
           print(item)
   
   # 2nd generator
   def distinct(iterable):
       seen = set()
       for item in iterable:
           if item in seen:
               continue # finishes current iteration of the loop an begins next iteration immediately!
               # execution will be transferred back to the for statement to begin next iteration
           yield item
           seen.add(item) # next call from for loop in run_distinct() will resume here with first item 5
           # and then moves up to beginning of for loop again with second item 7
   
   def run_distinct():
       items = [5, 7, 7, 6, 5, 5]
       for item in distinct(items):
           print(item)
   
   def run_pipeline():
       items = [5, 7, 7, 6, 5, 5]
       for item in take(3, distinct(items)): # distinct must run first to produce the iterator object argument for take
           print(item)
   
   if __name__ == '__main__':
       run_pipeline()


laziness and infinite
^^^^^^^^^^^^^^^^^^^^^

• Just in Time Computation
• Infinite (or large) sequences
  • sensor readings
  • mathematical series
  • massive files

.. code-block:: python

   def lucas():
       yield 2
       a = 2
       b = 1
       while True: # infinite while loop
           yield b
           a, b = b, a + b
   
   for x in lucas():
       print(x)
   # this will run forever until you pc runs out of memory but demonstrates nicely

generator comprehensions
------------------------

- similar syntax to list comprehensions
- create a generator object
- concise
- lazy evaluation

(expr(item) for item in iterable)

.. code-block:: python

   million_squares = (x*x for x in range(1, 1000001)) # creates a generator object
   list(million_squares) # force evaluation of the generator by using it to create a list
   list(million_squares)
   [] # repeating it = empty, generators are single use objects!
   # each time we call a generator function, we create a generator object
   sum(x*x for x in range(1, 1000001)) # sum of first 10mil squares, using a list comprehencsion would take 400MB!
   333333833333500000

   sum(x*x for x in range(1, 1000001) if x % 17) # with optional if condition
   313726019609411764


.. note:: we didn't have to use extra parentheses to put a generator comprehension wihtin sum(), this improves readability

using itertools
---------------

list of iteration tools in python: https://docs.python.org/3/library/itertools.html 

using islice and count

.. code-block:: python

   from itertools import islice, count
   from math import sqrt
   
   
   def is_prime(x):
       if x < 2:
           return False
       for i in range(2, int(sqrt(x)) + 1):
           if x % i == 0:
               return False
       return True
   
   # do this thousand_primes = islice(all_primes, 1000) but how to generate all primes
   # ranges must always be finite, we need an open ended version of range and that is what count() does
   # thousand_primes = islice((x for x in count() if is_prime(x)), 1000) # with islice() like with lists
   
   sum(islice((x for x in count() if is_prime(x)), 1000))
   3682913


using any(or) and all(and) for iterable series of bool values

.. code-block:: python

   any([False, False, True])
   True
   all([False, False, True])
   False
   
   # Are there any prime numbers between 1328 and 1361?
   any(is_prime(x) for x in range(1328, 1361))
   False
   
   # title() converts first character to uppercase
   # check if all city names have capital letters
   all(name == name.title() for name in ['London', 'New York', 'Sydney'])
   True
   
   # syncronize iterations over 2 iterable series
   # eg two  series of temperature data
   sunday = [12, 14, 15, 15, 17, 21, 22, 22, 23, 22, 20, 18]
   monday = [13, 14, 14, 14, 16, 20, 21, 22, 22, 21, 19, 17]
   # bind them in pairs of corresponding readings
   for item in zip(sunday, monday):
       print(item)
   
   (12, 13)
   (14, 14)
   (15, 14)
   (15, 14)
   (17, 16)
   (21, 20)
   (22, 21)
   (22, 22)
   (23, 22)
   (22, 21)
   (20, 19)
   (18, 17)
   
   # zip yields tuples when iterated
   # we can take advantage of this with tuple unpacking in the for loop
   for sun, mon in zip(sunday, monday):
       print("average =", (sun + mon) / 2)
   
   average = 12.5
   average = 14.0
   average = 14.5
   average = 14.5
   average = 16.5
   average = 20.5
   average = 21.5
   average = 22.0
   average = 22.5
   average = 21.5
   average = 19.5
   average = 17.5
   
   tuesday = [2, 2, 3, 7, 9, 10, 9, 8, 8]
   
   for temps in zip(sunday, monday, tuesday):
       print("min={:4.1f}, max={:4.1f}, average={:4.1f}".format(min(temps), max(temps), sum(temps) / len(temps)))
   """ 
   min= 2.0, max=13.0, average= 9.0
   min= 2.0, max=14.0, average=10.0
   min= 3.0, max=15.0, average=10.7
   min= 7.0, max=15.0, average=12.0
   min= 9.0, max=17.0, average=14.0
   min=10.0, max=21.0, average=17.0
   min= 9.0, max=22.0, average=17.3
   min= 8.0, max=22.0, average=17.3
   min= 8.0, max=23.0, average=17.7
   """
   # now we want one long temperature series for sunday monday and thuesday 
   # we can then lazily concatenate iterables using itertools chain
   # this is different from simply concatenating 3 lists into a new list
   # we have no memory impact of data duplication
   from itertools import chain
   temperatures = chain(sunday, monday, tuesday)

   all(t > 0 for t in temperatures)
   temperatures = chain(sunday, monday, tuesday)
   True

   # following shows generator functions, generator expressions, predicate functions and for loops
   def lucas():
       yield 2
       a = 2
       b = 1
       while True: # infinite while loop
           yield b
           a, b = b, a + b

   for x in (p for p in lucas() if is_prime(p)):
       print(x)

   2
   3
   7
   11
   29
   47
   199
   521
   2207
   3571
   9349
   3010349
   54018521
   370248451
   6643838879
   119218851371
   5600748293801
   688846502588399
   32361122672259149
   

   """ itertools.chain(*iterables)
   Make an iterator that returns elements from the first iterable until it is exhausted, then proceeds to the next iterable, until all of the iterables are exhausted. Used for treating consecutive sequences as a single sequence """

   
https://docs.python.org/3/library/itertools.html#itertools.chain
   
summary comprehensions generators
---------------------------------

- Comprehensions
  - Comprehensions are a concise syntax for describing lists, sets and dictionaries.
  - Comprehensions operate on an iterable source object and apply an optional predicate filter and a mandatory expression, both of which are usually in terms of the current item.
  - Iterables are objects over which we can iterate item by item.
  - We retrieve an iterator from an iterable object using the built-in iter() function.
  - Iterators produce items one-by-one-from the underlying iterable series each time they are passed to the built-in next() function 

- Generators
  - Generator functions allow us to describe series using imperative code.
  - Generator functions contain at least one use of the yield keyword.
  - Generators are iterators. When advanced with next() the generator starts or resumes execution up to and including the next yield.
  - Each call to a generator function creates a new generator object.
  - Generators can maintain explicit state in local variables between iterations.
  - Generators are lazy, and so can model infinite series of data.
  - Generator expressions have a similar syntactic form to list comprehensions and allow for a more declarative and concise way of creating generator objects.

list of iteration tools in python: https://docs.python.org/3/library/itertools.html

classes
=======

self: the first argument to all instance methods
__init__() instance method for initializing new objects

.. warning:: __init__() is an initializer, not a constructor, self is similar to this. __init__() is to configure an object that already exists by the time it is called

why self._number?
 
 1. avoid name clash with number()
 2. implementation details of objects start with _

.. note:: using objects of different types through a common interface = polymorphism

.. code-block:: python
   
   """Model for aircraft flights."""
   
   class Flight:
       """A flight with a particular passenger aircraft."""
   
       def __init__(self, number, aircraft):
           if not number[:2].isalpha():
               raise ValueError("No airline code in '{}'".format(number))
   
           if not number[:2].isupper():
               raise ValueError("Invalid airline code '{}'".format(number))
   
           if not (number[2:].isdigit() and int(number[2:]) <= 9999):
               raise ValueError("Invalid route number '{}'".format(number))
   
           self._number = number
           self._aircraft = aircraft
   
           rows, seats = self._aircraft.seating_plan()
           self._seating = [None] + [ {letter:None for letter in seats} for _ in rows ]
   
       def number(self):
           return self._number
   
       def airline(self):
           return self._number[:2]
   
       def aircraft_model(self):
           return self._aircraft.model()
   
       def allocate_seat(self, seat, passenger):
           """Allocate a seat to a passenger.
   
           Args:
               seat: A seat designator such as '12C' or '21F'.
               passenger: The passenger name.
   
           Raises:
               ValueError: If the seat is unavailable.
           """
           rows, seat_letters = self._aircraft.seating_plan()
   
           letter = seat[-1]
           if letter not in seat_letters:
               raise ValueError("Invalid seat letter {}".format(letter))
   
           row_text = seat[:1]
           try:
               row = int(row_text)
           except ValueError:
               raise ValueError("Invalid seat row {}".format(row_text))
   
           if row not in rows:
               raise ValueError("Invalid row number {}".format(row))
   
           if self._seating[row][letter] is not None:
               raise ValueError("Seat {} is already occupied.".format(seat))
   
           self._seating[row][letter] = passenger
   
       def _parse_seat(self, seat):
           """Parse a seat designator into a valid row and letter.
   
           Args:
               seat: A seat designator such as 12F
   
           Returns:
               A tuple containing an integer and a string for row and seat.
           """
           row_numbers, seat_letters = self._aircraft.seating_plan()
   
           letter = seat[-1]
           if letter not in seat_letters:
               raise ValueError("Invalid seat letter {}".format(letter))
   
           row_text = seat[:-1]
           try:
               row = int(row_text)
           except ValueError:
               raise ValueError("Invalid seat row {}".format(row_text))
   
           if row not in row_numbers:
               raise ValueError("Invalid row number {}".format(row))
   
           return row, letter
   
       def allocate_seat(self, seat, passenger):
           """Allocate a seat to a passenger.
   
           Args:
               seat: A seat designator such as '12C' or '21F'.
               passenger: The passenger name.
   
           Raises:
               ValueError: If the seat is unavailable.
           """
           row, letter = self._parse_seat(seat)
   
           if self._seating[row][letter] is not None:
               raise ValueError("Seat {} already occupied".format(seat))
   
           self._seating[row][letter] = passenger
   
       def relocate_passenger(self, from_seat, to_seat):
           """Relocate a passenger to a different seat.
   
           Args:
               from_seat: The existing seat designator for the
                          passenger to be moved.
   
               to_seat: The new seat designator.
           """
   
           from_row, from_letter = self._parse_seat(from_seat)
           if self._seating[from_row][from_letter] is None:
               raise ValueError("No passenger to relocate in seat {}".format(from_seat))
   
           to_row, to_letter = self._parse_seat(to_seat)
           if self._seating[to_row][to_letter] is not None:
               raise ValueError("Seat {} already occupied".format(to_seat))
   
           self._seating[to_row][to_letter] = self._seating[from_row][from_letter]
           self._seating[from_row][from_letter] = None
   
       def num_available_seats(self):
           return sum( sum(1 for s in row.values() if s is None)
                       for row in self._seating
                       if row is not None)
   
       def make_boarding_cards(self, card_printer):
           for passenger, seat in sorted(self._passenger_seats()):
               card_printer(passenger, seat, self.number(), self.aircraft_model())
   
       def _passenger_seats(self):
           """An iterable series of passenger seating allocations."""
           row_numbers, seat_letters = self._aircraft.seating_plan()
           for row in row_numbers:
               for letter in seat_letters:
                   passenger = self._seating[row][letter]
                   if passenger is not None:
                       yield (passenger, "{}{}".format(row, letter))
   
   
   class Aircraft:
         def __init__(self, registration):
             self._registration = registration
   
         def registration(self):
             return self._registration
   
         def num_seats(self):
             rows, row_seats = self.seating_plan()
             return len(rows) * len(row_seats)
   
   
   class AirbusA319(Aircraft):
         def model(self):
             return "Airbus A319"
   
         def seating_plan(self):
             return range(1, 23), "ABCDEF"
   
   
   class Boeing777(Aircraft):
       def model(self):
           return "Boeing 777"
   
       def seating_plan(self):
           # For simplicity's sake, we ignore complex
           # seating arrangement for first-class
           return range(1, 56), "ABCDEGHJK"
   
   
   def make_flights():
         f = Flight("BA758", AirbusA319("G-EUPT"))
         f.allocate_seat('12A', 'Guido van Rossum')
         f.allocate_seat('15F', 'Bjarne Stroustrup')
         f.allocate_seat('15E', 'Anders Hejlsberg')
         f.allocate_seat('1C', 'John McCarthy')
         f.allocate_seat('1D', 'Richard Hickey')
   
         g = Flight("AF72", Boeing777("F-GSPS"))
         g.allocate_seat('55K', 'Larry Wall')
         g.allocate_seat('33G', 'Yukihiro Matsumoto')
         g.allocate_seat('4B', 'Brian Kernighan')
         g.allocate_seat('4A', 'Dennis Ritchie')
   
         return f, g
   
   
   def console_card_printer(passenger, seat, flight_number, aircraft):
         output = "| Name: {0}"     \
                  "  Flight: {1}"   \
                  "  Seat: {2}"     \
                  "  Aircraft: {3}" \
                  " |".format(passenger, flight_number, seat, aircraft)
         banner = '+' + '-' * (len(output) - 2) + '+'
         border = '|' + ' ' * (len(output) - 2) + '|'
         lines = [banner, border, output, border, banner]
         card = '\n'.join(lines)
         print(card)
         print()

summary classes
---------------

- All types in Python have a 'class'
- Classes define the structure and behavior of an object
- Class is determined when object is created
  - normally fixed for the lifetime
- Classes are the key support for Object-Oriented Programming in Python
- Classes defined using the class keyword followed by CamelCase name
- Class instances created by calling the class as if it were a function
- Instance methods are functions defined inside the class
  - Should accept an object instance called self as the first parameter
- Methods are called using instance.method()
  - Syntactic sugar for passing self instance to method
- The optional __init__() method initialized new instances
  - If present, the constructor calls __init__()
  - __init__() is not the constructor
- Arguments passed to the constructor are forwarded to the initializer

- Instance attributes are created simply by assigning to them
- Implementation details are denoted by a leading underscore
  - There are no public, protected or private access modifiers in Python
- Accessing implementation details can be very useful
  - Especially during development and debugging
- Class invariants should be established in the initializer
  - If the invariants can't be established raise exceptions to signal failure
- Methods can have docstrings, just like regular functions
- Classes can have docstrings
- Even within an object method calls must be preceded with self
- You can have as many classes and functions in a module as you wish
  - Related classes and global functions are usually grouped together this way
- Polymorphism in Python is achieved through duck typing
- Polymorphism in Python does not use shared base classes or interfaces
- Class inheritance is primarily useful for sharing implementation
- All methods are inherited, including special methods like the initializer

- Strings support slicing, because they implement the sequence protocol
- Following the Law of Demeter can reduce coupling
- We can nest comprehensions
- It can sometimes be useful to discard the current item in a comprehension
- When dealing with one-based collections it's often easier just to waste one
- list entry.
- Don't feel compelled to use classes when a simple function will suffice
- Comprehensions or generator expression can be split over multiple lines
- Statements can be split over multiple lines using backslash
  - Use this feature sparingly and only when it improves readability
- Use “Ask! Don’t tell.” to avoid tight coupling between objects

files and resource management
=============================

open(file, mode, encoding)
 file: path to file (required)
 mode: read/write/append, binary/text
 encoding: text encoding

https://docs.python.org/3/library/functions.html#open

+-----------+-----------------------------------------------------------------+
| Character | Meaning                                                         |
+===========+=================================================================+
| 'r'       | open for reading (default)                                      |
+-----------+-----------------------------------------------------------------+
| 'w'       | open for writing, truncating the file first                     |
+-----------+-----------------------------------------------------------------+
| 'x'       | open for exclusive creation, failing if the file already exists |
+-----------+-----------------------------------------------------------------+
| 'a'       | open for writing, appending to the end of the file if it exists |
+-----------+-----------------------------------------------------------------+
| 'b'       | binary mode                                                     |
+-----------+-----------------------------------------------------------------+
| 't'       | text mode (default)                                             |
+-----------+-----------------------------------------------------------------+
| '+'       | open a disk file for updating (reading and writing)             |
+-----------+-----------------------------------------------------------------+
| 'U'       | universal newlines mode (deprecated)                            |
+-----------+-----------------------------------------------------------------+

write() returns the number of codepoints, not the number of characters

.. code-block:: python

   import sys

   def main(filename):
       f = open(filename, mode='rt', encoding='utf-8')
       for line in f:
           print(line)
       f.close()

   if __name__ == '__main__':
       main(sys.argv[1])

