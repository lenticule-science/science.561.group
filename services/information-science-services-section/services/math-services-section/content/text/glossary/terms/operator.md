---
title: "Operator"
defines: operator
aliases: [operators]
description: "A structured map between mathematical structures, considered as an entity in its own right rather than as a relation between particular elements — a function with a structure-preservation discipline (linearity, continuity, equivariance, type-preservation) appropriate to the source and target."
instance-of: function
related: [function, morphism, transformation, map, functional, operad]
date-created: 2026-04-27
references:
  hilbert1924:
    authors: ["David Hilbert", "Richard Courant"]
    title: "Methoden der mathematischen Physik"
    publication: "Springer"
    year: 1924
    note: "early systematic treatment of operators in functional analysis"
  vonneumann1932:
    authors: ["John von Neumann"]
    title: "Mathematische Grundlagen der Quantenmechanik"
    publication: "Springer"
    year: 1932
    note: "self-adjoint operators on Hilbert space; the term entered physics through this route"
  rieszsznagy1955:
    authors: ["F. Riesz", "B. Sz.-Nagy"]
    title: "Functional Analysis"
    publication: "Frederick Ungar"
    year: 1955
  maclane1971:
    authors: ["Saunders Mac Lane"]
    title: "Categories for the Working Mathematician"
    publication: "Springer"
    year: 1971
    note: "morphisms as the categorical analogue of operators"
  birkhoff1935:
    authors: ["Garrett Birkhoff"]
    title: "On the Structure of Abstract Algebras"
    publication: "Proceedings of the Cambridge Philosophical Society 31"
    year: 1935
    note: "operators as typed symbols of finite arity in universal algebra"
  may1972:
    authors: ["J. Peter May"]
    title: "The Geometry of Iterated Loop Spaces"
    publication: "Springer Lecture Notes in Mathematics 271"
    year: 1972
    note: "operads as parameterised families of operators"
type: term

---

An **operator** is a structured map between mathematical structures, considered as an entity in its own right rather than as a relation between particular elements. Where a [function](function.md) is often introduced by its rule for computing values, an operator is introduced by what it transforms and how it interacts with the structure on its source and target. Studying an operator means studying its action on whole sets, families, or algebras — its spectrum, kernel, image, the way it behaves under composition and limit — not the value it produces at any single point.

## Levels of generality

The term *operator* appears at three connected scales in modern mathematics.

**Functional-analytic.** A linear operator $T: V \to W$ between (often topological) vector spaces is the central object of operator theory and quantum mechanics. The interest is the structure of the spectrum, the kernel and image, and how $T$ behaves under perturbation, composition, and limit. Hilbert and Courant (1924) gave the first systematic treatment; von Neumann (1932) put self-adjoint operators on Hilbert space at the foundation of quantum mechanics; Riesz and Sz.-Nagy (1955) is the canonical textbook reference.

**Categorical.** In category theory, what a concrete setting calls an operator is a [morphism](./morphism.md): an arrow $f: A \to B$ in a category $\mathcal{C}$. The categorical move treats the object's content as exhausted by its morphisms in and out. Mac Lane (1971) is the standard reference. From this vantage, *operator* and *morphism* are nearly interchangeable when the category is concrete; *morphism* generalises to abstract categories whose source and target need not be sets.

**Algebraic / operational.** In universal algebra (Birkhoff 1935) and operad theory (May 1972), an operator is a typed symbol with a fixed arity — given inputs of certain types it produces an output of a certain type — together with equations or higher-arity composition laws that constrain how operators interact. This sense covers the operations of an algebraic theory, the operations of a Lawvere theory, the *n*-ary operations of an operad, and the operators of a typed term-rewriting system.

## What is fixed across the senses

In every sense, an operator has:

- a **source** (or *domain*, or *arity-tuple* of source objects) — what it takes as input;
- a **target** (or *codomain*) — what it produces;
- a **structure-preservation discipline** — the features of the source that carry over to the target (linearity, continuity, equivariance, type-preservation, equational compatibility).

It is the third of these — the structure-preservation discipline — that makes an operator more than a function. A self-map of a vector space that does not preserve linear structure is rarely called an operator; a continuous self-map that does is the canonical case. In the categorical sense the discipline is built into the definition: every morphism preserves the structure of the category it lives in.

## What an operator is not

An operator is not, in general, a *relation*: it is single-valued. Operators sometimes admit *converse* or adjoint counterparts that play the role a relation might — the adjoint $T^*$ of a linear operator on Hilbert space, the converse of a categorical morphism in a dagger category, the converse of a relation expressed as a span — but these are paired with the operator and do not replace it.

An operator is not the *trajectory* of its action: the path traced through a state space under iterated application of an operator is the orbit of a point under the operator, not the operator itself. The operator is the rule; the trajectory is what the rule produces.

## See Also

- [function](function.md) — the broader notion an operator specialises
- [morphism](./morphism.md) — the categorical generalisation
- adjoint — the structural pairing that links many operators to their duals
- operad — the parameterised family in which collections of operators live
