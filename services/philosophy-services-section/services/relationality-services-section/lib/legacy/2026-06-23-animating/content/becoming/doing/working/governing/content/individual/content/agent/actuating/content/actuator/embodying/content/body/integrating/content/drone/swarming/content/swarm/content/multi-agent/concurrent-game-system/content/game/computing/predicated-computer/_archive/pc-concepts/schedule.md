---
type: concept
class: time-discipline
depends-on: [clock, time-and-event-ordinals, witness]
see-also: [heartbeat]
---

# Schedule

A *substrate-recorded plan for invoking operations at chosen ordinals or wall-clock times*. Schedules are the substrate's mechanism for time-deferred work — operations that should run later, periodically, at specific calendar times, or in response to substrate-state conditions reaching thresholds.

A schedule has the structure:

- **An invocation specification** — what operation to run when the schedule fires.
- **A trigger condition** — when to fire: at a substrate ordinal, at a wall-clock time, periodically, or when a substrate-state predicate becomes true.
- **A retry policy** — what to do if the invocation fails: retry-immediately, retry-with-backoff, escalate-after-N-failures, fire-once-only.
- **A scope** — which substrate scope the schedule operates within.

Common schedule kinds:

- **Wall-clock-bound.** Fire at calendar time `T` (e.g., "every Monday at 09:00 UTC"). Per [clock](clock.md)'s discipline, the substrate consults wall-clock for the trigger but the operation's effect is recorded with substrate ordinal causality.
- **Substrate-ordinal-bound.** Fire at substrate ordinal $\tau$ (e.g., "after the next 100 admissions"). Used for substrate-local periodic tasks where wall-clock isn't relevant.
- **State-predicate-bound.** Fire when a substrate predicate becomes true (e.g., "when the federation peer count drops below 3"). The trigger is itself a closure rule whose firing invokes the scheduled operation.
- **One-shot.** Fire once at the trigger, then retire.
- **Periodic.** Fire repeatedly at a cadence (every N seconds, every N substrate ordinals, on every Nth heartbeat).

The substrate's [heartbeat](theories/agential-orchestration-platform/concepts/heartbeat.md) is structurally a periodic schedule that fires the [tick-advance](theories/agential-orchestration-platform/morphisms/tick-advance.md) operation per cycle per registered entity. Other schedules compose with the heartbeat: a wall-clock schedule may register an entity for the next heartbeat after its trigger time; an ordinal-bound schedule may use the ordinal directly.

Per [settlement-determinism](../theorems/settlement-determinism.md), schedules are substrate content; their behavior is replay-deterministic. Replaying a substrate that admitted a wall-clock-bound schedule will produce the schedule's effect at the same substrate ordinal as the original (the wall-clock check happens once at substrate-level firing time; the operation's effect is the substrate's record of what fired and when). An auditor reviewing schedule history can reconstruct what was scheduled, what fired, what didn't, and why.
