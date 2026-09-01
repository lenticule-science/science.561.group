---
type: morphism
class: device-operation
realizes: [hardware-device]
depends-on: [device-record, process-record, witness, capability]
see-also: [write-device]
---

# Read device

The substrate operation that *reads from a [hardware device](teaching/explanations/hardware-device.md)*: queries a sensor, receives a serial-port byte, captures a camera frame.

## Signature

`read-device(device-record-id, read-spec) → (device-data, read-witness)`

Inputs:

- **`device-record-id`** — reference to the [device-record](../objects/device-record.md) to read.
- **`read-spec`** — operation-specific parameters (e.g., camera-frame-resolution, sensor-sample-count).

Outputs:

- **`device-data`** — the read data, admitted as substrate predications. Per the device's [interfacer](teaching/explanations/interfacer.md), the data is canonical-form-encoded.
- **`read-witness`** — records the read: device-id, read-spec, data-hash.

## Operational semantics

1. Verify capability for device access.
2. Issue device-specific read via [syscall-discipline](teaching/explanations/syscall-discipline.md) (file read, memory-mapped register read, USB control transfer).
3. Per the device's interfacer, decode the raw data into substrate predications.
4. Per [witness](../objects/witness.md), emit read-witness with the data's canonical-form hash.

## Engineering invariants

- **Capability-required.** Per [capability](theories/functional-runtime-platform/concepts/capability.md), device access is gated.
- **Witnessed.** Per [witness](../objects/witness.md), device reads are part of the audit chain.
- **Replay-deterministic-to-time-of-original-read.** The device's data at the read time is recorded in the witness; replay reproduces the witness (replay can't re-read the device since the device's state may have changed).

## Position in the substrate

Read-device is the substrate's *sensor-acquisition primitive*. Composes with [write-device](write-device.md) for actuator control and with [interfacer](teaching/explanations/interfacer.md) for device-specific data translation.
