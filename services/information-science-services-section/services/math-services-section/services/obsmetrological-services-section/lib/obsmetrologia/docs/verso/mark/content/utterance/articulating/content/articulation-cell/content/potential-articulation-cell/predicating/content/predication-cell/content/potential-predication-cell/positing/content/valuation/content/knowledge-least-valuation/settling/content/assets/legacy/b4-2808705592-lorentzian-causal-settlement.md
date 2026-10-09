---
name: lorentzian-causal-settlement
description: "A settlement whose cells are pairs (e_1, e_2) of spacetime events and whose closure operator is causal transitivity: if e_1 ≺ e_2 and e_2 ≺ e_3 then e_1 ≺ e_3. The settling fixed-point is the transitive closure of seed causal precedences — the full causal order on the event set. Natural setting: Sorkin-style causal sets."
kind: presheaf
symbol: "v_caus"
cells: "(e_1, e_2) ∈ E × E (entity-pairs as event-pairs)"
closure-operator: causal transitivity
fixed-point: "transitive closure of seed direct-causal-links"
natural-setting: Sorkin causal sets (locally-finite partial-orders representing causal precedence)
depends-on: [settlement, closure-2-monad]
derives-from: docs/dev/scraps/lorentzian-causal-settling.md
---

# Lorentzian causal-structure settlement

A **Lorentzian causal-structure settlement** is a settlement whose cells are pairs `(e_1, e_2)` of spacetime events and whose closure operator is **causal transitivity**:

if `e_1 ≺ e_2` and `e_2 ≺ e_3`, then `e_1 ≺ e_3`.

The settling fixed-point is the **transitive closure** of the seed causal precedences — the full causal order on the event set.

## Setting: causal sets

The natural application is **causal sets** (Sorkin-style discrete spacetime models), where spacetime is replaced by a locally-finite partial-order `(P, ≺)` representing causal precedence. The substrate's settling formalism applies directly with Boolean (or bilattice) values.

## Definition

Fix a finite or countable set `E` of spacetime events and a binary relation `≺_0 ⊆ E × E` of **direct causal links** (e.g., elementary timelike connections). The **causal-structure settlement on `(E, ≺_0)`** is:

- **Initial state** `v_0(p)(e_1, e_2) = t` iff `(e_1, e_2) ∈ ≺_0` (direct link); `⊥` otherwise.
- **Closure rule**: `v(p)(e_1, e_2) ≥_k t ∧ v(p)(e_2, e_3) ≥_k t ⟹ v'(p)(e_1, e_3) ≥_k t`.
- **Orbit**: the closure-driven orbit accumulates indirect causal precedences as the transitivity rule fires.
- **Quiescent state**: `v_∞(p)(e_1, e_2) = t` iff `e_1 ≺ e_2` in the transitive closure.

## Closure-ordinal and regime

For finite `E`, the orbit quiesces in finitely many steps (`κ < ω`). For countably infinite `E`, the orbit may take up to `ω` steps but the transitive closure is computable as a Scott-continuous closure operator (`κ = ω`).

For uncountable `E` (continuum spacetime?), the orbit may need higher-regime closure — but causal-set discretization is precisely the move that keeps `E` countable, so the substrate stays in the Scott-continuous regime.

## What "Lorentzian" means

The causal-precedence relation `≺` encodes **Lorentzian causality**: the timelike-future direction in spacetime. The transitivity closure is the formal version of "if A is in the past of B and B is in the past of C, then A is in the past of C" — the basic axiom of causal structure.

Other causal-style settings (Newtonian absolute-time causality, branched causation) use different relations; "Lorentzian" specifies the specific structure where causal precedence is the timelike future.

## Position

`finite-settlement-algebra/hacking/library/lorentzian-causal-settlement/`. Settling tier — a specific instance of settlement applied to causal-set physics. Renamed per the four-object grammar.

## Derivation source

Adapted from `predication-categories/objects/lorentzian-causal-settling.md`, preserved at `docs/dev/scraps/`.
