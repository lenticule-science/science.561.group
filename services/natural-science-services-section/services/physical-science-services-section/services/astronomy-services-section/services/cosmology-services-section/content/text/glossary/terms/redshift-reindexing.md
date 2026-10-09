---
type: morphism
class: reindexing
depends-on: [light-cone-restriction, redshift, scale-factor]
aliases:
  - Redshift reindexing
---

# Redshift reindexing

The specialization of [light-cone restriction](light-cone-restriction.md) to the photon-wavelength predicate along null geodesics in an expanding spacetime. Given a photon emitted at event $e_{\mathrm{em}}$ with wavelength $\lambda_{\mathrm{em}}$ and observed at event $e_{\mathrm{obs}}$ on $e_{\mathrm{em}}$'s future light cone, the redshift reindexing maps

$$v_{\mathrm{em}}(\lambda)(e_{\mathrm{em}}) \mapsto v_{\mathrm{obs}}(\lambda)(e_{\mathrm{obs}}) = (1 + z) \cdot v_{\mathrm{em}}(\lambda)(e_{\mathrm{em}})$$

where $z$ is the [cosmological redshift](redshift.md) of the source as seen by the observer.

## Why this is its own morphism

The light-cone restriction $\rho_{e_{\mathrm{em}} \to e_{\mathrm{obs}}}$ in general preserves bilattice values on cells in the intersection of past light cones. But for the photon-wavelength predicate, the value is a frame-dependent quantity: the wavelength measured by an observer depends on the observer's frame. Along a null geodesic in an expanding spacetime, the [scale factor](../../../../../../content/text/glossary/terms/scale-factor.md) at emission and observation differ, and the wavelength acquires a multiplicative factor $a_{\mathrm{obs}}/a_{\mathrm{em}} = 1 + z$ when reindexed from the emitter's frame to the observer's.

The redshift reindexing is therefore the composition of a light-cone restriction with a position-dependent frame change. It is its own named morphism because it is the operative move in nearly every cosmological observation: every measurement of a distant source involves a redshift reindexing of the photon predicate.

## Other predicates redshifted by the same morphism

Photon energy ($E = h c / \lambda$) is divided by $1 + z$. Photon frequency is divided by $1 + z$. CMB temperature is divided by $1 + z$ (a thermal photon distribution at $T$ at recombination becomes a thermal distribution at $T / (1 + z)$ at observation). The redshift reindexing acts uniformly on all electromagnetic-field predicates — this is what makes the [CMB quiescent frontier](../../documents/articles/notes/cmb-quiescent-frontier.md) detectable as a uniform $T = 2.725$ K background, redshifted from $T \approx 3000$ K at recombination.

## Composition

$z(e_{\mathrm{em}} \to e_{\mathrm{obs}})$ is determined entirely by the [scale factor](../../../../../../content/text/glossary/terms/scale-factor.md) ratio $a_{\mathrm{obs}}/a_{\mathrm{em}}$ in FLRW, and the redshift reindexing composes accordingly:

$$\rho^z_{e_1 \to e_3} = \rho^z_{e_2 \to e_3} \circ \rho^z_{e_1 \to e_2}$$

with $1 + z(e_1 \to e_3) = (1 + z(e_1 \to e_2))(1 + z(e_2 \to e_3))$, when all three events lie on a common null geodesic.
