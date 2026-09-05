---
name: inconsistency-sheaf
kind: sheaf
description: "The sub-sheaf F^(⊤) ⊆ settling-associated-sheaf that retains only ⊤-valued (contradictory) firings, discarding the t/f/⊥ cells. Cohomology of F^(⊤) is the ⊤-component of the bigraded classifying invariant; vanishing of H^1(F^(⊤)) characterizes the consistent sub-stratum of the aperiodic moduli."
symbol: "F^(⊤)"
on-site: "bitopological-settling-site (T*, J)"
valued-in: "Q-Cat_cwl, supported on the ⊤-strand of FOUR"
sections-meaning: "the ⊤-valued cells of a settling — the contradictory firings"
parent-sheaf: "settling-associated-sheaf F"
projection: "F → F^(⊤) selects the ⊤-component of each cell"
minted-from: theorem-context — referenced by bigraded-aperiodic-regime-trichotomy and the paraconsistent-classification family of theorems with no own archive scrap. Reconstructed from how those theorems use the ⊤-component projection.
---

# Inconsistency-sheaf

The **sub-sheaf carrying only ⊤-valued firings**. Each cell of `settling-associated-sheaf` is a FOUR-valued datum `v(p, x) ∈ {⊥, t, f, ⊤}`. The inconsistency-sheaf `F^(⊤)` is the sub-sheaf whose stalks retain only the ⊤ component.

## Definition

For an aperiodic settling `v` and its associated sheaf `F` on the bitopological-settling-site, the **inconsistency-sheaf** `F^(⊤)` is defined cellwise:

$$\mathcal{F}^{(\top)}(\sigma) \;:=\; \{c \in \mathcal{F}(\sigma) \mid c = \top\},$$

with restrictions inherited from `F` (the ⊤-sub-sheaf is naturally a sub-presheaf, and sheafification yields the sheaf).

The complementary projection `F^(t,f,⊥) ⊆ F` retains the non-⊤ firings; together `F = F^(t,f,⊥) ⊕ F^(⊤)` as a coproduct of sub-sheaves (this is the **Belnap-class decomposition** of the settling-associated-sheaf).

## Why ⊤ separately

The four states of FOUR have different structural roles:

- `⊥` (told nothing) — sheaf-trivial: no evidence, no firing.
- `t` (told positive) — the substrate's "true" cells; classical-truth content.
- `f` (told negative) — the substrate's "false" cells; classical-truth content.
- `⊤` (told both) — contradiction; **paraconsistent** content.

The first three are jointly the **truth-side** content; only `⊤` is the **inconsistency** content. The substrate's bigraded classifying invariant (`bigraded-settling-cohomology`) separates these to detect aperiodic patterns that are present only in contradictions, not in truth-values, or vice versa.

## What `H^1(F^(⊤))` detects

A non-zero `H^1(F^(⊤))` is a non-trivial aperiodic cohomology class in the ⊤-component:

- It means there exist ⊤-firings arranged in a pattern that doesn't shrink to a point (a non-trivial 1-cocycle).
- Such a pattern is preserved under MLD-equivalence: any MLD-image of the settling has cohomologously the same ⊤-class.
- So `H^1(F^(⊤))` is the invariant that classifies aperiodic settlings **with respect to their contradiction structure** — independent of their truth-side structure.

By contrast, `H^1_t` on `settling-associated-sheaf` (or equivalently on `F^(t,f,⊥)`) captures the truth-side aperiodic structure.

## Worked example: paraconsistent Tribonacci

A Tribonacci-substitution settling can be "made paraconsistent" by **declaring every Tribonacci-pattern cell ⊤** (instead of the natural t / f assignment). The resulting settling has:

- All non-Tribonacci-pattern cells: `⊥` (no firing).
- All Tribonacci-pattern cells: `⊤` (paraconsistent firing).

Then:

- `F^(t,f,⊥)` carries only `⊥` cells everywhere → cohomology zero.
- `F^(⊤)` carries the Tribonacci pattern in its ⊤ component → `H^1(F^(⊤))` non-zero (it sees the Tribonacci aperiodicity).

This is the canonical example of a **paraconsistent-only** aperiodic settling.

## Compatibility with the bilattice negation gauge

The bilattice negation `~: FOUR → FOUR` sends `⊤ ↦ ⊤` (`⊤` is self-dual under negation). So the inconsistency-sheaf is **gauge-stable**: `~`-acting on `F^(⊤)` gives back `F^(⊤)`.

By contrast, the truth-side decomposition `F^(t,f,⊥)` is **not** gauge-stable: `~` sends `t ↔ f`, so `F^(t)` and `F^(f)` are swapped.

This is why the trichotomy's gauge interaction (per `bigraded-aperiodic-regime-trichotomy`'s gauge-interaction section) treats the paraconsistent sub-stratum as gauge-stable and the consistent sub-stratum as gauge-unstable.

## Position

`settling-associated-sheaf/library/inconsistency-sheaf/`. Settling tier — the inconsistency-sheaf is a **sub-sheaf** of the settling-associated-sheaf, so it lives inside that sheaf's `library/` as a derived term (not admitted).

## Derivation source

**Minted from theorem context.** Referenced by `bigraded-aperiodic-regime-trichotomy`, by `paraconsistent-classification`, by `combined-cohomology-classifying-morphism`, with no own archive scrap. Reconstructed from how those theorems decompose the settling-associated-sheaf by Belnap class, plus the substrate's standard FOUR-valued logic conventions.
