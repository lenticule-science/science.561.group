---
title: "high availability"
aliases:
  - HA
  - fault tolerance
date-created: 2026-04-03
description: "A system design principle where services continue operating despite individual component failures, achieved through redundancy and automatic failover."
---

**High availability** (HA) is a system design principle: the system continues providing service even when individual components fail. It is achieved through redundancy — running multiple instances of critical components so that when one fails, another takes over.

The standard measure is uptime percentage over a year:

| Availability | Downtime per year | Common name |
|-------------|-------------------|-------------|
| 99% | 3.65 days | "two nines" |
| 99.9% | 8.76 hours | "three nines" |
| 99.99% | 52.6 minutes | "four nines" |
| 99.999% | 5.26 minutes | "five nines" |

Each additional nine requires roughly an order of magnitude more engineering effort and cost. Most small organizations target three nines (99.9%), which allows about 9 hours of downtime per year.

The core mechanism is **failover**: when a component fails, traffic is automatically redirected to a healthy replica. This requires at minimum:
- **Multiple instances** of the component (at least two, typically three for consensus-based systems)
- **Health checking** to detect failures (heartbeat probes, typically every few seconds)
- **Automatic routing** to direct requests away from failed instances (load balancers, DNS failover, consensus protocols)

For stateful services like databases, high availability also requires **replication** — keeping data synchronized across instances so that a failover does not lose recent writes. Replication introduces its own tradeoffs: synchronous replication guarantees no data loss but adds latency to every write; asynchronous replication is faster but may lose the most recent writes during failover.

High availability is distinct from disaster recovery. HA handles component failures within a running system (a server crashes, a process dies). Disaster recovery handles the loss of an entire site or region (a datacenter goes offline). HA is automatic and measured in seconds. Disaster recovery is often manual and measured in hours.

A single server has no high availability — if it fails, the service is down until someone intervenes. The step from single-server to multi-server architecture is primarily motivated by the need for HA, not by raw capacity.
