---
type: question
status: open
explores:
  - teaching/explanations/cost-discipline.md
  - ../theorems/cost-composition-via-lawvere-quantale.md
  - ../theorems/cost-discipline-reads-free.md
  - teaching/explanations/closure-kind.md
  - teaching/explanations/regime-discipline.md
see-also:
  - teaching/explanations/composability-with-predication-categories.md
  - teaching/explanations/what-predicated-computing-inherits.md
  - ../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md
---

# How does the substrate's cost discipline compose under operator chaining, scope crossing, and federation?

The substrate's [cost-discipline](teaching/explanations/cost-discipline.md) bounds substrate operations by their closure-operator regime: per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md), cost composes via a Lawvere quantale at the per-operator level; per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), reads are free in the cost discipline. The composition law at the *single-operator* level is settled. The composition law across *operator chains*, across *scope crossings*, and across *federation boundaries* is open. The substrate has not committed to a unified cost-composition discipline, and the implementation in [pypredcomp](../../../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/) realises only the per-operator bound directly. The question is what discipline the substrate commits to for composed operations.

## Statement

> *What substrate-level structural fact fixes how cost composes when substrate operations are chained, when operations cross scope-boundaries, and when operations span federated substrates, and what does the [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md) theorem actually guarantee for composed operations?*

## Decomposition

### Sub-question A — How does cost compose under sequential operator chaining?

The candidate composition laws form a hierarchy by structural commitment:

- **Sum.** Chained operators sum their per-operator costs; the chain's cost is the additive total. The discipline is the simplest; the cost is that *amortized* gains across the chain (e.g., when the second operator can reuse the first's index) are not captured.
- **Quantale-product.** Chained operators compose via the cost-quantale's tensor product; per the [closure-2-monad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md)'s monoidal structure, the tensor is the natural composition. The discipline captures non-additive composition (e.g., quadratic when both operators iterate over the predication-graph independently); the cost is more bookkeeping.
- **Regime-determined.** Chained operators compose with a cost determined by the *regime* of the resulting composition: strict-with-strict yields strict; strict-with-Scott-continuous yields Scott-continuous; strict-with-aperiodic yields aperiodic. Per [aperiodic-regime-engineering-envelope](../theorems/aperiodic-regime-engineering-envelope.md), the regime *bounds* the cost rather than computing it. The discipline is structurally clean but coarse.
- **Witness-amortized.** Chained operators compose with a cost reduced by the witness-overlap across operators: if operator $g$ reuses witnesses produced by operator $f$, the overlap is deducted from $g$'s contribution. The discipline captures actual implementation cost more faithfully; the cost is high bookkeeping and dependency on witness-content discipline.

The sub-question: which composition law does the substrate commit to, and how is the choice recorded in substrate-resident cost-discipline metadata?

### Sub-question B — How does cost compose across scope crossings?

When an operator crosses a [scope-as-predication](teaching/explanations/scope-as-predication.md) boundary (querying content visible in one scope but not another), the cost discipline must extend:

- **Ignore scope.** Cost is computed as if all content were visible; scope-restricted operators are charged the same as fully-visible operators. The discipline is simple; the cost is over-conservative — scope-restricted operators that touch less content are charged for content they cannot read.
- **Per-scope cost.** Cost is computed per the operator's *visible* content under each scope; the operator's total cost is the maximum across scopes (worst-case discipline) or the sum (cumulative discipline) or the average (amortized discipline). The choice of aggregation is itself a sub-question.
- **Scope-boundary-marginal.** Cost is per-scope plus a marginal cost for each scope-boundary crossing. The discipline captures the cost of the modal restriction operation explicitly; cross-scope queries are visibly more expensive than in-scope queries.
- **Substrate-modal-respecting.** Cost is determined by the modal restriction operator (per [substrate-operations-are-bigraded-modal](../theorems/substrate-operations-are-bigraded-modal.md)): the operator's cost is the cost of evaluating the modal-necessity restriction times the per-scope cost. The discipline is mathematically principled and captures the modal apparatus; the cost is full modal-tracking.

The sub-question: which scope-crossing cost discipline does the substrate commit to, and how does it interact with the modal restriction apparatus.

### Sub-question C — How does cost compose across federation boundaries?

When an operator spans federated substrates (querying content from a remote substrate via [federation-bridge](../objects/federation-bridge.md)), the cost discipline must extend further:

- **Local + network.** Cost is per-substrate-local cost plus a network-cost term per substrate. The discipline is operationally simple; the cost-composition is a sum.
- **Bridge-amortized.** Cost is per-substrate-local cost plus a per-bridge-message-batch cost (per the delta-state CRDT discipline of [almeida-baquero-shapiro2018](references/almeida-baquero-shapiro2018.md)); batched queries amortize the network cost. The discipline captures actual implementation cost; the bookkeeping requires bridge-batching metadata.
- **Federation-convergence-bounded.** Cost is bounded by the federation's convergence-time per [federation-convergence](../theorems/federation-convergence.md); operators that complete before convergence may return partial results, with cost reflecting only the work done. The discipline admits *partial-result* cost accounting; the trade-off is that operators must declare their convergence-tolerance.
- **Witness-shipping cost.** Cost includes the cost of shipping witnesses across the federation, since federated substrates that need to audit the cross-substrate query require witness-shipping. The discipline captures audit-faithful federation; the cost is witness-traffic accounting.

