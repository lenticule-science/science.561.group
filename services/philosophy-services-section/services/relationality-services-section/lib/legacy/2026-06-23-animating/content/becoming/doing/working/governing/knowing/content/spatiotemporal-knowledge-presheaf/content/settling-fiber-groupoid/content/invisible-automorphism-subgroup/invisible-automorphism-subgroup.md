---
type: concept
class: subgroup
symbol: "N(v)"
depends-on: [settling-automorphism-1-truncation, settling-associated-sheaf, settling-morphism, internal-z2-gauge]
---

# Invisible automorphism subgroup

The kernel of the action of the settling-automorphism group on the [settling-associated sheaf](../objects/settling-associated-sheaf.md).

For a settling $v$ with [settling-morphism](settling-morphism.md) automorphism group $\mathrm{Aut}^\simeq(v)$ ([1-truncated by the automorphism 1-truncation theorem](../theorems/settling-automorphism-1-truncation.md)), the **invisible automorphism subgroup** is

$$N(v) \;:=\; \{\phi \in \mathrm{Aut}^\simeq(v) \,:\, \phi_* = \mathrm{id}_{\mathcal{F}_U}\} \;\trianglelefteq\; \mathrm{Aut}^\simeq(v).$$

Concretely, under the naturality restriction: $\phi \in N(v)$ iff the cellwise reindexing $g : E \times E \to E \times E$ induced by $\phi$ fixes every cell that is designated at some settling stage.
Equivalently, $g$ permutes only among cells that remain $\bot$ throughout the settling.

## Why "invisible"

These automorphisms are invisible to the cohomology: they act trivially on $\mathcal{F}_U$ and hence trivially on every cohomological invariant $H^n(\mathbf{T}^*, \mathcal{F}_U)$.
The [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) is fixed by $N(v)$ because its $H^1$-class is.

## When $N(v)$ is large

For sparsely-designated settlings — typical of [aperiodic regime](../theorems/four-regime-dichotomy.md), e.g., the [transfinite-induction settling](../examples/transfinite-induction-settling.md), whose designated cells form the $\omega_1$-diagonal — $N(v)$ has cardinality up to $|\mathrm{Sym}(\text{permanently-}\bot\text{ region})|$, a very large group.
The entire natural-automorphism structure of such settlings sits in $N(v)$.

## The gauge case

The [bilattice-negation $\mathbb{Z}/2$-gauge](teaching/explanations/internal-z2-gauge.md) is a distinguished case: it fixes cell positions and acts only on values at each cell, so its induced cellwise reindexing is the identity on $E \times E$.
Hence whenever gauge stabilizes $v$ — iff it fixes every cell value appearing in $v$, e.g., paraconsistent $\top$-valued settlings — gauge is automatically in $N(v)$.
Gauge never contributes to the [visible quotient](visible-automorphism-quotient.md) for the basic $\mathcal{F}_U$ sheaves.
