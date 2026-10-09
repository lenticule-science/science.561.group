---
name: conversing
description: A predicate whose cells record predicate-converse morphisms — which transformer is the relational converse of another.
title: conversing
---

One of the four generator classes of the predicate category $\mathcal{C}$.
A cell $(p^c, \texttt{conversing}, p)$ at $\mathbf{t}$ asserts a converse morphism $f : p^c \to p$ in $\mathcal{C}$: $p^c$ is the relational converse of $p$, induced by the swap of the entity-pair index $(s, o) \mapsto (o, s)$.

The induced fiber-algebra reindexing $f^* : A_p \to A_{p^c}$ acts by $f^*(v)(s, o) = v(o, s)$.
The converse of $p$ holds at $(s, o)$ exactly where $p$ holds at $(o, s)$.

This relation is involutive: conversing a converse returns the original predicate.
A transformer $p$ for which $(p, \texttt{conversing}, p)$ is at $\mathbf{t}$ is a symmetric predicate — its fiber algebra is invariant under coordinate swap.

By the predicate-generator-exhaustiveness theorem, conversing and three other generators exhaust all natural bottom-preserving bilattice homomorphisms between predication fiber algebras (under $\mathrm{Sym}(E)$-equivariance with $|E| \geq 3$).
Conversing corresponds to the index map class $g : (s, o) \mapsto (o, s)$ on the full support $E \times E$.
