---
name: monomorphism
description: "A left-cancellable morphism f : A → B — for every parallel pair g, h : X → A, the equation f ∘ g = f ∘ h implies g = h. The categorical generalization of injectivity."
specializing: transformer
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

A **monomorphism** $f : A \to B$ in a category $\mathcal{C}$ is a morphism that is **left-cancellable** [@maclane1971, Ch. I §5; @awodey2010, §2.1]:

$$f \circ g = f \circ h \implies g = h$$

for every parallel pair $g, h : X \to A$.

Monomorphisms are the categorical generalization of injective functions. In Set, the monomorphisms are exactly the injections. In Top, the monomorphisms are exactly the injective continuous maps. In Grp, the monomorphisms are exactly the injective group homomorphisms. In a partial order viewed as a thin category, every morphism is trivially a monomorphism (the cancellation hypothesis is vacuous because hom-sets have at most one element).

**Notation.** Monomorphisms are often drawn as arrows with a hooked tail: $A \hookrightarrow B$.

**Specializing shape.** The schema specializes [transformer](../../transformer.md) by structural property without adding any structural cells. The left-cancellation predicate is universally quantified over arbitrary parallel pairs into $A$; JSON Schema cannot express such universal quantification, so the predicate is checked by a separate transformer (the monomorphism-witness check).

**Specializations.** A **split monomorphism** (or section) is a monomorphism with a left inverse — there exists $r : B \to A$ with $r \circ f = \mathrm{id}_A$. Split monomorphisms are also called *sections* and are strictly stronger than ordinary monomorphisms in most categories. A **regular monomorphism** is one that arises as an equalizer of some parallel pair.

In categories with limits, monomorphisms have universal characterizations — they are precisely the morphisms $f : A \to B$ such that the pullback of $f$ along itself gives $A$ back (the diagonal $\Delta_f : A \to A \times_B A$ is an isomorphism).
