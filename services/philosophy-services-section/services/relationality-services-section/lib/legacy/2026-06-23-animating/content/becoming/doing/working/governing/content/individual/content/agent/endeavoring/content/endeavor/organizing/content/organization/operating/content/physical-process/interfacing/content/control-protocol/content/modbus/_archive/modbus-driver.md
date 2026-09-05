---
title: "modbus-driver — industrial control driver"
description: "Modbus TCP driver. Reads/writes coils, registers; function codes."
kind: spec
status: normative
version: "0.5"
---

# modbus-driver

Modbus TCP driver.
Per https://modbus.org/specs.php.
See [network/modbus.md](../network/modbus.md) (TBD).

## 1. Driver record

```json
{
  "kind": "driver",
  "slug": "driver:modbus",
  "version": "0.5.0",
  "capabilities-required": [
    {"predicate": "set", "target-pattern": "modbus-device:*"},
    {"predicate": "network-tcp-connect", "target-pattern": "*:502"}
  ],
  "extracts": ["modbus-read-coil", "modbus-read-register"],
  "applies": ["modbus-write-coil", "modbus-write-register"]
}
```

## 2. Cell mapping

```
(modbus-device:<slug>, coil:<addr>, "On|Off", value)
(modbus-device:<slug>, holding-register:<addr>, "<integer>", value)
```

## 3. Function codes

Standard Modbus function codes:

- 1 — Read coils.
- 2 — Read discrete inputs.
- 3 — Read holding registers.
- 4 — Read input registers.
- 5 — Write single coil.
- 6 — Write single register.
- 15 — Write multiple coils.
- 16 — Write multiple registers.

## 4. Conformance

Round-trip with a Modbus simulator in CI.
