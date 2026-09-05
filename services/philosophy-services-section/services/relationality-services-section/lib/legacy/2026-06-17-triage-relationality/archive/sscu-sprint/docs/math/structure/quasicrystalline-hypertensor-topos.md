---
title: Quasicrystalline Hypertensor Topos
role: structure
emerges_from: presheaf-topos
proof_refs:
- presheaf-topos
- sheafification
- hypertensor-site
- hypertensor-sheaf
fields:
- name: site
  type: hypertensor-site
  description: base site of hypertensor windows/covers.
- name: objects
  type: hypertensor-sheaf
  description: hypertensor sheaves over the site.
- name: classifier
  type: recognition-classifier
  description: subobject classifier giving internal logic over recognitions.
- name: flow_nucleus
  type: flow-nucleus-adjunction
  description: flow/nucleus compatibility data lifted to the topos.
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Topos of hypertensor sheaves over the hypertensor site with inherited internal
logic and classifier structure.

## Definition
- Objects: hypertensor sheaves over [Hypertensor Site](hypertensor-site.md)
  satisfying [Hypertensor Sheaf Condition](hypertensor-sheaf-condition.md).
- Morphisms: natural transformations between such sheaves.
- Internal logic: from [Recognition Classifier](recognition-classifier.md)
  and relational logic.

## Invariants
- Topos structure: has limits/colimits, exponentials, subobject classifier
  inherited via sheafification over the hypertensor site.
- Internal logic: recognition-classifier provides subobject classifier; flow/nucleus
  compatibility is preserved by morphisms.
- Stability: base change, pullback/pushforward stable on the hypertensor site.

## Proof
- Derived from: [Presheaf Topos](../acts/presheaf-topos.md) and sheafification
  over the hypertensor site/sheaves.
- Uses: hypertensor site and sheaf condition to ensure objects are sheaves.
- Shows that: hypertensor sheaves form a topos with earned internal logic and
  flow/nucleus compatibility.
