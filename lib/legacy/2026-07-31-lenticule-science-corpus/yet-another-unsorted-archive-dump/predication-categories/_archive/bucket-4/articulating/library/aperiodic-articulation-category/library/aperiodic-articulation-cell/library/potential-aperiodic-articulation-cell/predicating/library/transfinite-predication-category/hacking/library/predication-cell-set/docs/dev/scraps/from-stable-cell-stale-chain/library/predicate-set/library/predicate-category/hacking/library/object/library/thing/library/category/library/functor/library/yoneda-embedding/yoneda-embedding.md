---
name: yoneda-embedding
description: "The fully-faithful functor 𝒴 : C → [C^op, Set] sending each object A to its contravariant hom-functor Hom_C(-, A). The categorical formalization of the principle 'an object IS its hom-functor.' Embeds any category C into its presheaf category as a full subcategory."
specializing: functor
references:
  - id: yoneda1954
    type: article-journal
    title: On the homology theory of modules
    volume: 7
    author:
      - literal: Yoneda, Nobuo
    container-title: Journal of the Faculty of Science of the University of Tokyo Section I
    page: 193-227
    issued:
      - year: 1954
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

The **Yoneda embedding** $\mathcal{Y} : \mathcal{C} \to [\mathcal{C}^{\mathrm{op}}, \mathrm{Set}]$ sends each object $A$ of $\mathcal{C}$ to its contravariant hom-functor [@yoneda1954; @maclane1971, Ch. III §2; @awodey2010, §8]:

$$\mathcal{Y}(A) = \mathrm{Hom}_{\mathcal{C}}(-, A) : \mathcal{C}^{\mathrm{op}} \to \mathrm{Set}$$

On morphisms, $\mathcal{Y}$ sends $f : A \to A'$ to the natural transformation $f_* : \mathrm{Hom}_{\mathcal{C}}(-, A) \Rightarrow \mathrm{Hom}_{\mathcal{C}}(-, A')$ given by post-composition: $(f_*)_X(g) = f \circ g$ for $g : X \to A$.

**The Yoneda lemma.** For any functor $F : \mathcal{C}^{\mathrm{op}} \to \mathrm{Set}$ and any object $A \in \mathrm{Ob}(\mathcal{C})$:

$$\mathrm{Nat}(\mathrm{Hom}_{\mathcal{C}}(-, A), F) \cong F(A)$$

natural in both $A$ and $F$. Applied to $F = \mathrm{Hom}_{\mathcal{C}}(-, B)$:

$$\mathrm{Nat}(\mathrm{Hom}_{\mathcal{C}}(-, A), \mathrm{Hom}_{\mathcal{C}}(-, B)) \cong \mathrm{Hom}_{\mathcal{C}}(A, B)$$

which says natural transformations between hom-functors are in bijection with morphisms in $\mathcal{C}$ — the Yoneda embedding is **fully faithful**.

**The principle "an object IS its hom-functor."** The Yoneda embedding is faithful (different morphisms $f, g : A \to B$ give different natural transformations) and full (every natural transformation between hom-functors comes from a morphism in $\mathcal{C}$). Consequently, $\mathcal{C}$ is canonically isomorphic to a full subcategory of $\hat{\mathcal{C}} = [\mathcal{C}^{\mathrm{op}}, \mathrm{Set}]$ — namely, the full subcategory of [representable presheaves](../representable-functor/representable-functor.md).

**Consequences.**

- An object $A$ is determined up to canonical isomorphism by its hom-functor $\mathrm{Hom}_{\mathcal{C}}(-, A)$. Two objects with naturally isomorphic hom-functors are isomorphic.
- To define a morphism $A \to B$ is the same as to define a natural transformation $\mathrm{Hom}_{\mathcal{C}}(-, A) \Rightarrow \mathrm{Hom}_{\mathcal{C}}(-, B)$. This is the universal-property style of definition.
- Categories without limits or other special structure can be embedded into presheaf categories (which always have all small limits and colimits), gaining structure by passage to $\hat{\mathcal{C}}$.

**The covariant Yoneda embedding.** Dually, $\mathcal{Y}' : \mathcal{C}^{\mathrm{op}} \to [\mathcal{C}, \mathrm{Set}]$, $A \mapsto \mathrm{Hom}_{\mathcal{C}}(A, -)$, embeds $\mathcal{C}^{\mathrm{op}}$ into the category of covariant Set-valued functors.

**The deeper slogan.** Mac Lane summarizes the Yoneda embedding's content: *"To understand an object, study how it relates to other objects."* The hom-functor records every relation $A$ has to every other object; the Yoneda lemma says that record is complete.
