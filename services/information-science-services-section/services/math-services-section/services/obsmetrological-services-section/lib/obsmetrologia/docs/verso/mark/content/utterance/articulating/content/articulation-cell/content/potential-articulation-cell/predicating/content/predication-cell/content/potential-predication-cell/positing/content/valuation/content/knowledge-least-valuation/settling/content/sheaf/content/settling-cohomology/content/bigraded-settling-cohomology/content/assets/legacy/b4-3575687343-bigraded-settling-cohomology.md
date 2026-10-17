---
name: bigraded-settling-cohomology
kind: invariant
description: "The bigraded refinement of settling-cohomology that separates truth-side firings (H^1_t) from inconsistency-side firings (H^1(F^(⊤))). For an aperiodic settling v, the pair (cl-inv^(t)(v), cl-inv^(⊤)(v)) ∈ H^1_t ⊕ H^1(F^(⊤)) is the bigraded classifying invariant; its zero/non-zero pattern partitions the aperiodic stratum into consistent / paraconsistent / mixed sub-strata."
symbol: "H^1_t ⊕ H^1(F^(⊤))"
components: "truth-side cohomology H^1_t (from settling-associated-sheaf) + inconsistency-side cohomology H^1(F^(⊤)) (from inconsistency-sheaf)"
lives-in: "H^1_t ⊕ H^1(F^(⊤)) = settling-associated-sheaf cohomology ⊕ inconsistency-sheaf cohomology"
classifies: "aperiodic settlings refined by trichotomy: consistent (⊤-component zero) / paraconsistent (t-component zero) / mixed (both non-zero)"
minted-from: theorem-context — referenced by bigraded-aperiodic-regime-trichotomy and related bigraded/paraconsistent theorems with no own archive scrap. Reconstructed from how the trichotomy theorem decomposes it.
---

# Bigraded settling-cohomology

The **bigraded refinement** of `settling-cohomology` that separates aperiodic-invariant data into two cohomological components, one tracking ordinary truth-side firings and one tracking inconsistency-side firings.

## Definition

For an aperiodic settling `v` over parameter base `B`, the **bigraded classifying invariant** is the pair

$$\mathrm{cl}\text{-}\mathrm{inv}^{(k, t)}(v) \;=\; \bigl(\mathrm{cl}\text{-}\mathrm{inv}^{(t)}(v),\; \mathrm{cl}\text{-}\mathrm{inv}^{(\top)}(v)\bigr) \;\in\; H^1_t \;\oplus\; H^1(\mathcal{F}_U^{(\top)}),$$

with components:

