---
title: Naming Witness
id: naming-witness
role: structure
status: plan
derived_from:
- acts/first-name
- acts/self-naming
proof_refs: []
---



Structure showing how `Witness` binds to traces with external and self names.

## Components

- External label from `FirstName`.
- Self label from `SelfNaming`.
- Binding of `Witness` to traces carrying both names.

## Proof

Sketch: `FirstName` seeds an external label; `SelfNaming = (FirstName Reflex)`
reflects it back into the trace. Together they yield traces carrying external
and internal names.
