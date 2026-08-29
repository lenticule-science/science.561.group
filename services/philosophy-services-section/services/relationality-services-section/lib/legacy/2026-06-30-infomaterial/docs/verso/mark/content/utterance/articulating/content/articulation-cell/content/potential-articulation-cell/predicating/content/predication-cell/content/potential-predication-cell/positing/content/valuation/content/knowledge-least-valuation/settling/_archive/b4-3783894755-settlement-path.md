---
name: settlement-path
description: "A continuous family of settlements parameterized by an interval I ⊆ R (or a connected topological space). Formally (v_t)_{t ∈ I}: I → Settlements_B where continuity means v_t and v_{t + ε} are related by a first-order deformation in the SKH-deformation-Ext sense for small ε."
kind: family
symbol: "(v_t)_{t ∈ I}"
parameter-space: "I ⊆ R (connected, or more generally a connected topological space)"
target: "Settlements_B (settlements over fixed base B)"
continuity-condition: "first-order deformation related across small ε (SKH-Ext sense)"
depends-on: [settlement, settlement-morphism]
derives-from: docs/dev/scraps/settling-path.md
---

# Settlement path

A **settlement path** is a continuous family of settlements parameterized by an interval `I ⊆ R` (or more generally, a connected topological space). Formally:

$$(v_t)_{t \in I} \;:\; I \to \mathrm{Settlements}_B$$

where `Settlements_B` is the category of settlements on a fixed base `B`, with continuity meaning that for each `t ∈ I`, the settlements `v_t` and `v_{t + ε}` are related by a **first-order deformation** in the SKH-deformation-Ext sense for sufficiently small `ε`.

## Concretely

A settlement path interpolates between settlements:

- **Endpoints** `v_0, v_1`: two specific settlements on base `B`.
- **Path** `(v_t)_{t ∈ [0, 1]}`: a continuous family connecting them.
- **Continuity**: at each `t`, the local deformation `v_t → v_{t + ε}` is first-order — captured as an element of an Ext group via the SKH-deformation-Ext classification.

This is the substrate's analogue of a homotopy: a continuous interpolation between two settlements through intermediate settlements.

## What first-order deformation means

A first-order deformation `v_t → v_{t + ε}` is the linearization of the settlement-change at `t`. It is classified by an element of:

$$\mathrm{Ext}^1(\mathcal{F}_{v_t}, \mathcal{F}_{v_t}) \quad \text{(in the SKH sense, archive theorem)}.$$

So the deformation at each `t` is a class in this Ext group; the path's continuity is the requirement that the deformation varies continuously with `t`.

This is what makes settlement-paths a **topologically-meaningful** notion: they connect settlements via algebraic-topology-style deformations, not just arbitrary parameter-dependent families.

## Connectivity of the moduli stack

Settlement paths probe the **connectivity** of the moduli stack `M^pre(B)`:

- Two settlements are in the same path-component iff there exists a settlement-path connecting them.
- The path-components of `M^pre(B)` correspond to MLD-classes (with appropriate continuity conditions).

So settlement-paths give a **topological** approach to MLD-classification, complementing the cohomological approach (via the aperiodic-classifying-invariant).

## Use cases

**Continuous deformation analysis**: how does an aperiodic settlement change as one varies a substrate parameter (an entity, a predicate, an increment-sequence)? Settlement-paths capture the answer as continuous families.

**Topological invariants of moduli**: path-connected-components, homotopy groups of moduli stacks, and similar topological invariants of the settlement-moduli use settlement-paths as their basic geometric object.

## Position

`finite-settlement-algebra/hacking/library/settlement-path/`. Settling tier — a continuous-family object in the moduli of settlements. Renamed per the four-object grammar.

## Derivation source

Adapted from `predication-categories/objects/settling-path.md`, preserved at `docs/dev/scraps/`.
