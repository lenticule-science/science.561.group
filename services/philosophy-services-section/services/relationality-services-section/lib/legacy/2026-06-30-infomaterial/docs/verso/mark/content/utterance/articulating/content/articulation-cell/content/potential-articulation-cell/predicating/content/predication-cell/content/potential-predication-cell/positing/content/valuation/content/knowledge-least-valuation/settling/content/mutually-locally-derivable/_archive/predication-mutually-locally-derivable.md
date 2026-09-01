---
type: concept
class: equivalence-relation
symbol: "\\sim_{\\mathrm{MLD}}"
depends-on: [predication-settling, settling-morphism, aperiodic-settling]
---

# Mutually locally derivable settlings

The equivalence relation on [aperiodic-regime](../theorems/four-regime-dichotomy.md) [predication settlings](../objects/predication-settling.md) classified by the [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md).

Two aperiodic settlings $v, v'$ over a common base $(\mathbf{L}, \mathcal{C}, E, \lambda)$ are **mutually locally derivable** — written $v \sim_{\mathrm{MLD}} v'$ — iff there exists an invertible [settling-morphism](settling-morphism.md) $v \to v'$.

## What MLD captures and what it doesn't

MLD-equivalence includes settling-shift: two settlings differing only in starting ordinal are MLD. It does **not** include arbitrary relabelling — the settling-morphism family $\phi_{q, \tau}$ must commute with both settlings' endofunctors, so any equivalence respects the structural closure pattern, not just static values.

This is the settling analogue of MLD-equivalence for substitution tilings ([@sadun2008] Ch. 1), which pairs translation-equivalence with a pattern-preserving local map. The "local" part comes from the $\phi$ acting fiberwise; the "derivable" part from the settling-endofunctor commutation, which says each settling's structural derivations match the other's.

## Why this equivalence

For [aperiodic settlings](teaching/explanations/aperiodic-settling.md) — those that do not stabilize at any countable ordinal — strict isomorphism is too rigid: settlings that intuitively encode the same aperiodic structure can fail to be literally isomorphic because of settling-shift, base-element relabeling, or other surface-level differences. MLD-equivalence is the right notion for which the [aperiodic-regime classification theorem](../theorems/aperiodic-regime-classification.md) holds: two aperiodic settlings are MLD-equivalent iff their classifying invariants in $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U)$ agree.

Strictly finer classification would require either replacing $\mathbf{Ab}$ with a richer value category — see [bilattice-valued sheaves](questions/bilattice-valued-sheaves.md) — or moving up to $H^2$ on a different sheaf — see [exceptional higher cohomology](questions/exceptional-higher-cohomology.md).
