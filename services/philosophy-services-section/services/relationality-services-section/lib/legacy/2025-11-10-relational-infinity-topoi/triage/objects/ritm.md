---
name: ritm
type: object
class: modality
symbol: "(\\Pi^{\\to}, \\Box_r, \\Diamond_l, \\nabla^{\\leftarrow})"
realizes: [modality, cohesive-infinity-topos]
depends-on: [cohesive-infinity-topos, modality, cohesive-quadruple, kz-comonad]
---

The **RITM** of a [relational ∞-topos](relational-infinity-topos.md) $(\mathcal{H}, \mathbf{B}, \mathcal{S})$ is the typed packaging of the [cohesive quadruple](../morphisms/cohesive-quadruple.md) on $\mathcal{H}$ as an object whose internal structure is *modal*: the four functors are seen primarily through the action of the middle two as endomodalities $(\Box, \Diamond)$ on $\mathcal{H}$, and only secondarily as adjoint pairs.

## Data

A RITM consists of:

- A [cohesive ∞-topos](../teaching/explanations/cohesive-infinity-topos.md) $\mathcal{H}$.
- The cohesive quadruple $\Pi^{\to} \dashv \Box_r \dashv \Diamond_l \dashv \nabla^{\leftarrow}$, with $\Pi^{\to}$ and $\nabla^{\leftarrow}$ product-preserving.
- The internal sub-modality structure: an idempotent comonad $\Box := \Box_r$ (necessity) and an idempotent monad $\Diamond := \Diamond_l$ (possibility), each lax-idempotent (KZ).

## The two internal sub-modalities — RD and RT

Once realized, RITM canonically generates two internal sub-modalities of $\mathcal{H}$:

- **Relational Dynamics (RD)** — the full sub-$\infty$-category of $\Box$-stable endofunctors of $\mathcal{H}$. Equivalently, $\Box$-modal objects: those $X$ for which $\Box X \simeq X$.
- **Relational Topology (RT)** — the full sub-$\infty$-category of $\Diamond$-stable endofunctors. Equivalently, $\Diamond$-modal objects: those $X$ for which $\Diamond X \simeq X$.

These two sub-modalities reproduce the RITM axioms internally. The structure produces, from within itself, the structure that was used to build it. This is the geometric statement of the relational-calculus pilot's [self-grounding](../../../../../relational-calculus/triage/concepts/generative-closure.md) at the geometric layer; see the [RT self-stabilization theorem](../theorems/rt-self-stabilization.md).

## Existence

Existence of a RITM on a given cohesive ∞-topos is the [RITM existence theorem](../theorems/ritm-existence.md). The minimal model — the [presheaf cell](../examples/minimal-presheaf-cell.md) $\mathrm{PSh}(\{0 \to 1\})$ — gives a RITM by direct computation.

## Slug-collision note

This object's slug `ritm` collides with the [relational-calculus pilot's `concepts/ritm.md`](../../../../../relational-calculus/triage/concepts/ritm.md) (which is `type: concept` and is the philosophical-narrative version). The collision is intentional: this is the typed object that the pilot's concept names. The two are kept distinguishable by frontmatter (`type: concept` over there vs `type: object` here) and by the kinds of cross-references each receives. See [`dependency-audit.md`](../dependency-audit.md) for the full collision log.

## Cross-vault relationships

- The pilot's [`concepts/ritm.md`](../../../../../relational-calculus/triage/concepts/ritm.md) is the philosophical version; this object types it.
- The pilot's [`concepts/cohesive-chain.md`](../../../../../relational-calculus/triage/concepts/cohesive-chain.md) names the four functors without the modal interpretation; the [cohesive quadruple morphism](../morphisms/cohesive-quadruple.md) types that.
- Predication categories' [closure 2-monad](../../../../theories/predication-categories/morphisms/closure-2-monad.md) is the 1-categorical analogue of the KZ comonad $G = \Box \Diamond$ that lives inside RITM.
