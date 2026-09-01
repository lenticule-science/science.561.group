---
name: natural-transformation
description: "A morphism between two parallel functors. Given functors F, G: C -> D, a natural transformation eta: F => G is a family of component morphisms in D, one per object of C, such that for every morphism f: A -> B in C the naturality square commutes: G(f) compose eta_A = eta_B compose F(f)."
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

A **natural transformation** $\eta : F \Rightarrow G$ is a morphism between two parallel functors $F, G : \mathcal{C} \to \mathcal{D}$ [@eilenbergmaclane1945; @maclane1971, Ch. I §4; @awodey2010, §7]. The data is a family $\{\eta_A\}_{A \in \mathrm{Ob}(\mathcal{C})}$ of component morphisms with $\eta_A : F(A) \to G(A)$ in $\mathcal{D}$, indexed by objects of the source category.

The defining condition is **naturality**: for every morphism $f : A \to B$ in $\mathcal{C}$, the naturality square commutes:

$$G(f) \circ \eta_A = \eta_B \circ F(f).$$

Naturality is the universally-quantified equation that distinguishes a natural transformation from an arbitrary family of morphisms. The schema captures the component family — keys are source-category object names, values are target-category morphism names — using `propertyNames` and `additionalProperties` together with the `name-shape` dynamic anchor. The naturality equation is not expressible in JSON Schema and is checked by naturality transformers operating over a candidate natural transformation along with its source and target functors and their underlying categories.

**Specializations.**

- A **natural isomorphism** is a natural transformation whose every component is invertible. Equivalently, a natural transformation $\eta : F \Rightarrow G$ such that there exists $\eta^{-1} : G \Rightarrow F$ with $\eta^{-1} \circ \eta = \mathrm{id}_F$ and $\eta \circ \eta^{-1} = \mathrm{id}_G$ in the functor category $[\mathcal{C}, \mathcal{D}]$.
- The **unit** $\eta : \mathrm{Id}_{\mathcal{C}} \Rightarrow R \circ L$ and **counit** $\varepsilon : L \circ R \Rightarrow \mathrm{Id}_{\mathcal{D}}$ of an [adjunction](../adjunction/adjunction.md) are natural transformations with specific source/target functor pairs.

The functor category $[\mathcal{C}, \mathcal{D}]$ has functors $\mathcal{C} \to \mathcal{D}$ as objects and natural transformations as morphisms; composition is vertical composition $(\sigma \cdot \tau)_A = \sigma_A \circ \tau_A$.
