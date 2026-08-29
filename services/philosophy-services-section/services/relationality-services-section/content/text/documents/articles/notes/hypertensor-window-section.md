---
title: Hypertensor Window Section
id: hypertensor-window-section
role: structure
status: plan
derived_from:
- theorem/internal/universal-state-hypertensor
proof_refs: []
---


# Hypertensor Window Section

The **Hypertensor Window Section** is a finite section of the relational
quasicrystalline hypertensor sheaf over a finite lattice window.

## Definition
- Components:
  - a finite [Hypertensor Window](./hypertensor-window.md)
    recording dimension, sites, and window metadata;
  - a finite family of [Profile Towers](./profile-tower.md)
    attached to fibres whose trace/context positions lie inside the window.
- Equality: two representations `(W, {T_i})` and `(W', {T'_j})` describe the
  same section when related by sheaf restriction/gluing and nucleus-equivalence
  from the hypertensor and tower theorems.

## Invariants
- Restriction: restricting to a subwindow applies sheaf restriction on the
  window and restricts each tower to fibres over the subwindow, discarding
  towers outside.
- Gluing: compatible families over covers glue to a window section.

## Proof
Derived from **Theorem (Relational Quasicrystalline Hypertensor Sheaf)** and
the tower interaction/lifting results. These ensure that finite sections over
open charts supported on finite windows are represented by a window plus a
finite family of attached profile towers.
