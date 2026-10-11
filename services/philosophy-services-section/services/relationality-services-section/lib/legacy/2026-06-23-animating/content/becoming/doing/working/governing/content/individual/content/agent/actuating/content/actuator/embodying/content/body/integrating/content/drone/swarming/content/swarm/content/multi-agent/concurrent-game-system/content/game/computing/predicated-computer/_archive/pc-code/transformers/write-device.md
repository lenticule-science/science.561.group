---
type: morphism
class: device-operation
realizes: [hardware-device]
depends-on: [device-record, process-record, witness, capability]
see-also: [read-device]
---

# Write device

The substrate operation that *writes to a [hardware device](teaching/explanations/hardware-device.md)*: commands an actuator, sends a serial-port byte, drives a display.

## Signature

`write-device(device-record-id, write-spec) → (write-outcome, write-witness)`

Inputs:

- **`device-record-id`** — reference to the [device-record](../objects/device-record.md).
- **`write-spec`** — operation-specific parameters (motor-speed, display-content, LED-pattern).

Outputs:

- **`write-outcome`** — `success`, `failure` (device error, capability missing), `partial` (some bytes written, some not).
- **`write-witness`** — records the write attempt and outcome.

## Operational semantics

1. Verify capability for device access.
2. Issue device-specific write via [syscall-discipline](teaching/explanations/syscall-discipline.md).
3. Wait for the device's acknowledgment (or timeout per [latency-budget](teaching/explanations/latency-budget.md)).
4. Per [witness](../objects/witness.md), emit write-witness with the outcome.

## Engineering invariants

- **Capability-required.** Per [capability](theories/functional-runtime-platform/concepts/capability.md), actuator access is gated.
- **Witnessed.** Per [witness](../objects/witness.md), every write is recorded; auditors can review actuator commands.
- **Failure-explicit.** Device write failures produce explicit witnesses; the substrate doesn't silently treat failed writes as successful.

## Position in the substrate

Write-device is the substrate's *actuator-control primitive*. Per [federation-convergence](../theorems/federation-convergence.md), actuator commands can be federated — but per the device's discipline, only the substrate-instance with the device attached actually executes the command.
