---
type: theorem
status: draft
depends-on: [inference-sub-settling, sufficiency-gap, cosmological-settling]
---

# Hubble tension as residuation failure

**Statement.** The persistent discrepancy between early-universe and late-universe inferences of the [Hubble parameter](../../../theories/evolution/terms/hubble-parameter.md) $H_0$ — known as the **Hubble tension** — is, in the predicated framing, a **residuation failure** between the [inference sub-settlings](../objects/inference-sub-settling.md) $E_{\mathrm{early}}$ and $E_{\mathrm{late}}$ within the parent [cosmological settling](../objects/cosmological-settling.md).

Operationally, the tension corresponds to a non-zero [sufficiency gap](../objects/sufficiency-gap.md) $g(z)$ across the redshift range $0 < z < 3$ where both sub-settlings have non-trivial support, with empirical observation that $g(z)$ is small at low and high $z$ but peaks near $0.7 < z < 1.3$.

## Statement of the residuation law

In a [residuated bilattice](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/residuated-lattice.md) $\mathbf{L}$, the residuation law

$$ a \wedge_k b \leq_k c \iff b \leq_k a \to_k c $$

holds definitionally — $\to_k$ is by construction the right adjoint to $\wedge_k$.
The law itself never fails.
What can fail, for two specific stabilized inference sub-settlings projected onto a shared observable predicate $p$, is the **compatibility condition** required for their values to combine into a single non-degenerate joint valuation:

$$ v_{\mathrm{early}}(p) \wedge_k v_{\mathrm{late}}(p) >_k \bot. $$

When this condition fails — when the bilattice meet of the two values collapses to $\bot$ (no shared evidence) — the residual $v_{\mathrm{late}}(p) \to_k v_{\mathrm{early}}(p)$ becomes the trivial top of $\leq_k$, and there is no proper $b$ such that $v_{\mathrm{late}}(p) \wedge_k b \leq_k v_{\mathrm{early}}(p)$ in a non-degenerate way.
The two sub-settlings cannot be combined into a single coherent valuation of $p$ within the residuated structure.
We call this state of affairs a **residuation failure** of the pair $(E_{\mathrm{early}}, E_{\mathrm{late}})$ on $p$.

The Hubble tension is the empirical observation that this compatibility condition is violated (or near-violated) for the predicate $p = H_0$ — and, more generally, has measurably reduced compatibility across the redshift range $0 < z < 3$, captured by $g(z)$ — when $E_{\mathrm{early}}$ is the Planck CMB sub-settling and $E_{\mathrm{late}}$ is the distance-ladder sub-settling.

## What this is and is not claiming

**Claiming:** The Hubble tension is structural, not merely statistical.
It is the visible footprint of a residuation failure between two stabilized observers of the same cosmological settling.
The tension cannot be resolved by accumulating more data within either pipeline — the two sub-settlings are individually closed (each is at $\mathrm{Close}(E_i) = E_i$), so additional data either stays within the existing closure or exposes the same tension more sharply.

**Not claiming:** Any specific *physical* resolution.
The residuation-failure framing leaves open which of three possibilities is actually the case:

1. **Systematic in one pipeline.** Either $E_{\mathrm{early}}$ or $E_{\mathrm{late}}$ has a closure that rests on a hidden assumption that does not actually hold; once corrected, residuation is restored.
  (This is the standard "it's a measurement issue" hope.)
2. **Missing predicate.** The shared predicate sub-category $\mathcal{C}_O$ is too small — there is a hidden predicate $p^*$ measured by neither pipeline whose value would mediate the residuation.
  Adding $p^*$ to $\mathcal{C}_O$ and measuring it would close the tension.
  (Candidates: early dark energy, evolving dark energy equation of state.)
3. **Closure-rule system inconsistency.** The cosmological settling itself, at the level of the closure-rule system that drives its evolution, is genuinely under-specified for the cells the two pipelines are asking about.
  No additional data and no additional predicate would resolve the tension; the universe's physical content is, to the precision currently being asked about, not single-valued.

The residuation framing makes these three possibilities *structurally distinct* — they correspond to different kinds of fix to the inference sub-settlings — and provides $g(z)$ as a quantitative diagnostic that can in principle distinguish them: the redshift profile of $g(z)$ under different proposed extensions of the predicate sub-category constrains which fix is required.

## Relation to the standard formulation

The standard formulation of the Hubble tension is statistical: a $\sim 5\sigma$ discrepancy between Planck $H_0 \approx 67.4 \pm 0.5$ km/s/Mpc and SH0ES $H_0 \approx 73.0 \pm 1.0$ km/s/Mpc.
The predicated formulation is structural: a residuation failure of two stabilized sub-settlings, whose magnitude across redshift is captured by $g(z)$.

For Gaussian, low-dimensional posteriors, the two formulations agree: the sufficiency gap reduces to the classical consistency fraction, and a $g(z)$ above the null distribution corresponds to a statistically significant tension.
The predicated formulation differs in what it does next: it embeds the tension in a categorical structure that supports forward dynamical extensions ([reflexive-friedmann-coupling](reflexive-friedmann-coupling.md)) and connects it to other structural features of the cosmological settling.

## Status

Draft.
The structural translation is internally consistent.
Open: an explicit construction of $E_{\mathrm{early}}$ and $E_{\mathrm{late}}$ as bilattice-valued sub-settlings starting from published Planck and DESI/Pantheon+ posterior chains, and verification that the predicated $g(z)$ on this construction reproduces the empirical pattern (peak in $0.7 < z < 1.3$).

## Provenance

Translates the central thesis of three sscu-sprint cosmology drafts (2026-02-27): [`analyzing-hubble-tension-as-reflexive-dynamics.md`](../../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relating/triage/provenance/relating-archive/sscu-sprint/domains/cosmology/analyzing-hubble-tension-as-reflexive-dynamics.md), [`dynamic-sufficiency-in-cosmological-inference.md`](../../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relating/triage/provenance/relating-archive/sscu-sprint/domains/cosmology/dynamic-sufficiency-in-cosmological-inference.md), [`reflexive-disequilibrium-and-cosmological-phase-change.md`](../../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relating/triage/provenance/relating-archive/sscu-sprint/domains/cosmology/reflexive-disequilibrium-and-cosmological-phase-change.md).
Earlier and more abstract precursors in the math-from-relationality-bucket: [`reflexive-hubble-tension.md`](../../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relating/triage/provenance/math-from-relationality-bucket/reflexive-hubble-tension.md) and [`reflexive-residuated-sufficiency.md`](../../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relating/triage/provenance/math-from-relationality-bucket/reflexive-residuated-sufficiency.md) — these state the residuation law and the gap $g$ in their generic categorical form before specialization to cosmology.
The reflexive-existence formulation's "failure of residuation in the relational field" is the predicated formulation's "residuation failure between inference sub-settlings of the cosmological settling."
