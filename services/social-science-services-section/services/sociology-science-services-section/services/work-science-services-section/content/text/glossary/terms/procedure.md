---
aliases:
  - procedures
description: Work whose meaning is settled but whose execution branches on conditions — you know what you're producing but the path depends on what you encounter.
identity: procedure
name: Procedure
date-created: 2026-03-29
date-modified: 2026-09-27
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
---
A procedure is work whose meaning is settled but whose execution path is not. You know what you are trying to produce. You do not know which steps you will take to produce it, because that depends on conditions you evaluate as you go.

A procedure branches. At each decision point, it inspects the current state, evaluates a condition, and routes to the appropriate next step. The output type is fixed — every branch produces a result of the same kind. But which branch fires depends on the input and the state encountered during execution.

A medical triage protocol is a procedure. The output is always a triage category (immediate, delayed, minor, expectant). Which category a patient receives depends on conditions evaluated at each step: is the patient breathing? Is the respiratory rate above 30? Is the radial pulse present? Each condition routes to a different path, but every path terminates in a named output.

A procedure is more constrained than an [inquiry](./inquiry.md) (which doesn't know what it's looking for) and less constrained than a [process](./process.md) (which has no branches at all). Applying a procedure under a fixed set of conditions collapses it to a process — once you know which branch will fire, the path is determined.

Procedures compose into [workflows](./workflow.md). A workflow may contain both processes (fixed steps) and procedures (branching steps). The workflow's directed graph accommodates both: process nodes have one outgoing edge, procedure nodes have multiple outgoing edges labeled with conditions.

This is what "procedure" means in ISO quality management and formal methods: a documented method whose goal is settled and whose route branches on the situation met.

Procedures are what most people mean when they say "follow the process." Strictly, if there are decisions to make, it is not a process but a procedure. The distinction matters for automation: a process can be automated completely; a procedure requires either a decision-maker (human or agent evaluating conditions) or a complete enumeration of all possible conditions and their resolutions.

The four types of work:

| | Execution settled | Execution open |
|---|---|---|
| **Meaning settled** | [Process](./process.md) | **Procedure** |
| **Meaning open** | Derivation | [Inquiry](./inquiry.md) |

A procedure sits in the meaning-settled, execution-open quadrant. Resolving the execution questions (which branch?) under specific conditions collapses it to a process.

## Formal definition

A **Procedure** is an element $W \in \mathrm{Fix}(\sigma_t) \setminus H^*_t$:

$$\sigma_t(W) = W \quad\text{and}\quad \Delta_t(W) \neq W$$

Meaning-closed ($\sigma_t$-fixed): the output type is settled; the procedure knows what it is trying to produce. Execution-open ($\Delta_t$-unfixed): the execution path is determined at runtime by branching on conditions.

As a [Skill](./skill.md) type, a Procedure is a morphism $f : A \to B$ where $f$ contains decision points — $f(a) \in \mathrm{Fix}(\sigma_t) \setminus H^*_t$ — the output type $B$ is known but which branch produces it depends on $a$.

Applying $\Delta_t$ to $W$ closes the remaining execution-openness: $\Delta_t(W) \in H^*_t$, converting the Procedure into a [Process](./process.md). See [process.md](./process.md) for the full quartet table.

## What meaning-settlement means

Meaning-closure (σ) means the Procedure knows its domain and its output type.
Each branch produces a named, typed output.
No branch can terminate without naming what it produced.
The output is the stabilized image of σ applied to the raw work.

Execution-openness (¬Δ) means the Procedure must inspect conditions to choose a path.
It reads diagnostic state, evaluates criteria, and routes accordingly.
The execution path is not fixed before it runs — it is determined during the run.

## As a skill

A skill declared `closure-kind: procedure` routes: its prerequisites are
settled and what stays open is which next step follows. It is still
deterministic, since the same settled state routes to the same next step every
time, so it needs no model and no fuel cap; it is realized as a dispatch
decision, a control-flow branch or a routing rule. A procedure skill:

- names its output type, so the output can be the next skill's input;
- ends every branch in a call to a named skill or a halt;
- does no inline work inside a branch: inline work there is a process
  fragment and is extracted;
- dispatches the downstream work rather than doing it, and may loop provided
  each pass names an intermediate output.

A routing choice that needs open-ended exploration to reach has left
procedure and become inquiry. The discipline is either to derive the input
the routing needs beforehand, so the choice is a procedure again, or to
declare the whole an inquiry rather than smuggle exploration through a
procedure's deterministic contract.

## Open questions

- Formal proof that σ-closure alone is sufficient to produce a well-typed output — blocked by: skill-algebra construction.

## Related

- [Derivation](./derivation.md) — execution-closed, meaning-open: applies fixed inference rules; a Procedure applies conditional routing.
- [FlatfileAgentResourceSystemSkillfulWork](./skill.md) — all four positions partition the nuclear quartet.
