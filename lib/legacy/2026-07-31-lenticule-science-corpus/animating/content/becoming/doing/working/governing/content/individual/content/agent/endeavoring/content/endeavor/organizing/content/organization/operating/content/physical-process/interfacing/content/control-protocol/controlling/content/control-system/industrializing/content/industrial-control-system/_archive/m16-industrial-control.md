---
title: "M16 — Industrial Control Surface (ICS)"
type: milestone
campaign: ship-pyfars-autonomous-loop
status: planning
horizon: captured
depends-on: [m14-application-development-surface, m7-boundary-handedness-and-outbound-endpoints]
goals:
  - mqtt-5-driver
  - modbus-tcp-driver
  - sensor-and-actuator-records
  - bilattice-handles-stale-and-contradictory-readings
  - closure-rules-trigger-actuation-via-m9-precheck
  - outpost-image
  - first-physical-binding-soil-moisture
theory-basis: [bilattice, four-valued-truth, dispatch-readiness, charter-c5, monetary-cost-as-quantale-extension]
prior-art: [pypredcomp/docs/dev/milestones/v0.5-industrial-control.md, pypredcomp/docs/dev/specs/network/mqtt.md, pypredcomp/docs/dev/specs/network/modbus.md, pypredcomp/docs/dev/specs/init-boot/outpost-image.md]
cites-objects:
  - pyfars/objects/anomaly-witness.md
  - pyfars/objects/dispatch-closure-rule-system.md
  - pyfars/objects/jsonl-event-log.md
cites-morphisms:
  - pyfars/morphisms/settling.md
  - pyfars/morphisms/observing.md
cites-claims:
  - pyfars/claims/substrate-purity.md
backing-gaps:
  - pyfars/objects/sensor-record.md (NOT YET AUTHORED — physical-sensor identity, MQTT topic binding, freshness horizon)
  - pyfars/objects/actuator-record.md (NOT YET AUTHORED — physical-actuator identity, Modbus register binding, safety envelope)
  - pyfars/objects/reading-cell.md (NOT YET AUTHORED — bilattice-valued sensor reading; ⊥/⊤/t/f per stale/contradictory/confirmed/refuted)
  - pyfars/objects/actuation-event-record.md (NOT YET AUTHORED — actuation request/witness pair)
  - pyfars/objects/mqtt-topic-binding.md (NOT YET AUTHORED — topic-cell binding declaration for MQTT 5.0)
  - pyfars/objects/modbus-register-binding.md (NOT YET AUTHORED — coil/register/input mapping declaration)
  - pyfars/morphisms/admitting-mqtt-message.md (NOT YET AUTHORED — MQTT 5.0 → reading-cell projection)
  - pyfars/morphisms/admitting-modbus-frame.md (NOT YET AUTHORED — Modbus TCP → reading-cell projection)
acceptance: "PyFARS reads physical sensors via MQTT 5.0 and Modbus TCP, treats their readings as bilattice-valued substrate cells (stale → ⊥, contradictory → ⊤, confirmed → t, refuted → f), fires closure rules on the readings, and routes actuation through [M9](m9-substrate-as-supervisor-of-layered-control.md) precheck. The captain's first real binding — a soil-moisture sensor on a Raspberry Pi outpost reporting via MQTT, plus an optional Modbus-controlled pump — runs end-to-end with witnesses and ledger-charged costs."
---


After [M14](m14-application-development-surface.md) ships the SDK and [M7](m7-boundary-handedness-and-outbound-endpoints.md) establishes boundary algebra for non-peer participants, M16 makes PyFARS speak to physical systems — sensors, actuators, controllers — through MQTT and Modbus.
The natural fit is the bilattice: industrial-control data is *natively* multi-valued, and the Belnap–Fitting FOUR carries stale/contradictory/confirmed/refuted readings without coercion.

## What's built

### MQTT 5.0 driver

Citing MQTT 5.0 (not 3.1.1 — we want the per-topic message-expiry, user-properties, and subscription-identifier features).
The driver maintains a topic ↔ cell map: subscribed topics translate inbound publishes into substrate cells; substrate cells written under driver-owned predicates translate into outbound publishes.

**Topic-to-cell mapping:** an MQTT topic `sensors/garden/soil-moisture/1` maps to substrate cells of shape `(sensor:garden-soil-moisture-1, current-reading, <value>, <bilattice-truth>)`.
The driver carries a `topic-cell-binding` record per topic it subscribes; the binding declares the predicate-shape and bilattice interpretation.

**Staleness handling:** every binding carries a freshness horizon.
If no message arrives within the horizon, the cell's value drops to $\bot$ (no information) — *not* the last-known reading.
The closure rule that consumed the previous reading sees $\bot$ and reacts (typically by either holding the previous decision or surfacing a `(sensor:foo, stale, t)` cell that triggers diagnostic flow).

