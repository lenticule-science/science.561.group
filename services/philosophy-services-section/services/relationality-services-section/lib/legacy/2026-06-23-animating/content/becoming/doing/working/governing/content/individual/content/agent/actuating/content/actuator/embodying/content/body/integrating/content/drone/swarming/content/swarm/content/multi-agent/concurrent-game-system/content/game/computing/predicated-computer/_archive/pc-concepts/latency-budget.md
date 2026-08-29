---
type: concept
class: real-time-discipline
depends-on: [resource-budget, fuel-bound, witness, clock]
see-also: [deadline-discipline]
---

# Latency budget

A *substrate-recorded constraint on the wall-clock time an operation may consume*. Latency budgets extend [resource-budget](resource-budget.md) to the time dimension: in addition to bounding closure-fuel, memory, and CPU, the substrate may bound *how long* an operation is permitted to run before it must complete (or abort).

A latency budget has the structure:

- **Operation kind** — which substrate operations the budget applies to (e.g., dispatch-matching, federation-handshake, query).
- **Budget value** — the maximum admissible wall-clock duration (in milliseconds, microseconds for hard real-time).
- **Exhaustion policy** — what to do when the budget is exceeded: `abort` (stop the operation, witness the timeout), `degrade` (return a partial result with a flag), `escalate` (route to a fallback path).
- **Soft vs hard.** Soft real-time: budgets are guidelines, exceedance is logged; hard real-time: budgets are guarantees, exceedance is a failure.

Per [clock](clock.md), latency budgets are wall-clock-bound (informational time, not substrate-ordinal time). Per [settlement-determinism](../theorems/settlement-determinism.md), substrate behavior doesn't depend on latency-budget timing — but operation outcomes (whether the budget was exhausted) do depend on host-clock readings.

Common patterns:

- **Per-request latency.** A user-facing request (HTTP, RPC) has a latency budget; if not met, the substrate returns a timeout response.
- **Per-dispatch latency.** Dispatch-matching has a budget; if no agent matches in time, escalate.
- **Federation-roundtrip budget.** Federation handshake or message-exchange has a deadline; if not met, mark the peer unreachable.
- **Heartbeat budget.** Per [tick-advance](theories/agential-orchestration-platform/morphisms/tick-advance.md), each tick has a per-cycle budget; ticks taking longer flag the entity for diagnosis.

Per [witness](../objects/witness.md), latency-budget exhaustions produce witnesses; auditors can review timing patterns and identify operations that consistently approach or exceed budgets.

Per [federation-convergence](../theorems/federation-convergence.md), latency budgets are local — federated peers may have different budgets without affecting eventual convergence (just the time-to-convergence).

Real-time substrates (control systems, audio processing, embedded control loops) require *hard* latency budgets: per [deadline-discipline](deadline-discipline.md), the substrate's runtime must guarantee budget-respect even under load. Soft real-time substrates (web services, interactive applications) tolerate occasional exceedance.
