##################
debian workstation
##################

**********************
hardware configuration
**********************

peripherals
===========

logitech unified receiver
-------------------------

.. code::
   
   check if receiver recognized
   ----------------------------
   (env) patrick@stretch:~/docu/sphinx[brunswyck:docu.git master]$ sudo tail /var/log/kern.log
   May  1 20:41:58 stretch kernel: [1553347.282249] usb 1-1.2: USB disconnect, device number 91
   May  1 20:48:40 stretch kernel: [1553749.486417] thinkpad_acpi: EC reports that Thermal Table has changed
   May  1 20:49:50 stretch kernel: [1553819.183513] usb 1-1: new full-speed USB device number 92 using xhci_hcd
   May  1 20:49:50 stretch kernel: [1553819.325874] usb 1-1: New USB device found, idVendor=046d, idProduct=c52b
   May  1 20:49:50 stretch kernel: [1553819.325886] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
   May  1 20:49:50 stretch kernel: [1553819.325892] usb 1-1: Product: USB Receiver
   May  1 20:49:50 stretch kernel: [1553819.325898] usb 1-1: Manufacturer: Logitech
   May  1 20:49:50 stretch kernel: [1553819.363318] logitech-djreceiver 0003:046D:C52B.01EF: hiddev0,hidraw2: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:00:14.0-1/input2
   May  1 20:49:50 stretch kernel: [1553819.495762] input: Logitech M510 as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.2/0003:046D:C52B.01EF/0003:046D:1025.01F0/input/input516
   May  1 20:49:50 stretch kernel: [1553819.496362] logitech-hidpp-device 0003:046D:1025.01F0: input,hidraw3: USB HID v1.11 Mouse [Logitech M510] on usb-0000:00:14.0-1:1

   install unified receiver manager
   --------------------------------
   (env) patrick@stretch:~/docu/sphinx[brunswyck:docu.git master]$ sudo apt-cache search solaar
   solaar - Logitech Unifying Receiver peripherals manager for Linux
   solaar-gnome3 - GNOME Shell/Unity integration for Solaar

   (env) patrick@stretch:~/docu/sphinx[brunswyck:docu.git master]$ sudo apt-get install solaar
   Reading package lists... Done
   Building dependency tree       
   Reading state information... Done
   The following additional packages will be installed:
     python-pyudev
   Suggested packages:
     python-gobject python-qt4 python-pyside.qtcore gir1.2-appindicator3-0.1 solaar-gnome3
   The following NEW packages will be installed:
     python-pyudev solaar
   0 upgraded, 2 newly installed, 0 to remove and 24 not upgraded.
   Need to get 136 kB of archives.
   After this operation, 647 kB of additional disk space will be used.
   Do you want to continue? [Y/n] Y

   Get:1 http://ftp.be.debian.org/debian stable/main amd64 python-pyudev all 0.21.0-1 [40.2 kB]
   Get:2 http://ftp.be.debian.org/debian stable/main amd64 solaar all 0.9.2+dfsg-7 [95.9 kB]
   Fetched 136 kB in 0s (666 kB/s)  
   Preconfiguring packages ...
   Selecting previously unselected package python-pyudev.
   (Reading database ... 219287 files and directories currently installed.)
   Preparing to unpack .../python-pyudev_0.21.0-1_all.deb ...
   Unpacking python-pyudev (0.21.0-1) ...
   Selecting previously unselected package solaar.
   Preparing to unpack .../solaar_0.9.2+dfsg-7_all.deb ...
   Unpacking solaar (0.9.2+dfsg-7) ...
   Setting up python-pyudev (0.21.0-1) ...
   Processing triggers for mime-support (3.60) ...
   Processing triggers for desktop-file-utils (0.23-1) ...
   Processing triggers for man-db (2.7.6.1-2) ...
   Processing triggers for gnome-menus (3.13.3-9) ...
   Setting up solaar (0.9.2+dfsg-7) ...
   Processing triggers for hicolor-icon-theme (0.15-1) ...

**********************
software configuration
**********************

display
=======

redshift
---------

change display color profile following the sun

