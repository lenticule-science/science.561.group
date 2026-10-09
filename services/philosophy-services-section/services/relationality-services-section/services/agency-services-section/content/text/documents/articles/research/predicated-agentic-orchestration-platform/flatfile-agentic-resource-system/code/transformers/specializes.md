---
source: [predicate]
target: [predicate]
name: specializes
description: "The morphism of the substrate's predicate category whose cells record that one atom is a more-concrete instance of another."
type: predicate-definition
title: "specializes: predicate-specialization morphism"
status: draft
specializes: predication-cell
depends-on:
  - predicate-category
  - predication-fiber-algebra
realizes:
  - predicate-specialization
---


The morphism of the substrate's predicate category whose cells record that one atom is a more-concrete instance of another.
`specializes` IS the **predicate-specialization morphism** — one of the four predicate-category generators (the others being converse, subject-projection, and object-projection) which together exhaust the natural bilattice homomorphisms between fiber algebras per the predicate-generator-exhaustiveness theorem.

## Cell shape

$$(s, \texttt{specializes}, t)$$

where $s$ and $t$ are both substrate atoms.
The cell asserts that $s$ is a more-concrete instance of $t$ — equivalently, that there is a specialization morphism $\iota_f : \mathrm{dom}(s) \hookrightarrow \mathrm{dom}(t)$ in the predicate category.

## Value domain

Bilattice $\mathbf{FOUR}$:

- $\mathbf{t}$ — substrate confirms $s$ specializes $t$.
- $\mathbf{f}$ — substrate confirms $s$ does not specialize $t$.
- $\bot$ — relation unrecorded.
- $\top$ — contested.

## Factorization

This cell IS the predicate-specialization-generator instance.
Per the predicate-generator-exhaustiveness theorem in predication-categories, every natural bilattice homomorphism between fiber algebras factors through the four generators; `specializes` is the first.

The categorical structure: a `specializes`-cell $(s, \texttt{specializes}, t)$ induces a reindexing functor $f^* : \mathcal{E}_t \to \mathcal{E}_s$ between fiber algebras at $t$ and $s$, preserving the bilattice operations $\wedge_t, \vee_t, \wedge_k, \vee_k$, negation $\sim$, twist-product fusion $\odot$, and right residual $\Rightarrow$ pointwise.

## Constraints

**Transitivity.** If $s$ specializes $t$ at $\mathbf{t}$ and $t$ specializes $u$ at $\mathbf{t}$, the closure rule emits $s$ specializes $u$ at $\mathbf{t}$.

**No cycles.** A cycle in `specializes`-edges is a diagnostic — emit a cycle warning.
Specialization forms a DAG over substrate atoms.

## Self-application

This atom's own `specializes:` cell is $(\text{this-atom}, \texttt{specializes}, \text{predication-cell})$ at $\mathbf{t}$.
The predicate self-applies: `specializes` is itself a specialization of the abstract `predication-cell` concept from the math chapter.

## Overloaded keys in the current corpus

`realizes`, `formalizes-as`, and similar keys in the corpus's current usage are (in many cases) attempting to express specialization, but `realizes:` in particular is polymorphic across at least four distinct mathematical relations (theory-morphism, operates-on, instance-of, application-domain) and cannot be aggregated under one predicate name without losing information.
Disambiguation is downstream work, after the catalog stabilizes.

## Used in slug resolution

The slug-resolution algorithm walks `specializes`-chains in `_index.md` files to traverse from a theory to its ancestor theories.
A theory's `_index.md` frontmatter declares specialization edges; resolution follows them.

## Position in the self-typing bootstrap

`specializes` is one of three predicates in the substrate's self-typing bootstrap core, alongside `has-type` and `has-slug`.
These three are substrate-circular: every other predicate in the catalog cites them.

## Forced by

The predicate-generator-exhaustiveness theorem: the four generators (specialization, converse, subject-projection, object-projection) exhaustively generate every natural bilattice homomorphism between fiber algebras under $\mathrm{Sym}(E)$-equivariance with $|E| \geq 3$.
`specializes` is the substrate-resident realization of the first generator.
