---
title: Coverage Site
id: coverage-site
role: structure
status: plan
proof_refs:
- sheaf-condition
fields:
- name: objects
  type: hypertensor-window
  description: windows/contexts forming the site objects.
- name: covers
  type: hypertensor-coverage
  description: admissible covering families `{Ui → U}` with coverage stability data.
- name: restrictions
  type: matching-family
  description: restriction data along cover arrows.
- name: overlaps
  type: matching-family
  description: overlap objects and agreement data for matching families.
---


Carrier turning the sparse traces of [Relationlessness](../acts/relationlessness.md)
into a site equipped with covers, restrictions, and matching conditions that
support sheaves and path gluing.

## Definition
- Underlying category: contexts/recognitions produced by the first deviations
  from relationlessness, with morphisms given by refinements or inclusions.
- Covering families: collections of morphisms `{Ui → U}` that jointly detect the
  presence of relations on `U`; they express how absence is probed by local
  witnesses.
- Restrictions: for each cover arrow, a restriction map sends a section over `U`
  to a section over `Ui`, preserving composition and identities.
- Matching data: overlap objects `Ui ×_U Uj` ensure restrictions agree on
  intersections, providing the inputs to the [Sheaf Condition](../acts/sheaf-condition.md).
- Base change: pullback of covers along any morphism produces another cover,
  making the coverage stable under reindexing.

## Invariants
- Coverage stability: covers are closed under refinement and base change.
- Restriction coherence: restriction along composites matches iterated
  restriction; identity restrictions are neutral.
- Matching completeness: any matching family over a cover lives in
  [Matching Family](matching-family.md) and can be glued uniquely when the sheaf
  condition holds.
- Fundamental groupoid compatibility: paths in the
  [Fundamental Groupoid](fundamental-groupoid.md) respect covers and keep
  endpoints inside a chosen patch.

## Proof
- Derived from: [SheafCondition](../acts/sheaf-condition.md) plus the earned
  coverage/restriction data on contexts/recognitions.
- Shows that: the coverage site is the structural layer supporting restrictions,
  matching families, sheaf checks, and path composition across local patches;
  coverage stability and overlap data are explicit, not assumed.
