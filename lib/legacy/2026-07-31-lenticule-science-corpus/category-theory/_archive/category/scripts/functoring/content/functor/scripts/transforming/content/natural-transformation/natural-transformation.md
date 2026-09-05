---
id: natural-transformation
description: "A morphism between functors — a coherent family of morphisms that commutes with every arrow in the source category."
aliases: [natural transformations]
maps: functor, functor
components: morphism
condition: naturality-square
strengthens-to: natural-isomorphism
lives-in: functor-category
date-created: 2025-12-26
date-modified: 2026-03-29
---

A natural transformation $\alpha : F \Rightarrow G$ between two [functors](./functor.md) $F, G : C \to D$ assigns to each [object](./object.md) c in C a [morphism](./morphism.md) $\alpha_c : F(c) \to G(c)$ in D, such that for every morphism $f : c \to c'$ in C, the following square commutes:

$$G(f) \circ \alpha_c = \alpha_{c'} \circ F(f)$$

The commutativity condition is the substance of "natural." It says that $\alpha$ does not depend on arbitrary choices. Transforming an object and then mapping it forward gives the same result as mapping it forward and then transforming it. The components $\alpha_c$ are coherent across the entire category — they fit together into a single, globally consistent mapping from F to G.

A natural transformation is to functors what a [functor](./functor.md) is to categories and what a [morphism](./morphism.md) is to objects. Each level maps between structures at the level below, and each level preserves the relevant structure. Morphisms preserve nothing on their own — they are the arrows. Functors preserve [composition](./composition.md) and identity. Natural transformations preserve the naturality square — the coherence between how two functors interact with morphisms.

Natural transformations are the morphisms in the functor [category](./category.md) $[C, D]$. The objects of $[C, D]$ are functors from C to D. The morphisms are natural transformations between them. Composition of natural transformations is defined componentwise: $(\beta \circ \alpha)_c = \beta_c \circ \alpha_c$.

A natural transformation is a natural [isomorphism](./isomorphism.md) if every component $\alpha_c$ is an isomorphism. Natural isomorphisms express that two constructions are "the same" in the strongest sense available — same result at every object, coherently across the entire category. Two functors related by a natural isomorphism are interchangeable for all categorical purposes.

Mac Lane said: "I didn't invent categories to study functors; I invented them to study natural transformations." The naturality square is the reason category theory exists. Without it, there is no way to say that a construction is "canonical" or "choice-free" — natural transformations are the formal tool for making that claim precise.
