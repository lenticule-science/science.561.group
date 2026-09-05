---

name: notifications-attention-program
kind: structure
layer: program
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program routes notifications as recognitions so attention is managed
explicitly.

## Behaviour

- Represent notifications, channels, preferences, and policies as recognitions
  with provenance.
- Track context (urgency, user state) to route or defer notifications.
- Measure delivery, engagement, and overload signals.

## Intended operators

- Ingest notification events; apply policy and context filters.
- Route, batch, or suppress notifications with traceable decisions.
- Adapt routing based on measured attention signals.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

