.. include:: ../../../_static/global.rst


Static Routes
=============

ipv4 syntax
-----------
.. code::

    Router(config)# ip route network mask { next-hop-ip | exit-intf }

A static route is identified in the routing table with the code ‘S’.

To configure an IPv4 default static route, use the following command:

.. code::

    Router(config)# ip route 0.0.0.0 0.0.0.0 { exit-intf | next-hop-ip } 

combination of exit interface and next hop
------------------------------------------
.. code::

    R2(config)# ip route 192.168.2.0 255.255.255.0 s0/0/1 192.168.1.1


When to Use Static Routes
-------------------------

Static routing has three primary uses:

   # Providing ease of routing table maintenance in smaller networks that are not expected to grow significantly.
   # Routing to and from stub networks. A STUB NETWORK is a network accessed by a single route, and the router has ONLY ONE NEIGHBOR.
   # Using a single default route to represent a path to any network that does not have a more specific match with another route in the routing table.

   benefits:

   * Are not advertised over the network, resulting in better security
   * Use less bandwidth than dynamic routing protocols
   * Use known paths to send data

.. note:: Default routes are used to send traffic to any destination beyond the next upstream router.

Use static routes to...
 * Connect to a specific network
 * Connect a stub router
 * Summarize routing table entries
 * Create a backup route

Default static route
---------------------

.. code::

	ip route 0.0.0.0 0.0.0.0 nexthopip | exitif

.. note:: Default static routes are used when no other routes in the routing table match the packet destination IP address. In other words, when a more specific match does not exist. A common use is when connecting a company's edge router to the ISP network. When a router has only one other router to which it is connected. In this situation, the router is known as a stub router.

Summary static route
--------------------

Representing multiple networks

172.20.0.0/16
172.21.0.0/16
172.22.0.0/16
172.23.0.0/16
as 172.20.0.0/14

.. code::

	ip route 172.20.0.0 255.252.0.0 nexthopip | exitif

Floating static route
---------------------

Another type of static route is a floating static route.
Floating static routes are static routes that are **used to provide a backup path to a primary static or dynamic route, in the event of a link failure.**

.. note:: The floating static route is only used when the primary route is not available.

To accomplish this, the floating static route is configured with a **higher administrative distance than the primary route**.
The administrative distance represents the trustworthiness of a route.
If multiple paths to the destination exist, the router will choose the path with the lowest administrative distance. 

The next hop can be identified by an IP address, exit interface, or both. How the destination is specified creates one of the three following route types:

    Next-hop route
	 Only the next-hop IP address is specified

    Directly connected static route
	 Only the router exit interface is specified

    Fully specified static route
	 The next-hop IP address and exit interface are specified
	 
.. code::

	ip route 172.16.1.0 255.255.255.0 G0/1 172.16.2.2

Fully Specified Static Route
----------------------------
In a fully specified static route, **both the exit interface and the next-hop IP** address are specified.
This is another type of static route that is *used in older IOSs, prior to CEF.*

.. note:: This form of static route is used when the exit interface is a multi-access interface and it is necessary to explicitly identify the next hop.

The next hop must be directly connected to the specified exit interface.

example
^^^^^^^

.. code-block:: html

                               PC2
                                |
                                |_
               172.16.1.0/24   |__|
                                 |              
                                 |  
                             G0/0|.1    
                                _|__
                               (_R2_)
                       S0/0/0 /.2 .2\ S0/0/1
                             /       \ DCE
               172.16.2.0/24/         \/\
                           /             \  192.168.1.0/24
                        .1/               \.1      
            __           /__S0/0/0  S0/0/1_\        __
  PC1------|__|---------(_R1_) DCE      (_R3_)-----|__|----PC3
                   G0/0  .1           .1 G0/0
        
         172.16.3.0/24                  192.168.2.0/24

Suppose that the network link between R1 and R2 is an Ethernet link and that the GigabitEthernet 0/1 interface of R1 is connected to that network,
as shown in Figure 1. CEF is not enabled.
To eliminate the recursive lookup,(map a next hop ip to what interface that is = if CEF not enabled)
a directly connected static route can be implemented using the following command:

