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
Chapter 1 Routing Concepts
==========================

basic concepts
--------------
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
---------------------------------------

  Process Switching
   An older packet forwarding mechanism still available for Cisco routers. When a packet arrives on an interface, it is forwarded to the control plane where the CPU matches the destination address with an entry in its routing table, and then determines the exit interface and forwards the packet. It is important to understand that the router does this for every packet, even if the destination is the same for a stream of packets. This process-switching mechanism is very slow and rarely implemented in modern networks.
    
  Fast switching
   This is a common packet forwarding mechanism which uses a fast-switching cache to store next-hop information. When a packet arrives on an interface, it is forwarded to the control plane where the CPU searches for a match in the fast-switching cache. If it is not there, it is process-switched and forwarded to the exit interface. The flow information for the packet is also stored in the fast-switching cache. If another packet going to the same destination arrives on an interface, the next-hop information in the cache is re-used without CPU intervention.

  Cisco Express Forwarding (CEF)
   CEF is the most recent and preferred Cisco IOS packet-forwarding mechanism. Like fast switching, CEF builds a Forwarding Information Base (FIB), and an adjacency table. However, the table entries are not packet-triggered like fast switching but change-triggered such as when something changes in the network topology. Therefore, when a network has converged, the FIB and adjacency tables contain all the information a router would have to consider when forwarding a packet. The FIB contains pre-computed reverse lookups, next hop information for routes including the interface and Layer 2 information. Cisco Express Forwarding is the fastest forwarding mechanism and the preferred choice on Cisco routers.

Loopback interfaces
-------------------
 
 Multiple loopback interfaces can be enabled on a router. The IPv4 address for each loopback interface must be unique and unused by any other interface.

configure loopback interface
----------------------------
  
.. code::

   Router(config)# interface loopback 0
   Router(config-if)# ip address 10.0.0.1 255.255.255.0
   Router(config-if)# exit


Filtering parameters
--------------------

Used after the pipe are:

section
 Shows entire section that starts with the filtering expression
 .. highlight::
 R1# show running-config | section line vty

include
 Includes all output lines that match the filtering expression
 .. highlight::
 R1# show ip interface brief | include up


exclude
 Excludes all output lines that match the filtering expression
 .. highlight::
 R1# show ip interface brief | exclude unassigned

begin
 hows all the output lines from a certain point, starting with the line that matches the filtering expression
 .. highlight::
 R1# show ip route | begin Gateway
 R1# show running-config | begin line

 
History commands
----------------
set/show history
 .. code::
    
    R1# terminal history size 200
    R1# show history


Show command examples
---------------------

show interfaces
 .. code::
 
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
 .. code::

	SW1#show ip interface
	Vlan1 is up, line protocol is up
	  Internet address is 10.10.10.2/24
	  Broadcast address is 255.255.255.255 
	  Address determined by setup command 
	  MTU is 1500 bytes 
	  Helper address is not set
	  Directed broadcast forwarding is disabled 
	  Outgoing access list is not set 
	  Inbound  access list is not set 
	  Proxy ARP is enabled 
	  Local Proxy ARP is disabled 
	  Security level is default 
	  Split horizon is enabled 
	  ICMP redirects are always sent 
	  ICMP unreachables are always sent 
	  ICMP mask replies are never sent 
	  IP fast switching is disabled 
	  IP fast switching on the same interface is disabled 
	  IP Null turbo vector 
	  IP multicast fast switching is disabled 
	  IP multicast distributed fast switching is disabled 
	  IP route-cache flags are None 
	  Router Discovery is disabled 
	  IP output packet accounting is disabled 
	  IP access violation accounting is disabled 
	  TCP/IP header compression is disabled 
	  RTP/IP header compression is disabled 
	  Probe proxy name replies are disabled 
	  Policy routing is disabled 
	  Network address translation is disable 
	  WCCP Redirect outbound is disabled 
	  WCCP Redirect inbound is disabled 
	  WCCP Redirect exclude is disabled 
	  BGP Policy Mapping is disabled    

show ip int brief
 .. code::

    RTA(config)#do show ip int brief
     Interface              IP-Address      OK? Method Status                Protocol 
     GigabitEthernet0/0     10.10.10.1      YES manual up                    up 
     GigabitEthernet0/1     10.10.20.1      YES manual up                    up 
     Vlan1                  unassigned      YES unset  administratively down down 

