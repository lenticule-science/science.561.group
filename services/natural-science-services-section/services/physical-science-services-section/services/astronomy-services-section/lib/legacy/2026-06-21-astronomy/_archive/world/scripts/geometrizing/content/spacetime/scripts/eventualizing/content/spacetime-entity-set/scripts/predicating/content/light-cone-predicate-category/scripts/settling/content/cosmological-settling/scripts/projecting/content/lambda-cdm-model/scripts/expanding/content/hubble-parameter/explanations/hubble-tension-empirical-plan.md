---
type: example
status: sketch
instantiates: [sufficiency-gap, hubble-tension-as-residuation-failure]
depends-on: [inference-sub-settling, sufficiency-gap]
---

# Empirical plan for measuring the sufficiency gap on Planck + DESI + Pantheon+

A computational plan for evaluating the [sufficiency gap](../objects/sufficiency-gap.md) $g(z)$ on currently available cosmological data, as a concrete empirical test of the [hubble-tension-as-residuation-failure](../theorems/hubble-tension-as-residuation-failure.md) thesis.

## Data

- **Early-time inference sub-settling $E_{\mathrm{early}}$:** Planck 2018 $\Lambda$CDM parameter chains, projected onto the observables $H(z)$, $D_A(z)$, $r_d$.
- **Late-time inference sub-settling $E_{\mathrm{late}}$:** DESI BAO DR1 measurements of $H(z)$ and $D_A(z)$ in redshift bins; Pantheon+ Type Ia supernova distance moduli, converted to $D_A(z)$ via the standard distance-duality relation.
- **Redshift range:** $0 < z < 3$, binned to match DESI BAO bins.

## Procedure

1. Load full posterior samples from each pipeline with covariance propagated through the projection to the $(H, D_A)$ plane.
2. For each redshift bin $z_i$, project the two sub-settlings onto $\Pi_{z_i} = (H(z_i), D_A(z_i))$.
3. Construct bilattice-valued representations of the projected posteriors. In the simplest case (Gaussian posteriors), the bilattice value is the convex region containing the central confidence interval; in the general case, use a kernel-density estimate as the support.
4. Compute the [knowledge-order](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) meet and join: $v_{\mathrm{early}}(z_i) \wedge_k v_{\mathrm{late}}(z_i)$ as the intersection of supports, $v_{\mathrm{early}}(z_i) \vee_k v_{\mathrm{late}}(z_i)$ as the union.
5. Evaluate the sufficiency gap:

   $$g(z_i) = 1 - V\bigl(\text{intersection}\bigr) / V\bigl(\text{union}\bigr).$$

6. Bootstrap or resample posteriors to compute uncertainty $\sigma_{g(z_i)}$.
7. Construct the null distribution of $g(z)$ under the assumption that both sub-settlings sample the same underlying valuation: generate $N$ pairs of mock posteriors from a single Lambda-CDM parameter set with appropriate noise; compute $g_{\mathrm{null}}(z_i)$ for each.
8. Compare measured $g(z_i)$ against the null ensemble in each redshift bin; flag bins where measured exceeds null at $> 95\%$ percentile.

Conceptual pseudocode:

```python
load_posteriors("Planck", "DESI", "Pantheon+")
g = {}
for z in redshift_bins:
    v_early, v_late = project_to_observable_plane(z)
    intersection = bilattice_meet(v_early, v_late)
    union = bilattice_join(v_early, v_late)
    g[z] = 1 - volume(intersection) / volume(union)
g_uncertainty = bootstrap(g)
g_null = simulate_null_distribution(N=1000)
significance = compare_percentile(g, g_null)
```

## Expected outcome

Under [hubble-tension-as-residuation-failure](../theorems/hubble-tension-as-residuation-failure.md), the empirical $g(z)$ should exceed the null distribution in the redshift range $0.7 < z < 1.3$ and lie within the null elsewhere. The amplitude and shape of the excess constrain which of the three possible fixes (systematic, missing predicate, closure-rule inconsistency) is required.

If the [reflexive-friedmann-coupling](../theorems/reflexive-friedmann-coupling.md) RFS model fits the same data better than $\Lambda$CDM, that is independent evidence that the sufficiency gap captures a real degree of freedom rather than a measurement artifact.

## What this example is

A concrete, executable computational plan that operationalizes the predicated diagnosis of the Hubble tension. The pseudocode is sketch-level; a full implementation would require choosing a specific bilattice realization (e.g., the level-set representation of posteriors at chosen confidence levels) and the corresponding meet/join algorithms.

The example fixes the target: when run on real Planck + DESI + Pantheon+ data, this plan should reproduce the empirically known $g(z)$ profile reported in prior work, and should be runnable as a forward extension of any new dataset (LSST, Euclid, Roman) that constrains $H(z)$ and $D_A(z)$ in additional redshift bins.

## Provenance

Translates the empirical plans in [`analyzing-hubble-tension-as-reflexive-dynamics.md`](../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relationality/triage/provenance/relationality-archive/sscu-sprint/domains/cosmology/analyzing-hubble-tension-as-reflexive-dynamics.md) and [`reflexive-disequilibrium-and-cosmological-phase-change.md`](../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relationality/triage/provenance/relationality-archive/sscu-sprint/domains/cosmology/reflexive-disequilibrium-and-cosmological-phase-change.md) (sscu-sprint, 2026-02-27). The original plans were stated in the reflexive-existence vocabulary of `Together`/`Either`/`Includes`; this example restates them in the predication-categorical vocabulary of bilattice meet/join and inference sub-settlings, but the computational pseudocode is essentially unchanged because the operational meaning of "joint vs union of posterior support" is the same in both vocabularies.
