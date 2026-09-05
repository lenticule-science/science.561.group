---
type: theorem
status: sketch
depends-on: [iterated-cosettling-counts-derivable-cells, cosettling, closure-operator, closure-2-monad]
---

# Single-step cosettling via closure-cover hypergraph

The single-step cosettling $T^{-1}(w)$ — the set of subsets $v$ from which one application of $T$ produces $w$ — is generically smaller and more structurally complex than the iterated cosettling $T^{*-1}(w)$ (which is just the closure-equivalence interval $[\mathrm{seed}, w]$, per the [iterated cosettling theorem](iterated-cosettling-counts-derivable-cells.md)). The combinatorial structure depends on the rule-dependency structure of $T$.

This file states the conjectural framework — closure-cover hypergraph counting — and the open sub-questions. The framework is supported by enumerator data on benchmark rule systems but has not been established as a closed-form theorem.

## Empirical observations

The [cosettling enumerator](../tools/predication_categories/theorems/iterated_cosettling_counts_derivable_cells.py/) computes $T^{-1}(w)$ on benchmark rule systems:

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

- *Pure parallel last-step firings* (no chained dependencies): $|T^{-1}(w)| = 2^k$ where $k$ is the number of parallel-fired cells.
- *Diamond structures* (multiple paths to a final cell): $|T^{-1}| = 2^k - 1$ where the $-1$ corresponds to the seed-only state, which fails to produce the final cell in one step.
- *Conjunctive bottlenecks* (a rule requires multiple antecedents): $|T^{-1}|$ shrinks substantially.
- *Linear chains*: $|T^{-1}|$ has an irregular formula depending on chain length.

## The closure-cover hypergraph framework

**Conjecture.** *The right combinatorial framework for counting $T^{-1}(w)$ is the **closure-cover hypergraph** $H_w$:*

- *Vertices: cells of $w$.*
- *Hyperedges: pairs $(c, A)$ where $c \in w$ and $A = \mathrm{antec}(r)$ for some rule $r \in R$ with $c \in \mathrm{conseq}(r)$.*

*A subset $v \subseteq w$ is in $T^{-1}(w)$ iff $\mathrm{seed} \subseteq v$ and for every $c \in w \setminus v$, some hyperedge $(c, A)$ has $A \subseteq v$. This is a* closure-cover *of $H_w$: every vertex is either in $v$ or has its antecedents in $v$.*

## Open sub-questions

1. **Closed-form count for tree-shaped rule dependencies.** For rule systems where $H_w$ has a tree structure (each cell has a unique producing rule), $|T^{-1}(w)|$ should admit a recursive product formula.

2. **Lattice structure of the closure-cover poset.** $T^{-1}(w)$ is a join-semilattice (closed under union, per [cosettling object](../objects/cosettling.md)). Its full poset structure as a closure-cover collection is open.

3. **Asymptotic scaling.** For rule systems with $n$ cells and $m$ rules, what is the typical $|T^{-1}(w)| / 2^n$ as $n \to \infty$?

4. **Connection to hypergraph dualization.** Closure-cover counting is dual to set-cover counting; the dualization may give an alternative algorithmic approach.
