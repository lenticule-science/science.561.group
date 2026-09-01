---

title: "Skill"
description: "Compiled procedural knowledge — a named, repeatable unit of method that an agent can invoke without deliberating about how to do it."
extends: Entity
satisfies: RelationalSystemSkill
---

A **skill** is compiled procedural knowledge — a named, repeatable unit of method that an agent can invoke reliably. In ACT-R and cognitive science, a skill is procedural memory that runs without deliberation: the agent does not reason about *how* to do it, it just does it. In robotics, a skill is the middle layer: parameterized, reusable, composed into task plans by a higher-level planner. In AI agent frameworks, a skill is a named capability with defined preconditions and effects.

The invariant across all three fields: a skill is a discrete, named, deployable unit of method — not a plan, not a goal, not a task, but the compiled knowledge of how to do one specific thing.

A skill does one step of judgment. It does not sequence, loop, or call other skills. All structure — chaining, branching across skills, looping — belongs in a [Runbook](./runbook.md). The same skill can appear in multiple runbooks without duplication. This decouples judgment (skill) from structure (runbook).

## The four kinds of skill

Every skill occupies one position in the work-type classification (see [process](./process.md), [procedure](./procedure.md), [derivation](./derivation.md), [inquiry](./inquiry.md)). The classification is a 2×2 based on what is settled before the skill runs:

| | Execution settled | Execution open |
|---|---|---|
| **Meaning settled** | Process — deterministic, no branches | Procedure — known output type, branches on conditions |
| **Meaning open** | Derivation — follows fixed rules, meaning emerges | Inquiry — explores, discovers structure at runtime |

A process-skill always produces the same output from the same input (e.g., formatting a date, computing a hash). A procedure-skill evaluates conditions and branches (e.g., triage, classification). A derivation-skill follows fixed rules but the meaning of what it produces is not yet settled (e.g., applying a proof strategy, following a research protocol). An inquiry-skill explores open territory with no predetermined path (e.g., surveying a new domain, investigating a bug).

The kind matters for composition. Process-skills are fully automatable — they can become hooks. Procedure-skills need a decision-maker evaluating conditions. Derivation-skills need rules but produce novel meaning. Inquiry-skills need an agent with judgment and cannot be reduced further.

## Location

Skills live as close to their content as possible:

| Path | Who uses it |
|------|-------------|
| `skills/` | any agent in the repo |
| `spec/skills/` | agents working on spec content |
| `math/skills/` | agents working on math content |
| `src/skills/` | agents working on engine code |

A skill may be a single `.md` file or a directory with a main file plus supporting files. Name a skill by what it produces — full rules in [name](name.md).

## Proposed mathematical reading

The following formalization is proposed but not yet validated against actual skills in the system.

A skill can be read as a triple $(k, A, f)$ where $k$ is the work-type position, $A$ is an input type, and $f : A \to B$ is a judgment map producing output of type $B$. The work-type $k$ constrains what kind of map $f$ is:

- If $k$ = process, then $f$ is deterministic (same input, same output)
- If $k$ = procedure, then $f$ branches on conditions but output type $B$ is fixed
- If $k$ = derivation, then $f$ follows fixed rules but the meaning of $B$ is still emerging
- If $k$ = inquiry, then $f$ has no fixed-point constraints — structure discovered at runtime

Under this reading, runbooks are composable paths: output type of step $i$ must equal input type of step $i+1$. Whether this gives a useful category (skills as morphisms, runbooks as paths) is an open question — it depends on whether real skills have well-defined input and output types in the sense needed for composition.

## Open questions

- Does the triple $(k, A, f)$ formalization hold up against the actual skills in `.claude/skills/`? Do real skills have well-defined input/output types?
- Can the work-type classification be detected automatically from a skill's behavior, or must it be declared?
- What is the relationship between skill maturity (observation → instinct → skill → hook) and work-type position? Does maturity correspond to moving from inquiry toward process?
