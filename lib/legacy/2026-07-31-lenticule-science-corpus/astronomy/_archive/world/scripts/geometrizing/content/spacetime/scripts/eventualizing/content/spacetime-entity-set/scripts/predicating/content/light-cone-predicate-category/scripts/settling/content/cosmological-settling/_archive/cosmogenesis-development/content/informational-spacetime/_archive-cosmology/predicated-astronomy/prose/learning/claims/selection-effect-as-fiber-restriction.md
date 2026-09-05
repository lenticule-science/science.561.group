---
title: "Selection effect as fiber restriction"
type: theorem
status: sketch
component-of: predicated-astronomy
depends-on: [astronomical-settling, instrument-fiber, observer-instrument]
---


**Statement.** Let $\mathcal{A}$ be the [astronomical settling](../objects/astronomical-settling.md), $o$ an [observer-instrument](teaching/explanations/observer-instrument.md), and $\mathcal{F}_o$ its [instrument fiber](../objects/instrument-fiber.md).
The astronomical sub-settling produced by surveying $\mathcal{A}$ through $o$ is exactly the projection $\pi_o(\mathcal{A})$ of $\mathcal{A}$ onto $\mathcal{F}_o$.
Equivalently: every classical *selection effect* of survey astronomy — Malmquist bias, Eddington bias, transit-geometric selection, distance-modulus volume biases, completeness limits — is structurally a property of the projection $\pi_o$, not a property of the astronomical population $\mathcal{A}$.

## Sketch of argument

For each body $b$ and predicate $p$ in $\mathcal{A}$ with value $v(b, p) \in \mathbf{L}$, the projection assigns

$$ \pi_o(b, p) = \begin{cases} v(b, p) & \text{if } p \in \text{Pred}(\mathcal{F}_o) \text{ and } v(b,p) \in \mathbf{L}_o \\ \bot & \text{otherwise} \end{cases} $$

The first case is when $o$ both supports the predicate $p$ and admits the value; the second is when either $p$ is outside $o$'s repertoire or the value lies outside $\mathbf{L}_o$.
The projection $\pi_o(\mathcal{A})$ collapses all the second-case cells to $\bot$, exactly the structural form of "the survey has no entry for this body-predicate combination."

Each named selection effect is a special case:

- **Malmquist bias.** $o$'s admissible-value sub-bilattice is bounded above (by the bright limit) and below (by the faint limit) on the apparent-magnitude predicate.
  Bodies whose true apparent magnitudes lie outside this range are projected to $\bot$.
  The bias toward intrinsically luminous objects in flux-limited surveys is the structural shape of $\pi_o$ on a population whose luminosity function extends below $\mathbf{L}_o$.
- **Eddington bias.** $o$'s admissible-value sub-bilattice has finite resolution near its limits; objects scatter into and out of the survey at the boundaries.
  Asymmetry of the underlying luminosity function across the boundary produces a net bias under $\pi_o$.
- **Transit geometric selection.** $o$'s instrument fiber for the transit-depth predicate is empty unless the orbital plane of the planetary system is nearly aligned with the line of sight.
  The probability of inclusion is $\sim R_\star/a$.
  The known exoplanet population, projected through transit-survey instrument fibers, is biased to short-period orbits.

## What this is and is not claiming

**Claiming:** Selection effects are not an external bias to be subtracted.
They are intrinsic to the structural relationship between the astronomical settling and the instrument fiber.
Inferring the parent population $\mathcal{A}$ from the observed sub-settling $\pi_o(\mathcal{A})$ is the inverse problem of recovering a settling from one of its projections, and it is *structurally* an underdetermined problem — multiple parent populations project to the same observed sub-settling, and the inference machinery must include explicit assumptions about which families of parent populations are admissible.

**Not claiming:** This is an *exactly* novel insight.
Statistical astronomers have been correcting for selection effects with sophisticated machinery (V/V_max, hierarchical Bayesian population inference, Approximate Bayesian Computation, etc.) for decades.
What the predicated framing adds is a uniform structural language in which all these methods are inverse projections of $\pi_o$, and in which the assumptions buried in each method become explicit assumptions about the bilattice and the parent settling.

## Status

Sketch.
The structural argument is internally consistent.
Open: a full worked example on a specific selection-effect computation — recovering the true exoplanet occurrence rate (planets per star) from the Kepler-detected sub-settling — phrased as an inverse projection in the predicated framework, with explicit bilattice values on the transit-geometric and detection-pipeline selection cuts.
