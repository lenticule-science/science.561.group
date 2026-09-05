---
name: relational-state
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



## Definition
- Carrier: relational state sheaf section capturing recognitions, evaluation
  state, and wiring snapshots as a single carrier.
- Purpose: expose the earned relational state to downstream operators without
  bypassing invariants encoded in the carriers.

## Invariants
- Consistency: recognitions, evaluation state, and wiring plan references are
  mutually consistent (bindings align with ports, recognitions align with
  evaluation contexts).
- Section law: behaves as a sheaf section over the underlying site of ports and
  steps; restriction/gluing respect earned locality laws.
- Mutation discipline: updates occur via earned operators (evaluation,
  recognition, wiring); no out-of-band mutation.

## Proof
- Uses: [Recognition Carrier](recognition.md),
  [Evaluation State](evaluation-state.md), and [Wiring Plan](wiring-plan.md) as
  components; sheaf laws from the profile/sheaf acts to enforce section
  behaviour.
- Shows that: bundling recognition, evaluation, and wiring into a single
  relational state carrier yields a stable, type-safe snapshot of computation,
  updated only through earned operators.
