---
type: concept
class: resource-discipline
depends-on: [fuel-bound, cost-discipline, witness]
see-also: [budget-record]
---

# Resource budget

A *substrate-recorded constraint* on resource consumption — generalizing the substrate's [fuel-bound](fuel-bound.md) discipline beyond closure-rule layers to memory, disk, network bandwidth, CPU time, external-API call counts, and other consumable resources. Resource budgets are how the substrate enforces operational limits in a way that is auditable, replayable, and adjustable as substrate content rather than as ambient host configuration.

A resource budget has the structure:

- **A resource kind** — what is being constrained: `closure-fuel`, `memory-bytes`, `disk-bytes`, `network-bytes`, `cpu-seconds`, `model-tokens`, `external-api-calls`, etc.
- **A bound value** — the numerical limit (or function returning a limit per scope).
- **A scope of applicability** — which substrate operations the budget governs (per scope, per agent, per session, per substrate-instance).
- **A bound-exhaustion policy** — what to do when the bound is reached: `abort` (stop the operation, witness the abortion), `defer` (queue the operation for later when budget is available), `escalate` (refer to governance for additional budget), `degrade` (continue at reduced fidelity, e.g., truncated output).

Resource budgets are the substrate's mechanism for *making cost first-class*. Per [cost-discipline](cost-discipline.md), substrate operations have measurable costs; per resource-budget, those costs are bounded by substrate-content predications.

The substrate's existing [fuel-bound](fuel-bound.md) is one specific resource budget (closure-rule fuel). Other budgets typically declared:

- **Memory budget.** Per substrate-instance, per session: the substrate's working-memory footprint. When exceeded, the substrate's response is to swap rare content to slower storage, abort large-region operations, or refuse new admissions.
- **Disk budget.** Per scope, per substrate-instance: the substrate's persistent-storage allocation. When exceeded, snapshot retention is shortened, low-priority content is archived off-substrate, or new admissions are refused.
- **Network budget.** Per federation peer, per scope: the substrate's outbound bandwidth allocation. When exceeded, federation traffic is queued, throttled, or rejected.
- **External-API budget.** Per scope, per agent: the substrate's allocated calls to external APIs (frontier models, third-party services). When exceeded, dependent skills are deferred or escalated.

Resource budgets compose with [witness](../objects/witness.md): per-operation witnesses include the budget consumed, allowing audit to attribute resource usage to specific substrate operations. Per [observability-as-reads](../theorems/observability-as-reads.md), querying budget-consumption history is a free read of substrate state.