show ip interface
 .. code::

    RTA(config)#do show ip interface
     GigabitEthernet0/0 is up, line protocol is up (connected)
       Internet address is 10.10.10.1/24
       Broadcast address is 255.255.255.255
       Address determined by setup command
       MTU is 1500 bytes
       Helper address is not set
       Directed broadcast forwarding is disabled
       Outgoing access list is not set
       Inbound  access list is not set
       Proxy ARP is enabled
       Security level is default
       Split horizon is enabled
       ICMP redirects are always sent
       ICMP unreachables are always sent
       ICMP mask replies are never sent
       IP fast switching is disabled
       IP fast switching on the same interface is disabled
       IP Flow switching is disabled
       IP Fast switching turbo vector
       IP multicast fast switching is disabled
       IP multicast distributed fast switching is disabled
       Router Discovery is disabled
       IP output packet accounting is disabled
       IP access violation accounting is disabled
       TCP/IP header compression is disabled
       RTP/IP header compression is disabled
       Probe proxy name replies are disabled
       Policy routing is disabled
       Network address translation is disabled
       BGP Policy Mapping is disabled
       Input features: MCI Check
       WCCP Redirect outbound is disabled
       WCCP Redirect inbound is disabled
       WCCP Redirect exclude is disabled
     GigabitEthernet0/1 is up, line protocol is up (connected)
       Internet address is 10.10.20.1/24
       Broadcast address is 255.255.255.255
       Address determined by setup command
       MTU is 1500 bytes
       Helper address is not set
       Directed broadcast forwarding is disabled
       Outgoing access list is not set
       Inbound  access list is not set
       Proxy ARP is enabled
       Security level is default
       Split horizon is enabled
       ICMP redirects are always sent
       ICMP unreachables are always sent
       ICMP mask replies are never sent
       IP fast switching is disabled
       IP fast switching on the same interface is disabled
       IP Flow switching is disabled
       IP Fast switching turbo vector
       IP multicast fast switching is disabled
       IP multicast distributed fast switching is disabled
       Router Discovery is disabled
       IP output packet accounting is disabled
       IP access violation accounting is disabled
       TCP/IP header compression is disabled
       RTP/IP header compression is disabled
       Probe proxy name replies are disabled
       Policy routing is disabled
       Network address translation is disabled
       BGP Policy Mapping is disabled
       Input features: MCI Check
       WCCP Redirect outbound is disabled
       WCCP Redirect inbound is disabled
       WCCP Redirect exclude is disabled
     Vlan1 is administratively down, line protocol is down
       Internet protocol processing disabled

show ip route
 .. code:: 
    
    RTA(config)#do show ip route
    Codes: L - local, C - connected, S - static, R - RIP, M - mobile, B - BGP
           D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area
           N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
           E1 - OSPF external type 1, E2 - OSPF external type 2, E - EGP
           i - IS-IS, L1 - IS-IS level-1, L2 - IS-IS level-2, ia - IS-IS inter area
           * - candidate default, U - per-user static route, o - ODR
           P - periodic downloaded static route
    -- 
    Gateway of last resort is not set
    --
         10.0.0.0/8 is variably subnetted, 4 subnets, 2 masks
    C       10.10.10.0/24 is directly connected, GigabitEthernet0/0
    L       10.10.10.1/32 is directly connected, GigabitEthernet0/0
    C       10.10.20.0/24 is directly connected, GigabitEthernet0/1
    L       10.10.20.1/32 is directly connected, GigabitEthernet0/1

show ip route connected
 .. code::

    RTA(config)#do show ip route connected
     C   10.10.10.0/24  is directly connected, GigabitEthernet0/0
     C   10.10.20.0/24  is directly connected, GigabitEthernet0/1

ARP - Neighbor Advertisement/Sollicitation
------------------------------------------
A similar process is used for IPv6 packets. Instead of the ARP process, IPv6 address resolution uses ICMPv6 Neighbor Solicitation and Neighbor Advertisement messages. IPv6-to-MAC address mapping are kept in a table similar to the ARP cache, called the neighbor cache.

MAC addresses on Serial Interfaces
----------------------------------
When the interface is a point-to-point (P2P) serial connection, the router encapsulates the IPv4 packet into the proper data link frame format used by the exit interface (HDLC, PPP, etc.). Because there are no MAC addresses on serial interfaces, R2 sets the data link destination address to an equivalent of a broadcast.
The router does not need to know any info about the destination L2 address, so the router just sends the frame out the corresponding serial interface. No source address is required on a P2P serial connection

HDLC frames can be transmitted over synchronous or asynchronous serial communication links. Those links have no mechanism to mark the beginning or end of a frame, so the beginning and end of each frame has to be identified. This is done by using a frame delimiter, or flag, which is a unique sequence of bits that is guaranteed not to be seen inside a frame.
This sequence is '01111110', or, in hexadecimal notation, 0x7E. Each frame begins and ends with a frame delimiter. A frame delimiter at the end of a frame may also mark the start of the next frame.
A sequence of 7 or more consecutive 1-bits within a frame will cause the frame to be aborted.

