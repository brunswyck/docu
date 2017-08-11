.. highlightlang:: rest

####
CCNA
####

***********************
Networking Fundamentals
***********************

Add fundamentals content here

**********************************
Routing and Switching Fundamentals
**********************************

basic concepts
==================
 RAM
  Running IOS
  Running config file
  IP routing tables, ARP tables, CDP info
  Packet buffer

 ROM
  Bootup instructions (System Bootstrap)
  Basic diagnostic software (POST)
  Limited IOS in case router cannot load full featured IOS(ROMMON)

 NVRAM
  Startup config file

 FLASH
  IOS
 
 view their size via::

    show version    
 
 bootup process lookup for ios

  * flash memory
  * TFTP server
  * ROM

 to change this order, change configuration register

 

Router's 3 packet-forwarding mechanisms
======================================= 

  Process Switching
   An older packet forwarding mechanism still available for Cisco routers. When a packet arrives on an interface, it is forwarded to the control plane where the CPU matches the destination address with an entry in its routing table, and then determines the exit interface and forwards the packet. It is important to understand that the router does this for every packet, even if the destination is the same for a stream of packets. This process-switching mechanism is very slow and rarely implemented in modern networks.
    
  Fast switching
   This is a common packet forwarding mechanism which uses a fast-switching cache to store next-hop information. When a packet arrives on an interface, it is forwarded to the control plane where the CPU searches for a match in the fast-switching cache. If it is not there, it is process-switched and forwarded to the exit interface. The flow information for the packet is also stored in the fast-switching cache. If another packet going to the same destination arrives on an interface, the next-hop information in the cache is re-used without CPU intervention.

  Cisco Express Forwarding (CEF)
   CEF is the most recent and preferred Cisco IOS packet-forwarding mechanism. Like fast switching, CEF builds a Forwarding Information Base (FIB), and an adjacency table. However, the table entries are not packet-triggered like fast switching but change-triggered such as when something changes in the network topology. Therefore, when a network has converged, the FIB and adjacency tables contain all the information a router would have to consider when forwarding a packet. The FIB contains pre-computed reverse lookups, next hop information for routes including the interface and Layer 2 information. Cisco Express Forwarding is the fastest forwarding mechanism and the preferred choice on Cisco routers.

Loopback interfaces
===================
 
 Multiple loopback interfaces can be enabled on a router. The IPv4 address for each loopback interface must be unique and unused by any other interface.

configure loopback interface
----------------------------
  
  .. code-block::
  
     Router(config)# interface loopback 0
     Router(config-if)# ip address 10.0.0.1 255.255.255.0
     Router(config-if)# exit


Filtering parameters
====================

 Used after the pipe are:

  section
   Shows entire section that starts with the filtering expression::

   R1# show running-config | section line vty

  include
   Includes all output lines that match the filtering expression::

   R1# show ip interface brief | include up

  exclude
   Excludes all output lines that match the filtering expression::

   R1# show ip interface brief | exclude unassigned

  begin
   hows all the output lines from a certain point, starting with the line that matches the filtering expression::

   R1# show ip route | begin Gateway
   R1# show running-config | begin line

History
=======
 
 History commands
 ----------------
 
 .. code-block::
    
    R1# terminal history size 200
    R1# show history


Show command examples
=====================
show interfaces
 .. code-block::
	:emphasize-lines: 1
 
    TA(config)#do show interfaces
    GigabitEthernet0/0 is up, line protocol is up (connected)
    OB Hardware is CN Gigabit Ethernet, address is 0004.9ae8.b901 (bia 0004.9ae8.b901)
    Description: Link RTA G0/0 to SW1 G0/1
    Internet address is 10.10.10.1/24
    MTU 1500 bytes, BW 1000000 Kbit, DLY 10 usec,
       reliability 255/255, txload 1/255, rxload 1/255
    Encapsulation ARPA, loopback not set
    Keepalive set (10 sec)
    Full-duplex, 100Mb/s, media type is RJ45
    output flow-control is unsupported, input flow-control is unsupported
    ARP type: ARPA, ARP Timeout 04:00:00, 
    Last input 00:00:08, output 00:00:05, output hang never
    Last clearing of "show interface" counters never
    Input queue: 0/75/0 (size/max/drops); Total output drops: 0
    Queueing strategy: fifo
    Output queue :0/40 (size/max)
    5 minute input rate 0 bits/sec, 0 packets/sec
    5 minute output rate 0 bits/sec, 0 packets/sec
       0 packets input, 0 bytes, 0 no buffer
       Received 0 broadcasts, 0 runts, 0 giants, 0 throttles
       0 input errors, 0 CRC, 0 frame, 0 overrun, 0 ignored, 0 abort
       0 watchdog, 1017 multicast, 0 pause input
       0 input packets with dribble condition detected
       0 packets output, 0 bytes, 0 underruns
       0 output errors, 0 collisions, 2 interface resets
       0 unknown protocol drops
       0 babbles, 0 late collision, 0 deferred
       0 lost carrier, 0 no carrier
       0 output buffer failures, 0 output buffers swapped out


show ip interface
 

 show ip int brief

 show ip interface

 show ip route

 show ip route connected
