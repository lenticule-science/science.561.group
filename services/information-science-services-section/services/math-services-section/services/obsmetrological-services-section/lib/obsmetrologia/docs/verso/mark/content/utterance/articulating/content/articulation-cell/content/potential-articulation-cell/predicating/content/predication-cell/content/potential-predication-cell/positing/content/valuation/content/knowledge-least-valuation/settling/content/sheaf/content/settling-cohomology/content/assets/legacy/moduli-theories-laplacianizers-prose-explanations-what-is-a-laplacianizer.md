---
type: narrative
class: explanation
discusses: [laplacianizer, laplacianizability, hodge-laplacian]
see-also:
  - ../teaching/explanations/laplacianizer.md
  - ../teaching/explanations/laplacianizability.md
  - ../../_index.md
status: draft
---

# What is a Laplacianizer?

An orientation piece for a reader walking into this corpus without prior context. The full formal definition lives at [`concepts/laplacianizer.md`](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/laplacianizer.md); this is the version you read first, to know what you are looking at.

## The one-sentence version

A **Laplacianizer** is the package of data that turns a cohomology theory into a Laplace operator: a functor sending objects to Hilbert chain complexes, a differential, and a natural isomorphism witnessing that the Hilbert homology agrees with the cohomology you started from.

## What it is built out of

Given a category $\mathcal C$ (graphs, cell complexes, manifolds, persistence modules, …) and a cohomology theory $H^\bullet$ on it (cellular, de Rham, sheaf, persistent, …), a Laplacianizer is a triple

$$\mathfrak L = (F, d, \eta)$$

with three pieces:

- $F: \mathcal C \to \mathbf{Hilb}^{\mathbb Z}$ — assigns each object a graded *Hilbert* space. The inner products are part of the data, not an afterthought.
- $d$ — a degree-$(-1)$ natural differential with $d^2 = 0$. Makes $F(X)$ into a chain complex for every $X$.
- $\eta: H^\bullet \xrightarrow{\sim} H_\bullet(F, d)$ — a natural isomorphism. Pins the Hilbert homology to the cohomology theory you wanted to compute.

From this triple the **Hodge Laplacian** $\Delta = dd^* + d^*d$ falls out for free: $d^*$ is forced by the inner product, and Hodge gives $\ker \Delta \cong H^\bullet$.

## Why this is the right unit

The word "Laplacian" by itself names an *operator*. But operators don't exist in a vacuum — a Laplacian is determined the moment you fix a Hilbert chain complex. The non-trivial structure is *which* chain complex, *which* inner product, and *whose* cohomology it computes. Conflating those three with the operator hides the actual choices being made.

The Laplacianizer is the smallest object that exposes all three. Concretely:

- Different inner products on the same chain complex give different operators with different spectra but the *same* kernel (up to the iso $\eta$).
- Different chain models of the same cohomology can yield Laplacians that look unrelated as operators but are equivalent as Laplacianizers (related by chain isomorphism intertwining $d$).
- A "new Laplacian construction" in the wild is almost always a new Laplacianizer — sometimes including a new (often implicit) choice of cohomology theory $H^\bullet$. See [`concepts/laplacianizability.md`](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/laplacianizability.md) for the hypergraph example, where the disputed object is $H^\bullet$ itself.

So when we want to compare constructions, classify them, or ask "is this the same Laplacian as that one?", the right unit of comparison is $(F, d, \eta)$, not $\Delta$.

## Laplacianizers are not unique — and that is the subject

For a fixed $(\mathcal C, H^\bullet)$, many Laplacianizers exist. They differ in the choice of inner product, in the choice of chain model, and (sometimes) in subtler categorical data. The collection of all of them, modulo natural isomorphism, is the **moduli of Laplacianizers** — and *that* is what this corpus studies.

The headline structural result is that this moduli is not a featureless set. It is a stratified orbifold, with strata indexed by eigenvalue-multiplicity invariants of $\Delta$ (the *bipartite multipartitions* — see [`prose/teaching/explanations/the-bipartite-multipartition-lattice.md`](teaching/explanations/the-bipartite-multipartition-lattice.md)), and a second stratification at the SPD-cone boundary by Hilbert-degeneracy invariants (see [`prose/teaching/explanations/the-dual-stratification.md`](teaching/explanations/the-dual-stratification.md)). The shape is universal across cellular, smooth Riemannian, and noncommutative cases — see the synthesis in [`_index.md`](../../_index.md).

## What a Laplacianizer is not

- **Not an operator.** $\Delta$ is a derived invariant. The Laplacianizer is the data that determines $\Delta$, not $\Delta$ itself.
- **Not a chain complex.** A chain complex is part of the data, but only part — the inner products and the iso $\eta$ are essential.
- **Not a Hilbert lift on a single object.** A Laplacianizer is a *family*, functorial across $\mathcal C$. Per-object data is what you get by restricting.
- **Not unique.** Existence is one question (Laplacianizability); uniqueness is another, and the answer is "no, generically — the non-uniqueness has structure".

## When you will reach for the word

Use *Laplacianizer* when you want to talk about the object whose moduli is the subject of study. Use *Hilbert lift* when you want to emphasize the act of constructing one (does $(\mathcal C, H^\bullet)$ admit one at all?). Use *Hodge Laplacian* when you want to talk about the operator that comes out the other end. They are three views of the same situation; this corpus settles on "Laplacianizer" because the moduli view is the productive one.

## Where to go next

- [`concepts/laplacianizer.md`](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/laplacianizer.md) — formal definition, decomposition into per-object data, and worked examples (cellular, Riemannian, Einstein, persistent, graph).
- [`concepts/laplacianizability.md`](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/laplacianizability.md) — the property of admitting one, and why it is non-trivial.
- [`concepts/hodge-laplacian.md`](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/hodge-laplacian.md) — the derived operator.
- [`_index.md`](../../_index.md) — what is proved, what is sketched, and how the cellular / smooth / noncommutative / nonlinear cases fit together.
