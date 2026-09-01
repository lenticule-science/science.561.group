---
type: definition
class: substrate-entity
realizes: [hardware-device, sensor]
depends-on: [hardware-device, process-record, capability]
see-also: [sensor, interfacer]
---

# Device record

A **device record** is the substrate-entity formal definition of a [hardware device](teaching/explanations/hardware-device.md): the predication-graph entity declaring a device's kind, host interface, supported operations, and substrate-side identity.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary.
- **`device-kind`** — `temperature-sensor`, `gps`, `camera`, `motor`, `display`, `serial-port`, `usb-device`, etc.
- **`host-interface`** — backend-specific addressing: `/dev/ttyUSB0`, `gpio-17`, `i2c-bus-1-addr-0x48`, USB vendor:product, etc.
- **`bound-process`** — reference to the [process-record](process-record.md) handling the device's host-interface.
- **`required-capabilities`** — references to OS-level capabilities required to access the device.
- **`supported-operations`** — declared operations: `read`, `write`, `bidirectional`, `interrupt`.
- **`substrate-identity`** — the device's substrate-side identity-record (for cross-substrate device data attribution).
- **`device-state`** — `online`, `offline`, `error`, with substrate-recorded transitions.
- **`closure-kind`** — `device`.

## Invariants

- **Host-interface-resolvable.** The cited host-interface address must be accessible to the bound-process.
- **Capability-coherent.** The required-capabilities are granted to the bound-process at the OS level.
- **Operations-coherent.** The cited supported-operations match what the device actually supports.

## Position in the substrate

Device records are the substrate's *hardware-device registry*. Per [hardware-device](teaching/explanations/hardware-device.md), each device has its own record; per [witness](../objects/witness.md), device reads and writes are recorded with the device's identity for audit and federation.
