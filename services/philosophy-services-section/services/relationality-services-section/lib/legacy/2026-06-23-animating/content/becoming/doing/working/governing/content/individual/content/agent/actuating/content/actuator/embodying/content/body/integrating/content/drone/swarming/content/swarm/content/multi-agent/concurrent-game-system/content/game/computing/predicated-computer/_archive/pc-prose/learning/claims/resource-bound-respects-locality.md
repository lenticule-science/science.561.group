---
type: theorem
class: engineering-claim
status: proved
depends-on: [resource-budget, budget-record, allocate-resource, wavefront-termination, settlement-determinism]
see-also: [fuel-bound]
---

# Resource budgets respect substrate locality

**Claim.** A substrate operation governed by a [resource budget](teaching/explanations/resource-budget.md) consumes at most $K \cdot |\mathrm{affected\,region}|$ of the budget, where $|\mathrm{affected\,region}|$ is the size of the cells the operation actually touches and $K$ is a per-resource constant. Per [wavefront-termination](wavefront-termination.md), the substrate's operations are bounded by content, not by graph size; resource budgets inherit this property.

## Why this holds

Per [wavefront-termination](wavefront-termination.md), substrate operations' work is bounded by the size of the affected region, not by the substrate's total size. Per [settlement-determinism](settlement-determinism.md), an operation's resource consumption is deterministic on its inputs (the affected region, the rule-system version). The combined claim: an operation's budget consumption is determined by its affected region, not by ambient substrate content.

This holds for every resource kind:

- **Closure-fuel.** Per [wavefront-termination](wavefront-termination.md), closure-rule applications scale with the cascade's effect set.
- **Memory.** The substrate's working memory during an operation is bounded by the wavefront width plus the rule's match radius.
- **Disk.** New substrate content from an operation is bounded by the operation's witness size plus the cells it inserted/modified.
- **Network.** Federation traffic from an operation is bounded by the increment the operation contributes plus its witness.
- **CPU time.** Per locality, CPU time per operation is bounded by the affected region's size.

## Engineering consequence

Several engineering consequences:

- **Predictable budget consumption.** An operation's expected budget cost can be estimated before allocation by computing the affected region's size. Per [allocate-resource](../morphisms/allocate-resource.md), this enables pre-flight budget checks without running the operation.
- **Federation-portable budgets.** Two substrates with the same closure-rule system spend the same budget on the same operation. Per [federation-convergence](federation-convergence.md), federated work has predictable budget cost.
- **Locality-bounded scaling.** A substrate of $N$ entities running an operation affecting $k \ll N$ cells consumes $O(k)$ budget, not $O(N)$. The substrate's budget exhaustion is determined by *what's being worked on*, not *what exists*.

## What the theorem rules out

- An operation that consumes resources scaling with the substrate's total size violates locality and is non-conforming. Per [wavefront-termination](wavefront-termination.md), such operations are rejected at the substrate level.
- A budget whose accounting is non-deterministic (varies per host or per replay) breaks the claim. Per [settlement-determinism](settlement-determinism.md), budget accounting is substrate content and replay-deterministic.

## What the theorem requires

- The substrate respects the [wavefront-termination](wavefront-termination.md) locality bound.
- Per [settlement-determinism](settlement-determinism.md), resource consumption is deterministic on inputs.
- The budget records (per [budget-record](../objects/budget-record.md)) are substrate-resident and queryable.
