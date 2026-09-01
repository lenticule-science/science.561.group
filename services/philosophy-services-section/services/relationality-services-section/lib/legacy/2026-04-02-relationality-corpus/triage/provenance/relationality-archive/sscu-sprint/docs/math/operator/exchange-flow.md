---
name: exchange-flow
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Applies a crossflow exchange when legal, producing shuffle-equivalent outcomes.

## Definition
- Inputs: two flow segments and an [CrossFlow Exchange](../structure/crossflow-exchange.md)
  witness.
- Output: [Trace Shuffle Class](../structure/trace-shuffle-class.md) representing
  the exchanged interleavings.
- Behaviour: swap flow order when allowed; otherwise emit violation/neutral.

## Invariants
- Commutation: valid exchanges yield equivalent traces up to shuffle/nucleus.
- Detection: rejects exchanges that violate commutation constraints.

## Proof
- Uses: crossflow exchange data to decide swaps.
- Produces: shuffle class of exchanged flows.
- Shows that: flow swapping is controlled by earned exchange laws.
