---
name: minimal-presheaf-cell
type: example
class: minimal-cell
status: verified-by-hand
instantiates: [relational-infinity-topos, ritm, cohesive-quadruple]
depends-on:
  - relational-infinity-topos
  - ritm
  - cohesive-quadruple
---

The $(\infty, 1)$-topos $\mathcal{H} := \mathrm{PSh}(\{0 \to 1\})$ of presheaves on the walking arrow is the **minimal model** of a [relational ∞-topos](../objects/relational-infinity-topos.md) carrying a non-degenerate [cohesive quadruple](../morphisms/cohesive-quadruple.md).

## Concrete description

An object of $\mathcal{H}$ is a map $X_0 \to X_1$ in $\infty\text{-Grpd}$ — equivalently, a *relational cell* with source $X_0$ and target $X_1$ together with the structure-morphism between them.

## The cohesive quadruple in closed form

For $X = (X_0 \to X_1) \in \mathcal{H}$:

| Functor | Closed form |
|---|---|
| $\Pi^{\to}(X)$ | $\mathrm{colim}(X_0 \to X_1) \simeq X_1$ (because $X_0 \to X_1$ has its colimit at $X_1$) |
| $\Box_r(X)$ | the *constant arrow* $X_0 \to X_0$ — discrete embedding of the source |
| $\Diamond_l(X)$ | the *constant arrow* $X_1 \to X_1$ — codiscrete embedding of the target |
| $\nabla^{\leftarrow}(X)$ | $\lim(X_0 \to X_1) \simeq X_0$ |

The four functors are all computable in closed form; the KZ-laxity of $\Box_r \Diamond_l = G$ reduces to checking that the iterated-flow comparison on the walking arrow is an equivalence, which is immediate because each iteration collapses to a constant arrow.

## RITM verification

The RITM structure on this $\mathcal{H}$:

- $\Box$-modal objects (RD) = constant arrows on the source (objects of the form $A \to A$ via the embedding from $\infty\text{-Grpd}$).
- $\Diamond$-modal objects (RT) = constant arrows on the target (same shape, from the dual embedding).
- Self-stabilization: every $X = (X_0 \to X_1)$ has a canonical $\Diamond$-reflection $X \to \Diamond X = (X_1 \to X_1)$ via the structure morphism, and a canonical $\Box$-coreflection $\Box X = (X_0 \to X_0) \to X$.

This verifies the [RITM existence theorem](../theorems/ritm-existence.md) on the minimal model.

## Coincidence with the exit category

The walking arrow $\{0 \to 1\}$ is also the [exit ∞-category](../teaching/explanations/exit-infinity-category.md) of the minimal stratification of the unit interval $[0,1]$ stratified by $\{0\} \subset [0,1]$. So $\mathrm{PSh}(\{0 \to 1\})$ is simultaneously: the minimal cohesive model, the SD ∞-topos on the minimal stratified space, and the model in which "relational cell" reduces to "arrow." This three-fold coincidence is what makes the walking arrow the natural worked example.
