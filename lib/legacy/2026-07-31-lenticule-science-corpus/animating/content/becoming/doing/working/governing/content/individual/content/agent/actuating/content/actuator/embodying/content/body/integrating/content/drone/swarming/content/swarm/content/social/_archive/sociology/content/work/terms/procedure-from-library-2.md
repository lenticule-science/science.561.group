---

description: "Work whose meaning is settled but whose execution branches on conditions — you know what you're producing but the path depends on what you encounter."
defines: procedure
aliases: [procedures]
meaning-settled: true
execution-settled: false
resolves-to: process
contrasts-with: process, inquiry, derivation
composes-into: workflow
instance-of: work
date-created: 2026-03-29
---

A procedure is work whose meaning is settled but whose execution path is not.
You know what you are trying to produce.
You do not know which steps you will take to produce it, because that depends on conditions you evaluate as you go.

A procedure branches.
At each decision point, it inspects the current state, evaluates a condition, and routes to the appropriate next step.
The output type is fixed — every branch produces a result of the same kind.
But which branch fires depends on the input and the state encountered during execution.

A medical triage protocol is a procedure.
The output is always a triage category (immediate, delayed, minor, expectant).
Which category a patient receives depends on conditions evaluated at each step: is the patient breathing?
Is the respiratory rate above 30?
Is the radial pulse present?
Each condition routes to a different path, but every path terminates in a named output.

A procedure is more constrained than an [inquiry](./inquiry.md) (which doesn't know what it's looking for) and less constrained than a [process](./process.md) (which has no branches at all).
Applying a procedure under a fixed set of conditions collapses it to a process — once you know which branch will fire, the path is determined.

Procedures compose into [workflows](./workflow.md).
A workflow may contain both processes (fixed steps) and procedures (branching steps).
The workflow's directed graph accommodates both: process nodes have one outgoing edge, procedure nodes have multiple outgoing edges labeled with conditions.

Procedures are what most people mean when they say "follow the process."
Strictly, if there are decisions to make, it is not a process but a procedure.
The distinction matters for automation: a process can be automated completely; a procedure requires either a decision-maker (human or agent evaluating conditions) or a complete enumeration of all possible conditions and their resolutions.

The four types of work:

| | Execution settled | Execution open |
|---|---|---|
| **Meaning settled** | [Process](./process.md) | **Procedure** |
| **Meaning open** | Derivation | [Inquiry](./inquiry.md) |

A procedure sits in the meaning-settled, execution-open quadrant.
Resolving the execution questions (which branch?) under specific conditions collapses it to a process.
