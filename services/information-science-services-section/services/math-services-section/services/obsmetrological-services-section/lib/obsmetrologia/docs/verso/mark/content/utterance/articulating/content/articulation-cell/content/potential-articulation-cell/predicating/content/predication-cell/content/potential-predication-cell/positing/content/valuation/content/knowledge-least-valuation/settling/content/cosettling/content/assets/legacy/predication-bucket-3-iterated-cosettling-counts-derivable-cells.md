---
kind: theorem
status: proved
depends-on: [cosettling, closure-operator, closure-2-monad]
---

# Iterated cosettling counts derivable cells

For a strict-regime closure operator with seed-derived target $w$, the iterated cosettling has size $2^{|w| - |\mathrm{seed}|}$ — one element per subset of the derivable cells.

## Statement

**Theorem.** *Let $T$ be a strict-regime closure operator with rule set $R$ on a finite cell set. Let $\mathrm{seed} \subseteq w$ be a minimal subset such that no rule in $R$ produces any cell of $\mathrm{seed}$ (cells with no incoming rule), and suppose $T^*(\mathrm{seed}) = w$ (closure from the seed reaches $w$). Then*

$$T^{*-1}(w) \;=\; \{\, v \,:\, \mathrm{seed} \subseteq v \subseteq w\,\},$$

*and consequently*

$$|T^{*-1}(w)| \;=\; 2^{|w \setminus \mathrm{seed}|}.$$

## Proof

**$(\subseteq)$.** Let $v \in T^{*-1}(w)$, so $T^k(v) = w$ for some $k \geq 0$. By inflation $v \subseteq T^k(v) = w$. For the lower bound: cells of $\mathrm{seed}$ have no incoming rule, so they cannot be produced by any closure step. If a cell $s \in \mathrm{seed}$ were absent from $v$, then $s \notin T^k(v)$ for any $k$, contradicting $T^k(v) = w \supseteq \mathrm{seed}$. Hence $\mathrm{seed} \subseteq v$.

**$(\supseteq)$.** Let $v$ with $\mathrm{seed} \subseteq v \subseteq w$. By monotonicity of $T$, $T^*(v) \supseteq T^*(\mathrm{seed}) = w$. By inflation $T^*(v) \subseteq T^*(w)$. Since $w$ is closure-stable, $T^*(w) = w$. So $T^*(v) = w$, and $v \in T^{*-1}(w)$.

**Counting.** $\{v : \mathrm{seed} \subseteq v \subseteq w\}$ is in bijection with $\mathcal{P}(w \setminus \mathrm{seed})$. $\square$

## Empirical verification

The [cosettling enumerator](../tools/cosettling-enumerator/) computes $T^{*-1}(w)$ on benchmark rule systems. All recorded cases match $2^{|w \setminus \mathrm{seed}|}$:

| Benchmark | $|w|$ | $|\mathrm{seed}|$ | $|T^{*-1}(w)|$ | $2^{|w|-|\mathrm{seed}|}$ |
|---|---|---|---|---|
| theorem-3-stage | 3 | 1 | 4 | 4 |
| parallel-firing-2 | 3 | 1 | 4 | 4 |
| parallel-firing-3 | 4 | 1 | 8 | 8 |
| diamond | 4 | 1 | 8 | 8 |
| conjunctive-firing | 4 | 1 | 8 | 8 |
| linear-chain-5 | 5 | 1 | 16 | 16 |
| fan-out-fan-in | 5 | 1 | 16 | 16 |

The match is exact, with no exceptions across the seven structurally-distinct rule systems.

## Alternative proof via Moore-family fixed-points

The same result is proved lattice-theoretically in [iterated-cosettling via Moore-family fixed-points](iterated-cosettling-via-moore-family.md). That path identifies $T^{*-1}(w)$ as the closure-equivalence class in the Moore-family Galois connection $T \dashv \iota : \mathrm{Fix}(T) \hookrightarrow \mathcal{P}(C)$, an interval $[\mathrm{generators}(w), w]$. The Moore-family proof generalizes cleanly beyond the strict regime to any closure operator on a complete lattice.

## Position in the program

A clean structural fact about the iterated cosettling: the closure-equivalence class of $w$ under $T$ has size determined entirely by the count of derivable (non-seed) cells. The result tells us iteration does not introduce any subtlety beyond "must contain the seed, may freely contain any subset of derivables."

This contrasts sharply with the *single-step* cosettling $T^{-1}(w)$, whose size depends in a non-trivial way on the rule-dependency structure (see [forward trajectory inside the cosettling](backward-closure-recovers-forward-trajectory.md) and the open [off-trajectory pre-image classification](#open-the-single-step-classification) below).

## Open: the single-step classification

The single-step $T^{-1}(w) \subseteq T^{*-1}(w)$ inclusion is generically strict and structurally non-uniform. Enumerator data:

| Benchmark | $|T^{-1}(w)|$ | $|T^{*-1}(w)|$ |
|---|---|---|
| theorem-3-stage (linear) | 3 | 4 |
| parallel-firing-2 | 4 | 4 |
| parallel-firing-3 | 8 | 8 |
| diamond | 7 | 8 |
| conjunctive-firing | 5 | 8 |
| linear-chain-5 | 8 | 16 |
| fan-out-fan-in | 9 | 16 |

Patterns visible from the data:

- *Pure parallel last-step firings* (no chained dependencies): $|T^{-1}(w)| = 2^{k}$ where $k$ is the number of parallel-fired cells (parallel-firing-2, parallel-firing-3).
- *Diamond structures* (multiple paths to a final cell): $|T^{-1}|$ = $2^{k} - 1$ where the $-1$ corresponds to the seed-only state, which fails to produce the final cell in one step.
- *Conjunctive bottlenecks* (a rule requires multiple antecedents): $|T^{-1}|$ shrinks substantially.
- *Linear chains*: $|T^{-1}|$ has an irregular formula depending on chain length.

The right combinatorial framework appears to be the **closure-cover hypergraph** $H_w$:

- *Vertices*: cells of $w$.
- *Hyperedges*: pairs $(c, A)$ where $c \in w$ and $A = \mathrm{antec}(r)$ for some rule $r \in R$ with $c \in \mathrm{conseq}(r)$.

A subset $v \subseteq w$ is in $T^{-1}(w)$ iff $\mathrm{seed} \subseteq v$ and for every $c \in w \setminus v$, some hyperedge $(c, A)$ has $A \subseteq v$. This is a **closure-cover** of $H_w$: every vertex is either in $v$ or has its antecedents in $v$.

Counting closure-covers is a combinatorial problem with structure depending on the hyperedge lattice. Specific sub-questions:

1. *Closed-form count for tree-shaped rule dependencies.* For rule systems where $H_w$ has a tree structure (each cell has a unique producing rule), $|T^{-1}(w)|$ should admit a recursive product formula.
2. *Lattice structure of the closure-cover poset.* $T^{-1}(w)$ is a join-semilattice (closed under union, per [cosettling object](../objects/cosettling.md)). Its full poset structure as a closure-cover collection is open.
3. *Asymptotic scaling.* For rule systems with $n$ cells and $m$ rules, what is the typical $|T^{-1}(w)| / 2^n$ as $n \to \infty$?
