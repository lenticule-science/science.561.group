---
title: "v0.5 — Industrial control"
description: "The OS operates physical infrastructure. MQTT and Modbus drivers; sensor framework; outpost model; first physical-binding deployment."
kind: plan
status: ready
version: "v0.5"
---


## Goal

The OS operates physical systems.
Sensor data flows in via MQTT or Modbus; the bilattice handles partial / contradictory / stale data natively; closure rules trigger actuation.
The captain's first real physical binding (soil moisture, temperature, water level, pump controller) runs through the OS into the captain's ledger and dispatch.

## Specs read

- All v0.4 specs.
- [specs/network/mqtt.md](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/endeavoring/content/endeavor/organizing/content/organization/operating/content/physical-process/interfacing/content/control-protocol/controlling/content/control-system/industrializing/content/industrial-control-system/specs/network/mqtt.md) — citing MQTT 5.0 (https://docs.oasis-open.org/mqtt/mqtt/v5.0/mqtt-v5.0.html).
- [specs/network/modbus.md](modbus.md) — citing Modbus TCP (https://modbus.org/specs.php).
- [specs/drivers/mqtt-driver.md](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/endeavoring/content/endeavor/organizing/content/organization/operating/content/physical-process/interfacing/content/control-protocol/controlling/content/control-system/industrializing/content/industrial-control-system/specs/drivers/mqtt-driver.md), [modbus-driver.md](modbus-driver.md).
- [specs/bundled-apps/sensor-dashboard.md](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/endeavoring/content/endeavor/organizing/content/organization/operating/content/physical-process/interfacing/content/control-protocol/controlling/content/control-system/industrializing/content/industrial-control-system/specs/bundled-apps/sensor-dashboard.md) — added to v0.3's bundled-apps for ICS use.
- [specs/init-boot/outpost-image.md](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/endeavoring/content/endeavor/organizing/content/organization/operating/content/physical-process/interfacing/content/control-protocol/controlling/content/control-system/industrializing/content/industrial-control-system/specs/init-boot/outpost-image.md) — the lightweight OS image for edge deployment.

## Decisions in scope

All v0.4 decisions plus:

- (new for v0.5): outpost-is-tiered-deployment, bilattice-handles-sensor-uncertainty, ics-actuation-is-respond.

## Tasks

### MQTT

- t05-01: Implement MQTT 5.0 driver.
  Pub/sub; QoS 0/1/2; retained messages; topic patterns.
- t05-02: Map MQTT messages to substrate cells: topic + payload → predication cell with `(sensor:<slug>, reading, ...)
  `.
- t05-03: Implement bilattice handling for sensor staleness: a stale reading retains its $t$ value but a `staleness` predicate marks it; closure rules can elevate to $\bot$ after a configurable horizon.
- t05-04: Implement bilattice handling for sensor disagreement: two sensors reading different values produce $\top$.

### Modbus

- t05-10: Implement Modbus TCP driver.
  Read/write coils, registers; function codes.
- t05-11: Map Modbus reads to substrate cells; map writes to closure-rule conclusions.

### Sensor framework

- t05-20: Implement sensor records as substrate entities: `(sensor:<slug>, kind, soil-moisture)`, `(sensor:<slug>, location, ...)
  `, `(sensor:<slug>, calibration, ...)
  `.
- t05-21: Implement reading records: `(reading:<id>, from-sensor, sensor:<slug>)`, `(reading:<id>, value, ...)
  `, `(reading:<id>, at-ord, ...)
  `.
- t05-22: Implement actuator records and actuation closure rules: a closure rule that fires when soil moisture drops below threshold, asserting `(pump:<slug>, run, true)`.

### Outpost model

- t05-30: Implement the outpost OS image: lightweight (no GUI shell, minimal stdlib, focused on sensor/actuator drivers).
- t05-31: Implement tiered architecture: outpost (near hardware) → ship node (captain's main system) → confederacy fabric (peer 561 nodes).
- t05-32: Implement outpost-to-ship federation with selective sync (high sensor rate compressed for the ship's view; full detail retained at the outpost).

### First physical binding

- t05-40: Wire a real (or hardware-faithfully-simulated) soil moisture sensor through MQTT into the OS.
- t05-41: Build a closure rule that fires on dry-soil reading; triggers a notification to the captain's calendar.
- t05-42: Optionally: wire a pump controller via Modbus; the closure rule triggers pump activation.

## Deliverable

- A v0.5 OS image with MQTT and Modbus drivers.
- An outpost image bootable on a Raspberry Pi or equivalent.
- A real (or hardware-faithfully-simulated) sensor produces cells that drive a closure-rule firing that triggers a notification.
- The captain's ledger captures the actuation event (e.g., pump runtime).

## Conformance gate

1. All v0.4 vectors pass.
2. A simulated MQTT broker round-trips with the OS's MQTT driver.
3. A simulated Modbus controller round-trips read/write.
4. Bilattice handles three test cases: stale reading → $\bot$ after horizon; disagreement → $\top$; affirmative reading → $t$.
5. The outpost-to-ship federation works with selective sync.

## Out of scope

- SDK for third-party apps (v0.6).
- Productivity stack (v0.7).
- Multiple-of-X actuator orchestration patterns beyond a single binding (deferred until captain has the hardware).
