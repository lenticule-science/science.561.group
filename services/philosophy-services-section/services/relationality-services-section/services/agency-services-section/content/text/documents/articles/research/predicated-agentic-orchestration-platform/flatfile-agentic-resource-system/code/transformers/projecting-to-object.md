---
name: projecting-to-object
description: A predicate whose cells record predicate-object-projection morphisms — which transformer is derived from another by collapsing the subject coordinate to the object diagonal.
title: projecting-to-object
---

One of the four generator classes of the predicate category $\mathcal{C}$.
A cell $(q, \texttt{projecting-to-object}, p)$ at $\mathbf{t}$ asserts an object-projection morphism $f : q \to p$ in $\mathcal{C}$: $q$ is derived from $p$ by collapsing the entity-pair index to the object diagonal, $(s, o) \mapsto (o, o)$.

The induced fiber-algebra reindexing $f^* : A_p \to A_q$ acts by $f^*(v)(s, o) = v(o, o)$.
The object-projection of $p$ broadcasts $p$'s object-diagonal content across all subject coordinates — the value of $q$ at $(s, o)$ depends only on $p$'s value at $(o, o)$, regardless of $s$.
Such predicates are unary in effect: they describe properties of the object alone.

Idempotent: applying object-projection twice is isomorphic to applying it once.
The dual of [projecting-to-subject](projecting-to-subject.md) under the coordinate swap induced by [conversing](conversing.md).

By the predicate-generator-exhaustiveness theorem, projecting-to-object and three other generators exhaust all natural bottom-preserving bilattice homomorphisms between predication fiber algebras (under $\mathrm{Sym}(E)$-equivariance with $|E| \geq 3$).
This generator corresponds to the index map class $g : (s, o) \mapsto (o, o)$.