The sub-question: which federation-boundary cost discipline does the substrate commit to, and whether multiple disciplines coexist in a single substrate (e.g., bridge-amortized for routine federation, witness-shipping for audit-required federation).

### Sub-question D — What does the cost-composition theorem actually guarantee under composed operators?

The current [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md) theorem guarantees that cost composes via the Lawvere quantale at the per-operator level; the theorem is silent on the chained, scope-crossing, and federated cases. The sub-question is to rephrase the theorem as *parametric in the composition discipline*:

- Under **sequential-chain composition**: the theorem extends by associativity-of-tensor; the chain's cost is the tensor of per-operator costs.
- Under **scope-crossing composition**: the theorem extends by the modal-restriction operator's cost; the cross-scope cost is the modal-restriction cost times the per-scope cost.
- Under **federation-boundary composition**: the theorem extends by the federation's convergence-cost; the federated cost is the local-cost plus the federation-convergence-bounded network cost.
- Under **mixed composition**: the theorem extends by the composition of the three disciplines; the substrate must commit to a discipline-composition law (e.g., scope-crossing then federation-boundary then sequential-chain).

The theorem's `status` would change from `proved` to `proved-modulo-composition-discipline`, and the composition discipline would become a declared parameter of the substrate's cost accounting.

## What is established

- The per-operator cost-composition law is fully proved by [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md): cost is a value in a Lawvere quantale, and per-operator composition is the quantale's tensor.
- The reads-free discipline is proved by [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md): substrate reads do not contribute to cost in the discipline, so query-only operations have cost zero. This is structurally significant for the chained case (a chain of reads is free).
- The four-regime classification (per [regime-discipline](teaching/explanations/regime-discipline.md)) provides one structural axis along which cost-composition can be discussed; the regime-determined option in sub-question A is grounded in the existing classification.
- The Green-Karvounarakis-Tannen provenance-semiring framework (per [green-et-al2007](references/green-et-al2007.md)) provides a structurally-similar algebra for *witness* composition, which the cost-composition discipline could mirror — both are semiring-style composition laws over substrate operations.
- The substrate's [event log](../objects/event-log.md) records actual operator costs per firing, providing the empirical ground against which any composition law can be calibrated.
- The [aperiodic-regime-engineering-envelope](../theorems/aperiodic-regime-engineering-envelope.md) theorem bounds the worst-case cost for aperiodic operators; the envelope is the upper bound any composition law must respect.

## What remains open

- Which of sub-question A's four sequential-chain composition laws (sum / quantale-product / regime-determined / witness-amortized) the substrate commits to.
- Which of sub-question B's four scope-crossing disciplines (ignore / per-scope / boundary-marginal / modal-respecting) the substrate commits to.
- Which of sub-question C's four federation-boundary disciplines (local+network / bridge-amortized / convergence-bounded / witness-shipping) the substrate commits to.
- The parametric statement of cost-composition under the chosen disciplines (sub-question D).
- Whether *contestation between cost measurements* (one substrate observer reports one cost, another reports another) is handled by the substrate's $\top_k$ pressure discipline at the cost-cell level.
- The relationship between cost-composition and the substrate's [budget-record](../objects/budget-record.md): does a budget bind by the per-operator cost (current) or by the composed-cost-under-the-chosen-discipline (proposed)?
- Whether *cost is itself substrate content* (a cost-cell per operator-application is a substrate cell, queryable and witnessable) — which connects this question to [self-representation-completeness](self-representation-completeness.md).

## Why it matters

Resolving this question would settle four downstream commitments the substrate depends on:

1. **The strength of cost as an engineering signal.** As written, the per-operator cost is bounded but composed-operator cost is not; engineers cannot predict cost for chained, cross-scope, or federated workloads with confidence.
2. **The discipline of substrate budgets.** Without a composed-cost discipline, budgets bound only individual operators, not the workloads engineers actually deploy.
3. **The discipline of substrate scheduling.** A scheduler that does not know composed-cost cannot optimise across workloads; resolving this question would let the scheduler use the composition law to plan.
4. **The audit-faithfulness of cost across substrate operations.** Without a cost-composition discipline, audit cannot reconstruct *why* a workload took the cost it did; resolving this question would make cost auditable in the same way provenance is.

A tractable next step is to write a worked example of cost composition under each of the four sequential-chain disciplines (sum, quantale-product, regime-determined, witness-amortized), with the per-operator cost data, the composed-cost prediction, and the actual measured cost (from a pypredcomp-instrumented run), and compare the predictions to the measurements; the partial answers from the regime-classification literature would become candidate theorems.
