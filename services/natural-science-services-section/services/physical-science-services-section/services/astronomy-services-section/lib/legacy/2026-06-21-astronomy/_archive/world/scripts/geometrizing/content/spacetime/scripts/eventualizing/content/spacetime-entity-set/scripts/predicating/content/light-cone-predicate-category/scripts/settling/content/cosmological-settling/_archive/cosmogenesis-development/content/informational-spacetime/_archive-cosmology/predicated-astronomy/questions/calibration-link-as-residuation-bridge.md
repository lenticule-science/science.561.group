---
title: "Is the Hubble-tension residuation failure a special case of calibration-link failure?"
type: question
status: open
component-of: predicated-astronomy
explores: [calibration-link, instrument-fiber, astronomical-settling]
see-also: [hubble-tension-as-residuation-failure, sufficiency-gap]
---

# Is the Hubble-tension residuation failure a special case of calibration-link failure?

The [calibration-link](teaching/explanations/calibration-link.md) concept in predicated astronomy and the [Hubble-tension-as-residuation-failure](../../../../cosmology/theories/predicated-cosmology/theorems/hubble-tension-as-residuation-failure.md) reading in predicated cosmology share a structural pattern: two evidence-producing systems that ought to reconcile through a residuated relation in a common bilattice produce values whose joint meet falls short of what residuation would require.
The question is whether this is the same construction at two scales, or two distinct constructions that share a high-level resemblance.

## The candidate identification

The candidate identification is:

- The early-universe inference sub-settling $E_\text{early}(z)$ (Planck CMB) is the predication-categorical content of evidence produced by one [observer-instrument](teaching/explanations/observer-instrument.md) class — the CMB-anisotropy survey, end-to-end pipeline.
- The late-universe inference sub-settling $E_\text{late}(z)$ (distance-ladder, BAO, Pantheon+) is the content of evidence produced by another observer-instrument class — the cosmic-distance-ladder pipeline, terminating in supernova standard candles.
- The [residuated sufficiency gap](../../../../cosmology/theories/predicated-cosmology/objects/sufficiency-gap.md) $g(z)$ between them is, on this reading, the bilattice signature of a missing or failing calibration-link $\kappa$ between the two observer-instrument fibers on the predicate $H(z)$.

If this identification holds in detail, the predicated-cosmology Hubble-tension story and the predicated-astronomy calibration-link apparatus are different views of the same residuation-failure phenomenon.

## What needs to be done

1. **Construct the functor.** Specify a functor $\Phi$ from the predicated-cosmology category of inference sub-settlings to the predicated-astronomy category of instrument fibers, sending each cosmological inference sub-settling to the instrument fiber of the survey that produced it.
  Verify that $\Phi$ is well-defined (different cosmological reductions of the same survey land in the same fiber) and that it commutes with the relevant residuation operations on both sides.

2. **Translate the gap.** Show that the predicated-cosmology sufficiency gap $g(z)$ between $E_\text{early}$ and $E_\text{late}$ equals (or bounds, or is bounded by) the calibration-link discrepancy $1 - V(\kappa(v_\text{early}) \wedge v_\text{late}) / V(\kappa(v_\text{early}) \vee v_\text{late})$ between the corresponding instrument-fiber values, under $\Phi$.

3. **Identify what the cosmic distance ladder corresponds to.** The cosmic distance ladder is, structurally, a chain of calibration links between successive instrument-fibers (parallax → Cepheid → type-Ia supernova).
  On the cosmological side it is a chain of inference-sub-settlings interpolated in distance.
  The functor $\Phi$ should send chain to chain, and chain composition to chain composition.

4. **State the bridge theorem.** If steps 1–3 work, state a bridge theorem of the form: *the cosmological residuation failure between $E_\text{early}$ and $E_\text{late}$ is the $\Phi$-image of the residuation failure of the cosmic-distance-ladder calibration chain in predicated astronomy.* Then either prove it or identify the specific obstruction that prevents proof.

## Possible obstructions

Three places where the candidate identification might fail:

- **Mismatched bilattices.** Predicated cosmology works on a bilattice indexed by cosmological observables (matter density, $H_0$, …); predicated astronomy works on bilattices indexed by per-instrument observables (apparent magnitude, redshift, parallax).
  The functor $\Phi$ has to bridge these, and there may not be a clean projection.
- **Loss of structure under $\Phi$.** A functor that collapses the difference between distinct calibration links could show $g(z)$-equivalence vacuously by erasing the very distinctions that calibration links record.
- **Direction of inference.** Predicated cosmology runs from observed evidence backward to a cosmological-settling state; predicated-astronomy calibration links run between observation cells at the instrument level.
  Whether these directions compose as the functor would require is itself something to check.

## Stakes

If the bridge holds, the predicated framework gains a genuinely unified treatment of survey-level and inter-survey reconciliation: cross-instrument calibration audit and Hubble-tension diagnosis become the same problem at different scales, with a single set of structural tools.
If the bridge fails, the family resemblance was suggestive but the two constructions are distinct — which is itself a structural fact worth recording.
