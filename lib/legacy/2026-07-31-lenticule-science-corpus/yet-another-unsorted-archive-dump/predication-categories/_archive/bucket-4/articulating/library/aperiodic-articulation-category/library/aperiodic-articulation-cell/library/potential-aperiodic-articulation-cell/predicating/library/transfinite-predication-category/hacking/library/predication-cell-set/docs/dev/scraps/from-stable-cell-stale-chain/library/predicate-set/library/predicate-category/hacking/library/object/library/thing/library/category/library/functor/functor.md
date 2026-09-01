---
name: functor
description: "A structure-preserving map F: C -> D between two categories. Sends objects of C to objects of D and morphisms of C to morphisms of D, preserving composition and identities. The functorial laws — F(g compose f) = F(g) compose F(f) and F(id_A) = id_{F(A)} — are what make a functor a morphism in the category of categories Cat."
specializing: thing
references:
  - id: eilenbergmaclane1945
    type: article-journal
    title: General theory of natural equivalences
    volume: 58
    issue: 2
    author:
      - literal: Eilenberg, Samuel
      - literal: Mac Lane, Saunders
    container-title: Transactions of the American Mathematical Society
    page: 231-294
    issued:
      - year: 1945
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

A **functor** $F : \mathcal{C} \to \mathcal{D}$ is a structure-preserving map between two categories [@maclane1971, Ch. I §3; @awodey2010, §1.3], specified by two component maps:

- $F_{\mathrm{obj}} : \mathrm{Ob}(\mathcal{C}) \to \mathrm{Ob}(\mathcal{D})$, sending each source-category object $A$ to a target-category object $F(A)$.
- $F_{\mathrm{mor}} : \mathrm{Hom}_{\mathcal{C}} \to \mathrm{Hom}_{\mathcal{D}}$, sending each source-category morphism $f : A \to B$ to a target-category morphism $F(f) : F(A) \to F(B)$.

The two components are constrained to satisfy the **functoriality laws**:

1. **Composition preservation.** For every composable pair $f, g$ in $\mathcal{C}$: $F(g \circ f) = F(g) \circ F(f)$.
2. **Identity preservation.** For every object $A$ in $\mathcal{C}$: $F(\mathrm{id}_A) = \mathrm{id}_{F(A)}$.

The schema captures the structural data — `source-category`, `target-category`, `object-map`, `morphism-map` — using `propertyNames` and `additionalProperties` together with `$dynamicRef` to `name-shape` to constrain that every key and value in the two maps is a well-formed name. The functoriality laws are universally-quantified equations not expressible in JSON Schema; functoriality-check transformers operate over a candidate functor instance plus its source and target categories and report whether the laws hold.

**Specializations.** Several specific functors carry additional structure or constraints:

- An **endofunctor** is a functor $F : \mathcal{C} \to \mathcal{C}$ where source and target categories coincide. The closure operator on the predication-fiber-functor is an endofunctor.
- A **contravariant functor** $F : \mathcal{C}^{\mathrm{op}} \to \mathcal{D}$ reverses arrows, sending $f : A \to B$ to $F(f) : F(B) \to F(A)$. The predication-fibration is contravariant in the predicate category.
- A **forgetful functor** drops structure, sending an object with additional data to its underlying carrier.

Each specialization extends the functor schema via `allOf` and adds its own constraints (e.g., an endofunctor requires `source-category == target-category`, expressible with `if/then` keyed on the two fields).
