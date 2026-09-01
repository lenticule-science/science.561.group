---
id: skills
description: "A Skill is a named, documented method for one unit of agent judgment. It packages what an agent reasons about in one step, occupying exactly one position in the nuclear quartet."
extends: Entity
satisfies: RelationalSystemSkill
---

# Skill

## Formal definition

A **Skill** is a triple $(k, A, f)$:

$$\text{Skill} = (k \in \{P, Q, D, I\},\; A,\; f : [A]_t \to [B]_t)$$

where:
- $k$ is the **closure-kind** — which position in the nuclear quartet the skill occupies
- $A$ is the **input type** and $B$ the **output type** — types of elements in fibers of $H$
- $f$ is the **judgment** — a map from input to output within the fiber at history $t$

The closure-kind $k$ constrains the nuclear position of $f$'s output:

| $k$ | Fiber position | Nuclear condition on $f(a)$ |
|---|---|---|
| Process ($P$) | $H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ | $\sigma_t(f(a)) = f(a)$ and $\Delta_t(f(a)) = f(a)$ — fully settled |
| Procedure ($Q$) | $\mathrm{Fix}(\sigma_t) \setminus H^*_t$ | $\sigma_t(f(a)) = f(a)$ but $\Delta_t(f(a)) \neq f(a)$ — conditionally branches |
| Derivation ($D$) | $\mathrm{Fix}(\Delta_t) \setminus H^*_t$ | $\Delta_t(f(a)) = f(a)$ but $\sigma_t(f(a)) \neq f(a)$ — inferred, not yet saturated |
| Inquiry ($I$) | raw $H_t$ | no fixed-point condition — structure discovered at runtime |

**Morphism reading.** A Skill is a morphism $f : A \to B$ in the category $\mathcal{K}$ whose objects are fiber types and whose morphisms are judgment maps. Runbooks are composable paths in $\mathcal{K}$: output type of step $i$ must equal input type of step $i+1$.

**One step of judgment.** A Skill executes exactly one closure-kind position. It does not sequence, loop, or call other skills. All structure — chaining, branching across skills, looping — belongs in a [Runbook](./runbook.md).

## What this is

A **Skill** is a named, invokable unit of compiled procedural knowledge — automatic, repeatable, and reliable once acquired.
In ACT-R and cognitive science, a skill is procedural memory that runs without deliberation: the agent does not reason about how to do it, it just does it.
In robotics, a skill is the middle layer: parameterized, reusable, composed into task plans by a higher-level planner.
In AI agent frameworks, a skill is a named capability with defined preconditions and effects that an agent can invoke reliably.
The invariant across all three: a skill is a discrete, named, deployable unit of method — not a plan, not a goal, not a task, but the compiled knowledge of how to do one specific thing.

In this system, a Skill packages what an agent should reason about — the question to answer, the rules to apply, the conditions to branch on, or the territory to explore — in a single, invokable unit.
A Skill is one step of judgment.
Everything else — sequencing, I/O, looping, orchestration — belongs in a [Runbook](./runbook.md).

Every Skill occupies exactly one position in the nuclear quartet, declared by [closure-kind](flatfile-agent-resource-system-closure-kind.md).
The four positions are [Process](./process.md), [Procedure](./procedure.md), [Derivation](./derivation.md), [Inquiry](./inquiry.md).

## Relationship to Runbooks

A Runbook sequences skills.
A Skill does not sequence itself — it does not know what comes before or after.
The same Skill can appear in multiple Runbooks without duplication.
This decouples judgment (Skill) from structure (Runbook).

## Location

Skills live as close to their content as possible:

| Path | Who uses it |
|------|-------------|
| `skills/` | any agent in the repo |
| `spec/skills/` | agents working on spec content |
| `math/skills/` | agents working on math content |
| `src/skills/` | agents working on engine code |

A Skill MAY be a single `.md` file or a directory with a main file plus supporting files.
Name a skill by what it produces — full rules in [name](name.md).

## Open questions
