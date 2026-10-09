---

introduces: semantic-framework
description: "A dual equivalence between distributive lattices and ordered compact topological spaces (Priestley spaces), giving every lattice a geometric dual."
aliases: [Priestley duality, Priestley space]
specialization: stone-duality
dual-of: distributive-lattice
dual-objects: priestley-space
bilattice-dual: "disjoint union of component duals"
four-valued-dual: "discrete two-point space with negation swap"
bilattice-with-negation: jung-rivieccio-2012
two-sorted-refinement: rivieccio-jung-2021
introduced-by: priestley-1970
bilattice-case: mobasher-pigozzi-slutzki-voutsadakis-2000
date-created: 2026-03-30
---

Priestley duality (Priestley 1970) is a dual equivalence between the category of bounded distributive [lattices](../../order/terms/lattice.md) and the category of **Priestley spaces** — compact topological spaces equipped with a compatible partial order.

Every bounded distributive lattice $L$ has a Priestley dual: the space of prime filters of $L$, topologized and ordered. Every Priestley space determines a lattice (its clopen upsets). These constructions are inverse to each other up to isomorphism.

The duality gives every lattice a geometric dual. Algebraic properties of the lattice translate to topological properties of the space and vice versa.

For [bilattices](../../algebra/terms/bilattice.md): the Priestley dual of a distributive bilattice is the coproduct (disjoint union) of the Priestley duals of its two lattice components (Mobasher, Pigozzi, Slutzki, & Voutsadakis 2000). For the four-valued bilattice $\mathbf{2} \otimes \mathbf{2}$, both components are the two-element chain, whose dual is a single point. The Priestley dual of $\mathbf{2} \otimes \mathbf{2}$ is a discrete two-point space.

Jung & Rivieccio (2012) refined the dual for bilattices with negation: the dual space carries an order-reversing homeomorphism encoding negation as a topological involution. The two points are connected by the negation swap.
