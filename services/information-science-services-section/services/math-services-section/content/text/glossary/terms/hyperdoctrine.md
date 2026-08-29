---

introduces: semantic-framework
description: "A functor from a base category of contexts to a fiber category of propositions, formalizing how predicates vary over contexts — Lawvere's categorical model of predicate logic."
defines: hyperdoctrine
aliases: [hyperdoctrines]
specialization: functor
structure: "P: C^op → Lat"
base-category: contexts
fiber-category: propositions
reindexing: substitution
left-adjoint-on-fibers: existential-quantification
right-adjoint-on-fibers: universal-quantification
adjunction-on-fibers: "∃ ⊣ ∀"
classical-fibers: boolean-algebra
intuitionistic-fibers: heyting-algebra
bilattice-fibers: bilattice
bilattice-instance: predicate-fiber
generalized-by: maruyama-2021
introduced-by: [lawvere-1969, lawvere-1970]
date-created: 2026-03-30
type: term

---

A hyperdoctrine (Lawvere 1969, 1970) is a [functor](./functor.md) from a base [category](./category.md) of contexts to a fiber category of propositions:

$$P: \mathcal{C}^{\mathrm{op}} \to \mathbf{Lat}$$

For each context $c$ in $\mathcal{C}$, the fiber $P(c)$ is a lattice of propositions that can be stated in context $c$. For each morphism $f: c \to d$ (a substitution or change of context), the reindexing map $P(f): P(d) \to P(c)$ pulls back propositions from context $d$ to context $c$.

The reindexing maps have [adjoint pairs](./adjoint-pair.md): left adjoints $\exists_f$ (existential quantification along $f$) and right adjoints $\forall_f$ (universal quantification along $f$):

$$\exists_f \dashv f^* \dashv \forall_f$$

$\exists_f$ extends a predicate to a larger context by asserting existence. $\forall_f$ restricts a predicate to where it holds universally. This is Lawvere's insight: the logical quantifiers $\exists$ and $\forall$ are not primitive connectives but adjoint functors.

In classical logic, the fibers $P(c)$ are Boolean algebras. In intuitionistic logic, Heyting algebras. In bilattice-valued logic, the fibers are distributive [bilattices](./bilattice.md) — giving a bilattice-valued hyperdoctrine where each predicate generates a fiber carrying the full bilattice algebra.

Maruyama (2021) generalized the framework to fibered algebraic semantics for non-classical logics: any non-classical logic with an algebraic semantics can be fibered over a base category. The bilattice-valued fiber functor is an instance of Maruyama's framework for the specific case of the four-valued bilattice over predicate-structured data.
