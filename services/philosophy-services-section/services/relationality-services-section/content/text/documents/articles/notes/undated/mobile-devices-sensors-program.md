---
title: Mobile Devices and Sensors Program
kind: structure
layer: program
status: someday
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
derives-from:
  - computer/structure/computer-kernel
description: This program treats data from mobile devices and sensors as recognitions so environmental context is traceable and policy-aware.
---

This program treats data from mobile devices and sensors as recognitions so
environmental context is traceable and policy-aware.

## Behaviour

- Represent devices, sensors, readings, and contexts (location, activity) as
  recognitions with provenance.
- Handle calibration, sampling rates, and privacy/policy constraints explicitly
  in trace carriers.
- Link sensor data to other programs (fitness, home automation, mobility).

## Intended operators

- Ingest and calibrate sensor streams with validation.
- Aggregate and align sensor data with contextual recognitions.
- Enforce privacy/policy before sharing or acting on sensor readings.

## Proof
- Derived from: [Computer Kernel](../../../../triage/triage/computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