**Disagreement handling:** when two sensors of the same class report contradictory readings, the substrate-merge rule produces $\top$.
Closure rules subscribed to the merged cell see $\top$ and either: defer to the higher-trust sensor (per peer-trust cells), or surface a sensor-fault workitem.

### Modbus TCP driver

Reads ↔ cells, writes ↔ closure-rule conclusions.
A Modbus coil at address `0x0001` on controller `controller:pump-house` maps to substrate cells `(controller:pump-house, coil-0x0001, <bool>, <bilattice-truth>)`.
A closure rule that concludes `(controller:pump-house, coil-0x0001, true, t)` fires the driver's apply, which writes the coil.
Holding registers, input registers, and discrete inputs map similarly.

### Sensor and actuator records

`sensor-record` — substrate record describing a physical sensor: id, location (lat/lon or jurisdiction), kind (soil-moisture, temperature, water-level, etc.), driver-binding (which driver speaks to it), reading-units, calibration, fault-history.

`actuator-record` — likewise for actuators: id, location, kind (valve, pump, relay), driver-binding, actuation-cost (composed with [M10](m10-cost-and-energy-ledger-extension.md) cost-quantale for energy and dollars), safety-class (composes with [M9](m9-substrate-as-supervisor-of-layered-control.md) precheck severity).

`reading-record` — each inbound reading produces a reading-record cell with provenance: sensor-id, timestamp, raw-value, validated-value, bilattice-truth, witnessing-driver.
The reading-record is the unit of audit; downstream closure-rule firings cite reading-records in their derivation chain.

`actuation-event-record` — every actuator firing produces a record: actuator-id, commanded-value, actual-value (after readback), commanding-rule, M9-precheck-witness, energy-cost (M10), timestamp.
The audit chain reads these records when projecting safety-critical actuation history.

### Bilattice mapping for ICS data

The Belnap–Fitting FOUR maps directly to ICS data quality:

- **Confirmed reading** — sensor reports value, value within calibration, recent: $\mathbf{t}$.
- **Refuted reading** — sensor reports value, but a higher-trust sensor or a closure-rule check refutes it: $\mathbf{f}$.
- **Stale** — no message within freshness horizon: $\bot$.
- **Contradictory** — multiple same-class sensors disagree: $\top$.

No coercion to "high-medium-low quality scalars" is needed.
Closure rules consume bilattice values directly; eligibility rules using bilattice values compose without bridging code.

### Closure-rule-driven actuation, gated by M9 precheck

A closure rule firing on sensor-value cells does *not* fire the actuator directly.
It writes an *intent* cell `(actuator:pump-1, intended-state, on, t)` which is gated by [M9](m9-substrate-as-supervisor-of-layered-control.md)'s substrate-precheck.
The precheck reads CBF/HJ-reachability cells (for embodied actuation), budget cells, jurisdiction cells, recent-fault cells.
Only if the precheck cell settles to $\mathbf{t}$ does the actuation cell propagate to the driver.

This means: M16 alone does not provide safety.
M16 + M9 do.
The substrate-purity discipline applied to physical action is "no actuator fires without a precheck-witness in the audit chain".

### Outpost image

A lightweight PyFARS image bootable on a Raspberry Pi or equivalent edge device.
The outpost runs the substrate engine, the MQTT/Modbus drivers, and a minimal subset of [M15](m15-bundled-userland.md) bundled apps (terminal + file-browser for diagnostics; no email/calendar/etc.).
Federation to the main ship is selective: the outpost federates sensor/actuator cells, *not* the full substrate.
This is the captain's first deployed-edge configuration.

