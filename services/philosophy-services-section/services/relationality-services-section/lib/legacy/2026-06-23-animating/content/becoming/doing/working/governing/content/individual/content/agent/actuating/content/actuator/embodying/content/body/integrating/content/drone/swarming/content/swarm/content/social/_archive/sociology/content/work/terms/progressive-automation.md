---
description: "The principle that every completed task should encode itself so a less capable agent — or a deterministic program — can do it next time."
defines: progressive-automation
aliases: [progressive automation, automation settlement, settlement policy]
instance-of: policy
drives: settlement-path
related: [process, procedure, formality-level, skills, runbook]
traditions: [lean-manufacturing, continuous-improvement, kaizen]
date-created: 2026-04-05
---

**Progressive automation** is the principle that every completed task should produce not just its output but the means by which a less capable agent can replicate it.
Work that required expert judgment the first time should require less judgment the second time, and eventually none.

The mechanism is encoding.
When an agent solves a problem through inference — reading context, weighing options, making judgment calls — the solution path gets captured as a reusable artifact: a skill file, a script, a runbook, a hook, a frontmatter pattern.
The artifact encodes the judgment so that future executions can follow the encoded path rather than re-deriving it.

This produces a characteristic settlement sequence.
A task begins as [inquiry](./inquiry.md) — open-ended, requiring a capable agent.
Once solved, it becomes a [procedure](./procedure.md) documented in a skill or runbook.
With further encoding, the procedure becomes a [process](./process.md) — a deterministic script or hook.
The progression runs:

**Agent → Skill → Tool → Hook**

At each stage, the work moves from inference to computation.
An agent exercises judgment within a context window.
A skill constrains that judgment with documented patterns.
A tool replaces judgment with a program.
A hook triggers the program automatically without any agent involvement.

The principle has roots in lean manufacturing's concept of *jidoka* — building quality checks into the production process itself rather than relying on inspection.
Toyota's practice of stopping the line to fix problems and then modifying the process so the problem cannot recur is the same pattern: solve it once with human judgment, then encode the solution into the machinery.
W.
Edwards Deming's distinction between special-cause and common-cause variation applies: progressive automation converts special-cause interventions (one-off agent decisions) into common-cause process improvements (encoded scripts and rules).

Not all work can be automated.
Research, synthesis, architectural judgment, and novel problem-solving resist encoding because their value comes from responding to situations that have not been seen before.
Progressive automation applies to the *repeatable* fraction of work — and the claim is that this fraction is larger than most organizations recognize.
Identifying which components of a work unit are at which [formality level](./formality-level.md) reveals where the automatable fraction lies.
