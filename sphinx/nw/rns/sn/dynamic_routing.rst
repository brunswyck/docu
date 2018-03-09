
..
    # with overline, for parts
    * with overline, for chapters
    =, for sections
    -, for subsections
    ^, for subsubsections
    “, for paragraphs

Dynamic Routing
===============

Only RIPv1 and IGRP are classful.
The fact that RIPv1 and IGRP do not include subnet mask information in their updates means that they cannot provide variable-length subnet masks (VLSMs) and classless interdomain routing (CIDR)

Classful routing protocols also create problems in discontiguous networks. A discontiguous network is when subnets from the same classful major network address are separated by a different classful network address.


Distance Vector vs Link State
-----------------------------

+------------------------------+--------+--------+--------+----------+---------+---------+
|                              | RIPv1  | RIPv2  | IGRP   | EIGRP    | OSPF    | IS-IS   |
+==============================+========+========+========+==========+=========+=========+
| Speed of Convergence         | Slow   | Slow   | Slow   | Fast     | Fast    | Fast    |
+------------------------------+--------+--------+--------+----------+---------+---------+
| Scalability - Size of NW     | Small  | Small  | Small  | Large    | Large   | Large   |
+------------------------------+--------+--------+--------+----------+---------+---------+
| Use of VLSM                  | No     | [Yes]  | No     | Yes      | Yes     | Yes     |
+------------------------------+--------+--------+--------+----------+---------+---------+
| Resource Usage               | Low    | Low    | Low    | [Medium] | High    | High    |
+------------------------------+--------+--------+--------+----------+---------+---------+
| Implementation n Maintenance | Simple | Simple | Simple | Complex  | Complex | Complex |
+------------------------------+--------+--------+--------+----------+---------+---------+
		 
	
Metric is based on:
 - Routing Information Protocol (RIP) - Hop count
 - Open Shortest Path First (OSPF) - Cisco’s cost based on cumulative bandwidth from source to destination
 - Enhanced Interior Gateway Routing Protocol (EIGRP) – Minimum bandwidth, delay, load, and reliability.

.. code::

   R2# debug ip rip
   R2# debug ip routing

.. note:: Distance vector routing protocols share updates between neighbors. Neighbors are routers that share a link and are configured to use the same routing protocol. The router is only aware of the network addresses of its own interfaces and the remote network addresses it can reach through its neighbors. Routers using distance vector routing are not aware of the network topology.

.. note:: Instead of using broadcasts like RIP, RIPv2 and EIGRP can use ``multicast`` addresses to reach only specific neighbor routers. EIGRP can also use a ``unicast`` message to reach one specific neighbor router. Additionally, EIGRP only sends updates when needed, instead of periodically.

RIP uses the Bellman-Ford algorithm
IGRP and EIGRP use the Diffusing Update Algorithm (DUAL) routing algorithm
Link-state routing protocols are also known as shortest path first protocols and are built around Edsger Dijkstra's shortest path first (SPF) algorithm

RFC's for routing protocols

+----------+--------------+-----------+------+------+-----------+------+------+---------------+----------------+
| protocol | rfc          | metric    | port | type | address   | type | VLSM | summarization | authentication |
+==========+==============+===========+======+======+===========+======+======+===============+================+
| RIP      | :rfc: `1058` | hop count | 520  | udp  | 224.0.0.9 | bx   | no   | no            | no             |
+----------+--------------+-----------+------+------+-----------+------+------+---------------+----------------+
| RIPv2    | :rfc: `2453` | hop count | 520  | udp  | 224.0.0.9 | mc   | yes  | yes           | yes            |

				BDLR					BW,Delay,Load,Reliability
AD							120
metric		15 hops			15 hops
updates		255.255.255.255 	224.0.0.9			224.0.0.10
									90 seconds
VLSM		X			V
CIDR		X			V
Summarization	X			V
Authentication  X			V

for more info on RIPv2 see
:rfc: `2453`
or view <https://www.rfc-editor.org/rfc/rfc2453.txt> for full info

EIGRP

    Bounded triggered updates - Only routing table changes are propagated, whenever a change occurs. Bounded triggered updates means that EIGRP only sends to the neighbors that need it. 

    Hello keepalive mechanism - A small Hello message is periodically exchanged to maintain adjacencies with neighboring routers.

    Maintains a topology table - Maintains all the routes received from neighbors (not only the best paths) in a topology table. DUAL can insert backup routes into the EIGRP topology table.

    Rapid convergence - In most cases, it is the fastest IGP to converge because it maintains ALTERNATE routes, enabling almost instantaneous convergence. If a primary route fails, the router can use the already identified alternate route. The switchover to the alternate route is immediate and does not involve interaction with other routers.

    Multiple network layer protocol support - EIGRP uses Protocol Dependent Modules (PDM), which means that it is the only protocol to include support for protocols other than IPv4 and IPv6

