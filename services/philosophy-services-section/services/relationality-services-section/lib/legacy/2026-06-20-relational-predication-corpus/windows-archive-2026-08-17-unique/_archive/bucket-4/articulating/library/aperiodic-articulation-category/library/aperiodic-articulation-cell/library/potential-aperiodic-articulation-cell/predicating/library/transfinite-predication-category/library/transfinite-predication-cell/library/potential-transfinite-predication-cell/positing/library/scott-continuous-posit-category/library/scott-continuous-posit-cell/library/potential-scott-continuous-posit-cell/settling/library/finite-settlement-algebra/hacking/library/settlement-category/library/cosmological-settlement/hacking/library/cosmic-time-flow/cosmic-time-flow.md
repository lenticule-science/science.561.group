---
type: morphism
class: comonad
status: draft
depends-on: [cosmic-time-reindexing, inference-sub-settling]
---

# Cosmic-time flow

A refinement of [cosmic-time-reindexing](cosmic-time-reindexing.md) for the special case of [inference sub-settlings](../objects/inference-sub-settling.md): a Kock–Zöberlein-style comonad $\mathrm{Flow} : \mathrm{InfSubs} \to \mathrm{InfSubs}$ on the category of inference sub-settlings, equipped with:

- A **counit** $\varepsilon_E : \mathrm{Flow}(E) \to E$ (resolution): the propagated sub-settling at $z + \Delta z$ projects back to the present sub-settling $E$ at $z$.
- A **comultiplication** $\delta_E : \mathrm{Flow}(E) \to \mathrm{Flow}(\mathrm{Flow}(E))$ (propagation): the propagated sub-settling can itself be propagated.

Coherence laws (KZ-comonad):

$$
\varepsilon_{\mathrm{Flow}(E)} \circ \delta_E = \mathrm{id}_{\mathrm{Flow}(E)}, \quad
\mathrm{Flow}(\varepsilon_E) \circ \delta_E \geq_k \mathrm{id}_{\mathrm{Flow}(E)}, \quad
\delta_{\mathrm{Flow}(E)} \circ \delta_E = \mathrm{Flow}(\delta_E) \circ \delta_E.
$$

The middle inequality is the KZ-laxity condition: the counit is fully faithful, and propagation is an *upper* approximation in the [knowledge order](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) — Flow does not invent evidence, it carries forward consistent extensions of present evidence to future redshift bins.

## Why a comonad and not a monad

The propagated sub-settling $\mathrm{Flow}(E)$ is *more determinate* than $E$ — it carries $E$'s information plus the structural constraints required for it to remain consistent with itself one step into the future. The natural direction of the morphism between $\mathrm{Flow}(E)$ and $E$ is therefore *projection* ($\mathrm{Flow}(E) \to E$, dropping the future-consistency information), which makes Flow a comonad rather than a monad.

KZ-laxity captures the weaker side: forward propagation must be at least as informative as the identity, with stabilization approached asymptotically rather than in one step. This matches the observable behavior of cosmological inference: extending a pipeline's result one redshift bin into the future via a $\Lambda$CDM forward model produces a constraint at least as strong as the present constraint, but not arbitrarily stronger.

## Relationship to cosmic-time-reindexing

[cosmic-time-reindexing](cosmic-time-reindexing.md) is the underlying morphism class on individual cells; $\mathrm{Flow}$ is its lift to whole inference sub-settlings, equipped with the additional comonad structure. The two are compatible: applying $\mathrm{Flow}$ to a sub-settling and then projecting onto an individual cell agrees with applying the cosmic-time-reindexing on that cell.

## Modal preservation

Flow preserves stabilization and possibility:

$$
\mathrm{Flow}(\mathrm{Close}(E)) = \mathrm{Close}(\mathrm{Flow}(E)), \quad
\mathrm{Flow}(\mathrm{Open}(E)) = \mathrm{Open}(\mathrm{Flow}(E))
$$

where $\mathrm{Close}$ is the [predication-settling](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) closure operator and $\mathrm{Open}$ is its dual on the opposite knowledge axis. This is the predicated content of *PreservesCore*: forward propagation respects already-stabilized and already-possibilized components.

## Stability

A sub-settling $E$ is **Flow-stable** when $\mathrm{Close}(\mathrm{Flow}(E)) = E$. Flow-stable inference sub-settlings are those whose values do not change under one step of forward propagation through the cosmological model — they are dynamic fixed points, the predicated counterpart of attractor solutions in cosmological evolution.

## Status

Draft. The KZ-comonad structure is internally consistent and compatible with the existing cosmic-time-reindexing morphism class. Open: explicit construction of Flow on a worked inference sub-settling (e.g., a Planck-style posterior chain forward-propagated through one redshift bin) and verification of the KZ-laxity inequality on that example.

## Provenance

Translates the **Flow** operator (Kock–Zöberlein comonad) introduced in [`dynamic-sufficiency-in-cosmological-inference.md`](../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relationality/triage/provenance/relationality-archive/sscu-sprint/domains/cosmology/dynamic-sufficiency-in-cosmological-inference.md) (sscu-sprint, 2026-02-27). The earlier abstract formulation of Flow as a categorical operator on the reflexive field, with the same KZ-comonad axioms (counit/comultiplication/laxity), appears in the math-from-relationality-bucket as [`reflexive-cosmology.md`](../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relationality/triage/provenance/math-from-relationality-bucket/reflexive-cosmology.md) — that draft is the proximate mathematical source for the comonad structure. The reflexive `Includes`/`Together`/`Induces` machinery on `Rel` is replaced by the bilattice $\leq_k$, meet, and residuation on $\mathbf{L}$; the dynamic residuation law

$$\mathrm{Includes}(\mathrm{Together}(\mathrm{Flow}(a),b),c) \iff \mathrm{Includes}(b,\mathrm{Induces}(\mathrm{Flow}(a),c))$$

is the residuation law of $\mathbf{L}$ applied to the Flow-propagated value $\mathrm{Flow}(a)$.
