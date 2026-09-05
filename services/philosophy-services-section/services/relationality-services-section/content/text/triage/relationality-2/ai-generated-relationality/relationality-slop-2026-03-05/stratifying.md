---
title: "Stratifying and Constructible"
date-created: 2026-03-05T00:00:00
type: term
canonical-name: Stratifying
movement: IV
draft-names:
  draft-3-PRE: "Stratify (Axiom 9) — stratified dynamic; diagrammatic site structure; symbol G_site"
  draft-3-PRE: "Constructible (Definition 8) — constructibility condition on stratified objects"
  draft-6: "(SDIG framework — stratified directed infinity-homotopy geometry)"
stability: high — formally defined in PRE Part IV; implicit in draft 6's SDIG framework
signature: "Stratify : Diag -> Diag (unary on diagrams)"
---

Stratifying equips the relational field with orientation: degrees assigned to positions, arrows divided into forward (raising degree) and backward (lowering degree). Constructible is the condition under which a stratified diagram's assembly is fully determined by its forward inputs and backward constraints after stabilization.

## What it is

PRE Axiom 9: A stratified site has:
- A degree function Deg: Obj(Site) -> Nat assigning levels to positions
- Forward arrows that strictly raise degree; backward arrows that strictly lower it
- Finite latching (forward) and matching (backward) neighborhoods at every position
- Stratify: Diag -> Diag, a dynamic that assembles a diagram by propagating along forward arrows and reconciling along backward arrows
- PreservesCore(Stratify): the modalities (Necessary, Possible) commute with Stratify

PRE Definition 8: Constructible(F) holds when each node of a diagram is determined by its latching and matching neighborhoods after stabilization by Necessary and Possible and then composition by Together. Each node is the stabilized reconciliation of its forward inputs and backward constraints.

## Why they matter

Stratifying adds directed assembly to the cohesive chain. Where Movement IV's cohesive chain (Shape ⊣ Flat ⊣ Sharp ⊣ Crisp) translates between local and global perspectives, stratifying organizes HOW the field is built layer by layer. It formalizes the idea that relational structures have levels and that building up (forward) and checking back (backward) are both essential.

Constructible is the well-formedness condition: a diagram is constructible when its assembly is fully determined. This is what makes the derivation WORK at the diagrammatic level — every step is determined, not chosen.

## Ambidexterity

PRE Theorem 13: If Constructible(F), then stabilized upward and downward assemblies yield the same result. Building from the bottom up (homotopy colimit) and checking from the top down (homotopy limit) agree after stabilization. This is the diagrammatic expression of the existence-observation duality.

## Directed Cohesion

PRE Theorem 14: If Constructible(F) and PreservesCore(Flow), then:
- Flow commutes with assembly (flowing and assembling are interchangeable)
- Necessary and Possible commute with directed flow (modal operators respect directed assembly)

This connects stratifying to the rest of the framework: directed assembly respects all the structures earned in prior movements.

## Relationships

- Extends: the Cohesive Chain (adding directed assembly to local-global translation)
- Depends on: Necessary, Possible (modalities used in stabilization)
- Depends on: Together (used in reconciliation)
- Produces: Ambidexterity (Theorem 13) when Constructible holds
- Produces: Directed Cohesion (Theorem 14) when combined with PreservesCore(Flow)
- Related to: draft 6's SDIG framework (stratified directed infinity-homotopy geometry)

## TTL encoding

Stratifying encoded as `rel:Stratifying` (Operator) in ontology.ttl. signatureArity 1. inMovement MovementIV. Constructing encoded as `rel:Constructing` (Condition).

## Lean encoding

Not yet formalized in the Lean files. Stratifying would require:
- A Site type with degree function and forward/backward arrow classification
- Diagrammatic assembly operators
- The Constructible property as a Prop on diagrams
- Theorems 13 and 14

This is substantial categorical machinery beyond the current formalization level.

## SHACL validation

Stratifying as Operator requires signatureArity. Constructing as Condition requires producedBy or derivesFrom.
