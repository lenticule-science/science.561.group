---

name: "Skill"
description: "Compiled procedural knowledge — a named, repeatable unit of method that an agent can invoke without deliberating about how to do it."
extends: Entity
satisfies: RelationalSystemSkill
---

A **skill** is compiled procedural knowledge — a named, repeatable unit of method that an agent can invoke reliably.
In ACT-R and cognitive science, a skill is procedural memory that runs without deliberation: the agent does not reason about *how* to do it, it just does it.
In robotics, a skill is the middle layer: parameterized, reusable, composed into task plans by a higher-level planner.
In AI agent frameworks, a skill is a named capability with defined preconditions and effects.

The invariant across all three fields: a skill is a discrete, named, deployable unit of method — not a plan, not a goal, not a task, but the compiled knowledge of how to do one specific thing.

A skill does one step of judgment.
It does not sequence, loop, or call other skills.
All structure — chaining, branching across skills, looping — belongs in a [Runbook](runbook.md).
The same skill can appear in multiple runbooks without duplication.
This decouples judgment (skill) from structure (runbook).

## The four kinds of skill

Every skill occupies one position in the work-type classification (see [process](process.md), [procedure](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/procedure.md), [derivation](derivation.md), [inquiry](inquiry.md)).
The classification is a 2×2 based on what is settled before the skill runs:

| | Execution settled | Execution open |
|---|---|---|
| **Meaning settled** | Process — deterministic, no branches | Procedure — known output type, branches on conditions |
| **Meaning open** | Derivation — follows fixed rules, meaning emerges | Inquiry — explores, discovers structure at runtime |

A process-skill always produces the same output from the same input (e.g., formatting a date, computing a hash).
A procedure-skill evaluates conditions and branches (e.g., triage, classification).
A derivation-skill follows fixed rules but the meaning of what it produces is not yet settled (e.g., applying a proof strategy, following a research protocol).
An inquiry-skill explores open territory with no predetermined path (e.g., surveying a new domain, investigating a bug).

The kind matters for composition.
Process-skills are fully automatable — they can become hooks.
Procedure-skills need a decision-maker evaluating conditions.
Derivation-skills need rules but produce novel meaning.
Inquiry-skills need an agent with judgment and cannot be reduced further.

## Location

Skills live as close to their content as possible:

| Path | Who uses it |
|------|-------------|
| `skills/` | any agent in the repo |
| `spec/skills/` | agents working on spec content |
| `math/skills/` | agents working on math content |
| `src/skills/` | agents working on engine code |

A skill may be a single `.md` file or a directory with a main file plus supporting files.
Name a skill by what it produces — full rules in [name](../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/name.md).

## Proposed mathematical reading

The following formalization is proposed but not yet validated against actual skills in the system.

A skill can be read as a triple $(k, A, f)$ where $k$ is the work-type position, $A$ is an input type, and $f : A \to B$ is a judgment map producing output of type $B$.
The work-type $k$ constrains what kind of map $f$ is:

- If $k$ = process, then $f$ is deterministic (same input, same output)
- If $k$ = procedure, then $f$ branches on conditions but output type $B$ is fixed
- If $k$ = derivation, then $f$ follows fixed rules but the meaning of $B$ is still emerging
- If $k$ = inquiry, then $f$ has no fixed-point constraints — structure discovered at runtime

Under this reading, runbooks are composable paths: output type of step $i$ must equal input type of step $i+1$.
Whether this gives a useful category (skills as morphisms, runbooks as paths) is an open question — it depends on whether real skills have well-defined input and output types in the sense needed for composition.

## Open questions

- Does the triple $(k, A, f)$ formalization hold up against the actual skills in `.claude/skills/`?
  Do real skills have well-defined input/output types?
- Can the work-type classification be detected automatically from a skill's behavior, or must it be declared?
- What is the relationship between skill maturity (observation → instinct → skill → hook) and work-type position?
  Does maturity correspond to moving from inquiry toward process?

---

## Supplementary formulation

```yaml
---
id: skills
description: "A Skill is a named, documented method for one unit of agent judgment. It packages what an agent reasons about in one step, occupying exactly one position in the nuclear quartet."
extends: Entity
satisfies: RelationalSystemSkill
---
```

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

**One step of judgment.** A Skill executes exactly one closure-kind position. It does not sequence, loop, or call other skills. All structure — chaining, branching across skills, looping — belongs in a [Runbook](runbook.md).

## What this is

A **Skill** is a named, invokable unit of compiled procedural knowledge — automatic, repeatable, and reliable once acquired.
In ACT-R and cognitive science, a skill is procedural memory that runs without deliberation: the agent does not reason about how to do it, it just does it.
In robotics, a skill is the middle layer: parameterized, reusable, composed into task plans by a higher-level planner.
In AI agent frameworks, a skill is a named capability with defined preconditions and effects that an agent can invoke reliably.
The invariant across all three: a skill is a discrete, named, deployable unit of method — not a plan, not a goal, not a task, but the compiled knowledge of how to do one specific thing.

In this system, a Skill packages what an agent should reason about — the question to answer, the rules to apply, the conditions to branch on, or the territory to explore — in a single, invokable unit.
A Skill is one step of judgment.
Everything else — sequencing, I/O, looping, orchestration — belongs in a [Runbook](runbook.md).

Every Skill occupies exactly one position in the nuclear quartet, declared by [closure-kind](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/library/flatfile-agential-resource-system/library/vocabulary/library/flatfile-agential-resource-system-closure-kind/flatfile-agential-resource-system-closure-kind.md).
The four positions are [Process](process.md), [Procedure](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/procedure.md), [Derivation](derivation.md), [Inquiry](inquiry.md).

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
Name a skill by what it produces — full rules in [name](../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/name.md).

## Open questions
