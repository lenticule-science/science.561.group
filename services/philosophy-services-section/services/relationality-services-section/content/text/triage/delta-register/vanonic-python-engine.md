---
title: "Example: Lightball/Heavyball via modulation fields"
date-created: 2026-03-04T00:00:00
---

```python
class Vanon:
    def __init__(self, name):
        self.name = name
        self.praxons = {}  # praxon_id -> modulation weight
        self.current_value = 0.0

    def register(self, praxon_id, modulation_weight=1.0):
        self.praxons[praxon_id] = modulation_weight

    def update(self, state):
        # Vanon evaluates its modulation field from all participants
        total = 0.0
        for pid, weight in self.praxons.items():
            total += state.get(pid, 0.0) * weight
        self.current_value = total / max(1, len(self.praxons))

    def propagate(self):
        # Distribute modulation value back to all participants
        return {
            pid: self.current_value * weight
            for pid, weight in self.praxons.items()
        }


class VanonicModulationEngine:
    def __init__(self):
        self.vanons = []
        self.state = {}  # praxon_id -> modulation value

    def add_vanon(self, vanon):
        self.vanons.append(vanon)
        for pid in vanon.praxons:
            if pid not in self.state:
                self.state[pid] = 0.0

    def step(self):
        # Update vanons with current praxon states
        for vanon in self.vanons:
            vanon.update(self.state)

        # Gather modulations
        deltas = {pid: 0.0 for pid in self.state}
        for vanon in self.vanons:
            for pid, delta in vanon.propagate().items():
                deltas[pid] += delta

        # Apply modulations
        for pid, delta in deltas.items():
            self.state[pid] += delta

    def snapshot(self):
        return dict(self.state)

    def trace(self, steps):
        history = {pid: [] for pid in self.state}
        for _ in range(steps):
            self.step()
            for pid in history:
                history[pid].append(self.state[pid])
        return history


# Example: Lightball/Heavyball via modulation fields
if __name__ == "__main__":
    engine = VanonicModulationEngine()

    # Define vanons (modulation fields)
    curve = Vanon("curve")
    curve.register("lightball", 1.0)
    curve.register("heavyball", -0.5)

    momentum = Vanon("momentum")
    momentum.register("lightball", 1.0)
    momentum.register("heavyball", 0.2)

    position = Vanon("position")
    position.register("lightball", -0.2)
    position.register("heavyball", -0.05)

    engine.add_vanon(curve)
    engine.add_vanon(momentum)
    engine.add_vanon(position)

    # Initialize praxon states
    engine.state["lightball"] = 2.0
    engine.state["heavyball"] = -1.0

    # Run simulation
    trace = engine.trace(100)

    # Plot
    import matplotlib.pyplot as plt
    for pid, values in trace.items():
        plt.plot(values, label=pid)
    plt.title("Vanonic Modulation: Lightball / Heavyball")
    plt.xlabel("Cycle")
    plt.ylabel("State")
    plt.legend()
    plt.grid(True)
    plt.tight_layout()
    plt.show()
```