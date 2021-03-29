.. include:: ../../../_static/global.rst


Connect to console
==================

minicom
-------
make your user member of the dialout group

.. code::

   sudo usermod -G dialout guru

check what tty you should use after connecting the cable with ``dmesg``

.. code::

   sudo dmesg | grep tty

launch minicom with the appropriate baudrate and tty device

.. code::
 
   minicom --baudrate=9600 --device=/dev/ttyS0

off you go
