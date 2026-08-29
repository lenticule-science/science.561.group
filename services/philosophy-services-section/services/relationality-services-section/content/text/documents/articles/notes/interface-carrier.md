---
title: Interface Carrier
id: interface-carrier
role: structure
status: plan
proof_refs: []
---


# Interface Carrier

Math-level carrier for interfaces linking ports/channels and their expected
payload schemas.

## Definition
- Components: a collection of [Ports Carrier](./ports-carrier.md) endpoints,
  associated [Message Channels](./message-channel.md), and schema references for
  transmitted recognitions/sections.
- Role: defines the shape of IO for a subsystem.

## Invariants
- Schema adherence: interface enforces schemas on all ports.
- Connectivity: ports map to channels consistently.

## Proof
- Uses: port and channel definitions to build interface metadata.
- Shows that: IO interfaces can be specified as math carriers for projection to
  system/machine layers.
