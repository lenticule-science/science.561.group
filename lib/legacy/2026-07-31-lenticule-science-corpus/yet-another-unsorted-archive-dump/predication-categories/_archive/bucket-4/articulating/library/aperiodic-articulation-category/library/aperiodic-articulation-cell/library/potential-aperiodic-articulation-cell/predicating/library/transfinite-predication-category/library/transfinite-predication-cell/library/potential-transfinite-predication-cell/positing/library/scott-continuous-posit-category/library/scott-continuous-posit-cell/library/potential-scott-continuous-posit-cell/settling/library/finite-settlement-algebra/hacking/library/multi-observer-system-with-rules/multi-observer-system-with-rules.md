---
name: multi-observer-system-with-rules
description: "An extension of multi-observer-system carrying per-observer closure-rule data. Where the base multi-observer system treats each observer's settlement as a black-box settled state, a ruled multi-observer system records WHICH closure-rule-system produced each observer's settlement — making inferential dynamics behind each observer's view explicit."
kind: extended-system
extends: multi-observer-system
adds: per-observer-closure-rule-system data
depends-on: [multi-observer-system, closure-rule-system, settlement-morphism]
see-also: [distributed-settlement-system]
derives-from: docs/dev/scraps/multi-observer-system-with-rules.md
---

# Multi-observer system with rules

An **extension** of the multi-observer-system carrying per-observer closure-rule data.

Where the base multi-observer-system treats each observer's settlement as a **black-box settled state**, a *ruled* multi-observer system records **which closure-rule-system produced** each observer's settlement — making explicit the inferential dynamics behind each observer's view.

## Data

A ruled multi-observer system consists of:

- A multi-observer-system `V: O → Settlements_B` (the base structure).
- A per-observer assignment `o ↦ S_o` of a closure-rule-system `S_o` such that `V(o)` is closure-driven by `S_o`.
- Coherence: morphisms `α: o_1 → o_2` in `O` lift to settlement-morphisms `V(α): V(o_1) → V(o_2)` that respect the rule-systems (`S_{o_2}` is related to `S_{o_1}` through `α`).

## What "carrying rule data" enables

The base multi-observer-system loses information about HOW each observer arrived at their settlement. The ruled extension preserves that information:

- **Counterfactual reasoning**: given observer `o`'s rule-system `S_o`, ask "what would `o` conclude if a different increment-sequence were used?" The base system can't answer; the ruled system can.
- **Rule-comparison across observers**: do `o_1` and `o_2` use the same rule-system (their disagreement comes from different evidence) or different rule-systems (their disagreement is methodological)?
- **Theory-coherence checks**: are the observer rule-systems mutually consistent in their generated closure operators?

## CRDT convergence with per-observer rules

When `O` is discrete (replica-style) and the per-observer rules are all the same `S_o = S`, the ruled multi-observer system reduces to a distributed-settlement-system with shared rule-system. CRDT convergence still applies.

When per-observer rules **differ**, CRDT convergence becomes more subtle: merging requires reconciling not just states but also rule-systems. The archive's `crdt-convergence-with-per-observer-rules` theorem (not yet pulled) characterizes when such systems converge.

## Position

`finite-settlement-algebra/hacking/library/multi-observer-system-with-rules/`. Settling tier — the extension of multi-observer-system that adds inferential transparency.

## Derivation source

Adapted from `predication-categories/objects/multi-observer-system-with-rules.md`, preserved at `docs/dev/scraps/`.
