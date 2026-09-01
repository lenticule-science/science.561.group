---
name: observer-instrument
kind: entity
description: "A physical apparatus that produces observation-cells. Indexes evidence in a settlement by its admissible-value sub-bilattice. Instruments include telescopes, spectrographs, photometers, interferometers, particle detectors — anything that bears a measurement back into the settlement."
of: settlement
---

An **observer-instrument** is a physical apparatus that produces [observation-cells](../observation-cell/observation-cell.md): it measures some predicate $p$ about some celestial body $b$ and records a bilattice value $v(b, p, o) \in \mathbf{L}$.

## What an observer-instrument is structurally

Each observer-instrument $o$ has:

- An **admissible-value sub-bilattice** $\mathbf{L}_o \subseteq \mathbf{L}$: the set of bilattice values the instrument can in principle produce. Instruments with limited dynamic range or saturation have restricted $\mathbf{L}_o$.
- A **predicate-domain** $\Pi_o$: the set of predicates the instrument can measure. A photometer has $\Pi_o = \{$apparent magnitude in filter $f$ : $f$ in the instrument's filter set$\}$. A spectrograph has $\Pi_o = \{$spectral feature at wavelength $\lambda$ : $\lambda$ in the instrument's wavelength coverage$\}$.
- A **calibration state**: parameters that determine how raw instrument outputs map to bilattice values. Calibration drifts over time and is restored by calibration observations.

## Fiber-restriction sub-settlement

For each observer-instrument $o$, the restriction of the astronomical settlement $\mathcal{A}$ to $o$'s admissible-value sub-bilattice $\mathbf{L}_o$ is a sub-settlement $\mathcal{A}_o \subseteq \mathcal{A}$ — the universe as the instrument sees it. The relations between $\mathcal{A}_o$ for different $o$ are what calibration-links capture; the question "what does the observed universe look like to this instrument" is answered by $\mathcal{A}_o$.

## Examples

Major observer-instrument categories include telescopes (with imaging cameras and spectrographs as focal-plane instruments), interferometers (radio and optical), particle detectors (cosmic-ray and neutrino arrays), gravitational-wave detectors (LIGO, Virgo, KAGRA), and historical instruments (photographic plates). Each contributes a fiber-restriction sub-settlement of $\mathcal{A}$.
