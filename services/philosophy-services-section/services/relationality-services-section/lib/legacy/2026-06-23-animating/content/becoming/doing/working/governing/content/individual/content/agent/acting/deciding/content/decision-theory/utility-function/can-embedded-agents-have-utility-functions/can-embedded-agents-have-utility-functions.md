---
type: question
status: open
see-also:
  - ../objects/utility-function.md
  - teaching/explanations/embedded-agency.md
  - ../theorems/embedded-agent-impossibility.md
---

# Can embedded agents have utility functions?

## The question

The VNM utility theorem assumes preferences are over *outcomes*, where outcomes are external states the agent contemplates from the outside.
For an [embedded-agency](teaching/explanations/embedded-agency.md), the "outcome" includes the agent's own future state (memory, beliefs, source code), and the agent's preferences over outcomes are themselves part of the outcome being evaluated.
Does the VNM framework still apply?
Can an embedded agent be a coherent expected-utility maximizer at all?

## What's at stake

Several arguments suggest *no*:

- **Self-referential preferences.** If the agent's preferences over outcomes depend on what the agent's preferences are in those outcomes, the VNM axioms have ill-defined ranges.
- **Preference over decision algorithms.** FDT-style reasoning treats the algorithm as the choice variable; preferences over algorithms are not preferences over the lotteries VNM axiomatizes.
- **No clean outcome set.** For a self-modifying agent, the outcome includes the modified agent and its future actions — a recursive structure that ill-fits the VNM finite-outcome setting.

Counterarguments:

- **Restricted utility.** An embedded agent can have a utility function over *external* outcomes only (excluding self- referential structure).
  The VNM axioms apply on this restricted domain.
- **Limit utility.** The agent has a utility function in the limit of unbounded computation; bounded approximations satisfy axioms approximately.
- **Cartesian-frame approximation.** For a fixed agent-environment boundary, the agent has well-defined preferences; the boundary may shift but at any one moment VNM applies.

## Why it matters

The alignment problem assumes the AI has *some* utility function (possibly hidden, possibly diverging from its principal's).
If embedded agents do not have utility functions in the VNM sense, the alignment problem must be reformulated.
Mesa-optimization arguments, instrumental-convergence arguments, and most utility-theoretic alignment analysis presuppose a utility function exists; if it doesn't, the analysis needs different substrate.

## Status

Open.
There is no consensus answer.
The literature contains arguments in both directions and proposed restricted frameworks under which utility-function-like objects are recoverable.