The tiered-deployment shape: ship-tier (full substrate, [M15](m15-bundled-userland.md) + [M17](m17-561-productivity-stack.md) apps, captain's daily driver) ↔ outpost-tier (PyFARS + drivers + diagnostic apps, federation-selective) ↔ sensor/actuator-tier (no PyFARS, raw MQTT/Modbus).
Federation crosses ship ↔ outpost; the outpost ↔ sensor crossing is via the drivers.

### First binding — soil moisture

A real (or hardware-faithfully-simulated) soil-moisture sensor publishes via MQTT to an outpost.
The outpost's PyFARS reads the cell.
A closure rule:

```
when (sensor:garden-soil-moisture-1, current-reading, <value>, t)
  and value < 0.3  
  and (calendar:next-rain, expected-within-hours, <hours>, t)
  and hours > 24
  then assert (workitem:water-garden-zone-1, ready, true, t)
       and assert (notification:captain, message, "Garden zone 1 dry, no rain forecast", t)
```

The notification surfaces in the captain's [M15](m15-bundled-userland.md) email/chat client.
If the captain has authorised pump actuation (via a captain-attestation cell), a follow-on rule:

```
when (workitem:water-garden-zone-1, ready, true, t)
  and (captain-attestation:auto-water, valid, true, t)
  and (m9-precheck:actuator-pump-1, passed, true, t)
  then assert (actuator:pump-1, intended-state, on-for-seconds:120, t)
```

The pump runs.
The actuation-event-record charges the [M15](m15-bundled-userland.md) ledger via [M10](m10-cost-and-energy-ledger-extension.md): pump-runtime translated to kWh and dollars in `expenses:utilities:water-pump-electricity`.

## What M16 does NOT claim

- **Not safety-rated industrial control.** PyFARS is orchestrated, not classical-control.
  Safety-shielding lives in M9.
  For non-trivial physical actuation (anything that could harm a person, equipment, or non-trivial property), M16 + M9 MUST compose; M16 alone is monitoring + low-stakes actuation only.
- **Not real-time.** PyFARS tick cadence is on the order of seconds; classical industrial control demands milliseconds.
  M16 fits *slow* physical loops (irrigation, climate, monitoring); fast-control loops route through [M12](m12-cross-substrate-handoff-protocol.md)'s handoff to a real-time substrate.
- **Not OPC-UA, BACnet, or full SCADA-protocol coverage.** M16 ships MQTT and Modbus — what the captain's first binding requires.
  Other ICS protocols are post-M16 work, authored as additional drivers against the SDK.

## Goals

| Slug | One-liner | Status |
|---|---|---|
| `mqtt-5-driver` | MQTT 5.0 driver with topic↔cell binding records, freshness horizons, disagreement → $\top$ | open |
| `modbus-tcp-driver` | Modbus TCP driver: reads↔cells, writes↔closure-rule conclusions, coils/registers/inputs | open |
| `sensor-and-actuator-records` | First-class substrate records: sensor-record, actuator-record, reading-record, actuation-event-record | open |
| `bilattice-handles-stale-and-contradictory-readings` | Belnap-FOUR mapping: stale → $\bot$, contradictory → $\top$, confirmed → $\mathbf{t}$, refuted → $\mathbf{f}$ | open |
| `closure-rules-trigger-actuation-via-m9-precheck` | Actuation intent cells gated by M9 substrate-precheck before propagating to drivers | open |
| `outpost-image` | Lightweight PyFARS image bootable on Raspberry Pi; selective ship-federation; minimal app subset | open |
| `first-physical-binding-soil-moisture` | Real (or hardware-faithfully-simulated) soil-moisture sensor → closure rule → notification + optional pump actuation, ledger-charged via M10 | open |

## Done when

A simulated MQTT broker round-trips with the driver.
A simulated Modbus controller round-trips read/write.
Bilattice handles three test cases: stale → $\bot$ after horizon, disagreement → $\top$, confirmed → $\mathbf{t}$.
The outpost image boots on a Raspberry Pi; the outpost-to-ship federation works with selective sync.
The first physical binding runs end-to-end: real sensor → substrate → notification (and optionally pump-actuation through M9) → ledger entry via M10.

## Theoretical shape

**Bilattice-native ICS.** Industrial-control data's fundamental shape is four-valued.
The bilattice carries this without coercion; closure rules consume it directly.
This is the engineering payoff of the math foundation — what looks academic in `predication-categories/` shows up as concrete protocol simplification here.

**Drivers as bidirectional boundary records.** Each driver is a boundary record per [M7](m7-boundary-handedness-and-outbound-endpoints.md), handedness `bidirectional` (sensors inbound, actuators outbound).
Boundary algebra applies; cost-quantale tracks energy and bandwidth via [M10](m10-cost-and-energy-ledger-extension.md).

**Composition with M9 for safety.** An actuation cell does not fire the actuator; it goes through M9 precheck.
The substrate-purity discipline applied to physical action: no actuator fires without a precheck-witness in the audit chain.

## Related

- [Roadmap](roadmap.md)
- [M14 — Application Development Surface](m14-application-development-surface.md), [M7 — Boundary Handedness](m7-boundary-handedness-and-outbound-endpoints.md) — prerequisites
- [M9 — Substrate-Precheck](m9-substrate-as-supervisor-of-layered-control.md) — gates safety-critical actuation
- [M10 — Cost and Energy Ledger](m10-cost-and-energy-ledger-extension.md) — physical-cost dimension
- [M15 — Bundled Userland](m15-bundled-userland.md) — ledger app charges energy costs from M10; notifications surface in email/chat