+-------++------+-------+--------+-----------------+---+-------+
|Flag 7E|Address|Control|Protocol|        Data     |FCS|Flag 7E|
+-------+-------+-------+--------+-----------------+---+-------+
|8 bits |8 bits | 8 bits| 16 bits|~ length 0 or x*8|16b| 8 bits|
+-------+-------+-------+--------+-----------------+---+-------+

The Address field is used to specify the type of packet contained in the cHDLC frame; 0x0F for Unicast and 0x8F for Broadcast packets.
The Control field is always set to zero (0x00).
The Protocol Code field is used to specify the protocol type encapsulated within the cHDLC frame (e.g. 0x0800 for Internet Protocol).

Packet Forwarding Decision Process
----------------------------------

Directly Connected Interface?
Yes -> Check ARP cache (ARP request if necessary) and forward to host on local subnet
Remote Network? Yes -> Encapsulate the frame and forward out of the exit interface to the next hop
else Gateway of last resort or drop

Routing BEST PATH selection
---------------------------

RIP
 Routing Information Protocol - Hop count

OSPF
 Open Shortest Path First     - Cisco’s cost based on CUMULATIVE bandwidth from source to destination

EIGRP
 Enhanced Interior Gateway Routing Protocol - Bandwidth, delay, load, reliability (bladder)

.. note::
     two or more paths with identical metrics = LOAD BALANCING

.. note::
     Equal cost load balancing can be cfd to use both dynamic routing protocols and static routes ONLY EIGRP support UNEQUAL COST LOAD BALANCING

ADMINISTRATIVE DISTANCE
-----------------------
For example, if both RIP and EIGRP are configured on a router, both routing protocols may learn of the same destination network.
However, each routing protocol may decide on a different path to reach the destination based on that routing protocol’s metrics.
RIP chooses a path based on hop count, whereas EIGRP chooses a path based on its composite metric. How does the router know which route to use?

Cisco IOS uses what is known as the administrative distance (AD) to determine the route to install into the IP routing table.
The AD represents the "trustworthiness" of the route; the lower the AD,
the more trustworthy the route source. For example, a static route has an AD of 1,
whereas an EIGRP-discovered route has an AD of 90.
Given two separate routes to the same destination, the router chooses the route with the lowest AD.
When a router has the choice of a static route and an EIGRP route, the static route takes precedence.

 Default Distance Value Table

 This table lists the administrative distance default values of the protocols that Cisco supports:

 ========================================= ========================
 Routing Protocol                           Administrative distance
 ========================================= ========================
 Directly connected interface                          0
 Static route out an interface                         1
 Static route to next-hop address                      1
 DMNR - Dynamic Mobile Network Routing                 3
 EIGRP summary route                                   5
 External BGP                                          20
 Internal EIGRP                                        90
 IGRP                                                  100
 OSPF                                                  110
 IS-IS                                                 115
 Routing Information Protocol (RIP)                    120
 Exterior Gateway Protocol (EGP)                       140
 On Demand Routing (ODR)                               160
 External EIGRP                                        170
 Internal BGP                                          200
 Next Hop Resolution Protocol (NHRP)                   250
 Floating Static Route (ex. DHCP-learned)              254
 Unknown (Others)                                      255
 ========================================= ========================

 .. note::
     If the administrative distance is 255, the router does not believe the source of that route and does not install the route in the routing table.
     Since IOS 12.2, the administrative distance of a static route with an exit interface is 1.
     Only the interface itself has an administrative distance of 0, since a route cannot have a distance of less than 1.
     Directly connected routes have an administrative distance of 0.

Changing Administrative Distance
--------------------------------
When you use *route redistribution*, occasionally you need to modify the administrative distance of a protocol so that it takes precedence.
For example, if you want the router to select RIP-learned routes (default value 120) rather than IGRP-learned routes (default value 100)
to the same destination, you must increase the administrative distance for IGRP to 120+,
or decrease the administrative distance of RIP to a value less than 100.

You can modify the administrative distance of a protocol through the distance command in the routing process subconfiguration mode.
This command specifies that the administrative distance is assigned to the routes learned from a particular routing protocol.
You need to use this procedure generally when you migrate the network from one routing protocol to another,
and the latter has a higher administrative distance. However, a change in the administrative distance *can lead to routing loops and black holes*.

.. warning::
    use caution if you change the administrative distance.

.. code::

    R1(config)#router eigrp 10
    R1(config-router)#distance eigrp xx yy

    where xx representes the new value of internal administrative distance and yy representes the new value of the external administrative distance.

example of changing AD for rip
------------------------------

Here is an example that shows two routers, R1 and R2, connected through Ethernet. The loopback interfaces of the routers are also advertised with RIP and IGRP on both the routers.
You can observe that the IGRP routes are preferred over the RIP routes in the routing table because the administrative distance is 100.

