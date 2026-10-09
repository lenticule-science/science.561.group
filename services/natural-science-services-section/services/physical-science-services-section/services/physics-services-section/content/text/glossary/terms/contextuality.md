---
name: Contextuality
date-created: 2026-09-03
references:
  abramsky2011:
    authors: ["Samson Abramsky", "Adam Brandenburger"]
    title: "The sheaf-theoretic structure of non-locality and contextuality"
    publication: "New Journal of Physics"
    year: 2011
  hardy1993:
    authors: ["Lucien Hardy"]
    title: "Nonlocality for Two Particles without Inequalities for Almost All Entangled States"
    publication: "Physical Review Letters"
    year: 1993
  popescu1994:
    authors: ["Sandu Popescu", "Daniel Rohrlich"]
    title: "Quantum Nonlocality as an Axiom"
    publication: "Foundations of Physics"
    year: 1994
  klyachko2008:
    authors: ["Alexander A. Klyachko", "M. Ali Can", "Sinem Binicioğlu", "Alexander S. Shumovsky"]
    title: "Simple Test for Hidden Variables in Spin-1 Systems"
    publication: "Physical Review Letters"
    year: 2008
---

**Contextuality** is the phenomenon, first identified by the Kochen–Specker theorem,
that quantum mechanics cannot be reproduced by a non-contextual hidden-variable model —
one in which every observable has a definite, pre-existing value independent of which
other compatible observables are measured alongside it. Abramsky and Brandenburger
(2011) give contextuality a general sheaf-theoretic formulation: a **measurement
scenario** is a set of measurements together with a cover by **contexts** — maximal
sets of jointly measurable (compatible) measurements. An **empirical model** assigns to
each context a distribution (or, possibilistically, a set of admissible outcome
assignments) over that context's joint outcomes, subject to a no-signalling
compatibility condition on overlaps between contexts. The model is **non-contextual**
exactly when it admits a **global section** — a single distribution over assignments to
*all* measurements that restricts correctly to every context's local distribution; the
absence of a global section is contextuality, formally identical to a sheaf's failure to
glue compatible local sections into one global section.

Abramsky and Brandenburger organize the possibilistic (support-only, no probabilities)
case into a strict hierarchy: **non-contextual** (a global section exists);
**logically contextual** (no global section exists, but every individual local
assignment still extends to some global assignment consistent with at least one
context — Hardy 1993's model sits here); **strongly contextual** (no local assignment
in any context extends to any global assignment at all — the Popescu–Rohrlich box,
Popescu & Rohrlich 1994, is the paradigm strongly contextual model).

## In Obsmetrologia

`Obsmetrologia.QuantumContextuality` studies quantum existence as physics through this
support-level machinery. `QuantumContextuality.KCBS` builds the Klyachko–Can–Binicioğlu–
Shumovsky pentagon scenario (Klyachko et al. 2008). `QuantumContextuality.MeasurementScenario`
proves `prBox_no_global`, that the Popescu–Rohrlich box has no global section.
`QuantumContextuality.CohomologicalContextuality` re-proves the same fact
cohomologically: for a **parity model** (a scenario whose contexts are all pairs, each
carrying a required XOR target — the shape of the PR box, GHZ, and Mermin
all-versus-nothing arguments), `hasGlobalSection_iff_coboundary` proves global-section
existence is equivalent to the target being a Čech coboundary of the context graph
(axiom profile `(none)`); `prBox_hasGlobalSection_iff` specializes this to the PR box
(axiom profile `(none)`); `parityModel_stronglyContextual_iff` proves strong
contextuality is equivalent to every context being inhabited together with the target
*not* being a coboundary (axiom profile `propext`). `QuantumContextuality.HardyModel`
places the Hardy phenomenon (Hardy 1993) exactly at the strict middle rung above —
logically contextual, not strongly contextual.

## See also

- [PR box](./pr-box.md) — the paradigm strongly contextual empirical model
- [Čech cohomology](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/cech-cohomology.md) — the obstruction-theoretic form of the global-section question
- [Closure ordinal](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/closure-ordinal.md) — quantum existence sits in the transfinite-bounded regime, $\omega < \kappa < \omega_1$
