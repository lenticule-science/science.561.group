---
name: "Calibration link"
type: concept
class: calibration
component-of: predicated-astronomy
depends-on: [observer-instrument, observation-cell, residuated-lattice]
---

A **calibration link** between two [observer-instruments](observer-instrument.md) $o_1, o_2$ on a shared predicate $p$ is a residuated relation in the value bilattice that lets the evidence each instrument produces about $p$ be transformed into evidence in the other instrument's frame. Concretely: if $o_1$ produces $v_1(b, p, o_1)$ and the calibration link $\kappa_{12}$ is in place, then $\kappa_{12}(v_1)$ is the value $o_2$ would record on the same body, in $o_2$'s admissible-value sub-bilattice.

Calibration links are the predicated form of the standard astronomical calibration chain: photometric zeropoints, wavelength-scale tie-ins, polarimetric Stokes-parameter calibrations, parallax zero-point corrections. Each chain link is a relation between two observer-instruments; each chain is a composition of links; the whole chain forms a calibration network across all instruments measuring the predicate.

Two structural facts the predicated framing makes explicit:

- **Composition.** Calibration links compose: $\kappa_{13} = \kappa_{23} \circ \kappa_{12}$. Internally consistent calibration networks are categorically functorial; networks containing genuine *inconsistency* (closed loops $\kappa_{ii} \neq \mathrm{id}$ via different paths) reveal calibration errors and are the object of audit in cross-survey comparisons.
- **Residuation.** A calibration link comes equipped with a residuation $\kappa^{*}$ (its right adjoint in the bilattice), encoding what evidence in $o_2$'s frame would be sufficient to reconstruct an observation in $o_1$'s frame. The residuation is what propagates uncertainty: an observation in $o_2$ with a certain value transports back to a *set* of consistent values in $o_1$, not a single value, when the calibration link is not invertible (e.g., when one instrument has lower spectral resolution than the other).

The Hubble-tension reading in [predicated cosmology](../../documents/articles/notes/hubble-tension-as-residuation-failure.md) — that the early-time and late-time inference sub-settlings fail a residuation compatibility condition — bears a structural family resemblance to calibration-link failure across the cosmic distance ladder: in both cases, two evidence-producing systems that ought to be reconciled by a residuated relation produce values whose meet has lower-than-expected information. Whether the two are *the same construction*, lifted from the cosmological scale to the astronomical-instrument scale, is an open structural question — see [calibration-link-as-residuation-bridge](../../documents/articles/notes/calibration-link-as-residuation-bridge.md) — and turns on whether an explicit functor can be exhibited from the cosmological inference-sub-settling incompatibility into the instrument-level calibration-link network. Until that functor is constructed, the connection is an analogy worth pursuing rather than an identity to assume.
