---
type: narrative
introduces: [closure-ordinal, four-regime-dichotomy]
see-also: [aperiodic-regime-classification, non-scott-continuous-firing-ordinal, regime-stratification-non-semicontinuity, scott-continuous-regime-cohomology-vanishing, scott-continuous-regime-mld-polynomial, strict-regime-cohomology-vanishing, strict-regime-mld-trivial, transfinite-bounded-regime-h1-generators]
---

# Regime stratification

The settling either stabilizes or it does not, and if it does, the stabilization ordinal can be small (finite) or large (transfinite). The four-way classification — the [four-regime dichotomy](../../theorems/four-regime-dichotomy.md) — is predication categories' central organizing structural fact: every settling with eventually-zero increments falls into exactly one of four regimes, indexed by its [closure ordinal](../../objects/closure-ordinal.md) $\kappa$.

- **Strict regime** — $\kappa < \omega$. Finite stabilization. Cohomology is identically zero ([strict-regime cohomology vanishing](../../theorems/strict-regime-cohomology-vanishing.md)); MLD-classification reduces to designated-cell counts ([MLD-equivalence in the strict regime is trivial](../../theorems/strict-regime-mld-trivial.md)). The "easy" regime.

- **$\omega$-Scott (Scott-continuous) regime** — $\kappa = \omega$. The closure operator is Scott-continuous — its action commutes with directed suprema — and the settling stabilizes at the first infinite ordinal. Cohomology still vanishes ([Scott-continuous regime cohomology vanishing](../../theorems/scott-continuous-regime-cohomology-vanishing.md)); classification is polynomial in settling length ([Scott-continuous regime MLD-equivalence in polynomial time](../../theorems/scott-continuous-regime-mld-polynomial.md)).

- **Transfinite-bounded regime** — $\omega < \kappa < \omega_1$. The closure fails Scott-continuity but stabilizes at some countable ordinal. $H^1$ becomes non-zero, with generators indexed by [non-Scott-continuous firing ordinals](../../teaching/explanations/non-scott-continuous-firing-ordinal.md) (see [transfinite-bounded $H^1$ generators](../../theorems/transfinite-bounded-regime-h1-generators.md)).

- **Aperiodic regime** — $\kappa \geq \omega_1$. No countable ordinal stabilizes the settling. The [aperiodic-regime classification](../../theorems/aperiodic-regime-classification.md) is predication categories' deepest result: aperiodic settlings up to MLD-equivalence are classified by their $H^1$-class in a direct-limit cohomology, structurally analogous to Anderson–Putnam's classification of substitution tilings.

The dichotomy is *combinatorial*, not topological: the regime is a function of the closure operator's continuity properties and the entity-set's cofinality, not of any ambient topology on the moduli of settlings. See [regime-stratification non-semicontinuity](../../theorems/regime-stratification-non-semicontinuity.md). Most of the cohomological and moduli results are stratified by regime, with each regime having its own characteristic invariants and decision procedures.

## d-frame cohomology in each regime

The chapter has d-frame-valued cohomology results paralleling the $\mathbf{Ab}$-valued ones above, with the regime structure preserved. In each regime, d-frame $H^0$, $H^1$, and $H^{\geq 2}$ are computed via the cellular extension plan's Layer 1+2+3 (now closed in the Boolean d-frame scope). The aperiodic case is handled by [aperiodic-regime d-frame cohomology](../../theorems/aperiodic-regime-d-frame-cohomology.md): direct-limit assembly over countable truncations, with each truncation handled by the proved transfinite-bounded d-frame cohomology theorem, no transfinite Tarski–Lawvere convergence required.

## Robustness across value categories

The four-regime dichotomy survives generalization beyond the discrete-bilattice setting. The [continuous-state regime classification](../../theorems/continuous-state-regime-classification.md) lifts the regime-classification machinery to Lawvere-quantale-enriched, fuzzy-logic, and real-valued settings, and to continuous-time semigroup dynamics. The four regimes (strict / Scott-continuous / transfinite-bounded / aperiodic) survive each of these generalizations, with the appropriate continuity/cofinality conditions defined for the new value category. The combinatorial nature of the dichotomy is what makes it robust — it depends on the closure operator's continuity and the cofinality structure of the value lattice, both of which generalize cleanly.
