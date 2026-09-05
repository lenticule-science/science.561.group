---

introduces: algebraic-structure
description: "A set with two lattice orderings (truth and knowledge), plus negation and conflation involutions, interacting via interlacing conditions."
aliases: [bilattices]
specialization: lattice
made-of: [truth-lattice, knowledge-lattice, negation, conflation]
operations: [truth-meet, truth-join, knowledge-meet, knowledge-join, negation, conflation]
laws: [interlacing]
variants: [distributive-bilattice, interlaced-bilattice, bounded-bilattice]
produced-by: twist-product
symmetry-group: klein-four-group
canonical-example: "{⊥, t, f, ⊤}"
free-on: one-generator
values: [epistemic-state]
has-residuation: residuated-lattice
introduced-by: ginsberg-1988
developed-by: [fitting-1991, fitting-2002]
motivated-by: belnap-1977
dual: priestley-duality
modal-logic: modal-logic
linear-logic-via: chu-space
date-created: 2026-03-30
---

A bilattice is a set $L$ equipped with two bounded [lattice](../../order/terms/lattice.md) structures:

- A **truth lattice** $(L, \wedge_t, \vee_t, f, t)$ with bottom $f$ and top $t$
- A **knowledge lattice** $(L, \wedge_k, \vee_k, \bot, \top)$ with bottom $\bot$ and top $\top$

together with two involutions:

- **Negation** $\sim$: reverses the truth ordering, preserves the knowledge ordering
- **Conflation** $-$: preserves the truth ordering, reverses the knowledge ordering

Ginsberg (1988) introduced bilattices for AI reasoning. Fitting (1991, 2002) developed their theory. The canonical example is the four-valued bilattice $\{\bot, t, f, \top\}$ defined by Belnap (1977) for reasoning under incomplete and contradictory information. Fitting (2002) proved this is the free bounded distributive bilattice on one generator.

A bilattice is **distributive** if both lattice structures are distributive and the **interlacing conditions** hold: each of the four operations ($\wedge_t, \vee_t, \wedge_k, \vee_k$) is monotone with respect to both orderings. A bilattice is **interlaced** if all four operations are monotone with respect to both orderings.

The four-valued bilattice is isomorphic to the [twist product](./twist-product.md) $\mathbf{2} \otimes \mathbf{2}$ of the two-element Boolean algebra with itself (Kalman 1958, Fitting 1991). In this representation, each value is a pair $(a, b) \in \{0,1\}^2$: $\bot = (0,0)$, $t = (1,0)$, $f = (0,1)$, $\top = (1,1)$. The first component tracks positive evidence; the second tracks negative evidence.

Negation and conflation together generate $\mathbb{Z}_2 \times \mathbb{Z}_2$ (the Klein four-group), the symmetry group of the bilattice viewed as a square.

The bilattice carries a [residuated lattice](./residuated-lattice.md) structure via the Busaniche-Cignoli (2014) operations on the twist product.
