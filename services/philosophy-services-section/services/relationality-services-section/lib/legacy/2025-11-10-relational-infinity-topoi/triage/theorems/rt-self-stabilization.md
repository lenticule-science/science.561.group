---
name: rt-self-stabilization
type: theorem
class: reflectivity
status: sketch
lean: RelationalInfinityTopoi.rt_self_stabilization
depends-on:
  - ritm
  - kz-comonad-G
  - sharp-monad
  - field-of-existence
---

The Relational Topology sub-modality RT of [RITM](../objects/ritm.md) — the full sub-$\infty$-category of $\Diamond_l$-modal objects — is reflective in the ambient [cohesive ∞-topos](../teaching/explanations/cohesive-infinity-topos.md) $\mathcal{H}$, with reflector the [sharp monad](../morphisms/sharp-monad.md) $\Diamond_l$ itself. Equivalently, every object $X$ admits a canonical $\Diamond_l$-modal reflection $X \to \Diamond_l X$ that is universal among maps to $\Diamond_l$-modal objects.

## Statement

Let $\mathcal{H}_{\Diamond}$ denote the full sub-$\infty$-category of $\Diamond_l$-modal objects in a [relational ∞-topos](../objects/relational-infinity-topos.md). The inclusion $\mathcal{H}_{\Diamond} \hookrightarrow \mathcal{H}$ admits a left adjoint, namely $\Diamond_l$ restricted to $\mathcal{H}$ and corestricted to $\mathcal{H}_{\Diamond}$.

The same statement holds dualy for RD = $\mathcal{H}_{\Box}$ ($\Box_r$-modal objects), which is *coreflective* with coreflector $\Box_r$.

## Proof

This is exactly the standard fact about KZ-(co)monads: a KZ-monad's category of algebras is reflective in the ambient category, with the monad as reflector. $\Diamond_l$ is KZ by the [RITM existence theorem](ritm-existence.md); apply the Kelly–Lack lemma. $\square$

## Self-stabilization

The "self-stabilization" naming comes from the relational-calculus pilot's [`concepts/ritm.md`](../../../../../relational-calculus/triage/concepts/ritm.md): RITM "produces, from within itself, the structure that was used to build it." The geometric realization of that statement is exactly: once RITM is in place on $\mathcal{H}$, the sub-modality RT has a canonical reflection — no extra structure needs to be imported to define stabilization, because the cohesive quadruple's own $\Diamond_l$ is the reflector.

## Status

Sketch — the proof is short but depends on `ritm-existence` (sketch) as a lemma. Promote together.

## Relationship to the field of existence

The full sub-$\infty$-category $\mathcal{H}_{\Diamond}$ is the *pointwise* version of the [field of existence](../objects/field-of-existence.md): both consist of $\Diamond$-modal objects. The field of existence is the lift to $\mathcal{S}$-shaped diagrams; $\mathcal{H}_{\Diamond}$ is the underlying object-wise version.
