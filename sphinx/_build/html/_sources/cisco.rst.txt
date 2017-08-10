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

important concepts
==================
 Topology
  The physical topology is the arrangement of the cables, network devices, and end systems. It describes how the network devices are actually interconnected with wires and cables. The logical topology is the path over which the data is transferred in a network. It describes how the network devices appear connected to network users.
 
 Speed
  Is a measure of the data rate in bits per second (b/s) of a given link in the network.

 Cost
  Indicates the general expense for purchasing of network components, and installation and maintenance of the network.

Types of switching
==================  
Process Switching
-----------------
#. An older packet forwarding mechanism still available for Cisco routers. When a packet arrives on an interface, it is forwarded to the control plane where the CPU matches the destination address with an entry in its routing table, and then determines the exit interface and forwards the packet. It is important to understand that the router does this for every packet, even if the destination is the same for a stream of packets. This process-switching mechanism is very slow and rarely implemented in modern networks.
    
#. Fast switching - This is a common packet forwarding mechanism which uses a fast-switching cache to store next-hop information. When a packet arrives on an interface, it is forwarded to the control plane where the CPU searches for a match in the fast-switching cache. If it is not there, it is process-switched and forwarded to the exit interface. The flow information for the packet is also stored in the fast-switching cache. If another packet going to the same destination arrives on an interface, the next-hop information in the cache is re-used without CPU intervention.

#. Cisco Express Forwarding (CEF) - CEF is the most recent and preferred Cisco IOS packet-forwarding mechanism. Like fast switching, CEF builds a Forwarding Information Base (FIB), and an adjacency table. However, the table entries are not packet-triggered like fast switching but change-triggered such as when something changes in the network topology. Therefore, when a network has converged, the FIB and adjacency tables contain all the information a router would have to consider when forwarding a packet. The FIB contains pre-computed reverse lookups, next hop information for routes including the interface and Layer 2 information. Cisco Express Forwarding is the fastest forwarding mechanism and the preferred choice on Cisco routers.

Just to test
