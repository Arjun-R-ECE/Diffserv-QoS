DiffServ QoS Traffic-Shaping Testbed with Per-Class Latency/Jitter Benchmarking
The system handles mixed voice, video, and bulk data traffic and prioritizes each traffic class using DSCP classification, HTB (Hierarchical Token Bucket), and FQ-CoDel.

The performance of the network is evaluated with and without QoS based on latency, jitter, packet loss, and throughput.
Technologies Used
*Linux
*Linux tc
*HTB
*FQ-CoDel
*iperf3
*D-ITG
*Wireshark
*Bash
*Python
The experiment is expected to demonstrate that DiffServ QoS with HTB and FQ-CoDel can provide preferential treatment to delay-sensitive traffic during congestion.

Expected improvements include:

Reduced voice latency
Reduced voice jitter
Lower packet loss for priority traffic
Improved video performance
Controlled bandwidth usage
Better utilization of network resources

Bulk traffic may receive lower priority when the network is congested.