Set the administrative distance for RIPv2. This forces RA to choose RIP routes over EIGRP routes

	RA(config)# router rip
	RA(config-router)# distance 89

Link-State Routing Process (process OSPF IPv4 = IPv6)

	Each router learns about each of its own directly connected networks
	Each router is responsible for "saying hello" to its neighbors on directly connected networks
	Each router builds a Link-State Packet (LSP) containing the state of each directly connected link
	Each router floods the LSP to all neighbors who then store all LSP's received in a database
	Each router uses the database to construct a complete map of the topology and computes the best path to each destination network

Link and Link-State

  IF must have IPv4 address n SM. must me up and IF must be included in one of the network router config statements

    The interface's IPv4 address and subnet mask
    The type of network, such as Ethernet (broadcast) or Serial point-to-point link
    The cost of that link
    Any neighbor routers on that link

Cisco’s implementation of OSPF specifies the OSPF routing metric as the cost of the link based on the bandwidth of the outgoing interface

When two link-state routers learn that they are neighbors, they form an adjacency.
These small Hello packets continue to be exchanged between two adjacent neighbors and serve as a keepalive function to monitor the state of the neighbor.
If a router stops receiving Hello packets from a neighbor, that neighbor is considered unreachable and the adjacency is broken. 

Each router floods its link-state information to all other link-state routers in the routing area. Whenever a router receives an LSP from a neighboring router, it immediately sends that LSP out all other interfaces except the interface that received the LSP. This process creates a flooding effect of LSPs from all routers throughout the routing area

Link-state routing protocols calculate the SPF algorithm after the flooding is complete. As a result, link-state routing protocols reach convergence very quickly

sequence numbers and aging information, to help manage the flooding process. This information is used by each router to determine if it has already received the LSP from another router or if the LSP has newer information

With a complete link-state database, R1 can now use the database and the shortest path first (SPF) algorithm to calculate the preferred path or shortest path to each network resulting in the SPF tree. 

Building the SPF_Tree
---------------------
Each router constructs its own SPF tree independently from all other routers. To ensure proper routing, the link-state databases used to construct those trees must be identical on all routers.


Advantages of link-state routing protocols
------------------------------------------

    Builds a Topological Map
	Link-state routing protocols create a topological map, or SPF tree, of the network topology.
	Because link-state routing protocols exchange link-states, the SPF algorithm can build an SPF tree of the network.
	Using the SPF tree, each router can independently determine the shortest path to every network.

    Fast Convergence
	When receiving an LSP, link-state routing protocols immediately flood the LSP out all interfaces except for the interface from which the LSP was received.
	In contrast, RIP needs to process each routing update and update its routing table before flooding them out other interfaces.

    Event-driven Updates
	After the initial flooding of LSPs, link-state routing protocols only send out an LSP when there is a change in the topology.
	The LSP contains only the information regarding the affected link. Unlike some distance vector routing protocols, link-state routing protocols do not send periodic updates.

    Hierarchical Design
	Link-state routing protocols use the concept of areas.
	Multiple areas create a hierarchical design to networks, allowing for better route aggregation (summarization) and the isolation of routing issues within an area.

Disadvantages of Link-State Protocols
------------------------------------------

	additional memory to create and maintain the LS database and SPF tree
	more CPU for SPF algorithm because LS Protocols build a complete topology map
	can use a lot of BW during initial startup

The use and configuration of multiple areas can reduce the size of the link-state databases. Multiple areas can limit the amount of link-state information flooding in a routing domain and send LSPs only to those routers that need them. When there is a change in the topology, only those routers in the affected area receive the LSP and run the SPF algorithm. This can help isolate an unstable link to a specific area in the routing domain. 

Only those routers in area 51 need to update their link-state databases, rerun the SPF algorithm, create a new SPF tree, and update their routing tables. Routers in other areas learn that this route is down, but this is done with a type of LSP that does not cause them to rerun their SPF algorithm. Routers in other areas can update their routing tables directly. 


reset the adjacencies and use the new router ID
R1(config-t)# clear ip ospf process

