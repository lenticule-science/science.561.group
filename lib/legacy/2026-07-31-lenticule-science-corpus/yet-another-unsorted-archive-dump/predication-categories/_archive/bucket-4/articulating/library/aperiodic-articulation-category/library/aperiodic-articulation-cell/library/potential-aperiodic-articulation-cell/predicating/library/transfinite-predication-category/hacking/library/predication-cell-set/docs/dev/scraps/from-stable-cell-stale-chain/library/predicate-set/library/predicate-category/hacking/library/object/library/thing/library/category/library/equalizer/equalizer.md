---
name: equalizer
description: "The universal cone over a parallel pair — an object E with a morphism e : E → A such that f ∘ e = g ∘ e for parallel morphisms f, g : A → B, and universal among such pairs. Categorically captures the 'subobject where two morphisms agree.'"
specializing: object
references:
  - id: maclane1971
    type: book
    title: Categories for the Working Mathematician
    series: Graduate Texts in Mathematics
    volume: 5
    publisher: Springer-Verlag
    location: New York
    author:
      - literal: Mac Lane, Saunders
    issued:
      - year: 1971
  - id: awodey2010
    type: book
    title: Category Theory
    edition: "2"
    series: Oxford Logic Guides
    volume: 52
    publisher: Oxford University Press
    location: Oxford
    author:
      - literal: Awodey, Steve
    issued:
      - year: 2010
---

An **equalizer** of a parallel pair $f, g : A \to B$ in a category $\mathcal{C}$ is an object $E$ together with a morphism $e : E \to A$ satisfying [@maclane1971, Ch. III §3; @awodey2010, §5.4]:

$$f \circ e = g \circ e$$

and the universal property:

> For every $(Q, q : Q \to A)$ with $f \circ q = g \circ q$, there exists a unique morphism $u : Q \to E$ such that $e \circ u = q$.

The equalizing morphism $e$ is always a [monomorphism](../../../transformer/library/monomorphism/monomorphism.md) — it is the "subobject inclusion" picking out the part of $A$ where $f$ and $g$ agree.

**Examples by category.**

- In Set, the equalizer of $f, g : A \to B$ is the subset $E = \{a \in A : f(a) = g(a)\}$ with $e$ the inclusion.
- In Top, the equalizer is the same subset with the subspace topology.
- In Grp, the equalizer is the subgroup where the two homomorphisms agree.
- Equalizers exist in every category with finite limits.

**Relation to limit.** Equalizers are the limits of the parallel-pair diagram (two objects, two parallel morphisms between them). The general [limit](../limit/limit.md) record's `equalizer` branch carries this case directly.

**Dual.** The dual is the [coequalizer](../coequalizer/coequalizer.md) — the universal cocone identifying $f$ and $g$ in $B$ by passing to a quotient.

**Regular subobjects.** A morphism that arises as an equalizer is called a *regular* monomorphism. In well-behaved categories (regular, exact, etc.), every monomorphism is regular; in less-behaved ones (Top is one), regular monos are a proper subclass of monomorphisms.
