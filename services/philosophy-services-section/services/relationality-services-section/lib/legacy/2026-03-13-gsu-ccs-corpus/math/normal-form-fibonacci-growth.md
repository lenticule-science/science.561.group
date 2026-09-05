---
id: normal-form-fibonacci-growth
name: NormalFormFibonacciGrowth
description: "the number of distinct doubly-stable normal forms at depth n of the tower grows as the nth Fibonacci number."
---

### Conjecture — Normal Form Fibonacci Growth {#normal-form-fibonacci-growth}

**Statement.** Let $F_n$ denote the $n$-th Fibonacci number. The number of distinct doubly-stable normal forms (elements of $H^*$) at tower depth $n$ is exactly $F_{n+1}$:
$$
\bigl|\mathrm{NF}_n \cap H^*\bigr| \;=\; F_{n+1}.
$$
More precisely: at depth $n$, there are exactly $F_{n+1}$ normal forms in FiberNuclearLanguage that are fixed by both $\sigma$ and $\Delta$ under the context equations of the depth-$n$ covering family.

**Motivation.** The normalization proof (§strong-normalization) uses the entanglement measure $\mathsf{ent}$ as a termination measure. The measure obeys a recurrence $\mathsf{ent}(\mathsf{Saturate}(\mathsf{Transfer}(M))) = \mathsf{ent}(M) + \mathsf{kc}(M) + 2$ where $\mathsf{kc}(M)$ is the Trans-count. This is not arbitrary — it is the structure $a(n) = a(n-1) + a(n-2)$ in disguise: entanglement at $\mathsf{Saturate}(\mathsf{Transfer}(M))$ depends on $M$'s entanglement and $M$'s Trans-count, two separate quantities from two separate levels of nesting.

The nuclear Fibonacci recurrence (§nuclear-fibonacci-recurrence) already establishes that fiber dimensions $d_n = \dim H^{(n)*}$ grow as Fibonacci numbers. This conjecture sharpens that result by identifying the exact count with $F_{n+1}$ and explaining the Fibonacci structure as a consequence of the normalization proof's inductive structure.

**Consequence.** If proved, this provides a direct bridge from the normalization proof (a termination argument about rewriting) to the golden ratio criterion: the growth rate of how many things terminate at each depth is literally $\varphi = (1+\sqrt{5})/2$. The Hurwitz-Zeno conjecture (§hurwitz-zeno-conjecture) would then be a corollary of the normalization proof's depth structure.

**What a proof requires.**

1. An explicit enumeration of doubly-stable normal forms at depths 1, 2, 3 (yielding 1, 2, 3) to establish the base cases.

2. An inductive step: show that the new doubly-stable normal forms at depth $n$ exactly consist of those at depth $n-1$ plus the forms at depth $n-2$ that acquire a new $\mathsf{Transfer}(\mathsf{False})$ witness at depth $n$. This is the combinatorial content of the Fibonacci recurrence.

3. Connection to the golden hyperverse criterion (§golden-hyperverse-criterion): relate the growth rate to the fixed-point condition.

**Depends on:** §strong-normalization, §modal-weight-duality, §golden-hyperverse-criterion, §nuclear-fibonacci-recurrence.
