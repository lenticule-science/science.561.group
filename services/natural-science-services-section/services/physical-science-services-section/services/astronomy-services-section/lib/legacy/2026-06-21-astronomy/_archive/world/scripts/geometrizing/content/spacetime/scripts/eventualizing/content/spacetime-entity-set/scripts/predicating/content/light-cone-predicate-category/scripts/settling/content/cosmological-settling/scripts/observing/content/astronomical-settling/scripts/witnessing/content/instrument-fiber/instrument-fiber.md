---
title: "Instrument fiber"
type: object
class: predicate-fiber
component-of: predicated-astronomy
depends-on: [astronomical-settling, observer-instrument, predication-fiber-algebra]
realizes: [predication-fiber-algebra]
---

The **instrument fiber** $\mathcal{F}_o$ over an [observer-instrument](teaching/explanations/observer-instrument.md) $o$ is the sub-[predication fiber algebra](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) of the [astronomical settling](astronomical-settling.md) consisting of all [observation cells](teaching/explanations/observation-cell.md) produced by $o$, restricted to predicates $o$ can evaluate, with values restricted to the sub-bilattice $\mathbf{L}_o \subseteq \mathbf{L}$ of values $o$ can express.

Three structural properties:

- **Bounded predicate set.** $\mathcal{F}_o$ supports only predicates $o$ instruments — a photometer in $V$ band cannot witness $g$-band predicates; a low-resolution spectrograph cannot witness narrow line widths; an X-ray telescope cannot witness optical predicates. Every other predicate is structurally absent from $\mathcal{F}_o$, not merely unmeasured.
- **Bounded value sub-bilattice.** Even on predicates $o$ can evaluate, the values $o$ can produce are bounded: a magnitude-22-limited survey cannot evaluate "is brighter than mag 22" with anything but an upper-limit value; a saturating detector cannot evaluate "is brighter than the saturation level" with anything but a saturation flag. The admissible-value sub-bilattice $\mathbf{L}_o$ encodes this.
- **Calibration links to other fibers.** Calibration links $\kappa_{o, o'}$ between $\mathcal{F}_o$ and $\mathcal{F}_{o'}$ form the morphisms that let evidence flow across fibers. The discipline of cross-calibration is the construction and audit of these morphisms.

The instrument fiber is the right object for analyzing what an instrument can and cannot detect. The [selection effect theorem](../theorems/selection-effect-as-fiber-restriction.md) shows that surveying an astronomical population through $o$ amounts to projecting the parent astronomical settling onto $\mathcal{F}_o$, and that the resulting sub-settling is missing exactly the cells $\mathcal{F}_o$ cannot represent — not because the bodies are absent, but because $o$'s fiber cannot host the corresponding cells.

## Status

Draft. The fiber definition is a direct specialization of the predication-fiber-algebra. Open: an explicit construction for a specific real instrument (e.g., the Gaia G-band photometer) showing what predicates and values its fiber admits, and a worked example of a calibration-link morphism (Gaia G to Johnson V) as a residuated relation between the two instrument fibers' bilattices.
