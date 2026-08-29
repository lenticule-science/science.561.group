---
type: definition
class: substrate-entity
realizes: [resource-budget]
depends-on: [resource-budget, fuel-bound, witness, scope]
see-also: [witness]
---

# Budget record

A **budget record** is the substrate-entity formal definition of one [resource budget](teaching/explanations/resource-budget.md): the substrate-recorded constraint on a particular resource kind over a particular scope.

## Structural fields

- **`id`** — kebab-case identifier (typically the resource-kind + scope, e.g., `memory-budget-substrate-default`, `model-tokens-budget-agent-emsenn`).
- **`description`** — one-line summary.
- **`resource-kind`** — declared kind: `closure-fuel`, `memory-bytes`, `disk-bytes`, `network-bytes`, `cpu-seconds`, `model-tokens`, `external-api-calls`, etc.
- **`bound-value`** — the numerical limit. May be a static number, a per-cycle quota, or a function-of-context expression.
- **`scope`** — references to the [scope](teaching/explanations/scope.md), agent, or substrate-instance the budget applies to.
- **`exhaustion-policy`** — declared policy on bound-exhaustion: `abort`, `defer`, `escalate`, `degrade`.
- **`current-consumption`** — derived value: how much of the budget has been consumed in the current accounting period.
- **`reset-policy`** — when the consumption counter resets: `never`, `per-substrate-instance` (resets on bootstrap), `per-cycle` (resets per heartbeat cycle), `per-day`, `per-month`, etc.
- **`witness-requirements`** — declared shape of consumption-witnesses: which operations contribute, what fields each contribution carries.
- **`closure-kind`** — `budget`.

## Invariants

- **Consumption-coherent.** The `current-consumption` is the sum of all consumption-witnesses cited under this budget since the last reset. The substrate's audit can verify the sum from the witness chain.
- **Bound-respect.** When `current-consumption + new-operation-cost > bound-value`, the exhaustion-policy fires. The substrate cannot silently exceed the bound.
- **Reset-coherent.** Counter resets are themselves substrate events; per [witness](witness.md), the reset is recorded.
- **Scope-restricted.** The budget applies only to operations within the cited scope. Operations outside the scope are governed by other budgets (or by no budget for unrestricted operations).

## Operations

- *Allocate.* Reserve a portion of the budget for a planned operation. Per [allocate-resource](../morphisms/allocate-resource.md), allocation is a substrate operation that produces a witness recording the reservation.
- *Consume.* When an operation completes, record its actual consumption against the budget. The witness cites the budget and the amount.
- *Release.* If an allocated portion was not fully consumed, release the unused portion back to the budget. The substrate's accounting may release on operation completion or hold until the budget cycle resets.
- *Audit.* Query the budget's consumption history. Per [observability-as-reads](../theorems/observability-as-reads.md), this is a free read.
- *Adjust.* Edit the budget's `bound-value` or `exhaustion-policy`. Per [self-representation](teaching/explanations/self-representation.md), adjustments are substrate edits with their own witnesses.

## Position in the substrate

Budget records are the substrate's *resource-allocation registry*. Without them, resource consumption is implicit and unaudited; with them, the substrate's resource use is queryable, replayable, and adjustable by the same operators that act on any other substrate content.

The pattern composes with [resource-budget](teaching/explanations/resource-budget.md), [fuel-bound](teaching/explanations/fuel-bound.md) (closure-fuel is one resource-kind), [witness](witness.md), and the substrate's [accounting](theories/agential-orchestration-platform/concepts/accounting.md) discipline at the agential layer.