.. code::

    R1(config)# ip route 192.168.2.0 255.255.255.0 GigabitEthernet 0/1

However, this may cause unexpected or inconsistent results. The difference between an Ethernet multi-access network and a point-to-point serial network is that a point-to-point serial network has only one other device on that network, the router at the other end of the link. With Ethernet networks, there may be many different devices sharing the same multi-access network, including hosts and even multiple routers. By only designating the Ethernet exit interface in the static route, the router will not have sufficient information to determine which device is the next-hop device.

R1 knows that the packet needs to be encapsulated in an Ethernet frame and sent out the GigabitEthernet 0/1 interface. However, R1 does not know the next-hop IPv4 address; therefore, it cannot determine the destination MAC address for the Ethernet frame.

Depending upon the topology and the configurations on other routers, this static route may or may not work. It is recommended that when the exit interface is an Ethernet network, that a fully specified static route is used, including both the exit interface and the next-hop address.

.. code::

    R3(config)# ip route 172.16.1.0 255.255.255.0 s0/0/1 192.168.1.2

As shown in Figure 2, when forwarding packets to R2, the exit interface is GigabitEthernet 0/1 and the next-hop IPv4 address is 172.16.2.2.

.. note:: With the use of CEF, a fully specified static route is no longer necessary. A static route using a next-hop address should be used.

.. code::

    R1(config)# ip route 0.0.0.0 0.0.0.0 172.16.2.2

    R1#show ip route static
    
    
    R1(config)#do show ip route static
         172.31.0.0/16 is variably subnetted, 7 subnets, 5 masks
    S       172.31.0.0/24 [1/0] via 172.31.1.193
    S       172.31.1.128/26 [1/0] via 172.31.1.193
    S       172.31.1.196/30 [1/0] via 172.31.1.193
    
    R2(config)#ip route 172.31.1.0 255.255.255.128 S0/0/0
    %Default route without gateway, if not a point-to-point interface, may impact performance
    
    R2#show ip route ?
      WORD       Network to display information about or hostname
      bgp        Border Gateway Protocol (BGP)
      connected  Connected
      eigrp      Enhanced Interior Routing Protocol (EIGRP)
      ospf       Open Shortest Path First (OSPF)
      rip        Routing Information Protocol (RIP)
      static     Static routes
      summary    Summary of all routes
      |          Output Modifiers
      <cr>
    
    R2#show ip route connected
     C   172.31.0.0/24  is directly connected, GigabitEthernet0/0
     C   172.31.1.192/30  is directly connected, Serial0/0/0
     C   172.31.1.196/30  is directly connected, Serial0/0/1
    
    
    R3(config)#ip route 0.0.0.0 0.0.0.0 Serial 0/0/1
    %Default route without gateway, if not a point-to-point interface, may impact performance
    R3(config)#
    
ipv6 static routing
-------------------

.. code::

    R1(config)# ipv6 unicast-routing
    R1(config)# show ipv6 route

    R1#ping ipv6 2001.DB8:ACAD:4::2
    R1(config)# ipv6 route 2001.DB8:ACAD:2::/64 2001.DB8:ACAD:4::2
    
    R1(config)# show ipv6 route

As with IPv4, before any packet is forwarded by the router, the routing table process must resolve the route to determine the exit interface to use to forward the packet. The route resolvability process will vary depending upon the type of forwarding mechanism being used by the router. CEF (Cisco Express Forwarding) is the default behavior on most platforms running IOS 12.0 or later.

When a packet is destined for the 2001:DB8:ACAD:3::/64 network, R1:
 
  1. Looks for a match in the routing table and finds that it has to forward the packets to the next-hop IPv6 address 2001:DB8:ACAD:4::2. Every route that references only a next-hop IPv6 address and does not reference an exit interface must have the next-hop IPv6 address resolved using another route in the routing table with an exit interface.

  2. R1 must now determine how to reach 2001:DB8:ACAD:4::2; therefore, it searches a second time looking for a match. In this case, the IPv6 address matches the route for the directly connected network 2001:DB8:ACAD:4::/64 with the exit interface Serial 0/0/0. This lookup tells the routing table process that this packet is forwarded out of that interface.

