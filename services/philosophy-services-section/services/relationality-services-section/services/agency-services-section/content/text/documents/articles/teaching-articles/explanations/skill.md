---
name: skill
description: A reusable, bounded competence an agent can invoke to perform one specific kind of work — a record carrying the competence's preconditions, body, postconditions, and witness discipline.
status: draft
title: skill
---

A skill is a competence written down so it can be invoked, not just performed.
A surgeon's knowledge of anatomy is a skill in the older sense — the *technē* of Aristotle, the "knowing how" Gilbert Ryle distinguished from "knowing that" — but most of it cannot be put on paper.
An authored skill is the slice of competence whose preconditions, procedure, and outcomes can be *captured* clearly enough that an agent reading the record can invoke the competence reliably, and an auditor reading the witness can verify it fired.

A skill is therefore not the *whole* of a competence.
It is the bounded surface of one — the part written down because writing it down has more upside than the loss of nuance writing-down always entails.

## What a skill is for

A skill exists so that a character can perform a specific kind of work without rediscovering the work each time.
A skill records what to know before acting, the ordered steps to take, and what should be true after.
A skill that lacks any of these is not yet a skill; it is notes toward one.

Dispatch matches against skills, not against competence in the abstract.
When the dispatcher matches incoming work to a [character](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/code/structures/character.md), what it actually matches is the character's declared `skills:` (the character says: I can do these) and the work's required-skill predications (the work says: this needs to be done).
Both sides reference the same skill records.
The skill is the common ground through which work and capability meet.

## What a skill is not

A skill is not a tool.
A tool extends what a character can do (a hammer drives nails); a skill shapes how the character does work (carpentry tells you where to put them).
The MCP harness exposes skills *as* tools at the Claude Code surface, but this is a presentation convenience — the skill is the underlying record, the tool is its session-visible projection.

A skill is not a rule.
A rule fires on every applicable state without invocation; a skill is invoked.
The closure-rule system runs continuously; skills are what an agent *chooses to call* against the current cell-graph.

A skill is not an instruction.
An instruction is what a captain or another agent tells someone to do once.
A skill is a recorded, reusable surface — the investment in not having to give the instruction again.

A skill is not a runbook in any sense that excludes it from being a skill.
The older recipe-system distinguished skills (one bounded procedure) from runbooks (compositions of procedures); the present encoding dissolves that boundary.
A skill may invoke other skills; the composition is recorded as the `composes:` field on its `_index.md`.
Skills can be runbooks; runbooks remain skills.

## The shape of a skill record

Every skill lives at `doing/working/hacking/doing/working/skills/<slug>/`.
The directory carries:

- `SKILL.md` — the Claude Code surface.
  Bounded by Claude Code's two-sentence-description rule.
  Read verbatim into a session's tool prompt.
  Carries name, two-sentence description, and three body sections (Requirements, Steps, Outcomes).
- `_index.md` — the companion record.
  Holds the predications about the skill that the bounded `SKILL.md` cannot carry: composition edges, closure-position, operation-kind, preconditions and postconditions as shape references, scope, required-powers.
- `scripts/*.mjs` (optional) — the executable bodies for script-runtime skills.
- `examples/` (optional) — sample inputs and expected outputs.
- `templates/` (optional) — templates the skill generates output from.

The two-file split exists because the external (Claude Code) surface and the internal (cell-graph) surface have different bounds and different purposes.
The two files describe the same entity from two surfaces; both are normative.

## The four positions and the seven kinds

Every skill occupies one **closure-position** — one of process, procedure, derivation, inquiry — which says where in the settlement lattice the skill's work lands.
A process skill is fully-settled work (the rule fires deterministically; the output is known in advance); an inquiry skill is fully-open (the meaning of the output is part of what the skill is for finding out).
Procedure and derivation are the intermediate positions: procedure has fixed steps but the output's meaning depends on what is encountered; derivation has open steps but the output's meaning is fixed by the rule the skill applies.

The closure-position is structural.
A skill that crosses positions is two skills.

Orthogonally, every skill has one **operation-kind** — observation, guard, accounting, query, mutation, analysis, or learning — which says what kind of cell-graph operation the skill's body composes.
A mutation skill writes cells; a query skill reads them; an analysis skill inspects a region and summarizes.
Observation records what happened; guard checks admissibility; accounting tracks resource flows; learning is the self-composition kind, where the skill operates on existing records to produce new ones.

