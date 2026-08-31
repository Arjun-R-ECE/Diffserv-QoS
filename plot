import json
import matplotlib.pyplot as plt
import numpy as np

def generate_graphs():
    with open("benchmark_results.json", "r") as f:
        data = json.load(f)

    classes = ["Voice (EF)", "Video (AF41)"]
    
    jitter_no_qos = [data["no_qos"]["voice"]["jitter_ms"], data["no_qos"]["video"]["jitter_ms"]]
    jitter_with_qos = [data["with_qos"]["voice"]["jitter_ms"], data["with_qos"]["video"]["jitter_ms"]]

    loss_no_qos = [data["no_qos"]["voice"]["loss_percent"], data["no_qos"]["video"]["loss_percent"]]
    loss_with_qos = [data["with_qos"]["voice"]["loss_percent"], data["with_qos"]["video"]["loss_percent"]]

    x = np.arange(len(classes))
    width = 0.35

    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12, 5))

    ax1.bar(x - width/2, jitter_no_qos, width, label='Without QoS (FIFO)', color='#e74c3c')
    ax1.bar(x + width/2, jitter_with_qos, width, label='With DiffServ QoS (HTB)', color='#2ecc71')
    ax1.set_ylabel('Jitter (ms)')
    ax1.set_title('Per-Class Jitter Comparison')
    ax1.set_xticks(x)
    ax1.set_xticklabels(classes)
    ax1.legend()
    ax1.grid(axis='y', linestyle='--', alpha=0.7)

    ax2.bar(x - width/2, loss_no_qos, width, label='Without QoS (FIFO)', color='#e74c3c')
    ax2.bar(x + width/2, loss_with_qos, width, label='With DiffServ QoS (HTB)', color='#2ecc71')
    ax2.set_ylabel('Packet Loss (%)')
    ax2.set_title('Per-Class Packet Loss Comparison')
    ax2.set_xticks(x)
    ax2.set_xticklabels(classes)
    ax2.legend()
    ax2.grid(axis='y', linestyle='--', alpha=0.7)

    plt.tight_layout()
    plt.savefig("kpi_comparison.png", dpi=300)
    print("[SUCCESS] Graph saved as 'kpi_comparison.png'")

if __name__ == "__main__":
    generate_graphs()
