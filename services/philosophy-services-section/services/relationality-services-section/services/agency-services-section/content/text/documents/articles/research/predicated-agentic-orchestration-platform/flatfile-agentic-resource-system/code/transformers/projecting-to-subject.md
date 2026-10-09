---
name: projecting-to-subject
description: A predicate whose cells record predicate-subject-projection morphisms — which transformer is derived from another by collapsing the object coordinate to the subject diagonal.
title: projecting-to-subject
---

One of the four generator classes of the predicate category $\mathcal{C}$.
A cell $(q, \texttt{projecting-to-subject}, p)$ at $\mathbf{t}$ asserts a subject-projection morphism $f : q \to p$ in $\mathcal{C}$: $q$ is derived from $p$ by collapsing the entity-pair index to the subject diagonal, $(s, o) \mapsto (s, s)$.

The induced fiber-algebra reindexing $f^* : A_p \to A_q$ acts by $f^*(v)(s, o) = v(s, s)$.
The subject-projection of $p$ broadcasts $p$'s subject-diagonal content across all object coordinates — the value of $q$ at $(s, o)$ depends only on $p$'s value at $(s, s)$, regardless of $o$.
Such predicates are unary in effect: they describe properties of the subject alone.

Idempotent: applying subject-projection twice is isomorphic to applying it once.

By the predicate-generator-exhaustiveness theorem, projecting-to-subject and three other generators exhaust all natural bottom-preserving bilattice homomorphisms between predication fiber algebras (under $\mathrm{Sym}(E)$-equivariance with $|E| \geq 3$).
This generator corresponds to the index map class $g : (s, o) \mapsto (s, s)$.
