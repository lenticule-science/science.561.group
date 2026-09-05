---
name: kz-comonad-G
type: morphism
class: 2-comonad
symbol: "G"
realizes: [kz-comonad]
depends-on:
  - "../../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md"
  - kz-comonad
  - flat-comonad
  - sharp-monad
---

The **flow operator** of a [cohesive ∞-topos](../teaching/explanations/cohesive-infinity-topos.md) $\mathcal{H}$ is the composite

$$G \;:=\; \Box_r \, \Diamond_l \;:\; \mathcal{H} \to \mathcal{H}$$

of the [flat comonad](flat-comonad.md) with the [sharp monad](sharp-monad.md), naturally a [KZ-comonad](../teaching/explanations/kz-comonad.md) on $\mathcal{H}$.

## KZ structure

- **Counit** $\varepsilon : G \Rightarrow 1_{\mathcal{H}}$ — the projection $\Box_r \Diamond_l X \to X$ obtained as the composite of the unit of $\Box_r \dashv \Diamond_l$ with the codiscrete reflection.
- **Comultiplication** $\delta : G \Rightarrow G G$ — the iterated-flow comparison, lax-idempotent.
- **KZ axiom:** $\delta \dashv G\varepsilon$ with identity unit. This is the formal expression of "Flow contracts under iteration."

## Coalgebras as stable configurations

A $G$-coalgebra is a configuration $X \in \mathcal{H}$ stable under the directed dynamics: $G X \simeq X$ canonically. The full sub-$\infty$-category $\mathrm{coAlg}(G) \hookrightarrow \mathcal{H}$ is the [field of existence](../objects/field-of-existence.md) inside the cohesive ∞-topos, and it is reflective by KZ-laxity — the reflector being $G$ itself (this is the [RT self-stabilization theorem](../theorems/rt-self-stabilization.md)).

## Relationship to the closure 2-monad

Predication categories' [closure 2-monad](../../../../theories/predication-categories/morphisms/closure-2-monad.md) on $\mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$ is, in its 2-categorical formulation, also a KZ structure (Kelly–Lack K1 lax-idempotence). The flow operator $G$ is *not* the closure 2-monad — they live on different 2-categories — but the KZ axiom is the same in both, and one of the open structural questions is whether there is a comparison morphism between them. See [kz-comonad-vs-closure-2-monad](../questions/kz-comonad-vs-closure-2-monad.md).

## Relationship to the relational-calculus pilot's Flow

This is the typed-morphism version of the relational-calculus pilot's [`concepts/flow.md`](../../../../../relational-calculus/triage/concepts/flow.md): the pilot names Flow as a comonadic operator with counit, comultiplication, and KZ-laxity; this morphism types it as the composite $\Box_r \Diamond_l$ on a cohesive ∞-topos.
