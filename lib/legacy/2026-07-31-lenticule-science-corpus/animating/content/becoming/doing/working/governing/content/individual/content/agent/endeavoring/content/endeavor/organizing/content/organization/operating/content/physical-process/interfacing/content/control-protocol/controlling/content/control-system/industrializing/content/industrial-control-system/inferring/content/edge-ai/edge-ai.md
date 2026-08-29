---
title: Edge AI
date-created: 2026-04-04
description: Machine learning inference executed locally on edge devices (industrial gateways, IPCs) rather than in cloud data centers. The distinguishing feature is latency—edge AI enables real-time autonomous decisions in safety-critical systems.
---

Machine learning inference executed locally on industrial gateways, IPCs (Intelligent Programmable Controllers), or purpose-built edge compute devices rather than in cloud or centralized data centers.

## Distinguishing Characteristics

**Latency**: 1–10 milliseconds for inference and decision-making (compared to 50–500ms round-trip to cloud).

**Autonomy**: Continues operating even if cloud connectivity is lost, with degraded but functional capabilities.

**Safety**: Local processing is mandatory for safety-critical decisions where even small network delays would be unacceptable.
A bearing failure detection system must trigger an emergency stop in milliseconds, not seconds.

## Architecture

In the [industrial AI agent architecture](../texts/industrial-ai-agent-architecture-patterns.md), edge AI sits in **Layer 2** between the deterministic PLC (Layer 1) and cloud planning systems (Layer 3):

```
[Equipment Sensors] 
        ↓ OPC-UA
[Edge Device with AI Model]  ← runs ML inference locally, 1-10ms
        ↓ Commands via PLC
[Deterministic Control Loop]  ← certified safety systems
```

Edge devices typically run: - Computer vision for anomaly detection - Anomaly scoring models for sensor time-series - Alarm correlation and diagnosis - Caching and buffering of cloud-sourced data (ERP, supplier systems)

## Hardware

Modern edge AI platforms include: - **CPUs**: Multi-core x86 or ARM processors - **NPUs** (Neural Processing Units): Hardware accelerators for ML inference (e.g., Qualcomm Hexagon, Intel Nervana) - **GPUs**: NVIDIA GPUs with real-time guarantees (e.g., NVIDIA IGX Thor) - **Real-time operating systems**: Deterministic scheduling for time-critical inference

Hardware selection balances **throughput** (how much inference can happen per second) with **latency guarantees** (can we promise inference completes in 10ms?).

## When to Use Edge AI

**Edge AI is appropriate when:** - Detection-to-action latency must be sub-second (bearing degradation → emergency stop) - Cloud connectivity is unreliable (remote manufacturing facilities) - Regulatory compliance requires local processing (medical devices, power systems) - Data volume is too large to stream to cloud efficiently

**Cloud-based inference is appropriate when:** - Latency tolerance is seconds to minutes (batch optimization, scheduled maintenance planning) - Complex multi-step reasoning required (coordinating across multiple factories) - Retraining models frequently from new data (cloud has more compute)

## Contrast with Cloud AI

| Aspect | Edge AI | Cloud AI |
|--------|---------|----------|
| Latency | 1–10ms | 50–500ms |
| Autonomy on connectivity loss | Full autonomy | Degraded/offline |
| Hardware cost | Higher per unit | Lower; amortized across many customers |
| Model freshness | Slower updates (push new model to device) | Fast updates (redeploy cloud model) |
| Regulatory alignment | Natural fit for safety-critical | Requires additional certification |
| Compute budget | Limited (optimize for efficiency) | Abundant (can afford larger models) |

## Feedback Loop

Edge AI systems learn through a **push-pull feedback loop**:

1. **Local learning**: Detect anomalies, cache decisions and outcomes
2. **Cloud training**: Send cached observations to cloud; retrain models on aggregated data from all facilities
3. **Model push**: Deploy updated models back to edge devices
4. **Inference**: Edge devices run new models locally

This pattern avoids sending all sensor data to cloud (bandwidth prohibitive) while still enabling system-wide learning.

## Security Considerations

Edge devices are physically accessible; an attacker with local access can: - Extract trained models (though extraction-resistant hardware exists) - Inject adversarial inputs to fool the ML model - Modify commands executed by the PLC

Standard mitigations: - Secure boot and attestation (firmware verification) - Model encryption and obfuscation - Input validation before model inference - All AI decisions logged and auditable

## Market Maturity (2025-2026)

Edge AI for industrial control is transitioning from research to deployment.
Major vendors shipping edge AI platforms: - NVIDIA IGX for manufacturing and robotics - Siemens edge compute gateways (Siemens Automation Compute Engine) - Beckhoff embedded real-time systems with ML support - Rockwell Automation CompactLogix with onboard ML capabilities

Standards organizations (ISA, IEC) are developing formal safety specifications for edge AI in safety-critical systems, moving from de facto practice toward certified approaches.

---

## See Also

- [Industrial AI Agent Architecture Patterns](../texts/industrial-ai-agent-architecture-patterns.md)
- [Real-time systems](../../domains/real-time-systems/terms/real-time-system.md)
- [Functional Safety](../../../domains/safety/terms/functional-safety.md)
- [Distributed Systems](../../domains/distributed-systems/terms/distributed-system.md)
