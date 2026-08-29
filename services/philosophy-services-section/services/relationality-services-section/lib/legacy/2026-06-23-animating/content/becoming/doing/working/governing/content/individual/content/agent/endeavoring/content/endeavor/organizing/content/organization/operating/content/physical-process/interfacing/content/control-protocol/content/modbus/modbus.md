---
title: "Modbus"
description: "Modbus TCP per modbus.org spec. Industrial controllers. v0.5 driver."
kind: spec
status: normative
version: "0.5"
---

# Modbus

Per https://modbus.org/specs.php (Modbus Application Protocol Specification + Modbus TCP).
Used by the v0.5 industrial-control bindings.

## 1. Substrate cells

```json
{"subject": "modbus-device:<slug>", "predicate": "kind", "object": "modbus-device", "value": "True"}
{"subject": "modbus-device:<slug>", "predicate": "host", "object": "<ip>", "value": "True"}
{"subject": "modbus-device:<slug>", "predicate": "unit-id", "object": "<integer>", "value": "True"}
{"subject": "modbus-device:<slug>", "predicate": "coil:<addr>", "object": "On|Off", "value": "True"}
{"subject": "modbus-device:<slug>", "predicate": "holding-register:<addr>", "object": "<integer>", "value": "True"}
```

## 2. Function codes

- 1 — Read coils.
- 2 — Read discrete inputs.
- 3 — Read holding registers.
- 4 — Read input registers.
- 5 — Write single coil.
- 6 — Write single register.
- 15 — Write multiple coils.
- 16 — Write multiple registers.

## 3. Implementation

Python: `pymodbus`.
Rust: `tokio-modbus`.

## 4. Conformance

Round-trip with a Modbus simulator (e.g., `mbpoll` test instance) in CI.
