# Cosettling enumerator: findings

Run via `python3 enumerate.py --benchmark all`. Data in `data.json`.

## Headline finding

**Iterated cosettling has clean closed form.** Across all 7 benchmarks:

$$|T^{*-1}(w)| \;=\; 2^{|w| - |\mathrm{seed}|}.$$

This holds because $T^{*-1}(w) = \{v : \mathrm{seed} \subseteq v \subseteq w\}$ — see the [iterated-cosettling-counts-derivable-cells theorem](../../theorems/iterated-cosettling-counts-derivable-cells.md).

## Single-step counts

| Benchmark | $\kappa$ | $|w|$ | $|T^{-1}(w)|$ | $|T^{*-1}(w)|$ | structure |
|---|---|---|---|---|---|
| theorem-3-stage | 2 | 3 | 3 | 4 | linear chain length 2 |
| parallel-firing-2 | 1 | 3 | 4 | 4 | 2 parallel rules from seed |
| parallel-firing-3 | 1 | 4 | 8 | 8 | 3 parallel rules from seed |
| diamond | 2 | 4 | 7 | 8 | 2 paths, common final cell |
| conjunctive-firing | 2 | 4 | 5 | 8 | last rule needs both branches |
| linear-chain-5 | 4 | 5 | 8 | 16 | linear chain length 4 |
| fan-out-fan-in | 2 | 5 | 9 | 16 | 3 parallel + 1 conjunctive |

## Patterns visible

1. **Pure parallel last-step firings**: $|T^{-1}(w)| = 2^k$ exactly, where $k$ is the number of parallel-fired cells. (parallel-firing-2, -3.)

2. **Diamond structures** (multiple paths to a common final cell): $|T^{-1}| = 2^k - 1$. The minus 1 is the seed-only state, which cannot produce the final cell in one closure step (there is no cell in the seed that R3 or R4 can fire on directly).

3. **Conjunctive bottlenecks** (a rule needs multiple antecedents): $|T^{-1}|$ is smaller, since intermediate states with one but not both antecedents do not fire the bottleneck rule.

4. **Linear chains**: $|T^{-1}|$ has an irregular form depending on chain length and the "delayability" of intermediate cells.

## Combinatorial framework: closure-cover hypergraph

For target $w$, define the **closure-cover hypergraph** $H_w$:

- *Vertices*: cells of $w$.
- *Hyperedges*: pairs $(c, A)$ where $c \in w$ and $A$ is the antecedent of a rule producing $c$.

Then $v \in T^{-1}(w)$ iff:
- $\mathrm{seed} \subseteq v \subseteq w$, and
- for every $c \in w \setminus v$, some hyperedge $(c, A)$ has $A \subseteq v$.

A subset $v$ satisfying these conditions is a **closure-cover** of $H_w$.

Counting closure-covers is the combinatorial classification problem. The benchmarks above exhibit:

- $H_w$ tree-shaped (theorem-3-stage, linear-chain-5): irregular count, depends on chain length.
- $H_w$ disconnected (parallel-firing-k): $|T^{-1}| = 2^k$.
- $H_w$ with diamond / conjunctive structure: count between $2^{k-1}$ and $2^k$.

## Open problems

1. Closed-form count for tree-shaped rule dependencies.
2. Asymptotic scaling: for random rule systems with $n$ cells and $m$ rules, what is $\mathbb{E}[|T^{-1}(w)|] / 2^n$?
3. Lattice structure of the closure-cover poset (already known: join-semilattice with top, no canonical min in general).

## Reproduction

```
cd tools/cosettling-enumerator
python3 enumerate.py --benchmark all
python3 enumerate.py --benchmark all --json > data.json
```

To add a benchmark, edit `BENCHMARKS` in `enumerate.py` with a new `(seed, rules)` tuple.
