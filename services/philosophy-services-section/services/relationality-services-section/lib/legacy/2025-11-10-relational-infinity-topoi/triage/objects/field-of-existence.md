---
name: field-of-existence
type: object
class: substack
symbol: "\\mathfrak{F}^{\\mathrm{Ex}}"
realizes: [recursive-realization]
depends-on: [kz-comonad-G, recursive-realization, relational-infinity-topos, sd-constructible-stack]
---

The **field of existence** in a [relational ∞-topos](relational-infinity-topos.md) is the full sub-$\infty$-stack

$$\mathfrak{F}^{\mathrm{Ex}} \;\hookrightarrow\; \mathfrak{M}^{\mathrm{Constr}}_{\mathcal{S}}$$

of [SD-constructible](../teaching/explanations/constructibility.md) diagrams whose [recursive realization](../teaching/explanations/recursive-realization.md) terminates — equivalently, the diagrams that are coalgebras for the [KZ comonad](../morphisms/kz-comonad-G.md) $G$ extended pointwise to $\mathcal{S}$-shaped diagrams.

## Coalgebraic characterization

Equivalently, $\mathfrak{F}^{\mathrm{Ex}}$ is the moduli stack of $G$-coalgebras in $\mathrm{Diag}(\mathcal{S}, \mathcal{H})$ where $G$ is the [KZ comonad](../morphisms/kz-comonad-G.md) extended pointwise. This is what makes existence visibly RT-modal (a $\Diamond$-stable property): see [RT self-stabilization](../theorems/rt-self-stabilization.md).

## Caveat — existence-as-truncation vs RT-equivalence

Source drafts 1 and 2 disagree on the characterization of existence. Draft 1 takes "existence" to mean the $(-1)$-truncation of the constructible stack — a propositional shadow. Draft 2 takes it to mean RT-equivalence — coalgebra status under $\Diamond_l$. The two are not equivalent in general. See [existence-as-truncation-vs-rt-equivalence](../questions/existence-as-truncation-vs-rt-equivalence.md). This object adopts the draft-2 characterization (RT-equivalence) as primary because the coalgebraic picture composes more cleanly with the rest of the subtheory.
