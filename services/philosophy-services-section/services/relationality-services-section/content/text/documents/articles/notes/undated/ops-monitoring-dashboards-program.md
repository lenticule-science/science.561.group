---
title: Ops Monitoring and Dashboards Program
kind: structure
layer: program
status: someday
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
derives-from:
  - computer/structure/computer-kernel
description: This program provides operational monitoring and dashboards as recognitions so observability is traceable.
---

This program provides operational monitoring and dashboards as recognitions so
observability is traceable.

## Behaviour

- Represent metrics, alerts, dashboards, and incidents as recognitions with
  provenance.
- Map service topologies and dependencies; attach measurements to components.
- Measure reliability, latency, error rates, and alert quality.

## Intended operators

- Collect and aggregate ops metrics with trace.
- Configure dashboards and alerts; record incidents and responses.
- Analyse reliability and tune alerting to reduce noise.

## Proof
- Derived from: [Computer Kernel](../../../../triage/triage/computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
