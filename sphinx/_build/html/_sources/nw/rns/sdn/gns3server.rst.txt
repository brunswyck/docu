
..
    # with overline, for parts
    * with overline, for chapters
    =, for sections
    -, for subsections
    ^, for subsubsections
    “, for paragraphs

Setting up a GNS3 server
========================


Creating a KVM VM for GNS3
--------------------------

#. create the vm with plenty of memory and cpu

   .. code::

      patrick@lab:/mnt/store/kvm/images$ sudo virt-install --virt-type=kvm --name gns3 --os-variant debian9 --location /mnt/store/kvm/images/debian-testing-amd64-netinst.iso --memory 24576 --disk pool=default,size=150,format=qcow2 --vcpus=6,maxvcpus=12 --cpu host --network=network=br0 --extra-args console=ttyS0 --graphics none

      Starting install...
      Retrieving file info...                                                                                                                    |   82 B  00:00:00     
      Retrieving file vmlinuz...                                                                                                                 | 4.8 MB  00:00:00     
      Retrieving file initrd.gz...                                                                                                               |  18 MB  00:00:00     
      Allocating 'gns3.qcow2'                                            0% [                                                        ] 399 kB/s | 6.4 MB  109:22:16 ETA


#. install the python3-pip package

   .. code::

      patrick@gns3:~$ sudo apt-get install python3-pip
      patrick@gns3:~$ sudo pip3 install gns3-server
      Collecting gns3-server

.. image:: ../../../_static/img/sdn_zodiacfx_portal.png

