---
type: concept
class: substrate-spec
depends-on: [federation-graph, conformance, conformance-via-fiber-algebra-functor, federation-envelope, federation-trust-bilattice-graded, predication-fibration]
see-also: [device-substrate-restricted-conformance, identity-key-custody, hardware-device]
---

# Device substrate

The substrate's *spec for treating a hardware peripheral as a federation peer with restricted conformance* — a printer, a sensor, an IoT device, a robotic actuator, a smart appliance. In the substrate's hyperdoctrine setting, a device substrate is *a [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md) peer running a restricted sub-fibration of the full substrate's predication-fibration*. Per [device-substrate-restricted-conformance](../theorems/device-substrate-restricted-conformance.md), the device is conformant on its declared sub-fibration — it implements the substrate operations relevant to its role and explicitly disclaims the rest.

Without this concept, the substrate's federation discipline implicitly assumes every peer is fully-capable — but a $50 printer with 64MB of RAM cannot run the full substrate, the full closure-rule machinery, the full federation discipline. Treating it as either "fully-conformant" (fails — it isn't) or "non-substrate" (loses the federation properties) misses the right framing: it's *partially-conformant*.

## Why this concept exists

PredComp's [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md) describes federation as a multi-observer system over peers. PredComp's [conformance](conformance.md) describes implementation-fitness as functorial realization of the substrate's fibration. Neither covers the case where a peer realizes only a *sub-fibration* — handles a small vocabulary, runs a small rule-system, has limited compute and storage. Without a concept for this, the substrate has no structural framing for IoT, embedded systems, or single-purpose appliances.

This concept fills the gap. Per [device-substrate-restricted-conformance](../theorems/device-substrate-restricted-conformance.md), restricted conformance is a structural property; the substrate's federation discipline accommodates restricted peers without losing its other guarantees.

## What a device substrate looks like

A device substrate is a substrate that:

- Has its own identity-record (per [identity-key-custody](identity-key-custody.md)) — typically a per-device Ed25519 keypair, generated at first-boot and stored in device-local secure storage (TPM, secure enclave, or device flash).
- Maintains a small substrate-content store — vocabulary, closure rules, working state — sized for the device's memory.
- Implements [federation-envelope](federation-envelope.md) for receiving/sending federation messages.
- Declares its *conformance profile* — which substrate operations it implements, which vocabulary it admits, which capability classes it offers.
- Runs a *restricted runtime* — only the operations its conformance profile declares.

The device substrate's conformance profile is itself substrate content (per [self-representation](self-representation.md)) — discoverable by federation peers via standard substrate query.

## Common device-substrate profiles

### Printer

- **Vocabulary**: `print-job`, `queue-position`, `material-loaded`, `head-position`, `printer-status`, `print-error`.
- **Operations**: admit (print-jobs), respond (status queries), dispatch-internal (within its queue).
- **Closure rules**: queue-management (FIFO with priority), error-handling (job-failed → retry-or-discard), material-tracking (decrement on use).
- **Authority**: signs `print-completed` witnesses; cannot dispatch to other devices.
- **Federation**: accepts envelopes from authorized senders (per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md)); emits status to subscribers.

### Temperature sensor

- **Vocabulary**: `reading`, `unit`, `timestamp`, `sensor-status`.
- **Operations**: emit (continuous readings), respond (current-value queries).
- **Closure rules**: reading-validation (within sensor range), heartbeat (last-active-at update).
- **Authority**: signs `reading` witnesses with sensor identity-key; cannot accept commands.
- **Federation**: emits to subscribers; declines all admissions except subscriber-list updates.

### Smart lock

- **Vocabulary**: `lock-state`, `unlock-request`, `unlock-grant`, `access-log`.
- **Operations**: admit (unlock-requests with authorization), respond (status queries), emit (access-log entries).
- **Closure rules**: authorization-check (per [governance-decision-modal-decidability](../theorems/governance-decision-modal-decidability.md)), state-transition (locked ↔ unlocked).
- **Authority**: signs access-log entries; can deny unlock requests; cannot grant authorization.
- **Federation**: bilattice-graded trust on requesters per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md).

