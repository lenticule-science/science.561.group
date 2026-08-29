---
name: accumulates memory
type: morphism
class: agent-form-relation
source: persona
target: memory
status: open
---

`accumulates-memory(persona, memory-record, time)` — the persona's history-of-acts at time `t` is the persona's memory-record's state at `t`. As body-naturals incarnate the persona over successive sessions, each session's witnesses fold into the persona's memory.

## Shape

A time-varying relation. At each tick, the persona has a memory-state — a set of cells the persona-record's memory-fiber holds. Memory is *append-only* in the standard model (events are stratified, the cell-graph is a presheaf — per the [`events-are-stratified-substrate-is-a-presheaf`](../tools/platform/pypredcomp/docs/dev/decisions/events-are-stratified-substrate-is-a-presheaf.md) decision), so memory grows monotonically over time.

## Step-induction role

Cross-session continuity. Without memory accumulation, each session would start the persona "from scratch" — which is exactly what happens when the body-natural starts but is *not* what happens with the persona, because the persona has memory the body-natural reads at session-open.

Memory is also where character-consistency is checked across time: if the persona's recent acts diverge from F_χ, the memory-record reveals out-of-character drift to auditors.
