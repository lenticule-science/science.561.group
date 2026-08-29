---
title: Home & Environment Automation
status: someday
keywords:
  - idea
  - home
  - automation
---
# Idea: Home / Environment Automation

Treat sensors, devices, and automations as recognitions so routines are explicit
and auditable.

## 1. Recognitions

- `SensorRecognition`: temperature, light, motion, power, air quality, etc.
- `DeviceRecognition`: lights, HVAC, plugs, appliances.
- `AutomationRecognition`: “if this then that” style rules, but as runbooks.

## 2. Topology and measurement

- Topology:
  - rooms, floors, zones, devices; links to occupants.
- Measurement:
  - energy use, comfort indices, noise, CO₂, etc.

## 3. Runbooks

- Routines like “morning”, “bedtime”, “away” are runbooks over devices
  constrained by:
  - measurement (comfort/energy),
  - policy (safety, privacy),
  - traceability (who configured what).

