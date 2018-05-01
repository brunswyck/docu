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
   
