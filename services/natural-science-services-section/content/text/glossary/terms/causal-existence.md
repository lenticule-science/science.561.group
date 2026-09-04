---
name: Causal Existence
date-created: 2026-09-03
keywords:
  - ScottRegime
  - ClosureOrdinal
  - CausalSets
references:
  scott1976:
    authors: ["Dana S. Scott"]
    title: "Data Types as Lattices"
    publication: "SIAM Journal on Computing"
    year: 1976
  bombelli1987:
    authors: ["Luca Bombelli", "Joohan Lee", "David Meyer", "Rafael D. Sorkin"]
    title: "Space-Time as a Causal Set"
    publication: "Physical Review Letters"
    year: 1987
---

Causal existence is the regime of natural existence whose closure ordinal
`κ` equals `ω` exactly (the *Scott* stratum of
`Obsmetrologia.Closure.Regime.classify`): the closure is Scott-continuous —
it commutes with directed `ω`-joins, in the sense of Scott domain theory
(Scott 1976) — over an infinite base. Its settling cohomology `H¹` is
zero, per `cohomologyVanishes_iff` in
`lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Closure/Regime.lean`:
unlike [quantum existence](./quantum-existence.md) and [kinetic
existence](./kinetic-existence.md), the obstruction has fully drained by
this rung — every directed chain of evidence reaches its settled value at
stage `ω`.

## What it studies in nature

The Lean sub-corpus `CausalSets/` studies causal existence as physics,
taking a Lorentzian causal set — a locally finite poset of events under
causal precedence, Sorkin's causal set (Bombelli, Lee, Meyer & Sorkin
1987) — as a settling whose cells are pairs of events and whose value is
Boolean:

- **Causal order** — `CausalSets/Causal/Order.lean` builds the causal
  order itself as a Boolean transitive-closure settling: the closure step
  admits a causal link whenever it is already present or factors through
  an intermediate event, and the fixed point is the full causal order
  `J⁺`.
- **Alexandrov topology** — `CausalSets/Causal/Alexandrov.lean` instantiates
  the corpus's generic fact that a poset's Alexandrov topology has up-sets
  for opens: the causal cones become the opens of a topology, so causal
  structure determines topology with no new data.
- **Curvature** — `CausalSets/Curvature/Ricci.lean` builds the
  direction-resolved curvature tensor `curvatureTensor x y = μ(y,x) −
  μ(x,y)`, the retarded-minus-advanced residual weight of the incidence
  Möbius function, antisymmetric and supported exactly on an event's past
  and future cone.
- **Dimension** — `CausalSets/Dimension/OrderingFraction.lean` computes
  the Myrheim–Meyer ordering fraction `r(v)`, the ratio of causally
  ordered pairs to all unordered pairs, from which the causal set's
  geometric dimension `d_MM` is read.
- **Global time** — `CausalSets/Causal/RegimeSection.lean` proves the
  past-count function `t(x) = |{z : z ≺ x}|` is strictly monotone along
  the causal order (`timeSection_strict_mono`): a discrete refinement of
  Hawking's stable-causality theorem, and the source of this regime's own
  name (`RegimeSection`) in the corpus.

## Proof kind: settlement

Per the LAGOON architecture's regime ladder
(`lib/emsenn/services/561-group/services/engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/services/multi-agent-computer-system-engineering-services-section/content/text/documents/articles/specifications/2026-08-29-lagoon-architecture.md`,
"The regime ladder"), causal existence admits **proof by settlement**:
monotone closure to the `ω` fixed point — the world fold itself, replay,
deshrouding's monotone cone growth, arrow-of-time laws. Its artifact is
the witness chain and settlement receipt, verified by replay
byte-for-byte.

## Where it sits in the descent

Per the monograph
`lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section/content/text/documents/articles/notes/2026/06/17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md`
("The four fields"), *collapsing* — measurement, value entering — produces
causal existence's classical-spacetime, the valued presheaf of definite
reversible local sections: "natural existence as we experience it now."
This is the step out of [quantum existence](./quantum-existence.md); the
monograph reads it as the Big Bang. *Thermalizing* then glues causal
existence's local sections into [thermodynamic
existence](./thermodynamic-existence.md)'s single global section.

See also: [quantum existence](./quantum-existence.md); [thermodynamic
existence](./thermodynamic-existence.md); the topic [four regimes of
natural existence](../topics/four-regimes-of-natural-existence.md).
