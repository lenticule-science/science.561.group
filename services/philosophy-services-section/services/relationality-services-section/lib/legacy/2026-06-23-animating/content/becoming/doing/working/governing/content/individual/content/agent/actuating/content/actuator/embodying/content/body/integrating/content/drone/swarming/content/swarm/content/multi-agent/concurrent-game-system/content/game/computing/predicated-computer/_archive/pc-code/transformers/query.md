---
type: morphism
class: data-access-operation
realizes: [query-language, index]
depends-on: [query-language, index, index-record, traversal, cost-discipline-reads-free]
see-also: [build-index]
---

# Query

The substrate operation that *executes a query expression* against the predication graph, returning matching predications.

## Signature

`query(query-expression, scope?) → (result-set, query-witness)`

Inputs:

- **`query-expression`** — a [query-language](teaching/explanations/query-language.md) expression.
- **`scope`** — optional restriction to a particular [scope](teaching/explanations/scope.md).

Outputs:

- **`result-set`** — the matching predications (or, for projections, the projected values).
- **`query-witness`** — records the query execution.

## Operational semantics

1. *Parse and validate.* Verify the query is well-formed in the substrate's query language.
2. *Plan.* Choose which [indexes](teaching/explanations/index.md) to use; produce an execution plan.
3. *Execute.* Apply the plan via [traversal](traversal.md), reading from indexes where applicable.
4. *Witness emit.* Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), queries are reads; the witness is informational (audit-of-reads if enabled).

Per [settlement-determinism](../theorems/settlement-determinism.md), query results are deterministic on substrate state and query expression. Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), querying a snapshot reproduces the historical result.

## Engineering invariants

- **Reads-free.** Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), queries don't advance substrate state.
- **Index-leveraging.** When indexes exist, the query uses them for efficiency.
- **Result-deterministic.** Per [settlement-determinism](../theorems/settlement-determinism.md), the same query against the same state produces the same result.

## Position in the substrate

Query is the substrate's *general-purpose data-access primitive*. Composes with [traversal](traversal.md) (the underlying read), [index](teaching/explanations/index.md) (the optimization), and the substrate's audit chain.
