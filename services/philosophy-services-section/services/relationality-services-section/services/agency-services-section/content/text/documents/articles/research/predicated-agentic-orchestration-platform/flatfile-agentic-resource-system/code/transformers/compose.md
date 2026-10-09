---
source: [f1, f2]
target: [f]
name: compose
description: "The morphism that lifts the substrate value-domain's extending operation $\odot$ to fibers, pointwise on cells."
type: morphism
class: operator
depends-on: [fiber, substrate-value-domain]
see-also: [restrict, respond, settle]
---

# compose

The morphism that lifts the [substrate value-domain](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/substrate-value-domain.md)'s extending operation $\odot$ to [fibers](../structures/fiber.md), pointwise on cells.
`compose(F1, F2)` produces the fiber whose value at each cell is the value-domain's $\odot$-composition of `F1`'s value at that cell and `F2`'s value at that cell.
`compose` is one of the two algebra primitives FARS commits to (the other is [`restrict`](restrict.md)); together they realize the residuated pair $\odot \dashv \Rightarrow$ at the fiber level.

## Signature

```
compose(F1, F2) → F
```

Inputs are two fibers, typically on the same entity (or on entities at composable scopes).
Output is the fiber that combines their commitments.

## Operational semantics

The cell domain of the output is the union of `F1.cells` and `F2.cells`.
For each cell `c` in the union:

- if `c` is in both fibers: the output value is `F1[c] ⊙ F2[c]`, computed from the value-domain's $\odot$ table;
- if `c` is in only `F1`: the output value is `F1[c]` (equivalent to `F1[c] ⊙ ⊥`);
- if `c` is in only `F2`: the output value is `F2[c]` (equivalent to `⊥ ⊙ F2[c]`).

The bilattice $\{\bot, t, f, \top\}$'s $\odot$ table:

| $a \odot b$ | $\bot$ | $t$ | $f$ | $\top$ |
|---|---|---|---|---|
| $\bot$ | $\bot$ | $t$ | $f$ | $\top$ |
| $t$ | $t$ | $t$ | $\top$ | $\top$ |
| $f$ | $f$ | $\top$ | $f$ | $\top$ |
| $\top$ | $\top$ | $\top$ | $\top$ | $\top$ |

$\bot$ is the unit ($\bot \odot a = a$); concordant evidence sustains its value ($t \odot t = t$, $f \odot f = f$); discordant evidence produces $\top$ (contested); $\top$ is absorbing.

The output fiber's `provenance` mapping aggregates both inputs' provenance for each cell — when both fibers contributed, the output records both sources, so the [`Witness`](../objects/witness.md) chain can cite either or both as upstream.

## Normative invariants

- **Pure.** A conformant realization SHALL have no I/O and no shared state in `compose`.
  The output depends only on the bytes of `F1` and `F2`.
- **Commutative.** $\odot$ is commutative on the four-valued bilattice; therefore `compose(F1, F2)` and `compose(F2, F1)` SHALL produce the same fiber on the value-content axis.
  The output's provenance ordering MAY differ; the value content does not.
- **Associative.** $\odot$ is associative; therefore `compose(compose(F1, F2), F3)` SHALL equal `compose(F1, compose(F2, F3))` on the value-content axis.
- **$\bot$-fiber as identity.** The fiber whose `cells` mapping is empty (every cell carries $\bot$) SHALL be the identity for `compose`: composing it with any fiber returns that fiber.

## Lambek adjunction

`compose` and [`restrict`](restrict.md) form the residuated pair: for fibers $A, P, Q$,

$$ A \odot P \leq_t Q \iff P \leq_t (A \Rightarrow Q) $$

where $\leq_t$ is the truth-order's pointwise extension to fibers.
The adjunction is what makes [`respond`](respond.md) a coherent inference operation: composing a message with an entity, then settling, is residuation-equivalent to restricting the entity by what the message tests.

## What `compose` is not

- **Not a database join.** Cells are matched by predicate-name-and-arguments; values are combined by the value-domain's table.
  There is no relational-algebra structure ($\bowtie$, projection, selection) operating on cell content.
- **Not a fiber merger across entities.** Fibers on different entities do not compose at the cell level by `compose`.
  Cross-entity composition happens via [closure rules](../../../../teaching/explanations/closure-rule.md) firing during [`settle`](settle.md), not by direct fiber composition.
- **Not the same as [`restrict`](restrict.md).** `compose` adds positive evidence; `restrict` filters negative evidence.
  The two are residuated but not interchangeable.

## Position

`compose` is the algebraic primitive [`respond`](respond.md) uses in its first phase.
It is also invoked directly by closure rules whose conclusions extend a fiber, by [`settle`](settle.md) when accumulating per-layer additions, and by any operator that needs to combine two parties' commitments about an entity (federation, multi-author edits, the substrate's [merge](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/merge.md) operator at FARS's value-domain).
