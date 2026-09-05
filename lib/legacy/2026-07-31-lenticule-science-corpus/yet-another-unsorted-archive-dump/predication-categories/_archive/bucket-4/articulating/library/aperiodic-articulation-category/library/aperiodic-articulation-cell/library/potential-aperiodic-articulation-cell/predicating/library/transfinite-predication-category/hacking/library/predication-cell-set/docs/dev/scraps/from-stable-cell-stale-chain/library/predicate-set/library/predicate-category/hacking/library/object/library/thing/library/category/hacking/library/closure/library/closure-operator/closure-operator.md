---
name: closure operator
description: A family of maps cl = (cl_p)_p on each predication-fiber-algebra A_p, satisfying monotonicity in the knowledge-order, inflationarity, idempotence, and naturality in the predicate-category. The closure cl_p(v) is the consequence closure of a valuation v under the inference rules encoded in cl.
---

A **closure operator** on the [predication-fiber-functor](predication-fiber-functor.md) $F : \mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}(\mathbf{L})$ is a family of maps $\mathrm{cl} = (\mathrm{cl}_p)_{p \in \mathcal{C}}$ with $\mathrm{cl}_p : A_p \to A_p$ on each [predication-fiber-algebra](../structures/predication-fiber-algebra.md) such that:

1. **Monotone in $\leq_k$:** $v \leq_k v' \Rightarrow \mathrm{cl}_p(v) \leq_k \mathrm{cl}_p(v')$ in the knowledge order.
2. **Inflationary:** $v \leq_k \mathrm{cl}_p(v)$.
3. **Idempotent:** $\mathrm{cl}_p \circ \mathrm{cl}_p = \mathrm{cl}_p$.
4. **Natural in $\mathcal{C}$:** for every morphism $f : q \to p$ in the [predicate-category](../structures/predicate-category.md) $\mathcal{C}$,
$$f^* \circ \mathrm{cl}_p = \mathrm{cl}_q \circ f^*.$$

Conditions (1)–(3) are the classical lattice-theoretic closure axioms; (4) is the additional content imposed by the family structure — closures at distinct predicates are coherent under reindexing.

The closure $\mathrm{cl}_p(v)$ is the *consequence closure* of the valuation $v$ under the inference rules encoded in $\mathrm{cl}$. A closure operator can be specified syntactically by a closure-rule system — a finite or countable family of positive $\Pi_1$-schemas. The generated closure operator is the least operator satisfying every rule consequent whenever the corresponding antecedent holds.