The two classifications cross-classify.
A skill is one of 4 × 7 = 28 (position, kind) pairs.
Not all combinations are common; some are rare.
A `process`-position skill is most often a `mutation` or `observation` kind; an `inquiry`-position skill is most often an `analysis` or `learning` kind.
But the structural orthogonality matters: collapsing them into one field (as some earlier source files did, under `closure-kind`) loses the distinction between *what the skill is doing categorically* and *what kind of cell-graph operation it composes*.

## The body and the recipe-normal form

The older agent-skill-recipe-system theory named a **recipe-normal form** for executable skills: four slots, orient, act, verify, witness.
A skill's body should fit into these four slots; if it does not, the skill is doing too much (excessive radius) or is incompletely specified.

The operative spec compresses the four slots into three section names: Requirements (where orient happens), Steps (where act and verify happen), Outcomes (which the harness witnesses through jsonl emission).
The compression is faithful, not lossy: the recipe-normal form remains the discipline a skill author should follow while writing the three sections.
Reading a skill back, an auditor can recover the four slots from the three sections without ambiguity.

## Scripts and inference

A skill's body is one of two kinds.
A **script-runtime** skill delegates the body to a script at `scripts/<name>.mjs`; the `Steps` section names the script and its arguments; the recipe collapses to typed-input → script-call → typed-output.
An **inference-runtime** skill carries the act in agent judgment; the `Steps` section names what to inspect, what relation to infer, and when to refuse for insufficient evidence.

Scripts are not first-class records in this round.
They are referenced from `SKILL.md` but carry no frontmatter, and their bodies cannot be inspected categorically the way skill records can.
This is a known gap — agential self-generation (the discipline that every operative element is recorded as a categorical object) wants scripts promoted; the shape catalog for executable bodies is not yet authored, so the promotion is deferred.
The gap is named, not pretended-resolved.

## Composition

Skills compose.
A skill that names another skill as one of its steps **composes** that skill.
The composition is recorded as the `composes:` list on `_index.md`; the DAG of composition over the skill catalog must be acyclic.

Composition is *static* — recorded on the call surface, not on the call trace.
A skill may compose a sub-skill it invokes only on some paths; `composes` records the static surface so the dispatcher can pre-compute what a session might fire, not just what fires this run.

Sequential and parallel composition are not distinguished at the frontmatter level.
The Steps section describes the order or the parallelism where relevant.
A future spec round may elevate the distinction if it turns out to matter for dispatch; this round leaves it implicit.

## Invocation produces a witness

Every skill invocation produces a witness — a jsonl line written by the MCP harness to `code/logs/tool-uses/<YYYY-MM-DD>.jsonl`, recording timestamp, agent, skill, arguments, result summary, duration, and success flag.
The witness is the record that the skill fired; it is the input the audit and replay machinery reads.

The witness is emitted by the harness, not authored by the skill.
The skill's `Outcomes` section says what is *true after* successful completion; the witness records *that* the completion happened.

This is why the recipe-normal form's witness slot does not appear as a fourth body section in `SKILL.md`.
The witness is the harness's job, not the skill's.
The skill's job is to make the witness *valid* by ensuring the postconditions hold when it claims success.

## Naming

A skill's name is the gerund form of a verb plus an English noun phrase that scopes its object: `auditing-the-citations`, `writing-an-essay`, `enforcing-the-specification-for-rust-scripts`.
The first kebab-component is the gerund (`auditing`, `writing`, `enforcing`) and resolves to a transformer record at `code/transformers/<verb>.md`.

The skill catalog and the agent catalog share this vocabulary.
The same transformer `audit` heads both the skill name (`auditing-the-citations`, via its gerund form) and the corresponding agent name (`auditor-of-the-citations`, via its agent-noun form, recorded as the transformer's `agent-noun` field).
Skill and agent are linguistically parallel: skill is *the act* (gerund-headed); agent is *the actor* (agent-noun-headed).
See [[agent]] for the agent-side discipline.

Every content word in the slug resolves to a record.
Verbs (gerund head) resolve to transformers at `code/transformers/`; nouns resolve to structures at `code/structures/` (with `aliases:` for morphological variation); adjectives resolve to concepts at `prose/concepts/` (with `aliases:` likewise).
A concept may point to a structure via `also-noun:`, in which case the adjective also carries that structure's content.
The expressive capacity of skill names is exactly what the earned vocabulary supports.
