---
type: theorem
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

The [cosettling enumerator](../tools/predication_categories/theorems/iterated_cosettling_counts_derivable_cells.py/) computes $T^{*-1}(w)$ on benchmark rule systems. All recorded cases match $2^{|w \setminus \mathrm{seed}|}$:

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
