---
type: concept
class: operation-kind
depends-on: [operation-kinds, witness, telemetry]
see-also: [provenance, event-log]
title: Accounting
description: "The platform's resource-flow tracking operation kind: an operation that records a substrate event's effect on a tracked quantity — compute consumed, time elapsed, capacity used, tokens spent, work-units produced — as predications in a…"
---

# Accounting

The platform's *resource-flow tracking* operation kind: an operation that records a substrate event's effect on a tracked quantity — compute consumed, time elapsed, capacity used, tokens spent, work-units produced — as predications in a substrate-recorded ledger.
Accounting is the substrate's analog of double-entry bookkeeping for any quantity the platform tracks.

An accounting operation is structurally distinct from a [query](../../documents/articles/research/predicated-agentic-orchestration-platform/query/query.md) (read-only) or a [mutation](../../documents/articles/research/predicated-agentic-orchestration-platform/memory/mutation/mutation.md) (changes content): an accounting operation is a *write* (it records the resource flow) but the *content* it writes is *derived* from another operation's effect.
An accounting operation does not initiate work; it observes work and records its resource consequences.

## Three structural moves

An accounting operation:

- **Observes a triggering event.** A substrate event (a skill invocation, a closure rule firing, a tick advance) produces resource consumption: compute time, memory used, network bytes transferred, monetary cost incurred, agent-attention spent.
- **Computes the ledger entry.** The triggering event's witness is read; the resource consumption is computed (typically by reading platform-provided per-operation cost predications); the ledger entry is constructed.
- **Inserts the ledger predication.** The accounting predication is inserted into a substrate ledger (a content-addressed-store region dedicated to resource-flow records).
  The insertion produces its own witness, citing the triggering event.

## Engineering properties

- **Atomic-with-trigger.** An accounting operation either completes alongside the triggering event (accounting-and-event are a substrate transaction) or fails alongside (rolling back is admissible).
  The substrate's discipline is that resource consumption is *recorded as it happens*, not summed later from logs.
- **Ledger-bounded.** Per [containment](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/endeavoring/content/endeavor/organizing/content/organization/resourcing/content/resource/recording/content/teaching/explanations/containment.md), accounting predications live in a particular ledger's `contains` relation.
  Multiple ledgers per scope are admissible (one for compute, one for tokens, one for cost, etc.); each is a substrate entity.
- **Provenance-complete.** Per [provenance](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/endeavoring/content/endeavor/organizing/content/organization/resourcing/content/resource/recording/content/teaching/explanations/provenance.md), every accounting predication cites the triggering event by canonical hash.
  An audit can trace any ledger entry to its operation cause.
- **Non-mutating beyond ledger.** An accounting operation does not change the substrate state of the operation it accounts; its effect is *only* the ledger predication.

## Position in the platform

Accounting is the platform's *cost discipline*: where every resource flow has a substrate-recorded entry, and the platform's cost can be computed by ledger query rather than by external observation.
Per [telemetry](../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/telemetry.md), accounting is the substrate-level realization of "the platform sees its own cost as data."

Particular accounting patterns:

- **Per-operation cost.** A skill invocation's accounting records the inference tokens consumed, the wall-clock latency, the substrate operations performed.
- **Per-tick cost.** A tick advance's accounting records the closure-rule application's match-radius-cost, the resulting predications inserted.
- **Per-session cost.** A session's accumulated accounting predications, summed via a query, give the session's total resource consumption.
- **Per-scope budget.** A scope's ledger entries, summed and compared against a budget predication, surface budget violations as substrate events.
- **Per-agent debit/credit.** When agents have resource budgets (compute quotas, token allocations, time budgets), the accounting predications track per-agent flows.
