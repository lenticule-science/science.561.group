---
title: "Stratifying"
kind: term
---
Stratifying equips the relational field with orientation: degrees assigned to positions, arrows divided into forward (raising degree) and backward (lowering degree). *Constructible* is the well-formedness condition under which a stratified diagram's assembly is fully determined by its forward inputs and backward constraints after stabilization.

## What it is

A stratified site has:

- A degree function $\text{Deg}: \text{Obj}(\text{Site}) \to \mathbb{N}$ assigning levels to positions.
- Forward arrows that strictly raise degree; backward arrows that strictly lower it.
- Finite latching (forward) and matching (backward) neighborhoods at every position.
- A Stratify dynamic $\text{Diag} \to \text{Diag}$ that assembles a diagram by propagating along forward arrows and reconciling along backward arrows.
- $\text{PreservesCore}(\text{Stratify})$: the modalities ([Necessary, Possible](necessary-possible.md)) commute with Stratify.

A diagram $F$ is **constructible** when each node is determined by its latching and matching neighborhoods after stabilization by Necessary and Possible and then composition by Together. Each node is the stabilized reconciliation of its forward inputs and backward constraints.

## Why it matters

Stratifying adds *directed assembly* to the [cohesive chain](cohesive-chain.md). Where the cohesive chain (Shape ⊣ Flat ⊣ Sharp ⊣ Crisp) translates between local and global perspectives, stratifying organizes *how* the field is built layer by layer. It formalizes the idea that relational structures have levels and that building up (forward) and checking back (backward) are both essential.

*Constructible* is what makes the derivation work at the diagrammatic level: every step is determined, not chosen.

## Key theorems

**Ambidexterity.** If $F$ is constructible, then stabilized upward and downward assemblies yield the same result. Building from the bottom up (homotopy colimit) and checking from the top down (homotopy limit) agree after stabilization. This is the diagrammatic expression of [existence-observation duality](existence-observation-duality.md).

**Directed Cohesion.** If $F$ is constructible and Flow preserves the modal core, then Flow commutes with assembly (flowing and assembling are interchangeable) and Necessary/Possible commute with directed flow.
