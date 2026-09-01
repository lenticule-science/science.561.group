---
name: three-divergent-models
type: narrative
class: model-comparison
discusses: [relational-infinity-topos, cohesive-infinity-topos, ritm]
depends-on:
  - relational-infinity-topos
  - cohesive-infinity-topos
  - ritm
---

The three source drafts use three different models of the cohesive ∞-topos. The differences are substantive — different drafts give different answers to "which sheaves are SD-constructible?" — but each is internally coherent. The synthesis decision was to register the divergence as questions rather than pick one model and discard the others.

**Draft 1: presheaves on the walking arrow.** $\mathcal{H} = \mathrm{PSh}(\{0 \to 1\})$. The minimal model. Cohesive quadruple is computable in closed form; the SD ∞-site degenerates to a two-stratum chain; ambidexterity reduces to a finite-rank linear-algebraic check. Used as the *worked example* in this subtheory ([`examples/minimal-presheaf-cell.md`](../examples/minimal-presheaf-cell.md)) but not the *typed model*.

**Draft 2: the formal-modality model.** $\mathcal{H}$ is left abstract; the modal axioms are taken as defining. This is the [Schreiber 2013](../references/schreiber-2013.md) approach. Has the advantage of cleanly separating the modal content from any choice of base site, and is the natural formal home for the [filter-induced restriction of RITM](../theorems/filter-induced-restriction-of-ritm.md). Adopted as the *typed model* in this subtheory: the [`relational-infinity-topos.md`](../objects/relational-infinity-topos.md) object leaves $\mathcal{H}$ abstract.

**Draft 3: presheaves on Cartesian spaces.** $\mathcal{H} = \mathrm{PSh}(\mathrm{CartSp})$. Schreiber's "synthetic differential ∞-cohesion." The largest model among the three; carries differential-geometric structure (smooth functions, differential forms, infinitesimal extensions). Used in source draft 3 as the example of an SD-stratifiable cohesive ∞-topos with non-trivial geometry. Not a typed object here, but referenced in the [`presheaf-vs-cartsp-base`](../questions/presheaf-vs-cartsp-base.md) question.
