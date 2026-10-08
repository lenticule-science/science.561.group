---
name: epimorphism
description: "A right-cancellable morphism f : A → B — for every parallel pair g, h : B → Y, the equation g ∘ f = h ∘ f implies g = h. The categorical generalization of surjectivity; dual to monomorphism."
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
title: epimorphism
---

An **epimorphism** $f : A \to B$ in a category $\mathcal{C}$ is a morphism that is **right-cancellable** [@maclane1971, Ch. I §5; @awodey2010, §2.1]:

$$g \circ f = h \circ f \implies g = h$$

for every parallel pair $g, h : B \to Y$. The dual of [monomorphism](monomorphism.md): mono is left-cancellable, epi is right-cancellable.

Epimorphisms are the categorical generalization of surjective functions. In Set, the epimorphisms are exactly the surjections. The same holds in Top (surjective continuous maps) and Grp (surjective group homomorphisms). But the correspondence is not universal: in the category of rings, the inclusion $\mathbb{Z} \hookrightarrow \mathbb{Q}$ is an epimorphism without being surjective — its image $\mathbb{Z}$ in $\mathbb{Q}$ is enough to determine any ring homomorphism out of $\mathbb{Q}$, because a ring homomorphism's behavior on integers determines it everywhere on the rationals.

**Notation.** Epimorphisms are often drawn as arrows with a double head: $A \twoheadrightarrow B$.

**Specializing shape.** The schema specializes [transformer](transformer.md) by structural property without adding any structural cells. The right-cancellation predicate is universally quantified over arbitrary parallel pairs out of $B$; JSON Schema cannot express such universal quantification. A separate transformer (the epimorphism-witness check) verifies the property.

**Specializations.** A **split epimorphism** (or retraction) is an epimorphism with a right inverse — there exists $s : B \to A$ with $f \circ s = \mathrm{id}_B$. A **regular epimorphism** is one that arises as a coequalizer of some parallel pair. **Isomorphism** is mono and epi together (and the inverse condition; in general categories mono + epi does not imply iso, but in many concrete categories like Set it does).
