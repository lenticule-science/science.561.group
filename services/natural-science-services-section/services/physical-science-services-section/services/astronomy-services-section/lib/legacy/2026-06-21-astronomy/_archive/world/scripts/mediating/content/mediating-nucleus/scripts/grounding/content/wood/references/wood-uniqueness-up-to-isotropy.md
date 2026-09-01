---
type: theorem
class: uniqueness
status: sketch
depends-on: [wood-between-worlds, isotropy]
---

# Wood uniqueness up to isotropy

**Statement.** If $(\mathrm{Wd}, \{P_i\}, \{\phi_i\})$ and $(\mathrm{Wd}', \{P'_i\}, \{\phi'_i\})$ both satisfy the [Wood axioms](../objects/wood-between-worlds.md#the-wood-axioms) for the same family of [worlds](../objects/world-as-nucleus.md) $\{W_i\}$, then there exists an isomorphism

$$f : \mathrm{Wd} \to \mathrm{Wd}'$$

unique up to postcomposition with $\mathrm{Aut}(\mathrm{Wd}')$.

## Argument (sketch)

Standard initial-object argument. By the universal mediating property (W-Univ), each Wood receives a unique-up-to-isotropy morphism from the other, since each is a [mediating nucleus](../teaching/explanations/mediating-nucleus.md) for $\{W_i\}$. Composing the two morphisms in either order yields an endomorphism of $\mathrm{Wd}$ (resp. $\mathrm{Wd}'$) that is, by uniqueness-up-to-isotropy in (W-Univ), the identity up to an automorphism in $\mathrm{Aut}(\mathrm{Wd})$ (resp. $\mathrm{Aut}(\mathrm{Wd}')$). Hence the composition is an automorphism, and each individual morphism is an isomorphism. ∎

## What this theorem is and is not

- **It is** the categorical statement that the Wood is well-defined as a structure: the axioms (W-Iso), (W-PoolDeg), (W-BdyPort), (W-Univ) pick out a single object up to the controlled ambiguity of $\mathrm{Aut}(\mathrm{Wd})$.
- **It is not** a uniqueness statement about *physical* multiverses: nothing here says that the family of worlds $\{W_i\}$ is unique, or that any given physical multiverse instantiates the Wood structure.
- **It is not** stronger than initiality up to isomorphism — the controlled ambiguity is exactly that of the Wood's own automorphism group, no more and no less.

The subordinate **Corollary (Canonicality).** Any liminal, isotropic, hole-stratified mediator for $\{W_i\}$ is equivalent up to isotropy to $\mathrm{Wd}$. (This was Corollary 3.9 in the source.)

## Status

Sketch. The argument is standard for initial objects in a category with the appropriate uniqueness-up-to-iso conditions on morphisms; making it fully rigorous requires being explicit about the 2-categorical structure of the mediator category (in which the "up to isotropy" is the 2-cell). Open work.

## Provenance

Theorem 3.8 of [`wood-between-worlds.md`](../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relationality/triage/provenance/math-from-relationality-bucket/wood-between-worlds.md).
