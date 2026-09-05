---
type: definition
class: order-parameter
symbol: "g(z)"
status: draft
depends-on: [inference-sub-settling, cosmological-settling, knowledge-order]
---

# Sufficiency gap

A scalar-valued function $g : \mathbb{R}_{\geq 0} \to [0, 1]$ on cosmological [redshift](../../../terms/redshift.md), measuring the failure of two [inference sub-settlings](inference-sub-settling.md) to be jointly consistent in the parent [cosmological settling](cosmological-settling.md).

Definition: for inference sub-settlings $E_{\mathrm{early}}, E_{\mathrm{late}}$ projected onto a shared observable plane $\Pi_z$ (the typical choice is $(H, D_A)$ at redshift $z$),

$$g(z) = 1 - \frac{V\bigl(v_{\mathrm{early}}(z) \wedge_k v_{\mathrm{late}}(z)\bigr)}{V\bigl(v_{\mathrm{early}}(z) \vee_k v_{\mathrm{late}}(z)\bigr)}$$

where $\wedge_k, \vee_k$ are the [knowledge-order](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) meet and join in $\mathbf{L}$ (continuous bilattice case), $v_{\mathrm{early}}(z), v_{\mathrm{late}}(z)$ are the two sub-settlings' values restricted to the redshift-$z$ slice of $\Pi_z$, and $V$ is a fixed measure on the projection plane.

## Interpretation

- $g(z) = 0$: the two sub-settlings' values join cleanly in $\mathbf{L}$ — the joint value is the meet, which equals the join, and nothing is lost in combining them.
  The two pipelines are saying compatible things at redshift $z$.
- $g(z) > 0$: the join exceeds the meet.
  The two sub-settlings each have evidence the other does not, and combining them produces a value strictly weaker than either alone in $\leq_k$.
  This is a **residuation failure**: $v_{\mathrm{early}}$ and $v_{\mathrm{late}}$ are not [knowledge-order](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) compatible.
- $g(z) \to 1$: the two sub-settlings' supports are nearly disjoint in $\Pi_z$ — they are saying entirely incompatible things.

The sufficiency gap is the predicated translation of the classical "consistency fraction" used in cosmological calibration analysis, embedded in the bilattice apparatus so that it remains well-defined for non-Gaussian and high-dimensional posteriors.

## Equivalent formulations

For continuous-bilattice values supported on convex regions in $\Pi_z$, $g(z)$ reduces to the standard intersection-over-union complement: $1 - V(\mathrm{intersection}) / V(\mathrm{union})$.
For discrete-bilattice values, $g(z) = 1$ when the two cells take incompatible truth-axis projections (one $\mathbf{t}$, one $\mathbf{f}$), $g(z) = 0$ when they agree, and intermediate values for the partial-evidence cases ($\mathbf{both}$, $\mathbf{none}$).

## As an order parameter

The sufficiency gap $g(z)$ varies smoothly with redshift if the underlying disagreement between sub-settlings has a smooth physical origin (a missing parameter, an evolving systematic).
Empirically, the observed $g(z)$ for the Planck-vs-DESI/Pantheon+ pair is small at low $z$ and high $z$ but peaks near $0.7 < z < 1.3$ — coincident with the matter-to-dark-energy transition.
This temporal localization motivates treating $g(z)$ as an **order parameter** for a phase change in the [cosmological settling](cosmological-settling.md); see [reflexive-friedmann-coupling](../theorems/reflexive-friedmann-coupling.md).

## Status

Draft.
The definition is well-typed and reproduces standard intersection-over-union calibration.
Open: the precise relationship between $g(z)$ measured on a finite-data approximation of the inference sub-settlings and the asymptotic sufficiency gap of the underlying ideal sub-settlings; this is a question about how the bilattice values' uncertainty interacts with the meet/join operations.

## Provenance

Translates the "residuated sufficiency gap" introduced in three prior reflexive-existence cosmology drafts (sscu-sprint, 2026-02-27): [`analyzing-hubble-tension-as-reflexive-dynamics.md`](../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relating/triage/provenance/relating-archive/sscu-sprint/domains/cosmology/analyzing-hubble-tension-as-reflexive-dynamics.md), [`dynamic-sufficiency-in-cosmological-inference.md`](../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relating/triage/provenance/relating-archive/sscu-sprint/domains/cosmology/dynamic-sufficiency-in-cosmological-inference.md), [`reflexive-disequilibrium-and-cosmological-phase-change.md`](../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relating/triage/provenance/relating-archive/sscu-sprint/domains/cosmology/reflexive-disequilibrium-and-cosmological-phase-change.md).
The earlier abstract formulations of the same construction live in the math-from-relationality-bucket: [`reflexive-residuated-sufficiency.md`](../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relating/triage/provenance/math-from-relationality-bucket/reflexive-residuated-sufficiency.md) (where $g$ is introduced as a generic calibration index across measurement systems) and [`reflexive-hubble-tension.md`](../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relating/triage/provenance/math-from-relationality-bucket/reflexive-hubble-tension.md) (where it is first specialized to redshift bins).
The original `Together`/`Either` operators on `Rel` map to bilattice $\wedge_k$/$\vee_k$ on $\mathbf{L}$; the original equivalence

$$\mathrm{Includes}(\mathrm{Together}(a,b),c) \iff \mathrm{Includes}(b, \mathrm{Induces}(a,c))$$

is the standard residuation law in a residuated bilattice, and its empirical failure is what $g(z)$ measures.
