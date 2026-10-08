---
name: declared-dependency-ordering
description: "The discipline that tick order is computed from substrate content, not declared by the heartbeat: each entity carries reads: and writes: predicates declaring which channels and which predicates it consumes and produces; the heartbeat's policy reads these declarations and orders the cycle's ticks so that each entity's tick runs after the entities it reads from."
type: concept
class: framing
depends-on: [tick-as-iteration, fiber, closure-rule-record]
see-also: [heartbeat-cycle, advance-tick]
title: declared-dependency-ordering
---

# Declared dependency ordering

The discipline that *tick order is computed from substrate content, not declared by the heartbeat*: each entity carries `reads:` and `writes:` predicates declaring which channels and which predicates it consumes and produces; the heartbeat's policy reads these declarations and orders the cycle's ticks so that each entity's tick runs after the entities it reads from.

The discipline is the engineering content of Guix-style declarative dependency: the system computes ordering from what entities *say* about themselves, not from a hand-edited schedule.
An entity that reads `status` and writes `event` ticks after any entity that writes `status`; if the writer-set of `status` changes (a new entity is added, an old entity is retired), the ordering is recomputed automatically on the next cycle.

Without the discipline, the heartbeat would either (a) run all entities in arbitrary order — risking that consumers see stale state from producers that haven't yet ticked — or (b) maintain a hand-edited dependency table at the heartbeat layer, coupling the heartbeat to the substrate's content and breaking [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md).
With the discipline, the heartbeat's body stays small and the substrate's content stays load-bearing.

## How declarations work

Each entity's fiber carries:

- **`reads`** — the channels and predicates the entity consumes during its tick.
  May reference channel names (`reads: [dispatch, observation]`), specific predicates (`reads: [status, depends-on]`), or scoped patterns (`reads: [{channel: dispatch, predicate: assignment}]`).
- **`writes`** — the channels and predicates the entity produces during its tick.
  Same vocabulary.

The heartbeat reads these per cycle.
For two entities $A$ and $B$ in the cycle's selection set: if $B$'s `reads` overlaps $A$'s `writes` on a channel-or-predicate, $B$ ticks after $A$ in the cycle's ordering.
If neither's writes overlap the other's reads, they MAY tick in either order (or in parallel, if the realization's heartbeat supports it).

Cycles in the dependency graph (entity $A$ reads what $B$ writes, $B$ reads what $A$ writes) produce $\top$-cells in the cycle's *ordering fiber* — the substrate's view of "this isn't well-orderable."
Per [validation-as-settlement](../settlement/validation-as-settlement/validation-as-settlement.md), the contradiction is substrate-visible; the substrate's repair catalog has admissible recipes (e.g., split-the-cycle, accept-eventual-consistency-within-cycle, escalate).

## What the declarations enable

- **Automatic reordering on substrate edits.** Adding an entity with new `reads`/`writes` declarations recomputes the cycle's ordering.
  The heartbeat doesn't care; the substrate's content drives the schedule.
- **Parallelism discovery.** Two entities whose `reads`/`writes` don't overlap can tick in parallel.
  A realization with parallel-capable heartbeat reads the dependency graph and dispatches non-conflicting entities concurrently.
- **Cycle detection.** Dependency cycles are computable from substrate content; the heartbeat's pre-cycle pass detects them and either admits the cycle (if the policy allows eventual consistency) or escalates.
- **Replay-deterministic ordering.** Given the cycle's selection set and the entities' declarations, the cycle order is determined; replay reproduces the same order.
  Per the [`heartbeat-cycle`](../code/transformers/heartbeat-cycle.md) deterministic invariant, two cycles with the same selection set and same declarations produce byte-identical event sequences.

## What the discipline is not

- **Not author-declared priority.** Authors don't write "this entity is high-priority"; they declare what the entity reads and writes.
  Priority emerges from the dependency structure (more-depended-on entities tick earlier, naturally).
  Realizations that admit explicit priority predicates (for tie-breaking among entities with equivalent dependencies) treat priority as one declaration among others, not as the ordering primitive.
- **Not a topological sort of the entire substrate.** The heartbeat orders only the *registered* entities in the cycle's selection set, not every entity.
  Most entities don't tick most cycles; the ordering is over the small registered subset, not the substrate's full population.
- **Not a build system.** Build systems compute *what to rebuild* given source-file changes.
  The heartbeat computes *what to tick* given fiber-state changes.
  The semantic shape is similar; the units and conditions are different.

## Position

Declared dependency ordering is what makes [tick-as-iteration](../tick-as-iteration/tick-as-iteration.md) operationally complete.
Tick-as-iteration says "the heartbeat walks contents and processes each"; declared dependency ordering says "but in *this* order, computed from substrate content."
Together they cover the heartbeat's behavior without the heartbeat needing internal state beyond the cycle's selection set.

The framing depends on [closure-rule-record](../objects/closure-rule-record.md): rules' premise patterns include `reads`-style declarations on the entities they match against; the rule system can verify that an entity's declared `reads` is consistent with the rules that fire on it (a rule that reads `status` requires the entity to declare `reads: [status]`).
The verification is itself a closure rule — meta-rule, in the substrate, like everything else.
