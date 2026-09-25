---
name: specializing
description: A predicate whose cells record predicate-specialization morphisms — which transformer is a sub-predicate of another.
title: specializing
---

One of the four generator classes of the predicate category $\mathcal{C}$.
A cell $(q, \texttt{specializing}, p)$ at $\mathbf{t}$ asserts a specialization morphism $f : q \to p$ in $\mathcal{C}$: $q$ is a sub-predicate of $p$, given by a sub-support inclusion $\iota_f : \mathrm{dom}(q) \hookrightarrow \mathrm{dom}(p)$.

The induced fiber-algebra reindexing $f^* : A_p \to A_q$ restricts values to $\mathrm{dom}(q)$, assigning $\mathbf{\bot}$ outside it: $f^*(v)(s, o) = v(s, o)$ if $(s, o) \in \mathrm{dom}(q)$, else $\mathbf{\bot}$.

This relation is transitive (sub-support inclusions compose) and acyclic (a cycle collapses the distinction between predicates).
Every transformer specializes itself via the identity inclusion.

By the predicate-generator-exhaustiveness theorem, specializing and three other generators exhaust all natural bottom-preserving bilattice homomorphisms between predication fiber algebras (under $\mathrm{Sym}(E)$-equivariance with $|E| \geq 3$).
