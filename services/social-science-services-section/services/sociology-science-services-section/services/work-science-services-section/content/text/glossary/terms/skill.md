---
name: Skill
identity: skill
description: "Compiled procedural knowledge: a named, repeatable unit of method that a person or an agent invokes without deliberating about how to do it. One step of judgment of one of the four kinds of work, whose result is its declared output or a structured error."
aliases:
  - skills
  - skillful work
  - skill result
date-created: 2026-03-20
date-modified: 2026-09-27
instance-of: method
kinds: process, procedure, derivation, inquiry
composed-by: runbook
---
A **skill** is compiled procedural knowledge: a named, repeatable unit of
method that a person or an agent invokes without deliberating about how to do
it. Gilbert Ryle's distinction between *knowing that* and *knowing how* (*The
Concept of Mind*, 1949) places it: a skill is knowing how, and cannot be fully
captured in propositions, though propositions guide its development. Aristotle
set *technē*, the knowledge of how to produce something, apart from the
instruments of production. A tool extends what can be done; a skill shapes
how it is done. A hammer lets you drive nails; knowing carpentry tells you
where.

The concept recurs across fields. In ACT-R and cognitive science a skill is
procedural memory that runs without deliberation. In robotics it is the middle
layer, parameterized and reusable, composed into task plans by a planner. In
agent frameworks it is a named capability with preconditions and effects. What
they share: a skill is a discrete, named, deployable unit of method, not a
plan, a goal or a task, but the compiled knowledge of how to do one thing.
[Work](work.md) for which such a method exists is **skillful work**; work
without one is ad hoc, and becomes skillful when someone writes the method down.

A skill has three components: the *knowledge* its work needs (what counts as
good work, the common errors, the standards), the *procedure* that usually
produces good results (what to do first, what to check, when to stop), and the
*judgment* for what the procedure leaves open (when to deviate, when something
is good enough, when to ask). Skills mature along the progression Stuart and
Hubert Dreyfus described (*Mind Over Machine*, 1986): novice, advanced
beginner, competent, proficient, expert. A written skill usually encodes the
competent or proficient stage, where the knowledge can be stated as guidelines
and criteria; see [skill maturity](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/interactive-semioverse-services-section/services/agential-semioverse-services-section/content/text/glossary/terms/skill-maturity.md)
for how a skill matures from inference-heavy toward automated.

## One step of judgment

A skill does one step of judgment. It does not sequence, loop or call a chain
of other skills; that structure belongs to a [runbook](runbook.md), which can
use the same skill in many places without duplicating it. Judgment and structure
stay apart: write the skill first, to understand what judgment is needed, then
the runbook that places it.

Every skill is one of the four kinds of work, declared by its closure kind:

| | Execution settled | Execution open |
|---|---|---|
| **Meaning settled** | [Process](process.md): deterministic, no branches | [Procedure](procedure.md): known output type, branches on conditions |
| **Meaning open** | [Derivation](derivation.md): fixed rules, the judgment emerges | [Inquiry](inquiry.md): explores, structure found at runtime |

The kind decides how a skill runs and what bounds it: a process skill is a
script and can become an automatic hook, a procedure routes deterministically,
a derivation needs a model held to a typed result, and an inquiry needs a model
and a fuel cap. Each kind's entry states its contract. Settling meaning first
(inquiry, procedure, process) or rules first (inquiry, derivation, process)
reaches the same place, because the two closures commute.

## Result

A skill's result is its declared output or a structured error, and the error is
a named output the caller must handle, not an exception. A skill that fails
silently, halts with nothing, or returns garbage instead of an error has
abandoned its caller. An error names its class, one sentence on what went wrong,
and what was being attempted, and may add a recovery hint. The classes:

| Class | Meaning |
|---|---|
| MissingInput | a required input was absent |
| ValidationFailure | an input was present but broke a stated constraint |
| UnexpectedState | the world did not match what the skill assumed |
| SkillNotFound | a called skill does not exist or cannot be found |
| Unresolvable | the skill applied all its rules and reached no output |

By kind: a process emits UnexpectedState when a step's assumed condition fails;
a procedure handles or re-emits every error from what it calls; a derivation
emits Unresolvable when its rules yield no judgment; an inquiry's "nothing
found" is a valid output, and it emits Unresolvable only when it could not be
conducted at all.

## As an agent skill

Agent harnesses realize skills under the Agent Skills open standard: a skill is
a `SKILL.md` file, or a directory holding one with its supporting files, whose
YAML frontmatter names it and describes it. Harnesses load only the
descriptions at start and the body when a skill applies, so the description is
the selector, not a summary: one sentence on what the skill does to what, one
on when it is the right choice. The house adds its closure kind and the
capabilities a skill requires. House skills are not written into a harness by
hand: they are kept with the agency's offices and projected into each harness
by the node (MetroPlat's `claude-harness-project`).

## Proposed formal reading

A skill can be read as a triple $(k, A, f)$: its kind $k$, an input type $A$,
and a judgment map $f : A \to B$ whose output sits in the fiber position the
kind names (a process's output is fixed by both closures, a procedure's by
meaning-closure, a derivation's by execution-closure, an inquiry's by neither;
see [process](process.md)). Runbooks are then composable paths, the output type
of each step being the input type of the next. Whether real skills have input
and output types well enough defined for this to be a category, with skills as
morphisms, is open.

## Open questions

- Can a skill's kind be detected from its behaviour, or must it be declared?
- Does maturity (observation, instinct, skill, hook) correspond to moving from
  inquiry toward process?

## Related

- [Work](work.md), [Runbook](runbook.md), [Skilling](skilling.md)
- [Process](process.md), [Procedure](procedure.md), [Derivation](derivation.md), [Inquiry](inquiry.md)
