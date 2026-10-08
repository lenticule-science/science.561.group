---
title: Hypertensor Section
id: hypertensor-section
role: structure
status: plan
proof_refs:
- presheaf
- sheaf-condition
- sheafification
- commute-flow-and-nucleus
fields:
- name: base
  type: hypertensor-window
  description: window/fiber/tower base for the section.
- name: restrictions
  type: coverage-site
  description: restriction maps along admissible inclusions on the coverage site.
- name: gluing
  type: matching-family
  description: gluing operation data for compatible local sections.
- name: flow_nucleus
  type: flow-nucleus-adjunction
  description: compatibility data for flow/nucleus actions on sections.
description: Sheaf of sections over hypertensor windows, earned from presheaf/sheaf acts with flow–nucleus compatibility.
---



Sheaf of sections over hypertensor windows, earned from presheaf/sheaf acts
with flow–nucleus compatibility.

## Components
- Base coverage from [Hypertensor Window](./hypertensor-window.md),
  [Hypertensor Fiber](./hypertensor-fiber.md), and [Hypertensor Tower](./hypertensor-tower.md).
- Presheaf `Section : Open → Set` with restriction/gluing from sheaf acts
  ([Presheaf](./presheaf.md), [Sheaf Condition](./sheaf-condition.md),
  [Sheafification](./sheafification.md)).
- Flow–nucleus compatibility (`flow`, `nucleate`, [Commute Flow and Nucleus](./commute-flow-and-nucleus.md))
  on sections.

## Proof

Sketch: use presheaf/sheaf acts over hypertensor windows/towers to define
`Section` with restriction/gluing. Apply flow/nucleus acts and their
commutation to ensure compatibility on sections. The section data is earned
from these acts; no unearned structure is assumed.
