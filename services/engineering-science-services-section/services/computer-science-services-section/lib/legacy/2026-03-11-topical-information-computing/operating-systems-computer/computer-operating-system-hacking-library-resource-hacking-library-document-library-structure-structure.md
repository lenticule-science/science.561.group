---
name: structure
description: A Bourbaki / Mac-Lane mathematical structure — a categorical object equipped with a signature declaring its required characterizations and a set of invariants those characterizations must satisfy.
slicing: slice-category
references:
  bourbaki1968:
    class: book
    authors: ["Bourbaki, Nicolas"]
    year: 1968
    title: "Theory of Sets"
    publisher: "Hermann"
    location: "Paris"
  maclane1971:
    class: book
    authors: ["Mac Lane, Saunders"]
    year: 1971
    title: "Categories for the Working Mathematician"
    publisher: "Springer"
    location: "New York"
  lambek-scott1986:
    class: book
    authors: ["Lambek, Joachim", "Scott, Philip J."]
    year: 1986
    title: "Introduction to Higher-Order Categorical Logic"
    publisher: "Cambridge University Press"
    location: "Cambridge"
  awodey2010:
    class: book
    authors: ["Awodey, Steve"]
    year: 2010
    title: "Category Theory"
    edition: "2nd"
    publisher: "Oxford University Press"
    location: "Oxford"
---

A **structure** in the sense used here is a Bourbaki-style mathematical structure [@bourbaki1968, ch. IV]: a set or class equipped with one or more *characterizations* — distinguished relations, functions, or constants on the underlying carrier — satisfying a fixed collection of *axioms*.
Examples in standard mathematics: a group $(G, \cdot, e, (-)^{-1})$ with the group axioms; a topological space $(X, \tau)$ with the open-set axioms; a category $(\mathrm{Ob}, \mathrm{Mor}, \circ, \mathrm{id})$ with associativity and identity laws.

In the modern categorical formulation [@maclane1971, ch. II §1; @lambek-scott1986, Part I; @awodey2010, §1.4], a structure-form $T$ is presented by a *signature*: a list of typing judgments declaring the operations, relations, and constants a $T$-structure must carry, together with the equations those characterizations must satisfy.
A $T$-structure is then an object of the category $T\text{-}\mathbf{Str}$ whose objects are signature-conforming carriers and whose morphisms are signature-preserving maps.

## Structures in this corpus

Structure-forms relevant to predication-categorical work are recorded as objects of the predication category $\mathcal{P}$.
Each carries a signature presented as the typed cells of its frontmatter — every $\langle\text{key, value}\rangle$ on a structure-record encodes one characterization the type's instances are required to satisfy — and the axioms appear as invariants stated in the body or in companion specification records.

A structure is not the same kind of mathematical object as an entity (an element of an entity-set).
An entity *inhabits* a structure-form when its cells in $\mathcal{P}$ satisfy the type's signature; the inhabiting morphism is fibered by the structure-catalog.
Multiple entities may inhabit the same structure-form, and one entity may inhabit several simultaneously.

## Slice

Every structure $S$, qua object of $\mathcal{P}$, has a slice category $\mathcal{P}/S$ [@maclane1971, ch. I §3] — the bundle of arrows into $S$, equivalently the cells incident to $S$ in the predication graph.
The cell `(structure, slicing, slice-category)` records this.
The slice is not the structure itself; it is a derived category whose objects collect all the cells the predication graph carries with $S$ as their target.
