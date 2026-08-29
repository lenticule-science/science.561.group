---
type: narrative
introduces: [cosmic-event, observer, cosmological-settling]
---

# Why predicated cosmology

Modern cosmology has a remarkable shape: a six-parameter model — [Lambda-CDM](../../../terms/lambda-cdm-model.md) — that fits every major observation, sitting on top of a long list of unanswered questions about what those parameters mean.
We know the universe is 13.8 billion years old, has been expanding since the Big Bang, is composed of 5% baryons, 27% dark matter, and 68% dark energy, and is governed by general relativity at large scales.
We do not know what dark matter is.
We do not know why the cosmological constant has the value it does.
We do not know what happened in the first $10^{-32}$ seconds.
We do not know how to reconcile general relativity with quantum mechanics.

These are the [five deepest open questions in cosmology](../../../texts/open-questions-in-cosmology.md), and they have the same shape: a parameter that the theory takes as input has a value that the theory cannot derive, and the parameter's microscopic origin is unknown.

The standard hope is that better physics — a particle, a field, a quantum-gravity theory — will dissolve these questions.
Predicated cosmology offers a different hope: that the questions are partly *structural* rather than partly *physical*, and that a better account of the structure of the universe's state will at least *relocate* the open questions in productive ways.

## The reframing

Standard cosmology models the universe as a 4-manifold with a metric, a stress-energy tensor, and assorted fields.
The state of the universe at a moment is a point in a (very high-dimensional) configuration space.
The dynamics is given by partial differential equations.

Predicated cosmology models the universe as a [predication settling](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) — a $\leq_k$-monotone family of [predication valuations](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md) on the [spacetime entity set](../objects/spacetime-entity-set.md).
The state at a cosmic time is an assignment of bilattice values to (event, predicate, event) cells.
The dynamics is given by a closure-rule system that respects the [light-cone predicate category](../objects/light-cone-predicate-category.md)'s morphism class.

Both formalisms can express the same observations: redshift-distance relations, CMB power spectra, structure-formation correlations.
The predicated formalism, additionally, makes structural facts visible:

- The [arrow of time](../theorems/arrow-of-time-from-knowledge-monotonicity.md) is the orientation of $\leq_k$.
- The [particle horizon](../../../theories/observation/terms/particle-horizon.md) is a $\leq_k$-ceiling on observers' valuations.
- The [CMB](../objects/cmb-quiescent-frontier.md) is a sub-settling quiescence frontier.
- The [dark sectors](../objects/dark-sector-fiber.md) are predicates with evidence in only one bilattice projection.
- The [cosmological constant](../theorems/dark-energy-as-closure-rate.md) is, conjecturally, an asymptotic floor on the closure-rule firing rate.

These are not new physics.
They are new vocabulary for old physics — vocabulary that makes some claims sharper, makes some questions phrasable that the standard formalism cannot directly state, and (in a few cases) suggests new lines of attack on standard puzzles.

## What predicated cosmology is not

It is not an alternative to Lambda-CDM.
Every standard observation projects to a value of $v_t(p)(s, o)$ for specific $p, s, o$ in the [cosmological settling](../objects/cosmological-settling.md), and Lambda-CDM is the symmetric reduction of the settling under the [cosmological principle](../../../terms/cosmological-principle.md) — see [cosmological-principle-as-symmetric-settling](../theorems/cosmological-principle-as-symmetric-settling.md).

It is not a theory of quantum gravity.
The settling's value bilattice is left open, and whether quantum-gravity effects require a non-classical bilattice structure is an [open question](../learning/questions/is-quantum-gravity-a-non-classical-fiber.md), not an established result.

It is not a theory of dark matter or dark energy.
The [dark-sector-fiber](../objects/dark-sector-fiber.md) characterizes the *shape* of the dark sectors' evidence; it does not say what the underlying particles are.

What predicated cosmology *is* is a structural reorganization of cosmological content under a particular categorical apparatus.
Its first responsibility is to recover the standard predictions; its second is to make the standard puzzles sharper; its third is to surface new questions that the categorical apparatus makes phrasable.
The work in this directory is at the founding stage — the structures are in place, the bridge to standard cosmology is sketch-level, and several theorems remain to be tightened.
Whether the reframing turns out to be merely-rephrasing or genuinely-clarifying is itself an open empirical question for the program.