packages
^^^^^^^^

.. code::

   sudo apt-cache search redshift
   gnome-shell-extension-redshift - redshift extension for GNOME Shell
   plasma-applet-redshift-control - Adjusts the color temperature of your screen
   gtk-redshift - transitional dummy package
   redshift - Adjusts the color temperature of your screen
   redshift-gtk - Adjusts the color temperature of your screen with GTK+ integration
   

.. code::

   sudo apt-get install redshift redshift-gtk

help
^^^^

.. code::

   redshift -h
   
   Usage: redshift -l LAT:LON -t DAY:NIGHT [OPTIONS...]
   
   Set color temperature of display according to time of day.
   
     -h     Display this help message
     -v     Verbose output
     -V     Show program version
  
     -b DAY:NIGHT   Screen brightness to apply (between 0.1 and 1.0)
     -c FILE    Load settings from specified configuration file
     -g R:G:B   Additional gamma correction to apply
     -l LAT:LON Your current location
     -l PROVIDER    Select provider for automatic location updates
            (Type `list' to see available providers)
     -m METHOD  Method to use to set color temperature
            (Type `list' to see available methods)
     -o     One shot mode (do not continuously adjust color temperature)
     -O TEMP    One shot manual mode (set color temperature)
     -p     Print mode (only print parameters and exit)
     -x     Reset mode (remove adjustment from screen)
     -r     Disable temperature transitions
     -t DAY:NIGHT   Color temperature to set at daytime/night
   
   The neutral temperature is 6500K. Using this value will not
   change the color temperature of the display. Setting the
   color temperature to a value higher than this results in
   more blue light, and setting a lower value will result in
   more red light.
   
   Default values:
   
     Daytime temperature: 5500K
     Night temperature: 3500K

   CONFIGURATION FILE
          A configuration file with the name `redshift.conf' can optionally be placed in `~/.config/'. The file has standard INI format. General program options are
          placed  under  the `redshift' header, while options for location providers and adjustment methods are placed under a header with the name of that provider
          or method. General options are:
   
          temp-day = integer
                 Daytime temperature
   
          temp-night = integer
                 Night temperature
   
          transition = 0 or 1
                 Disable or enable transitions
   
          brightness-day = 0.1-1.0
                 Screen brightness at daytime
   
          brightness-night = 0.1-1.0
                 Screen brightness at night
   
          elevation-high = decimal
                 The solar elevation for the transition to daytime
   
          elevation-low = decimal
                 The solar elevation for the transition to night
   
          gamma = R:G:B
              Gamma adjustment to apply (day and night)

          gamma-day = R:G:B
                 Gamma adjustment to apply at daytime
   
          gamma-night = R:G:B
                 Gamma adjustment to apply at night
   
          adjustment-method = name
                 Select adjustment method. Options for the adjustment method can be given under the configuration file heading of the same name.
   
          location-provider = name
                 Select location provider. Options for the location provider can be given under the configuration file heading of the same name.
   
          Options for location providers and adjustment methods can be found in the help output of the providers and methods.
   
      Please report bugs to <https://github.com/jonls/redshift/issues>
   
configure
^^^^^^^^^
   
you need to set latitude:longitude first in a configuration file
   
.. code::

   patrick@stretch:~$ vim ~/.config/redshift.conf
      
   patrick@stretch:~$ cat ~/.config/redshift.conf
   [redshift]
   temp-day=5700
   temp-night=3600
   gamma=0.8
   adjustment-method=randr
   location-provider=manual
   
   [manual]
   lat=50.85045
   lon=4.34878
 
cli equivalent

.. code::

   redshift -l 50.85045:4.34878 -t 5700:3600 -g 0.8 -m randr -v
      

more information: http://jonls.dk/redshift/

brightness controller
---------------------

manually change display parameters with gui tool

install and run
^^^^^^^^^^^^^^^

.. code::

   ~/github/projects$ sudo apt-get install python-pyside
   ~/github/projects$ git clone https://github.com/LordAmit/Brightness.git

   ~/github/projects$ python2.7 Brightness/src/init.py 
 
