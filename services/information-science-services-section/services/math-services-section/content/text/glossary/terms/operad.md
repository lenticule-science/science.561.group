---
name: "Operad"
aliases:
  - "operad"
  - "operads"
  - "symmetric operad"
  - "non-symmetric operad"
  - "planar operad"
date-created: 2026-08-26
date-modified: 2026-08-26
tags: []
---

An operad is a system of operations with many inputs and one output, closed under plugging one operation's output into another's input. Formally, a symmetric operad $\mathcal O$ in a symmetric [monoidal category](./monoidal-category.md) consists of an object $\mathcal O(n)$ for each $n \geq 0$ — "the operations of arity $n$" — with an action of the symmetric group $S_n$ on $\mathcal O(n)$ permuting inputs, a unit $1 \in \mathcal O(1)$, and composition maps

$$\gamma: \mathcal O(k) \otimes \mathcal O(n_1) \otimes \cdots \otimes \mathcal O(n_k) \to \mathcal O(n_1 + \cdots + n_k)$$

that plug the outputs of $k$ sub-operations into the $k$ inputs of an outer operation. These must satisfy associativity (nested composition is unambiguous), unit (composing with $1$ does nothing), and equivariance (composition is compatible with the $S_n$-actions) axioms.

An *algebra* over $\mathcal O$ is an object $A$ with maps $\mathcal O(n) \to \mathrm{Hom}(A^{\otimes n}, A)$ compatible with composition — an interpretation of every abstract $n$-ary operation as an actual $n$-ary operation on $A$. This is what makes operads useful: rather than axiomatizing "an associative algebra" or "a commutative algebra" one structure at a time, the associative operad $\mathrm{Assoc}$ and commutative operad $\mathrm{Com}$ package the respective axioms once, and algebras over them are, respectively, associative and commutative algebras. The Lie operad, the little-disks operads $E_n$, and countless others follow the same pattern.

Operadic composition is naturally drawn as grafting of rooted [trees](./tree.md): an operation of arity $n$ is a corolla with $n$ labeled leaves and one root, and $\gamma$ grafts the roots of $k$ trees onto the $k$ leaves of another. This tree picture is made precise by the [operadic nerve](./operadic-nerve.md), which presents an operad as a presheaf on a category of trees, generalizing the way an ordinary [category](./category.md) is presented by its [nerve](./nerve.md) as a presheaf on the category of ordinals.

Operads were introduced by J. Peter May in *The Geometry of Iterated Loop Spaces* (1972), with an equivalent formalism (PROPs restricted to one output) due to Boardman and Vogt. A symmetric sequence $(\mathcal O(n))_{n \geq 0}$ with $S_n$-actions can itself be organized into a [monoidal category](./monoidal-category.md) under the composition product, and an operad is precisely a monoid object in that category — the operadic analogue of how a [monoidal category](./monoidal-category.md) is the natural home for monoid objects generally.

Dropping the $S_n$-action requirement gives a **non-symmetric** (or **planar**) **operad**: the same arities, unit, and composition maps $\gamma$, but with inputs treated as an ordered list rather than a set acted on by permutations — algebras over a non-symmetric operad have operations that care about the left-to-right order of their arguments but need not be invariant under permuting them. The corolla for an arity-$n$ operation is then drawn with its $n$ leaves in a fixed left-to-right order (a *planar* tree), rather than merely labeled. This is not a minor variant: several structural results — including the [Dold–Kan-type normalization](./dold-kan-correspondence.md) of the [operadic nerve](./operadic-nerve.md) into an honest chain-complex-like object — are currently established only for non-symmetric operads, and are open questions when an $S_n$-action is added back in.
