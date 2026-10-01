---
type: definition
class: set
realizes: [cosmic-event]
symbol: "E_{\\mathrm{cos}}"
depends-on: [spacetime, entity-set, cosmic-event]
name: Spacetime entity set
description: Fix a spacetime manifold $(M, g)$ — a four-dimensional Lorentzian manifold satisfying the Einstein equations or, in Lambda-CDM, the FLRW metric on a comoving slice.
---

# Spacetime entity set

Fix a [spacetime](../../../../../../../natural-science-services-section/services/physical-science-services-section/services/physics-services-section/content/text/glossary/terms/spacetime.md) manifold $(M, g)$ — a four-dimensional Lorentzian manifold satisfying the Einstein equations or, in [Lambda-CDM](../../../../../../../natural-science-services-section/services/physical-science-services-section/services/astronomy-services-section/services/cosmology-services-section/content/text/glossary/terms/lambda-cdm-model.md), the FLRW metric on a comoving slice. The **spacetime entity set** $E_{\mathrm{cos}}$ is the underlying point set of $M$, considered as the [entity set](../../documents/articles/research/2026/humanities/theories/math/theories/categories/theories/predication-categories/objects/entity-set.md) of the [cosmological settling](../../documents/articles/research/2026/07/31/lenticule-import/entity/_archive/cosmological-settling.md).

Equivalently, $E_{\mathrm{cos}}$ is the carrier of the [cosmic event](../../../../../../../natural-science-services-section/services/physical-science-services-section/services/astronomy-services-section/content/text/glossary/terms/cosmic-event.md) role: each element $e \in E_{\mathrm{cos}}$ is one cosmic event.

## Carries: causal order, but not just causal order

The spacetime entity set is not a bare set. It carries:

- A **causal partial order** $\preceq$: $e_1 \preceq e_2$ iff $e_2$ is in the future light cone of $e_1$ (or $e_1 = e_2$). This is the structure that the [light-cone predicate category](../../../../../../../natural-science-services-section/services/physical-science-services-section/services/astronomy-services-section/services/cosmology-services-section/content/text/documents/articles/notes/light-cone-predicate-category.md) reads off.
- A **proper-time metric** along timelike worldlines: how much clock-time elapses between two timelike-separated events along a given worldline.
- A **[cosmic time](../../../../../../../natural-science-services-section/services/physical-science-services-section/services/astronomy-services-section/content/text/glossary/terms/cosmic-time.md) projection** $t : E_{\mathrm{cos}} \to \mathbb{R}_{\geq 0}$, defined when the spacetime is FLRW: each event projects to the cosmic time of the comoving slice it lies on. This projection is the [cosmic-time-reindexing](../../../../../../../natural-science-services-section/services/physical-science-services-section/services/astronomy-services-section/services/cosmology-services-section/content/text/glossary/terms/cosmic-time-reindexing.md) morphism's source.

The bare entity set $E_{\mathrm{cos}}$ disregards all this structure; the morphisms that act on it (causal restrictions, time reindexings, frame changes) carry the structure as side data.

## Cardinality and granularity

$E_{\mathrm{cos}}$ is a continuum — a four-dimensional manifold — not a discrete set. The [predication settling](../../documents/articles/research/2026/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) machinery developed in the parent theory was originally posed for discrete entity sets. Two strategies for handling the continuum are admissible:

1. **Coarse-graining.** Partition $E_{\mathrm{cos}}$ into a discrete cover (e.g. a Hubble-volume-sized cell complex) and treat each cell as a single entity. Acceptable for cosmology-at-large-scales; loses information at small scales.
2. **Continuum predication.** Promote the [predication fiber algebra](../../documents/articles/research/2026/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) at each predicate to a sheaf of bilattice values over $E_{\mathrm{cos}} \times E_{\mathrm{cos}}$. The [d-frame valued sheaf](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/d-frame-valued-sheaf/d-frame-valued-sheaf.md) machinery from the parent theory is the natural setting.

Predicated cosmology defaults to (2) at the foundational level; (1) is the working approximation for explicit calculations.

## Topology and orientation

$E_{\mathrm{cos}}$ inherits its topology from the manifold structure of $(M, g)$, and inherits a time orientation from the choice of future-pointing timelike vector field. The time orientation is what makes the [arrow-of-time-from-knowledge-monotonicity](../../../../../../../natural-science-services-section/services/physical-science-services-section/services/astronomy-services-section/services/cosmology-services-section/content/text/documents/articles/notes/arrow-of-time-from-knowledge-monotonicity.md) theorem orient the [knowledge order](../../documents/articles/research/2026/humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) the same way at every event.
