---
title: Distribution Packet Carrier
keywords:
  - dataflow
  - packet
  - trace
layer: system
status: plan
claims:
  - type: structure
    judgement: DistributionPacketCarrier packages recognised payloads with trace/context/storage metadata
depends-on:
  - calculus/structure/trace-carrier
  - math/structure/intake-observation
  - math/structure/intake-context
  - math/structure/storage-snapshot-carrier
description: of packets assembling recognised payloads with trace identifiers, contexts, and storage metadata.
---

## Statement

There exists a carrier

```text
DistributionPacketCarrier
```

of packets assembling recognised payloads with trace identifiers, contexts, and
storage metadata.

## Construction by earned pieces

- Payloads come from intake observations/contexts (see
  [`intake-observation`](intake-observation.md) and
  [`intake-context`](intake-context.md)).
- Trace identifiers and replay data come from
  [`trace-carrier`](./trace-carrier.md).
- Storage metadata (e.g., snapshot IDs/remainders) come from
  [`storage-snapshot-carrier`](storage-snapshot-carrier.md).

## Uniqueness

Given these earned components, any packet carrier bundling them is
nucleus-equivalent; `DistributionPacketCarrier` is unique up to earned
equivalence.
