---
type: example
depends-on: [aperiodic-settling, four-regime-dichotomy, aperiodicity-characterization, dual-predication-hyperdoctrine, scott-continuous-closure]
instantiates: [aperiodic-settling, four-regime-dichotomy]
lineage: 5
---

# Aperiodic settling — entry point of Lineage 5 (substitution-dynamics-flavored)

The entry point of **Lineage 5** — the aperiodic substitution-dynamics example chain. Where Lineages 1–4 progressively exercise predication categories' machinery on increasingly rich (but still tame) bases, Lineage 5 is the *headline* lineage: substantive aperiodic settlings encoded as substitution dynamics, with explicit comparison to the published Anderson-Putnam tiling cohomology literature.

L5 has **three sub-lineages**, picked per the structural feature being exercised:

- **L5a Fibonacci substitution.** Simplest 1-D substitution ($a \mapsto ab$, $b \mapsto a$); workhorse for the basic aperiodic-classifying-invariant computation and the Anderson-Putnam comparison.
- **L5b Thue-Morse substitution.** Binary substitution ($0 \mapsto 01$, $1 \mapsto 10$); chosen for its clean d-frame compatibility (alternating 0/1 valuation aligns with truth-positive / falsity-positive content).
- **L5c Penrose substitution.** 2-D substitution; the literature's most-celebrated aperiodic system with the most-developed Anderson-Putnam computation. The Big Benchmark.

## Qualitative shape (general aperiodic)

- [Entity set](../objects/entity-set.md) $E$: a class-sized collection, or $E = \omega_1$ (predication categories' typical aperiodic-regime base).
- Closure rules encoding substitution dynamics: cells of $E \times E$ encode "tile types at positions"; the substitution rule produces new cells from prior ones, iterated transfinitely.
- The settling reaches closure ordinal $\kappa = \omega_1$ — aperiodic regime.

By [aperiodicity characterization](../theorems/aperiodicity-characterization.md), the settling is aperiodic iff the closure is non-Scott-continuous and the state space has cofinality at least $\omega_1$ — both met.

## Connection to the literature

Aperiodic substitution tilings (Penrose, Fibonacci, Thue-Morse, etc.) have been classified up to MLD-equivalence via [Anderson-Putnam](../objects/anderson-putnam-direct-limit.md)'s direct-limit construction — Čech cohomology of the inverse-limit tiling space.

The corpus's aperiodic-regime classification ([aperiodic-regime classification](../theorems/aperiodic-regime-classification.md)) generalizes the Anderson-Putnam framework to bilattice-valued / closure-rule-driven settlings. Lineage 5 instantiates the corpus on these specific substitution systems and verifies predication categories' invariants match the known invariants from the tiling literature.

## L5 members

L5a (Fibonacci):
- [fibonacci-substitution-settling](fibonacci-substitution-settling.md) (forthcoming) — anchor.
- [fibonacci-classifying-invariant](fibonacci-classifying-invariant.md) (forthcoming).
- [fibonacci-co-classifying-invariant](fibonacci-co-classifying-invariant.md) (forthcoming).
- [fibonacci-strong-mld-orbit](fibonacci-strong-mld-orbit.md) (forthcoming).
- [fibonacci-verdier-dual-presentation](fibonacci-verdier-dual-presentation.md) (forthcoming).
- [fibonacci-anderson-putnam-comparison](fibonacci-anderson-putnam-comparison.md) (forthcoming).
- [fibonacci-meta-classification](fibonacci-meta-classification.md) (forthcoming).
- [fibonacci-deformation-tangent](fibonacci-deformation-tangent.md) (forthcoming).

L5b (Thue-Morse):
- [thue-morse-substitution-settling](thue-morse-substitution-settling.md) (forthcoming).
- [thue-morse-d-frame-cohomology](thue-morse-d-frame-cohomology.md) (forthcoming).
- [thue-morse-classifying-invariant](thue-morse-classifying-invariant.md) (forthcoming).

L5c (Penrose):
- [penrose-substitution-settling](penrose-substitution-settling.md) (forthcoming).
- [penrose-classifying-invariant](penrose-classifying-invariant.md) (forthcoming).
- [penrose-anderson-putnam-full-comparison](penrose-anderson-putnam-full-comparison.md) (forthcoming).

## L5's role

L5 is the *headline* benchmark — where predication categories' framework is demonstrated on substantive cases the literature has explicit data for. If the L5 examples land cleanly (corpus's invariants match Anderson-Putnam's), the framework is *demonstrated* on substantive aperiodic instances. If they don't land cleanly, the discrepancies surface where predication categories' framework genuinely differs from the existing aperiodic-tiling apparatus.

## Position relative to other lineages

| Lineage | Regime | $\kappa$ | $|L_{\mathrm{ns}}|$ | $\dim \mathrm{Ext}^1$ |
|---|---|---|---|---|
| L1 | strict | $\leq 1$ | 0 | 0 |
| L2 | strict | finite | 0 | 0 |
| L3 | Scott-continuous | $\omega$ | 0 | 0 |
| L4 | transfinite-bounded | $\omega \cdot k + 1$ | $k$ | $k$ |
| L5 | aperiodic | $\omega_1$ | $\omega_1$ | $2^{\aleph_0}$ |

L5 is the *terminal* lineage — most complex closure ordinal, uncountable invariants, predication categories' full machinery activated.
