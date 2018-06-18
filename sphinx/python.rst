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

   if __name__ == '__main__': # the module is being executed directly not imported
       main(sys.argv[1]) # the 0th arg is the module/script filename 
   
more on command-line parsing module: `https://docs.python.org/3/howto/argparse.html`_
an alternative is docopt: `https://github.com/docopt/docopt`_

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


list repetition
---------------

.. code-block:: python


more on list
------------

.. code-block:: python


growing lists
-------------

.. code-block:: python


reversing and sorting lists
---------------------------

.. code-block:: python


dictionary
----------

.. code-block:: python


set
---

.. code-block:: python


collection protocols
--------------------

