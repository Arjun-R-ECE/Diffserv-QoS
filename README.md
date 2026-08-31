DiffServ QoS Traffic-Shaping Testbed with Per-Class Latency/Jitter Benchmarking
A network traffic-shaping testbed engineered with Linux Traffic Control (tc), Hierarchical Token Bucket (HTB), and Fair Queueing CoDel (fq_codel). The testbed classifies mixed concurrent network flows (Voice, Video, and Bulk data) using Differentiated Services (DiffServ) DSCP bits and benchmarks per-class latency, jitter, and loss during bottleneck congestion.
diffserv-qos-traffic-shaping/
├── setup_topo.sh           # Builds 3-node netns topology and veth interface routing
├── qos_engine.sh           # Manages kernel tc HTB trees, leaf AQMs, and u32 filters
├── benchmark.py            # Concurrent traffic orchestrator and JSON KPI parser
├── plot_kpis.py            # Generates comparative PNG bar charts via Matplotlib
├── benchmark_results.json  # Raw measured JSON performance metrics
├── kpi_comparison.png      # Rendered KPI benchmark charts
├── requirements.txt        # Python dependency manifest
└── README.md               # Engineering documentation and runbook
Prerequisites & Installation
System Requirements

    Ubuntu 20.04 / 22.04 / 24.04 LTS

    Python 3.10 or later

    Sudo administrative access (for Linux netns and iproute2 manipulation)