.. code::
	
    R1#show ip route
     
    Gateway of last resort is not set
     
    172.16.0.0/24 is subnetted, 1 subnets
    C 172.16.1.0 is directly connected, Ethernet0
    I 10.0.0.0/8 [100/1600] via 172.16.1.200, 00:00:01, Ethernet0
    C 192.168.1.0/24 is directly connected, Loopback0
     
    R2#show ip route
     
    Gateway of last resort is not set
     
    172.16.0.0/24 is subnetted, 1 subnets
    C 172.16.1.0 is directly connected, Ethernet0
    C 10.0.0.0/8 is directly connected, Loopback0
    I 192.168.1.0/24 [100/1600] via 172.16.1.100, 00:00:33,

In order to enable the router to prefer RIP routes to IGRP, configure the distance command on R1 like this:

.. code::
 
 R1(config)#router rip
 R1(config-router)#distance 90

Now look at the routing table. The routing table shows that the router prefers the RIP routes. The router learns RIP routes with an administrative distance of 90, although the default is 120.

.. note::
    The new administrative distance value is relevant only to the routing process of a single router (in this case R1). R2 still has IGRP routes in the routing table.

.. code::

    R1#show ip route
     
    Gateway of last resort is not set
     
    172.16.0.0/24 is subnetted, 1 subnets
    C 172.16.1.0 is directly connected, Ethernet0
    R 10.0.0.0/8 [90/1] via 172.16.1.200, 00:00:16, Ethernet0
    C 192.168.1.0/24 is directly connected, Loopback0
     
    R2#show ip route
     
    Gateway of last resort is not set
     
    172.16.0.0/24 is subnetted, 1 subnets
    C 172.16.1.0 is directly connected, Ethernet0
    C 10.0.0.0/8 is directly connected, Loopback0
    I 192.168.1.0/24 [100/1600] via 172.16.1.100, 00:00:33,

.. note::
    There are no general guidelines to assign administrative distances because each network has varied requirements. You must determine a reasonable matrix of administrative distances for the network as a whole. Similarly, a directly connected route with an AD of 0 takes precedence over a static route with an AD of 1.

Other applications of A.D.
--------------------------

One common reason to change the administrative distance of a route is when you use *Static Routes to backup an existing IGP route*.
This is normally used to bring up a backup link when the primary fails.

For example, assume that you use the routing table from R1. However, in this case,
there is also an ISDN line that you can use as a backup if the primary connection fails. Here is an example of a Floating Static for this route:

.. code::

    ip route 10.0.0.0 255.0.0.0 Dialer 1 250   
    !--- Note: The Administrative Distance is set to 250.

If the Ethernet interfaces fail, or if you manually bring down the Ethernet interfaces, the floating static route is installed into the routing table. All traffic destined for the 10.0.0.0/8 network is then routed out of the Dialer 1 interface and over the backup link.
The routing table appears similar to this after the failure:

.. code::

    R1#show ip route
    Gateway of last resort is not set
    172.16.0.0/24 is subnetted, 1 subnets
    C 172.16.1.0 is directly connected, Ethernet0
    S 10.0.0.0/8 is directly connected, Dialer1
    C 192.168.1.0/24 is directly connected, Loopback0

Directly Connected n Remote Network Routes
------------------------------------------

    Directly connected routes
	 These routes come from the active router interfaces. Routers add a directly connected route when an interface is configured with an IP address and is activated.

    Remote routes
	 These are remote networks connected to other routers. Routes to these networks can either be statically configured or dynamically learned through dynamic routing protocols.

The sources of the routing table entries are identified by a *code*. The code identifies how the route was learned. For instance, common codes include:

   * L - Identifies the address assigned to a router’s interface.
	This allows the router to efficiently determine when it receives a packet for the interface instead of being forwarded.

   * C - Identifies a directly connected network.

   * S - Identifies a static route created to reach a specific network.

   * D - Identifies a dynamically learned network from another router using EIGRP.

   * O - Identifies a dynamically learned network from another router using the OSPF routing protocol.


D 10.1.1.0/24 [90/2170112] via 209.165.200.226, 00:00:05, Serial0/0/0

   * Route source - Identifies how the route was learned.

   * Destination network - Identifies the address of the remote network.

   * Administrative distance - Identifies the trustworthiness of the route source. Lower values indicate preferred route source.

   * Metric - Identifies the value assigned to reach the remote network. Lower values indicate preferred routes.

   * Next-hop - Identifies the IPv4 address of the next router to forward the packet to.

   * Route timestamp - Identifies how much time has passed since the route was learned.

   * Outgoing interface - Identifies the exit interface to use to forward a packet toward the final destination.
