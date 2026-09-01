---
title: Home and Environment Automation Program
kind: structure
layer: program
status: someday
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program treats sensors, devices, and automations as recognitions so home
and environmental routines are explicit and auditable.

## Behaviour

- Represent sensors (temperature, light, motion, power, air quality), devices
  (lights, HVAC, plugs, appliances), and automations/runbooks with provenance.
- Map topology of rooms, zones, devices, and occupants; measure energy, comfort
  indices, noise, CO₂, and other environmental metrics.
- Constrain routines by measurement (comfort/energy), policy (safety, privacy),
  and traceability (who configured what).

## Intended operators

- Plan and run routines (morning, bedtime, away) over devices with policy and
  measurement checks.
- Monitor energy and comfort metrics; adjust automations accordingly.
- Audit configuration changes and execution histories.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
