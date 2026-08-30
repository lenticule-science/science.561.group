---
id: procedure
description: "A Procedure is an operation whose meaning is settled but whose execution path is not: it branches on conditions to determine which named output to produce. Corresponds to Fix(σ)∖H* in the nuclear quartet."
defines: Procedure
extends: FlatfileAgentResourceSystemSkillfulWork
date-modified: 2026-03-19
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
---

# Procedure

## Formal definition

A **Procedure** is an element $W \in \mathrm{Fix}(\sigma_t) \setminus H^*_t$:

$$\sigma_t(W) = W \quad\text{and}\quad \Delta_t(W) \neq W$$

Meaning-closed ($\sigma_t$-fixed): the output type is settled; the procedure knows what it is trying to produce. Execution-open ($\Delta_t$-unfixed): the execution path is determined at runtime by branching on conditions.

As a [Skill](./skills.md) type, a Procedure is a morphism $f : A \to B$ where $f$ contains decision points — $f(a) \in \mathrm{Fix}(\sigma_t) \setminus H^*_t$ — the output type $B$ is known but which branch produces it depends on $a$.

Applying $\Delta_t$ to $W$ closes the remaining execution-openness: $\Delta_t(W) \in H^*_t$, converting the Procedure into a [Process](./process.md). See [process.md](./process.md) for the full quartet table.

## What this is

A **Procedure** is a named, specified way to carry out an activity — its output type is fixed but its execution path is determined by conditions evaluated at runtime.
This is what "procedure" means in ISO quality management and formal methods: a documented method where the goal is settled and the route branches on the situation encountered.

In this system, a Procedure is [FlatfileAgentResourceSystemSkillfulWork](../../../../../../../engineering-science-services-section/services/technology-science-services-section/content/text/glossary/terms/flatfile-agent-resource-system-skillful-work.md) in which meaning-closure (σ) has been applied but execution-closure (Δ) has not.
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

- [Process](./process.md) — both closures applied: the result of closing all branches of a Procedure into fixed execution paths.
- [Derivation](../../../../../../../sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/derivation.md) — execution-closed, meaning-open: applies fixed inference rules; a Procedure applies conditional routing.
- [Inquiry](../../../../../../../sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/inquiry.md) — neither closure applied: a Procedure with settled meaning is further along than an Inquiry.
- [FlatfileAgentResourceSystemSkillfulWork](../../../../../../../engineering-science-services-section/services/technology-science-services-section/content/text/glossary/terms/flatfile-agent-resource-system-skillful-work.md) — all four positions partition the nuclear quartet.

## Open questions

- Formal proof that σ-closure alone is sufficient to produce a well-typed output — blocked by: skill-algebra construction.
