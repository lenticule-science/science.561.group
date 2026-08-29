---
kind: question
status: open
explores: [cosettling, closure-operator, closure-2-monad]
---

# Closure-cover hypergraph classification of single-step pre-images

The single-step cosettling $T^{-1}(w)$ in the strict regime has a clean combinatorial reformulation as the closure-covers of a hypergraph $H_w$, but no closed-form count. Open: is there a natural classification?

## The setup

For a strict-regime closure operator $T$ with rule set $R$ on a finite cell space, and a closure-stable target $w$:

**Closure-cover hypergraph $H_w$.**
- Vertices: cells of $w$.
- Hyperedges: pairs $(c, A)$ where $c \in w$ and $A = \mathrm{antec}(r)$ for some rule $r \in R$ with $c \in \mathrm{conseq}(r)$.

**Closure-cover.** A subset $v \subseteq V(H_w) = w$ such that:
1. $\mathrm{seed} \subseteq v$ (where $\mathrm{seed}$ = cells with no producing rule), and
2. for every $c \in w \setminus v$, some hyperedge $(c, A)$ has $A \subseteq v$.

**Theorem.** *$T^{-1}(w) = $ {closure-covers of $H_w$}.* (See [forward trajectory inside the cosettling](../theorems/backward-closure-recovers-forward-trajectory.md) for the underlying pre-image characterization.)

The iterated cosettling is much simpler — see [iterated-cosettling-counts-derivable-cells](../theorems/iterated-cosettling-counts-derivable-cells.md), where $|T^{*-1}(w)| = 2^{|w|-|\mathrm{seed}|}$. The single-step problem is the structurally non-trivial one.

## What's known from enumerator data

The [cosettling enumerator](../tools/cosettling-enumerator/) gives concrete counts on small benchmarks:

| Rule structure | $|T^{-1}(w)|$ | Pattern |
|---|---|---|
| Pure parallel firings ($k$ independent rules from seed) | $2^k$ | clean exponential |
| Diamond (two paths to a final cell) | $2^k - 1$ | one excluded: seed-only |
| Conjunctive bottleneck (rule needs multiple antecedents) | substantially smaller | depends on bottleneck |
| Linear chain (length $k$) | irregular | not $2^j$ |

Counts depend non-trivially on the rule-dependency structure.

## Sub-questions

1. **Tree-shaped rule dependencies.** When $H_w$ has a tree structure — each cell has a unique producing rule, no parallel firings — does $|T^{-1}(w)|$ admit a recursive product formula? Tentative formula based on small cases:
   $$|T^{-1}(w)| = \prod_{c \in w \setminus \mathrm{seed}} (1 + N_c)$$
   where $N_c$ is some structural quantity (the number of "delayability degrees" for $c$). Verify against enumerator output.

2. **Closure-cover poset structure.** $T^{-1}(w)$ is closed under union (per [cosettling object](../objects/cosettling.md)) — a join-semilattice with top $w$. Its full poset structure as a sub-poset of $\mathcal{P}(w)$, including the off-trajectory branches, is currently unmapped.

3. **Asymptotic scaling.** For random rule systems with $n$ cells and $m$ rules, what is $\mathbb{E}[|T^{-1}(w)|] / 2^n$? Does it concentrate, follow a phase transition in $m/n$, or vary smoothly?

4. **Connection to standard hypergraph problems.** Closure-cover counting may be a known combinatorial object under a different name. The condition "every uncovered vertex has all the antecedents of some hyperedge in $v$" resembles **dominating set** or **transversal** problems but with a directional twist (antecedent → consequent). Mapping to the standard literature is open.

5. **Algorithmic complexity.** Is computing $|T^{-1}(w)|$ #P-complete, or does the rule structure make it tractable? For tree-shaped $H_w$, polynomial-time computation should be possible by recursion. For general $H_w$, the answer is open.

## Why it matters

A closed-form classification of $T^{-1}(w)$ would:

- **Sharpen the corrected cosettling theorem.** [forward trajectory inside the cosettling](../theorems/backward-closure-recovers-forward-trajectory.md) currently gives a pre-image characterization but not a count. The corrected version of the original "$T^{-1}(v_\kappa) = \{v_{\kappa-1}, v_\kappa\}$" claim — refuted — could be replaced with a real formula.
- **Inform the cosettling cohomology question.** $T^{-1}(w)$ as a poset has its own cohomology (per [cosettling-backward-direction](cosettling-backward-direction.md)). If the poset has a structured form, the cohomology is computable.
- **Connect to the backward-MLD equivalence relation.** Defined as $v \sim_{\mathrm{bMLD}} w$ iff $T^{-1}(v) = T^{-1}(w)$. The closure-cover form makes this checkable on rule structure.

## Computational approach

The [cosettling enumerator](../tools/cosettling-enumerator/) directly computes $T^{-1}(w)$ for arbitrary strict-regime rule sets. Adding sweeps over random rule-system ensembles (parameterized by $n, m$, antecedent-size distribution) would generate enough data to test the asymptotic-scaling conjecture and the tree-shape recursive formula.

## Connection to existing structure

- [Forward trajectory inside the cosettling](../theorems/backward-closure-recovers-forward-trajectory.md) — pre-image characterization (Theorem (1)).
- [Iterated cosettling counts derivable cells](../theorems/iterated-cosettling-counts-derivable-cells.md) — clean iterated formula, contrast with single-step.
- [Cosettling object](../objects/cosettling.md) — structural facts (join-semilattice, no canonical min, finiteness).
- [Cosettling-backward-direction](cosettling-backward-direction.md) — broader open backward-direction question.
