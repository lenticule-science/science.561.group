---
type: example
depends-on: [coarse-settling-moduli, four-bilattice, moduli-classifying-function, rigid-moduli-point, orbifold-moduli-point, predicate-generator-exhaustiveness, visible-automorphism-sources, relational-database-settling]
instantiates: [coarse-settling-moduli, rigid-moduli-point, orbifold-moduli-point, visible-automorphism-sources]
lineage: 2
---

# Two-entity moduli

The smallest [coarse settling moduli](../objects/coarse-settling-moduli.md) exhibiting both [rigid](teaching/explanations/rigid-moduli-point.md) and [orbifold](teaching/explanations/orbifold-moduli-point.md) substrata. **Lineage 2** instance for the moduli stack on a two-entity sub-base.

## Base

$\mathbf{L} = \mathbf{2}$, [entity set](../objects/entity-set.md) $E = \{a, b\}$ (writing $a, b$ for Alice and Bob — the L2 base restricted to two entities), [predicate category](../objects/predicate-category.md) $\mathcal{C}$ one-object on $P$ (the Likes predicate of the L2 vocabulary), [settling bound](../objects/settling-bound.md) $\lambda = \omega$.

## Fiber algebra

$A_P = \mathbf{2}^{\bowtie 2 \times 2} = $ [$\mathbf{FOUR}$](../objects/four-bilattice.md)$^4$ — four cells $(a, a), (a, b), (b, a), (b, b)$ with independent $\mathbf{FOUR}$-values.

## Regime

Finite, hence entirely the strict regime.

## MLD-classes (without closure)

For settlings quiescent from stage 0 (no closure rule), MLD-classes are orbits of $\mathbf{FOUR}^4$ under [natural-bijection-induced reindexing](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md).
Under naturality, only $\mathrm{Sym}(E)$-equivariant bijections enter, reducing the relevant symmetry group to $\mathrm{Sym}(\{a, b\}) \cong \mathbb{Z}/2$ (swapping $a \leftrightarrow b$).

The $\mathbb{Z}/2$ acts on $\mathbf{FOUR}^4$ by swapping $(a, b) \leftrightarrow (b, a)$ in the indexing.
Counting orbits:

- **Swap-fixed states** ($v(a, b) = v(b, a)$, with $v(a, a)$ and $v(b, b)$ arbitrary): $4 \times 4 \times 4 = 64$ states.
- **Non-fixed states** (the remaining $256 - 64 = 192$): pair up under swap into $96$ orbits of size 2.

Total natural MLD-classes (without closure): $64 + 96 = 160$.

The count relies on the naturality restriction and excludes settlings with non-trivial closure operators.

## Visible automorphism analysis

A state $v$ is *swap-fixed* iff $v(a, b) = v(b, a)$.
By [visible automorphism sources](../theorems/visible-automorphism-sources.md), fiber-swap contributes to the visible quotient iff (a) it stabilizes $v$ and (b) it permutes newly-designated cells non-trivially.

For a swap-fixed $v$ with $v(a, b) = v(b, a) \in \{\mathbf{t}, \mathbf{f}, \top\}$ (off-diagonal designated): swap stabilizes $v$ and swaps the two off-diagonal newly-designated cells $(a, b)$ and $(b, a)$ — non-trivial action on $\mathcal{F}_U$.
So this is an [orbifold moduli point](teaching/explanations/orbifold-moduli-point.md).

For $v$ with $v(a, b) = v(b, a) = \bot$ (off-diagonal not designated): swap fixes a diagonal-only designation set; trivial action on $\mathcal{F}_U$.
Rigid.

## Substratum counts

**Orbifold points.** Swap-fixed $v$ with off-diagonal designated value in $\{\mathbf{t}, \mathbf{f}, \top\}$ (3 choices) and diagonal values arbitrary ($4 \times 4 = 16$ combinations).
Total: $3 \times 16 = 48$ orbifold MLD-classes.

**Rigid points.** $160 - 48 = 112$ rigid MLD-classes.

## Summary

$$|\mathrm{KP}^{\mathrm{vis}}(B)| \;=\; 160 \text{ points} \;=\; 112 \text{ rigid} \,+\, 48 \text{ orbifold},\;\; \text{all in the strict regime}.$$

Adding closure operators with non-trivial rules consolidates orbits and gives further refinements; the unrestricted count above is a baseline.
Even at this minimal non-trivial base, the moduli is genuinely a finite but non-trivial object with both rigid and orbifold strata coexisting.

## Position in Lineage 2

The L2 instance of the moduli stack on a two-entity sub-base.
The 160-point count established here is the baseline; richer L2 examples adding closure rules ([social-network-meta-classification](social-network-meta-classification.md) forthcoming) will produce subset stratifications.