## Restricted conformance

Per [device-substrate-restricted-conformance](../theorems/device-substrate-restricted-conformance.md), a device substrate is conformant on its declared sub-fibration:

- The device implements the value-domain (per [bilattice-operation-table](bilattice-operation-table.md)) — a hardware constraint, but unavoidable for substrate participation.
- The device implements the operations its conformance profile declares — these are checkable per [conformance-via-fiber-algebra-functor](../theorems/conformance-via-fiber-algebra-functor.md) on the sub-fibration.
- The device explicitly disclaims operations outside its profile — federation peers don't expect them.
- The device's federation-envelope verification (per [federation-envelope](federation-envelope.md)) is mandatory; per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), the device's accept/reject decisions are auditable.

## Capability declarations

A device substrate's conformance profile declares its *capabilities* — the substrate operations and predicates it offers:

```json
{
  "kind": "device-substrate-profile",
  "device-id": "<canonical hash of profile>",
  "device-class": "printer | sensor | actuator | ...",
  "vocabulary": [<predicate-hash>, ...],
  "operations": ["admit", "respond", "emit", ...],
  "capabilities": [<capability-hash>, ...],
  "physical-properties": {
    "<device-class-specific properties: print-resolution, sensor-precision, etc.>"
  },
  "compute-budget": {
    "max-pending-cells": <integer>,
    "max-rule-applications-per-second": <integer>
  }
}
```

Per [graded-dispatch-via-q-enriched-fusion](../theorems/graded-dispatch-via-q-enriched-fusion.md), the dispatcher uses the capability declarations to pick the strongest-match device for a work-item.

## Offline behavior

Devices may be temporarily offline (network disconnected, sleep mode, power off). The substrate's discipline:

- The federation-graph records the device's `last-seen-ordinal`; if not refreshed within heartbeat-timeout, the device's accessibility cell moves to $\bot$ (uninformed).
- Pending dispatches to the offline device queue locally on the dispatcher's side until the device reconnects.
- On reconnection, per [federation-convergence](../theorems/federation-convergence.md), pending envelopes are delivered and the device's local state catches up.

Per [base-admissibility-of-regimes](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/base-admissibility-of-regimes.md), the device's regime is typically strict (finite vocabulary, finite operations, bounded settling) — replay on reconnection is bounded.

## What the discipline rules out

- **Treating devices as fully-conformant peers.** A device that doesn't implement the full substrate operation set is *not* fully-conformant; per [device-substrate-restricted-conformance](../theorems/device-substrate-restricted-conformance.md), it's restricted-conformant — and the federation discipline must accommodate.
- **Treating devices as non-substrate-aware peripherals.** A device controlled via a custom non-substrate protocol breaks the substrate's federation, audit, and content-addressing properties. The discipline is to wrap the device behind a *device-interfacer substrate* that does run the federation discipline, even if the device itself doesn't.
- **Devices without identity-records.** A device that doesn't sign its own emissions can't be attributed; per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), the substrate refuses unsigned device emissions. Devices without secure storage for their identity-key need an interfacer-substrate to sign on their behalf (with reduced trust).
- **Devices accepting unauthorized operations.** A device that accepts commands without authorization-check is not running the substrate's discipline. Per [governance-decision-modal-decidability](../theorems/governance-decision-modal-decidability.md), the device's authorization check is mandatory, even if the check is simplified to "if signed by the owner's identity, accept."

## Position

Device substrates are the substrate's *peripheral-as-peer discipline*. Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), the federation accommodates bilattice-graded trust; per this concept, the federation also accommodates capability-graded conformance. Together, the federation discipline scales from fully-capable substrates to severely-restricted devices without losing structural guarantees.

The concept composes with [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md), [federation-envelope](federation-envelope.md), [identity-key-custody](identity-key-custody.md), [conformance](conformance.md), [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), and [graded-dispatch-via-q-enriched-fusion](../theorems/graded-dispatch-via-q-enriched-fusion.md) (dispatch chooses devices per their capability declarations).
