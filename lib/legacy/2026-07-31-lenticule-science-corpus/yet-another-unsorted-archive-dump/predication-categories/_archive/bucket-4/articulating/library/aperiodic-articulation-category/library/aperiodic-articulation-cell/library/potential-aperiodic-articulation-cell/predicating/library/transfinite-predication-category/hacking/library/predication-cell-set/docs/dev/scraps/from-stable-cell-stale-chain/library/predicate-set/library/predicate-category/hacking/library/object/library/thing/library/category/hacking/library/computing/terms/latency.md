---
title: "latency"
aliases:
  - network latency
  - round-trip time
date-created: 2026-04-03
description: "The time delay between a request and its response, especially in network communication. The primary constraint on interactive remote work."
---

**Latency** is the time elapsed between initiating an action and receiving the result. In computing, it most commonly refers to network latency — the round-trip time for a packet to travel from one machine to another and back. It is measured in milliseconds (ms).

Latency is distinct from bandwidth. Bandwidth is the volume of data a connection can carry per unit time (measured in megabits per second). Latency is the delay before data arrives regardless of volume. A connection with high bandwidth and high latency can transfer large files quickly once the transfer starts, but each individual request still waits for the round-trip delay. For interactive work — keystrokes, editor commands, file operations — latency matters more than bandwidth because every action requires a round trip.

The primary determinants of network latency are physical distance (light in fiber travels at roughly 200,000 km/s, adding ~1 ms per 100 km of cable), number of network hops (each router adds processing delay), and protocol overhead (encryption, connection establishment). Geographic proximity between endpoints is the strongest lever for reducing latency.

Human-perceptible latency thresholds for interactive computing:
- Under 50 ms: feels instantaneous
- 50–100 ms: noticeable but tolerable
- 100–200 ms: sluggish, disrupts flow
- Over 200 ms: unusable for interactive editing

Latency is the critical tradeoff in remote development environments. A developer editing code on a remote server experiences the network round-trip time on every keystroke and file operation. A 2025 industry survey found 53% of remote developers cited latency as a limiting factor, up from 32% the prior year — reflecting the growing adoption of remote development setups where the latency problem is inescapable.
