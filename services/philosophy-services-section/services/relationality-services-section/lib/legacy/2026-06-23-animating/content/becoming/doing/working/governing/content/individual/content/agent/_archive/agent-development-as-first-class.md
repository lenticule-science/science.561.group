---
type: question
status: open
---

# Is agent-driven development a first-class case or a special case?

When an AI agent (or a human-and-agent pair) develops software, is the activity *the same activity* as solo-human development with different operators, or is it a different activity that happens to produce similar artifacts?

The substrate framing suggests the former: an increment to a codebase cell is an increment regardless of which agent dispatched it; the [witness-as-increment](../../../../../predicated-computing/theories/agential-orchestration-platform/_index.md) discipline does not distinguish human and AI sources at the substrate level.
But the *witness language* may differ — an AI's test-run is a different kind of evidence than a human's compilation-success — and so the activity's classification under the visible/invisible automorphism dichotomy may be agent-relative.

A second consideration: agent-driven development typically produces *more* artifact transitions per unit time, and a different distribution of transition kinds.
If refactoring is what an IDE's automated tools used to do, agent-driven refactoring is what an LLM does when asked.
The discipline of when to trust an agent-driven refactor — what evidence settles the structure-preservation claim — is itself a new sub-question.

## Why this matters

The 561 substrate is built for human-and-agent collaboration.
A theory of software development that treats agents as a special case will miss the structure of how the substrate actually evolves.
A theory that treats them as first-class will need to be specific about what differs (witness-language choice, evidence patterns, dispatch rates) without re-deriving the substrate operations.
