---
title: Ports Carrier
id: ports-carrier
role: structure
status: plan
proof_refs: []
---



Math-level carrier for ports/interfaces: endpoints for serialized recognitions
and messages.

## Definition
- Components: input/output endpoints tied to [Message Channels](./message-channel.md),
  plus [Section Encoding Schema](./section-encoding-schema.md) for serialization.
- Role: boundary for injecting/extracting recognitions into channels.

## Invariants
- Type safety: ports accept recognitions encoded per schema.
- Consistency: port directions (in/out) respected; messages tagged with channel.

## Proof
- Uses: channel and encoding schema to define port structure.
- Shows that: ports can be treated as math carriers for IO in the system stack.
