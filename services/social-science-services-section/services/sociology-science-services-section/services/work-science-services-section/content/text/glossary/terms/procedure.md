---
aliases:
  - procedures
  - procedure
description: Work whose meaning is settled but whose execution branches on conditions — you know what you're producing but the path depends on what you encounter.
identity: procedure
name: Procedure
date-created: 2026-03-29
relations:
  instance-of: work
  contrasts-with:
    - process
    - derivation
    - inquiry
  requires: flatfile-agent-resource-system-skill-result
  properties:
    - meaning-settled=true
    - execution-settled=false
extends: FlatfileAgentialResourceSystemSkillfulWork
params:
  output-type: relational-universe
  branching-condition: relational-universe-morphism
output: relational-universe
ast:
  meaning-settled-element:
    - relational-history-saturating-nucleus:
        - output-type
    - branching-condition:
        - output-type
meaning-settled: true
execution-settled: false
resolves-to: process
contrasts-with: process, inquiry, derivation
composes-into: workflow
instance-of: work
id: procedure
defines: Procedure
date-modified: 2026-03-19
---
A procedure is work whose meaning is settled but whose execution path is not. You know what you are trying to produce. You do not know which steps you will take to produce it, because that depends on conditions you evaluate as you go.

A procedure branches. At each decision point, it inspects the current state, evaluates a condition, and routes to the appropriate next step. The output type is fixed — every branch produces a result of the same kind. But which branch fires depends on the input and the state encountered during execution.

A medical triage protocol is a procedure. The output is always a triage category (immediate, delayed, minor, expectant). Which category a patient receives depends on conditions evaluated at each step: is the patient breathing? Is the respiratory rate above 30? Is the radial pulse present? Each condition routes to a different path, but every path terminates in a named output.

A procedure is more constrained than an [inquiry](./inquiry.md) (which doesn't know what it's looking for) and less constrained than a [process](./process.md) (which has no branches at all). Applying a procedure under a fixed set of conditions collapses it to a process — once you know which branch will fire, the path is determined.

Procedures compose into [workflows](./workflow.md). A workflow may contain both processes (fixed steps) and procedures (branching steps). The workflow's directed graph accommodates both: process nodes have one outgoing edge, procedure nodes have multiple outgoing edges labeled with conditions.

Procedures are what most people mean when they say "follow the process." Strictly, if there are decisions to make, it is not a process but a procedure. The distinction matters for automation: a process can be automated completely; a procedure requires either a decision-maker (human or agent evaluating conditions) or a complete enumeration of all possible conditions and their resolutions.

The four types of work:

| | Execution settled | Execution open |
|---|---|---|
| **Meaning settled** | [Process](./process.md) | **Procedure** |
| **Meaning open** | Derivation | [Inquiry](./inquiry.md) |

A procedure sits in the meaning-settled, execution-open quadrant. Resolving the execution questions (which branch?) under specific conditions collapses it to a process.

## Related

- [Derivation](./derivation.md) — execution-closed, meaning-open: applies fixed inference rules; a Procedure applies conditional routing.
- [FlatfileAgentResourceSystemSkillfulWork](../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/services/agent-computer-platform-system-engineering-services-section/services/flatfile-agent-resource-system-engineering-services-section/content/text/glossary/terms/flatfile-agent-resource-system-skillful-work.md) — all four positions partition the nuclear quartet.

## Formal definition

A **Procedure** is an element $W \in \mathrm{Fix}(\sigma_t) \setminus H^*_t$:

$$\sigma_t(W) = W \quad\text{and}\quad \Delta_t(W) \neq W$$

Meaning-closed ($\sigma_t$-fixed): the output type is settled; the procedure knows what it is trying to produce. Execution-open ($\Delta_t$-unfixed): the execution path is determined at runtime by branching on conditions.

As a [Skill](./skills.md) type, a Procedure is a morphism $f : A \to B$ where $f$ contains decision points — $f(a) \in \mathrm{Fix}(\sigma_t) \setminus H^*_t$ — the output type $B$ is known but which branch produces it depends on $a$.

Applying $\Delta_t$ to $W$ closes the remaining execution-openness: $\Delta_t(W) \in H^*_t$, converting the Procedure into a [Process](./process.md). See [process.md](./process.md) for the full quartet table.

## What this is

A **Procedure** is a named, specified way to carry out an activity — its output type is fixed but its execution path is determined by conditions evaluated at runtime.
This is what "procedure" means in ISO quality management and formal methods: a documented method where the goal is settled and the route branches on the situation encountered.

In this system, a Procedure is [FlatfileAgentResourceSystemSkillfulWork](../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/services/agent-computer-platform-system-engineering-services-section/services/flatfile-agent-resource-system-engineering-services-section/content/text/glossary/terms/flatfile-agent-resource-system-skillful-work.md) in which meaning-closure (σ) has been applied but execution-closure (Δ) has not.
The procedure knows what it is trying to do and what its output type is.
It does not yet know which path it will take to get there — that depends on conditions it evaluates as it runs.
It branches on those conditions and dispatches to further work.

The mathematical position is Fix(σ)∖H* — inside meaning-closure but outside the doubly-fixed intersection.
Applying execution-closure (Δ) to a Procedure lands it in [Process](./process.md): once all branches resolve to fixed execution paths, the procedure becomes fully determined.

## What meaning-settlement means

Meaning-closure (σ) means the Procedure knows its domain and its output type.
Each branch produces a named, typed output.
No branch can terminate without naming what it produced.
The output is the stabilized image of σ applied to the raw work.

Execution-openness (¬Δ) means the Procedure must inspect conditions to choose a path.
It reads diagnostic state, evaluates criteria, and routes accordingly.
The execution path is not fixed before it runs — it is determined during the run.

## The other three positions

## Open questions

- Formal proof that σ-closure alone is sufficient to produce a well-typed output — blocked by: skill-algebra construction.
