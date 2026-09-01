---
name: presheaf-vs-cartsp-base
type: question
class: model-choice
status: open
explores: [relational-infinity-topos, cohesive-infinity-topos]
depends-on:
  - relational-infinity-topos
  - cohesive-infinity-topos
---

The three source drafts disagree on which cohesive ∞-topos to take as the *primary* model:

- **Draft 1 / draft 2:** $\mathrm{PSh}(\{0 \to 1\})$ — presheaves on the walking arrow. The minimal cohesive model. Computable in closed form.
- **Draft 3:** $\mathrm{PSh}(\mathrm{CartSp})$ — Schreiber's synthetic-differential ∞-cohesion. The fully geometric model.

This subtheory adopts the abstract / formal-modality stance ([`objects/relational-infinity-topos.md`](../objects/relational-infinity-topos.md) leaves $\mathcal{H}$ open) and uses $\mathrm{PSh}(\{0 \to 1\})$ only as the worked example. The CartSp model is unimplemented.

## What the choice affects

1. **Whether SD-stratification has differential-geometric content.** $\mathrm{PSh}(\{0 \to 1\})$ has only combinatorial strata (two of them); $\mathrm{PSh}(\mathrm{CartSp})$ supports stratifications by smooth submanifolds with codimension-stratified normal bundles.
2. **Whether the [Verdier-duality theorem](../theorems/verdier-duality-on-sd-site.md) needs orientation data.** On the walking arrow, dualizing sheaves are trivial; on CartSp they are full-fledged orientation-twisted local systems.
3. **Whether [filter-induced restriction of RITM](../theorems/filter-induced-restriction-of-ritm.md) has non-trivial Filter examples.** Trivial on the walking arrow; rich on CartSp (every smooth-submanifold inclusion gives one).

## Resolution criteria

Resolution requires either:

(a) Picking one model as primary and demoting the other to an example/aside.
(b) Showing that the two models are connected by a formal cohesive-functor that transports theorems across them — i.e. that the choice is forced to be irrelevant.
(c) Splitting the subtheory into two: a combinatorial strand (walking arrow) and a smooth strand (CartSp).

Current preference: (b), via Schreiber's nerve-and-realization between cohesive ∞-topoi. Not pursued in triage.