- `cl-inv^(t)(v) ∈ H^1_t` — the **truth-side classifying invariant**, computed in the cohomology of `settling-associated-sheaf` (the substrate's standard settling-cohomology applied to ordinary truth-valued firings).
- `cl-inv^(⊤)(v) ∈ H^1(F^(⊤))` — the **inconsistency-side classifying invariant**, computed in the cohomology of `inconsistency-sheaf` (the sub-sheaf carrying only the ⊤-valued firings).

The pair lives in the direct sum of the two cohomology groups; the bigrading is `(k, t)` = (knowledge axis, truth axis) of the bilattice `FOUR`.

## Why bigraded

The classical (single-graded) classifying invariant `cl-inv(v) ∈ H^1` of an aperiodic settling lumps together ordinary firings and ⊤-firings into one cohomology group. The bigraded version **decomposes by Belnap class**:

- The truth-axis component `t` distinguishes positive-truth firings (the classical part).
- The knowledge-axis component `⊤` distinguishes contradiction firings (the paraconsistent part).

Each component captures structurally different aperiodic content:

- **`H^1_t`** sees the standard aperiodic pattern through truth-valued data. Vanishes for paraconsistent-only settlings (all contradictions, no truth).
- **`H^1(F^(⊤))`** sees the paraconsistent pattern through inconsistency data. Vanishes for consistent settlings (no contradiction firings).

The separation is exactly what `bigraded-aperiodic-regime-trichotomy` (at `settling-cohomology/docs/dev/theorems/`) uses to classify aperiodic settlings into three disjoint, jointly exhaustive sub-strata.

## The trichotomy

The bigraded classifying invariant partitions the aperiodic stratum `|KP^vis(B)|_D` into three sub-strata indexed by the (zero / non-zero) pattern of its two components:

| Sub-stratum | `cl-inv^(t)` | `cl-inv^(⊤)` | Meaning |
|---|---|---|---|
| Consistent | non-zero | zero | Aperiodic, no ⊤-firings (textbook aperiodic-classical) |
| Paraconsistent | zero | non-zero | Aperiodic only through contradictions; truth-data trivial |
| Mixed | non-zero | non-zero | Both aperiodic patterns coexist |

The fourth combination `(0, 0)` — both invariants zero — is **not aperiodic**, hence excluded from `|KP^vis(B)|_D`.

## Gauge interaction

The bigraded invariant has a clean interaction with the **internal Z/2 gauge** (bilattice negation `~`):

| Sub-stratum | Z/2-gauge behavior |
|---|---|
| Paraconsistent | All designated cells are ⊤-valued, fixed by `~`. The sub-stratum is **gauge-stable**. |
| Consistent | Generic settlings are gauge-unstable; gauge-stable sub-locus exists where designated cells are diagonally `~`-paired. |
| Mixed | Intermediate: partially gauge-stable, depending on ⊤-content distribution. |

This Z/2-equivariance (via `classifying-morphism-z2-equivariance` theorem) decorates each sub-stratum with an additional structure visible in moduli computations.

## Worked example: padovan strict-finite

In the **strict-finite regime** (canonical example Padovan substitution `P(n) = P(n-2) + P(n-3)`, per the substitution-regime mapping):

- Padovan substitution produces only truth-valued firings (no contradictions in the canonical case).
- So `cl-inv^(⊤) = 0`.
- `cl-inv^(t)` is non-zero (it captures the Padovan substitution's aperiodic invariant — non-zero since Padovan is aperiodic).

Strict-finite Padovan settling lands in the **consistent** sub-stratum.

## Worked example: contradiction-laden Tribonacci

In the **transfinite-bounded regime** (canonical example Tribonacci), a variant constructed by **augmenting Tribonacci** with a closure rule `(p, T(n), x) ⊑ ⊤_p` for all `(n, x)` in some pattern produces ⊤-firings on a Tribonacci-pattern subgrid:

- `cl-inv^(⊤)` captures the Tribonacci pattern of the ⊤-firings — non-zero.
- `cl-inv^(t)` still captures the underlying truth-side Tribonacci — non-zero.

This is the **mixed** sub-stratum: both invariants encode the same Tribonacci substitution, but on different Belnap-side data.

## Relation to single-graded settling-cohomology

The classical `settling-cohomology` (`H^1` on `settling-associated-sheaf`) is recovered as the **first component** of the bigrading. The second component (`H^1` on `inconsistency-sheaf`) is the genuinely new content that the bigrading adds.

Combined-cohomological classifications (e.g., `combined-cohomology-classifying-morphism`) typically use the bigraded version as their target.

## Position

`settling-cohomology/library/bigraded-settling-cohomology/`. Settling tier — direct `library/` (derived term of `settling-cohomology`, not admitted). The bigrading is a structural refinement of the cohomology framework, so it lives as a sub-object of `settling-cohomology`.

## Derivation source

**Minted from theorem context.** Referenced by `bigraded-aperiodic-regime-trichotomy`, by paraconsistent-classification theorems, by combined-cohomology-classifying-morphism, with no own archive scrap. Reconstructed from how the trichotomy theorem decomposes the invariant into its two components, plus the substrate's standard Belnap-class partitioning of firings.
