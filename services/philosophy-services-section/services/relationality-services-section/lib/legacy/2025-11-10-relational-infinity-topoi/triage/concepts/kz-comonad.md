---
name: kz-comonad
type: concept
class: 2-comonad
symbol: "G"
depends-on:
  - "../../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md"
  - modality
  - cohesive-infinity-topos
---

A **KZ-comonad** on an $(\infty, 1)$-category $\mathcal{H}$ is a 2-comonad $(G, \varepsilon, \delta)$ in which the comultiplication $\delta : G \Rightarrow G G$ is a section of $G\varepsilon$ — equivalently, $\delta \dashv G\varepsilon$ as 1-cells in $\mathcal{H}$ with identity unit. Dually, a KZ-monad is a 2-monad with $\eta \dashv \mu$ identity counit. The condition is *lax-idempotence*: $G G$ canonically retracts onto $G$ in a way that makes $G$-coalgebras into a full sub-$\infty$-category of $\mathcal{H}$.

The pattern goes back to [Kock](../references/kock-1995.md) and [Zöberlein](../references/zoberlein-1976.md).

## In a cohesive ∞-topos

The composite

$$G := \Box_r \, \Diamond_l \, : \, \mathcal{H} \to \mathcal{H}$$

of the two middle functors of the [cohesive quadruple](../morphisms/cohesive-quadruple.md) is naturally a KZ-comonad on $\mathcal{H}$. This is the operator the relational-calculus pilot's [Flow](../../../../../relational-calculus/triage/concepts/flow.md) names.

The KZ-laxity of $G$ is the formal expression of "Flow contracts under iteration": if $X$ is already a $G$-coalgebra (a *stable configuration*), then $G X \simeq X$ canonically, and the canonical comparison $G G X \to G X$ is an equivalence.

## Relationship to the closure 2-monad

Predication categories' [closure 2-monad](../../../../theories/predication-categories/morphisms/closure-2-monad.md) is, in its 2-categorical formulation (Kelly–Lack K1 lax-idempotence), a *KZ-monad* on the 2-category of predication fibrations. The KZ-comonad $G$ on a cohesive $\infty$-topos and the closure 2-monad on $\mathbf{PrFib}(\mathcal{C})$ are *not* the same operator — one is a comonad on a topos, the other a monad on a 2-category of fibrations — but they are both KZ structures, and their KZ-laxity axioms are formally identical. See [kz-comonad-vs-closure-2-monad](../questions/kz-comonad-vs-closure-2-monad.md) for the relationship.

## Algebras as stable configurations

A $G$-coalgebra is a [field-of-existence](../objects/field-of-existence.md) point — a configuration that survives iteration of the directed dynamics $G$. The category $\mathrm{coAlg}(G)$ is the *Relational Topology* (RT) sub-modality named in the source drafts. By the lax-idempotence of $G$, the inclusion $\mathrm{coAlg}(G) \hookrightarrow \mathcal{H}$ is reflective, and the reflector is $G$ itself — this is the [RT self-stabilization theorem](../theorems/rt-self-stabilization.md).
