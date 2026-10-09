---
title: Distribution Channel Carrier
keywords:
  - dataflow
  - channel
  - wiring
layer: system
status: plan
claims:
  - type: structure
    judgement: DistributionChannelCarrier sequences packets along compatible ports with storage backing
depends-on:
  - system/structure/distribution-packet-carrier
  - system/structure/interface-port
  - math/structure/storage-snapshot-carrier
description: "of channels: sequences of DistributionPacketCarrier values associated with compatible ports and backed by storage."
---

## Statement

There exists a carrier

```text
DistributionChannelCarrier
```

of channels: sequences of `DistributionPacketCarrier` values associated with
compatible ports and backed by storage.

## Construction by earned pieces

- Channels are keyed by compatible `InPorts`/`OutPorts`
  (`interface-port.md`).
- They carry sequences of `DistributionPacketCarrier` packets.
- Storage backing (buffering/serialisation) uses
  [`storage-snapshot-carrier`](storage-snapshot-carrier.md) components.

## Uniqueness

Given these earned components, any channel carrier serving this role is
nucleus-equivalent; `DistributionChannelCarrier` is unique up to earned
equivalence.
