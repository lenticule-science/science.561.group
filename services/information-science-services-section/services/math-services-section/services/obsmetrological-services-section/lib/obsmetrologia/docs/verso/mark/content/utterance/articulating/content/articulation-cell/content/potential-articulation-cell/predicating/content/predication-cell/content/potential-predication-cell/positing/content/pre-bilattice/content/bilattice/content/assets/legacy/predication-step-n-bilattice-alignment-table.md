---
type: example
status: draft
depends-on: [step-n-and-bilattice-correspondence, fibonacci-substitution-settling, padovan-substitution-settling, tetranacci-substitution-settling, four-bilattice]
instantiates: [step-n-and-bilattice-correspondence]
lineage: 5
kind: example
---

# Step-n bilattice cardinality coincidence at n = 2, 3, 4

Tabulates the [step-$n$ / bilattice cardinality coincidence theorem](../../../../../../valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-and-bilattice-correspondence.md) on the three concrete cases. The cardinality match is real; the structural correspondence (whether the listed mappings are canonical in any operational sense) is open.

## The cardinality match

| $n$ | Substitution | Alphabet | Bilattice substructure of size $n$ | An example bijection |
|---|---|---|---|---|
| 2 | Fibonacci | $\{a, b\}$ | 2 partial orders ($\leq_k, \leq_t$) | $a \leftrightarrow \leq_k$, $b \leftrightarrow \leq_t$ |
| 3 | Padovan | $\{a, b, c\}$ | 3 non-bottom values ($\mathbf{t}, \mathbf{f}, \top$) | $a \leftrightarrow \mathbf{t}$, $b \leftrightarrow \mathbf{f}$, $c \leftrightarrow \top$ |
| 4 | Tetranacci | $\{a, b, c, d\}$ | 4 full values ($\bot, \mathbf{t}, \mathbf{f}, \top$) | $a \leftrightarrow \bot$, $b \leftrightarrow \mathbf{t}$, $c \leftrightarrow \mathbf{f}$, $d \leftrightarrow \top$ |

Each row exhibits a bijection between the named substitution's alphabet and a structurally-distinguished cardinality-$n$ subset of the bilattice. **None of these bijections is currently known to be canonical** — at each $n$ there are $n!$ such bijections, and no specific one has been shown to make the substitution matrix commute with a bilattice operation under the bijection.

## What is established

- The cardinality coincidence is genuine: alphabet sizes of named step-$n$ families ($2, 3, 4$) match cardinalities of bilattice substructures ($2$ orders, $3$ non-bottom values, $4$ full values).
- The boundary at $n = 4$ is sharp: $\mathbf{FOUR}$ has only 4 elements, so no substructure has cardinality $\geq 5$. For $n \geq 5$ no alphabet-to-bilattice-substructure bijection exists.

## What is open

- Whether *any* of the bijections above is structurally canonical — i.e., whether the substitution matrix $M_n$ acts on $\mathbb{Z}^n$ in a way that respects (under the given bijection) the bilattice's negation, conflation, or partial-order structure on $\Sigma_n$.
- The author's preliminary expectation is that the answer is *no* at $n = 3, 4$ — the substitution matrices do not naturally commute with any bilattice involution under any choice of bijection — and *unclear* at $n = 2$. See the open-question discussion in the parent theorem file.

If a positive answer is found at any $n$, the substitution-bilattice correspondence becomes a genuine structural alignment at that level. If negative across the board, the cardinality coincidence is numerology — interesting but not a structural correspondence.

## Position in Lineage 5

Cross-step cardinality table. Demonstrates the precise content of the cardinality-coincidence theorem at three concrete instances; identifies the cardinality boundary at $n = 4$ as sharp; flags the structural-correspondence question as open.
