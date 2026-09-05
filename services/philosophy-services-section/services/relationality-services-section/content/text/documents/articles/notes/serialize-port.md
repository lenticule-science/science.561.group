---
title: Serialize Port
id: serialize-port
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Serializes/deserializes recognitions for transmission through ports.

## Definition
- Inputs: a [Ports Carrier](./ports-carrier.md) and recognitions to
  send/receive.
- Output: same carrier with serialized payloads conforming to
  [Section Encoding Schema](./section-encoding-schema.md).
- Behaviour: encode recognitions for outbound ports; decode inbound payloads.

## Invariants
- Round-trip fidelity for encodable recognitions.
- Schema compliance enforced.

## Proof
- Uses: encoding schema for deterministic serialization.
- Produces: port-ready payloads.
- Shows that: ports can safely carry encoded recognitions.
