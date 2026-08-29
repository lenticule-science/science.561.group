---

name: external-integrations-program
kind: structure
layer: program
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program models external APIs and services as recognitions so integrations
stay explicit, governed, and auditable.

## Behaviour

- Define integrations (service description), connectors (code/config), and
  sync jobs as recognitions with clear provenance.
- Attach policy to each integration: who may use it, data-flow constraints, and
  obligations (auth, rate limits).
- Measure request volumes, error rates, latency, and data freshness to detect
  drift or breakage early.

## Intended operators

- Configure integrations and bind connectors safely.
- Run sync jobs on schedule or ad hoc with trace and policy enforcement.
- Disable or quarantine integrations when measurements or policy checks fail.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

