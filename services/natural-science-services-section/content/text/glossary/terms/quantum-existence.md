---
name: Quantum Existence
date-created: 2026-09-03
keywords:
  - TransfiniteBoundedRegime
  - ClosureOrdinal
  - QuantumContextuality
references:
  abramsky2011:
    authors: ["Samson Abramsky", "Adam Brandenburger"]
    title: "The sheaf-theoretic structure of non-locality and contextuality"
    publication: "New Journal of Physics"
    year: 2011
  klyachko2008:
    authors: ["Alexander A. Klyachko", "M. Ali Can", "Sinem Binicioğlu", "Alexander S. Shumovsky"]
    title: "Simple Test for Hidden Variables in Spin-1 Systems"
    publication: "Physical Review Letters"
    year: 2008
  popescu1994:
    authors: ["Sandu Popescu", "Daniel Rohrlich"]
    title: "Quantum Nonlocality as an Axiom"
    publication: "Foundations of Physics"
    year: 1994
  hardy1993:
    authors: ["Lucien Hardy"]
    title: "Nonlocality for Two Particles without Inequalities for Almost All Entangled States"
    publication: "Physical Review Letters"
    year: 1993
---

Quantum existence is the regime of natural existence whose closure ordinal
`κ` is countable but transfinite (`ω < κ < ω₁`, the *transfinite-bounded*
stratum of `Obsmetrologia.Closure.Regime.classify`): the closure is not
Scott-continuous, but its cofinality is countable. Its settling cohomology
`H¹` is non-zero, per `cohomologyVanishes_iff` in
`lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Closure/Regime.lean`
— the same obstruction that never drains in [kinetic
existence](./kinetic-existence.md), here bounded by a countable cofinality
rather than escaping it entirely.

## What it studies in nature

The Lean sub-corpus `QuantumContextuality/` studies quantum existence as
physics, through **support-level** phenomena — whether a global valuation
over a set of measurement contexts exists at all, independent of any
probabilities:

- **KCBS pentagon** — `QuantumContextuality/KCBS.lean` builds the
  Klyachko–Can–Binicioğlu–Shumovsky scenario (Klyachko et al. 2008): five
  exclusive yes/no measurements on a five-cycle, with the classical
  independence bound `α(C₅) = 2` proved as a finite decidable fact.
- **The PR box** — `QuantumContextuality/MeasurementScenario.lean` proves
  `prBox_no_global`: the Popescu–Rohrlich box (Popescu & Rohrlich 1994)
  has no global section, re-proved cohomologically in
  `QuantumContextuality/CohomologicalContextuality.lean` via
  `prBox_no_global_cohomological`, an ordinary Čech `H¹` of the context
  graph valued in `ℤ/2ℤ`.
  `not_coboundary_of_cycle_sum_true` witnesses the obstruction directly:
  a non-zero signed sum around a 4-cycle of the context graph.
- **The Hardy model** — `QuantumContextuality/HardyModel.lean` places the
  Hardy phenomenon (Hardy 1993) in the strict middle rung of the
  Abramsky–Brandenburger possibilistic hierarchy (Abramsky & Brandenburger
  2011): logically contextual (some local section extends to no global
  section) while not strongly contextual (some global section still
  exists) — the PR box sits on the strong rung above it.
- **Fock condensates** — `QuantumContextuality/FockCondensate.lean`
  records a finite creation/annihilation ledger, a condensate hole
  carrying a coherent Fock support with indefinite particle number, and
  glass overlap as the order parameter for a two-condensate joint whose
  state fails to factor.

## Proof kind: obstruction witness

Per the LAGOON architecture's regime ladder
(`lib/emsenn/services/561-group/services/engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/services/multi-agent-computer-system-engineering-services-section/content/text/documents/articles/specifications/2026-08-29-lagoon-architecture.md`,
"The regime ladder"), a quantum-grade verdict is never "true/false"; it is
"a global section exists / provably does not", and the does-not case
redirects effort rather than failing outright. The artifact is the
contextuality witness object itself — a typed record naming the actual
Lean theorem it instantiates (`prBox_no_global_cohomological`,
`parityModel_stronglyContextual_iff`, and the like).

## How it sits below kinetic existence

Per the monograph
`lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section/content/text/documents/articles/notes/2026/06/17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md`
("The four fields"), *condensing* carries kinetic existence's irreducible
`H¹ ≠ 0` residue down into quantum-spacetime, the value-free amplitude
fibration: quantum existence is where value-freedom is superposition,
indistinguishable quanta being what remains when the descent keeps a
shared predicate and discards which bit carried it. *Collapsing* —
measurement, value entering — is the step out of quantum existence into
[causal existence](./causal-existence.md); on the monograph's cosmological
reading that step is the Big Bang.

See also: [kinetic existence](./kinetic-existence.md); [causal
existence](./causal-existence.md); the topic [four regimes of natural
existence](../topics/four-regimes-of-natural-existence.md).
