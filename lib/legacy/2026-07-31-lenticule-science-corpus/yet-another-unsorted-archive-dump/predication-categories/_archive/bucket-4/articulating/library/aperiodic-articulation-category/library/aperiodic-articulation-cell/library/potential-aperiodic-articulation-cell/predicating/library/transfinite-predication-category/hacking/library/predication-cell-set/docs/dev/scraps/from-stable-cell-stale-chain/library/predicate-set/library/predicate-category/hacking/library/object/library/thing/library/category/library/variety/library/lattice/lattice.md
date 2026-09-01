---
name: lattice
description: "A partially ordered set in which every pair of elements has a least upper bound (join) and a greatest lower bound (meet). Equivalently, an algebra ⟨L, ∧, ∨⟩ in which both binary operations are commutative, associative, idempotent, and satisfy the absorption laws."
specializing: poset
meeting: lattice
joining: lattice
having-bottom: lattice
having-top: lattice
homomorphizing-as-lattice: lattice
extended-by-pairing: pre-bilattice
references:
  - id: birkhoff1940
    type: book
    title: Lattice Theory
    publisher: American Mathematical Society
    location: Providence
    author:
      - literal: Birkhoff, Garrett
    issued:
      - year: 1940
  - id: davey-priestley2002
    type: book
    title: Introduction to Lattices and Order
    edition: "2"
    publisher: Cambridge University Press
    author:
      - literal: Davey, B. A.
      - literal: Priestley, H. A.
    issued:
      - year: 2002
---

A **lattice** is a structure $\mathbf{L} = \langle L, \wedge, \vee \rangle$ on a carrier $L$ with two binary operations satisfying, for all $a, b, c \in L$:

- $a \wedge b = b \wedge a$ and $a \vee b = b \vee a$ &nbsp;&nbsp; (commutativity),
- $(a \wedge b) \wedge c = a \wedge (b \wedge c)$ and $(a \vee b) \vee c = a \vee (b \vee c)$ &nbsp;&nbsp; (associativity),
- $a \wedge a = a$ and $a \vee a = a$ &nbsp;&nbsp; (idempotence),
- $a \wedge (a \vee b) = a$ and $a \vee (a \wedge b) = a$ &nbsp;&nbsp; (absorption).

The induced partial order is $a \leq b \iff a \wedge b = a \iff a \vee b = b$. Under this order, $a \wedge b$ is the greatest lower bound of $\{a, b\}$ and $a \vee b$ the least upper bound. Existence of all binary meets and joins extends to all finite meets and joins by induction.

A lattice is **bounded** when it has a least element $\bot$ and a greatest element $\top$ with $\bot \wedge a = \bot$ and $\top \vee a = \top$ for every $a \in L$. A lattice is **distributive** when $a \wedge (b \vee c) = (a \wedge b) \vee (a \wedge c)$ holds; equivalently, when it embeds in a product of chains [@birkhoff1940]. A lattice is **complete** when every subset (not just every finite pair) has a meet and a join.

Lattices form an equationally-defined variety [@birkhoff1940] — the class is closed under homomorphic images, subalgebras, and direct products. Adding a second pair of lattice operations on the same carrier (a knowledge meet and join) yields a [pre-bilattice](../pre-bilattice/pre-bilattice.md); adding a unary negation antitone in the truth order yields a [bilattice](../bilattice/bilattice.md). The standard development is [@davey-priestley2002].
