DiffServ QoS Traffic-Shaping Testbed with Per-Class Latency/Jitter Benchmarking

A network traffic-shaping testbed engineered with Linux Traffic Control (tc), Hierarchical Token Bucket (HTB), and Fair Queueing CoDel (fq_codel). The testbed classifies mixed concurrent network flows (Voice, Video, and Bulk data) using Differentiated Services (DiffServ) DSCP bits and benchmarks per-class latency, jitter, and loss during bottleneck congestion.

Key Technical Highlights

    Zero Virtualization Overhead: Built entirely with native Linux network namespaces (ip netns) and virtual Ethernet pairs (veth), allowing microsecond-accurate benchmarking with zero VM hypervisor jitter.

    Granular DiffServ Classification: Uses kernel-level u32 traffic classifiers matching against the IP Type of Service (ToS) / DSCP octet.

    Hierarchical Bandwidth Guarantees: Enforces parent-child HTB scheduling classes to ensure dedicated minimum rates (rate) while enabling burst borrowing up to link capacity (ceil).

    Active Queue Management (AQM): Couples leaf queues with fq_codel to neutralize bufferbloat, isolate micro-bursts, and maintain sub-millisecond queuing delay for high-priority traffic.

    Fully Automated Benchmarking Suite: Single-command orchestrator automating iperf3 multi-port daemon provisioning, concurrent flow transmission, JSON metric aggregation, and Matplotlib chart generation.


Prerequisites & Installation

System Requirements

    Ubuntu 20.04 / 22.04 / 24.04 LTS

    Python 3.10 or later

    Sudo administrative access (for Linux netns and iproute2 manipulation)


diffserv-qos-traffic-shaping

├── setup_topo.sh           # Builds 3-node netns topology and veth interface routing

├── qos_engine.sh           # Manages kernel tc HTB trees, leaf AQMs, and u32 filters

├── benchmark.py            # Concurrent traffic orchestrator and JSON KPI parser

├── plot_kpis.py            # Generates comparative PNG bar charts via Matplotlib

├── benchmark_results.json  # Raw measured JSON performance metrics

├── kpi_comparison.png      # Rendered KPI benchmark charts

├── requirements.txt        # Python dependency manifest

└── README.md               # Engineering documentation and runbook


