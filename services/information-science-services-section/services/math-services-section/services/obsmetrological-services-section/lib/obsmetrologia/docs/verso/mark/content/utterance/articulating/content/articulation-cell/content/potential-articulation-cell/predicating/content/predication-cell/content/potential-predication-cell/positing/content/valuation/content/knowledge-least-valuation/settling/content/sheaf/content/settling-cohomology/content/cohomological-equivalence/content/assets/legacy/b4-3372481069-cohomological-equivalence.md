---
name: cohomological-equivalence
description: "An equivalence relation on settlements over a fixed base. v ~_H v' iff there exists an ordinal shift δ ∈ λ and a sheaf isomorphism F_U ≅ F_{U'}[δ] on the bitopological-settling-site. The coarsest of three natural equivalences on settlements — coarser than MLD."
symbol: "~_H"
depends-on: [settlement, settling-associated-sheaf, mutually-locally-derivable, settling-bound]
derives-from: docs/dev/scraps/cohomological-equivalence.md
---

# Cohomological equivalence

An equivalence relation on settlements over a fixed base `(L, C, E, λ)`. Two settlements `v, v'` are **cohomologically equivalent** — written `v ~_H v'` — iff there exists an ordinal shift `δ ∈ λ` and a sheaf isomorphism

$$\mathcal{F}_U \;\cong\; \mathcal{F}_{U'}[\delta]$$

on the bitopological-settling-site, where `F_{U'}[δ]` is the settling-associated-sheaf of `v'` shifted by `δ`.

## Why sheaf-iso, NOT `H^n`-agreement

A first attempt at defining cohomological equivalence by the **conjunction** "`H^0`-ranks agree" + "`H^1`-classifying classes agree" **fails** to capture stage-by-stage settling structure.

**Counterexample** over base `B = (2, {a, b}, {P}, ω + 1)`:

- `v_1`: initial state `{P(a, a) = t}` with closure-rule `P(a, a) ⟹ P(b, b)`.
- `v_2`: initial state `{P(a, a) = t, P(b, b) = t}` with no closure-rule.

Both settlements have the same `H^0` rank (= 2 — they agree on the same two cells eventually) and the same `H^1` classifying class (trivial — the orbit quiesces in finite steps). But they are not stage-by-stage equivalent: `v_1` needs the closure-rule to FIRE at step 1 to produce `P(b, b)`, while `v_2` has it at step 0.

So `H^n`-agreement is too coarse. Sheaf-iso captures more: it says the two settlements' associated sheaves are isomorphic AS SHEAVES (not just having the same cohomology rank).

## The three equivalences on settlements

The substrate has **three** natural equivalences on settlements at three strengths:

| Equivalence | Condition | Strictness |
|---|---|---|
| **MLD** (mutually-locally-derivable) | invertible settlement-morphism `v → v'` | strongest (aperiodic regime) |
| **biequivalence** (in moduli 2-category) | weaker than MLD, sees only structural equivalence | medium |
| **`~_H`** (this $thing) | sheaf-iso `F_U ≅ F_{U'}[δ]` on bitopological site | coarsest |

`~_H` is the coarsest: any MLD-equivalence implies `~_H` (the settlement-morphism induces a sheaf-iso), but `~_H` can hold for settlements that are not MLD (sheaves can be isomorphic without the orbits being structurally identical at every step).

## What `~_H` captures

`v ~_H v'` says: the **cohomological data** of the two settlements is identical (up to ordinal shift). All cohomological invariants `H^n(T*, F_U)` agree with `H^n(T*, F_{U'})` — not just rank, but the whole sheaf-iso class.

This is the **right** equivalence for cohomological classification: it identifies settlements iff they have indistinguishable cohomological signatures.

## What `~_H` does NOT capture

`~_H` does NOT capture:

- **Stage-by-stage timing** of when cells are designated. Two settlements with the same final sheaf but different orbits' inferential paths can be `~_H` while having different settlement-morphism structure.
- **Closure-rule-system identity**. Different rule-systems can produce the same sheaf-iso class. `~_H` quotients out the inferential path; only the cohomological outcome matters.

## Why this lives at settling tier

Cohomological equivalence is computed on the **Priestley-side bitopological settling site** — a settling-tier object. The sheaves involved (`F_U`, `F_{U'}[δ]`) are settling-associated-sheaves at settling tier. The whole apparatus is settling-tier.

The placement `finite-settlement-algebra/hacking/library/cohomological-equivalence/` records this: `~_H` is an equivalence on settlement objects, computed via their Priestley duals and sheaves.

## Operational consequence

Cohomological classification of settlements uses `~_H` as its equivalence: two settlements are classified the same iff their cohomological data agrees, i.e., `v ~_H v'`.

For aperiodic-regime settlements, `~_H` and MLD often DIFFER: MLD requires invertible settlement-morphisms (structural inferential identity), while `~_H` only requires cohomological isomorphism. The MLD/`~_H` distinction is the substrate's expression of "structurally equivalent vs cohomologically equivalent."

## Position

`finite-settlement-algebra/hacking/library/cohomological-equivalence/`. Settling tier — equivalence on settlements via their Priestley-side cohomological data. Coarsest of the three settlement-equivalences.

## Derivation source

Adapted from `predication-categories/concepts/cohomological-equivalence.md`, preserved at `docs/dev/scraps/`. The archive scrap continues with the worked counterexample comparing `v_1` and `v_2`; full detail in the scrap.
