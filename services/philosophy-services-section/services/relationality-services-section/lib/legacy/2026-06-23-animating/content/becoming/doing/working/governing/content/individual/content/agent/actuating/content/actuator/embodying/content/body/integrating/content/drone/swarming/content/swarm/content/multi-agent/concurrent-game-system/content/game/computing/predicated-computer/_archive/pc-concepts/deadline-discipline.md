---
type: concept
class: real-time-discipline
depends-on: [latency-budget, witness, clock]
see-also: [resource-budget]
---

# Deadline discipline

The *substrate's discipline for guaranteeing operation-completion-by-a-cited-wall-clock-time*. Where [latency-budget](latency-budget.md) bounds operation duration, deadline discipline bounds operation *completion time*: an operation initiated at $t_0$ with deadline $t_d$ must complete (or abort) by $t_d$, regardless of when it actually started executing.

Deadlines vs latency budgets:

- **Latency budget** is about *how long an operation runs once it starts*: "this operation may take up to 100ms of CPU time."
- **Deadline** is about *when the operation must be done by*: "this operation must complete by 14:00:00 UTC, regardless of queue time, scheduling delays, or interruptions."

Deadline discipline composes with [scheduling](schedule.md): the substrate's scheduler must be deadline-aware to guarantee deadlines. Common scheduling disciplines:

- **EDF (Earliest Deadline First).** Schedule the operation with the soonest deadline first. Optimal for single-processor uniprocessor real-time systems.
- **Rate-monotonic.** Schedule by period, not deadline. Suitable for periodic tasks with implicit deadlines.
- **Priority-based.** Each operation has a priority; deadlines are encoded in priority assignment.

Per [self-representation](teaching/explanations/self-representation.md), deadlines are substrate content. Per [witness](../objects/witness.md), deadline-met / deadline-missed events are recorded; auditors can review deadline performance.

Per [federation-convergence](../theorems/federation-convergence.md), deadlines do not affect federation convergence (the federated state is the same regardless of when each substrate's operations completed) — but they affect *when* convergence is observable to clients.

Hard-real-time deadlines require:
- A real-time operating system (RT-Linux, FreeRTOS, Zephyr) at the host layer.
- A substrate runtime designed for predictable execution (no garbage collection pauses, bounded operation latencies).
- Per [native-compilation-target](native-compilation-target.md), CPU machine code rather than JIT or interpreted (JIT compilation can introduce unpredictable pauses).

Soft-real-time deadlines tolerate occasional misses and are admissible on standard hosts; per [latency-budget](latency-budget.md), they're typically expressed via budgets rather than hard deadlines.
