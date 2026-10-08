---
name: multi-observer-system
description: "A small category O together with a functor V: O → Settlements_B assigning to each object o ∈ O (an 'observer') a settlement V(o) on the same base B, and to each morphism α: o_1 → o_2 a settlement-morphism V(α): V(o_1) → V(o_2). The category O encodes observer-to-observer relations."
kind: functor
symbol: "V: O → Settlements_B"
source-category: "O (small category — 'observer index')"
target-category: "Settlements_B (settlements over fixed base B)"
specializes-to: "single settlement when O = 1 (one object, no non-identity morphisms)"
specializes-to: "discrete family of settlements when O is discrete"
depends-on: [settlement, settlement-morphism]
derives-from: docs/dev/scraps/multi-observer-system.md
---

# Multi-observer system

A **multi-observer system** on a base `B` is a small category `O` together with a functor

$$V \;:\; O \longrightarrow \mathrm{Settlements}_B$$

assigning:

- To each object `o ∈ O` (an **observer**): a settlement `V(o)` on the base `B`.
- To each morphism `α: o_1 → o_2` in `O`: a **settlement-morphism** `V(α): V(o_1) → V(o_2)`.

The category `O` encodes **observer-to-observer relations**: each morphism `α` is a **translation** from one observer's perspective to another's.

## Special cases of `O`

**`O = 1` (trivial)**: one observer, no non-identity morphisms. The multi-observer system is a single settlement. Recovers the base case.

**`O` discrete**: multiple objects, only identity morphisms. The multi-observer system is a **family of independent settlements** — different observers with no formal relations between their settlings.

**`O` a poset**: morphisms `o_1 → o_2` express "observer 2 has at least as much / more refined data than observer 1." Models hierarchical observation, where lower-rank observers feed into higher-rank ones.

**`O` a groupoid**: every morphism is invertible. Models **symmetric observation** — observers are mutually translatable, none is more refined than others.

**`O` a general small category**: mixed cases. Some observer pairs are unrelated; others have one-way refinement; others have mutual translation.

## Three operational uses

**(1) Modeling different perspectives.** Observers `o_1, o_2` may have access to different subsets of evidence; their settlements differ. The category `O`'s morphisms encode how perspectives translate (when one observer's view can be re-described as another's).

**(2) Modeling distributed observation.** A network of sensors each measuring overlapping aspects of a system: `O` indexes the sensors; the functor `V` records each sensor's settlement; morphisms encode sensor-to-sensor relationships (synchronization, calibration translation).

**(3) Modeling theory-of-mind.** Agent `a_1` models agent `a_2`'s knowledge: observer `o_1` represents `a_1`'s own settlement; observer `o_2` represents `o_1`'s model of `a_2`'s settlement; a morphism `o_1 → o_2` is the "what `a_1` thinks `a_2` knows" relation.

## Relationship to distributed-settlement-system

A **distributed-settlement-system** is a special case where:

- `O` is discrete (no non-identity morphisms — replicas are formally independent).
- The functor `V` lands in the underlying-set of settlements (no morphism structure used).
- Merge happens externally via `∨_k`-join, not via `O`'s morphisms.

A multi-observer system **generalizes** this by allowing non-trivial morphisms in `O`. Replica-merging is recovered as the `O = (discrete I)` case; richer observer-structure uses more of `O`.

## Position

`finite-settlement-algebra/hacking/library/multi-observer-system/`. Settling tier — a categorical extension of settlements indexed by an observer category.

## Derivation source

Adapted from `predication-categories/objects/multi-observer-system.md`, preserved at `docs/dev/scraps/`.
