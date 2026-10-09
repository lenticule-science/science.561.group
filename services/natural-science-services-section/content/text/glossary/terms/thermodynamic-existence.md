---
name: Thermodynamic Existence
date-created: 2026-09-03
keywords:
  - StrictRegime
  - ClosureOrdinal
  - Thermodynamics
references:
  boltzmann1877:
    authors: ["Ludwig Boltzmann"]
    title: "Über die Beziehung zwischen dem zweiten Hauptsatze der mechanischen Wärmetheorie und der Wahrscheinlichkeitsrechnung respektive den Sätzen über das Wärmegleichgewicht"
    publication: "Sitzungsberichte der Kaiserlichen Akademie der Wissenschaften Wien"
    year: 1877
  landauer1961:
    authors: ["Rolf Landauer"]
    title: "Irreversibility and Heat Generation in the Computing Process"
    publication: "IBM Journal of Research and Development"
    year: 1961
---

Thermodynamic existence is the regime of natural existence whose closure
ordinal `κ` is finite (`κ < ω`, the *strict* stratum of
`Obsmetrologia.Closure.Regime.classify`): the base `(L, E, C)` is all
finite. `Regime.lean`'s corpus constraints (`fin_scott`, `fin_cof`) prove
a finite base forces both Scott-continuity and countable cofinality, so
thermodynamic existence is the most constrained of the four regimes,
nested inside the conditions the others only partly satisfy. Its settling
cohomology `H¹` is zero per the regime-cohomology table's own definition,
proved by exhaustion in `cohomologyVanishes_iff` in
`lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Closure/Regime.lean`.
No theorem under `Thermodynamics/` instantiates the classifier at all: the
2026-09-04 regime-instantiation census
(`lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section/data/records/2026-09-04-regime-instantiation-census.json`)
counts zero theorems there using `ClosureRegime`, `ClosureRegimeData`, or
`classify`. The library's own concrete strict-regime instance is the
spine's `spineData` (`spine_is_strict`, spending `propext` — the axiom
needed to conclude classification on the nose rather than merely
biconditionally) — a finite charge lattice, not a thermodynamic system.
Thermodynamic existence's placement at the strict, finite-base rung rests
on this section's own frame (the regime ladder, the monograph's
correspondence table), not on a Lean theorem about `BoltzmannEntropy.lean`.

## What it studies in nature

The Lean sub-corpus `Thermodynamics/` studies thermodynamic existence as
physics. `Thermodynamics/BoltzmannEntropy.lean` proves the real-valued
Boltzmann H-theorem: a coarse configuration's number of microstates `W`
gives entropy `S = k log W` (Boltzmann 1877), computed here via a
Bishop-real logarithm rather than deferred as needing measure theory. The
module isolates Boltzmann's H-functional `H = Σ log nₘ!` (so `S = log N! −
H`, maximizing entropy is minimizing `H`) and proves `htheorem`: an
equilibrating exchange — moving one particle from a fuller velocity cell
to an emptier one — never increases `H`, hence never decreases entropy.
This is the deterministic monotone skeleton of the H-theorem, the entropic
companion to the collision-conservation proofs kinetic existence's own gas
module builds on. This module does not itself use `ClosureRegime` or
`classify`; its placement in the strict regime is this section's frame,
above.

## Proof kind: exhaustion

Per the LAGOON architecture's regime ladder
(`lib/emsenn/services/561-group/services/engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/services/multi-agent-computer-system-engineering-services-section/apps/lagoon/content/text/documents/articles/notes/2026/08/29/2026-08-29-lagoon-architecture.md`,
"The regime ladder"), thermodynamic existence admits **proof by
exhaustion**: every state and transition checked. The library carries no
thermodynamics-specific instance of this proof kind — no `Thermodynamics/`
theorem instantiates the regime-cohomology table (above). Landauer's
principle (Landauer 1961), that erasing information in a finite system has
an exact, accountable thermodynamic cost, is this section's own reading of
the table's strict-regime stipulation (`cohomologyVanishes strict = true`)
onto thermodynamics, not a theorem the Lean proves about thermodynamics.

## Where it sits in the descent

Per the monograph
`lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section/content/text/documents/articles/notes/2026/06/17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md`
("The four fields"), *thermalizing* glues [causal
existence](./causal-existence.md)'s local sections into thermodynamic
existence's thermal-spacetime, the global section with `H¹ = 0` whose
quantities (temperature, entropy, equilibrium) are properties of the whole
glued thing rather than of any local section. The descent stops here
because there is nothing left to thermalize: full thermalization is heat
death, reached only at the plastic-number floor of the monograph's forced
inflation-rate tower, and only observerless.

See also: [causal existence](./causal-existence.md); the topic [four
regimes of natural existence](../topics/four-regimes-of-natural-existence.md).