.. warning::
  Therefore, it actually takes two routing table lookup processes to forward any packet to the 2001:DB8:ACAD:3::/64 network. When the router has to perform multiple lookups in the routing table before forwarding a packet, it is performing a process known as a recursive lookup.

.. note::
   A recursive static IPv6 route is valid (that is, it is a candidate for insertion in the routing table) only when the specified next hop resolves, either directly or indirectly, to a valid exit interface.

ipv6 default static route
-------------------------


.. code-block:: html                                                                                                                                      
                                                                                                                                                        
                             PC2                                                                                                                        
                              |                                                                                                                         
                              |_                                                                                                                        
      2001:db8:acad:2::/64   |__|                                                                                                                       
                               |                                                                                                                        
                               |                                                                                                                        
                           G0/0|:1                                                                                                                      
                              _|__                                                                                                                      
                             (_R2_)                                                                                                                     
                     S0/0/0 /2 :2\ S0/0/1                                                                                                              
                           /       \ DCE                                                                                                                
                          /         \/\                                                                                                                
    2001:db8:acad:4::/64 /             \  2001:db8:acad:5::/64                                                                              
                      :1/               \:1                                                                                                             
          __           /__S0/0/0  S0/0/1_\        __                                                                                                    
 PC1-----|__|---------(_R1_) DCE      (_R3_)-----|__|----PC3                                                                                            
                 G0/0  :1           :1 G0/0                                                                                                             
                                                                                                                                                        
    2001:db8:acad:1::/64             2001:db8:acad:3::/64                                                                              

.. code::

    R1(config)# ipv6 route ::/0 s0/0/0

.. note:: The ‘S’ signifies that the route source is a static route. Unlike the IPv4 static route, there is no asterisk (*) or Gateway of Last Resort explicitly identified. 

.. code::

    ipv6 route ipv6-prefix/prefix-length {ipv6-address|interface-type interface-number}
    -
    R2(config)# ipv6 route 2001:0DB8:ACAD:1::/64 2001:0DB8:ACAD:3::1
    R2(config)# ipv6 route 2001:0DB8:ACAD:2::/64 s0/0/0

Router is only connected to R2 = stub router = default static route

.. code::
   
    R1(config)#ipv6 route ::/0 2001:DB8:ACAD:4::2


verify a default static route
-----------------------------

.. code::

    R1# show ipv6 route static
    
    R1# ping 2001:DB8:ACAD:4::2 source 2001:DB8:ACAD:1::2

Troubleshooting a missing route
-------------------------------

 #. ping
 #. traceroute
 #. show ip route
 #. show ip interface brief
 #. show cdp neighbors detail

Solve a connectivity problem
----------------------------

 #. ping 192.168.2.1 source g0/0
 #. traceroute 192.168.2.1
 #. show ip route | begin Gateway
 #. show running-config | section ip route

.. note:: In a recursive static route, only the next-hop IPv6 address is specified. As a consequence, the router must perform a recursive route table lookup to find an exit interface associated with the network of the IPv6 address.

.. note:: To test a floating static route, take down the main route/link in order to see whether the backup link appears in the routing table.

.. note:: When a static route is to be configured via the next-hop IP address, the IP address of the interface of the next router in the path to the destination is used.

.. note:: An example of a floating static route used in conjunction with the EIGRP routing protocol would be as follows.

   .. code::  

      R1(config)# ip route 192.168.10.0 255.255.255.0 95

   Notice the extra number at the end of the static route. This route only appears in the routing table if the EIGRP-learned route with an administrative distance of 90 went down. That floating static route cannot appear in the routing table when a route with a better administrative distance exists. 
