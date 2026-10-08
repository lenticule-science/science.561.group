---
name: Causal Set
date-created: 2026-09-03
references:
  bombelli1987:
    authors: ["Luca Bombelli", "Joohan Lee", "David Meyer", "Rafael D. Sorkin"]
    title: "Space-Time as a Causal Set"
    publication: "Physical Review Letters"
    year: 1987
---

A **causal set** (Bombelli, Lee, Meyer & Sorkin 1987) is a locally finite partial order
$(C, \prec)$: a set $C$ equipped with a relation $\prec$ that is irreflexive,
transitive, and *locally finite* — for any $x, y \in C$, the causal interval
$\{z : x \prec z \prec y\}$ is finite. $x \prec y$ is read as "$x$ causally precedes
$y$." Local finiteness is what distinguishes a causal set from an ordinary continuum
causal structure: it is the discreteness hypothesis, encoding that spacetime has, at
the fundamental level, only finitely many events between any two causally related
events.

The causal set hypothesis in quantum gravity is that spacetime *is*, fundamentally, a
causal set, and that the familiar Lorentzian manifold of general relativity emerges only
statistically at macroscopic scales — a causal set can be "sprinkled" into a Lorentzian
manifold by a Poisson process, and conversely a causal set's order alone is claimed to
determine, up to conformal factor, the manifold geometry it approximates (Bombelli, Lee,
Meyer & Sorkin 1987): counting causal intervals recovers volume, and the order recovers
causal and (statistically) conformal structure — "order plus number equals geometry."

## In Obsmetrologia

The Lean sub-corpus `Obsmetrologia.CausalSets` studies causal existence as physics by
building the causal-set structures above directly: `CausalSets.Causal.Order` builds the
causal order itself as a Boolean transitive-closure settling; `CausalSets.Causal.Alexandrov`
instantiates the Alexandrov topology (causal cones as opens); `CausalSets.Curvature.Ricci`
builds a direction-resolved curvature tensor from the incidence Möbius function;
`CausalSets.Dimension.OrderingFraction` computes the Myrheim–Meyer ordering fraction
used to read off geometric dimension from the order alone — the discrete, computable form
of the continuum "order plus number equals geometry" claim above. `CausalSets.Causal.RegimeSection`
is the module that gives this sub-corpus its own name in the corpus: see
[global time function](./global-time-function.md) for its central theorem.

## See also

- [Global time function](./global-time-function.md) — the strictly monotone map a
  causal set's past-count builds
- [Closure ordinal](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/closure-ordinal.md) — the corpus places causal existence at $\kappa = \omega$ exactly, the Scott regime
