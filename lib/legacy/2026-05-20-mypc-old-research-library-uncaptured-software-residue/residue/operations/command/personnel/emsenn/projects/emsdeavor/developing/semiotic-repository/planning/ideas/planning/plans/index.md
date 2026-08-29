---
title: "Plans"
date-created: 2026-03-07T00:00:00
type: specification
authors:
  - claude
keywords:
  - ProjectManagement
  - AgentialSemioverse
description: "Specification for how plans, proposals, and decisions are tracked in the ASR."
---

How planning documents work in this repository. Influenced by FOSS
planning practices: Python's PEP process, Rust's RFC process,
Architecture Decision Records (ADRs), and IETF RFC 2026. Research
at `slop/foss-planning-practices-survey.md`.

## The problem

Agent sessions generate plans, roadmaps, and decisions that live only
in conversation context. When a session ends, the rationale behind
decisions disappears. Future sessions either reinvent the same plans
or work from stale vibes.

## Three kinds of planning documents

### 1. Plans (what needs to be done)

A plan describes a concrete piece of work: what it is, why it matters,
what the steps are, and what "done" looks like. Plans are filed here
in `plans/` with a sequential number prefix.

**Format**: `NNNN-short-title.md` (see `_template.md`)

```yaml
---
title: "Plan title"
date-created: 2026-01-01T00:00:00
authors: [claude]
status: draft | proposed | accepted | active | completed | abandoned | deferred
priority: critical | high | medium | low
depends-on: []          # list of plan numbers, e.g. [0004]
milestone: ""           # optional named milestone
---
```

**Sections**:

- **Summary** — one paragraph, what and why
- **Motivation** — why this work matters now
- **Steps** — numbered, concrete, verifiable
- **Done when** — acceptance criteria
- **Dependencies** — what must exist first
- **Log** — dated entries recording progress and decisions as work
  happens

Plans are not instructions. An agent reads a plan only when emsenn
directs it to. Plans record intent and track progress; they do not
autonomously trigger work.

### 2. Decisions (what was decided and why)

A decision record captures a choice that affects how the repository
works. Modeled on Architecture Decision Records (ADRs). Filed in
`plans/decisions/`.

**Format**: `NNNN-short-title.md`

```yaml
---
title: "Decision title"
date-created: 2026-01-01T00:00:00
authors: [emsenn]
status: accepted | superseded | deprecated
superseded-by: NNNN  # if applicable
---
```

**Sections**:

- **Context** — what situation prompted the decision
- **Decision** — what was decided
- **Consequences** — what follows from this decision
- **Alternatives considered** — what was rejected and why

Decision records are append-only. When a decision is superseded, mark
it as such and link to the new decision. Do not edit the original.

### 3. Questions (what is unresolved)

Questions already exist as first-class objects in the ASR (see
[questions as first-class objects](../theory/questions-as-first-class-objects.md)).
Planning-level questions — "should we do X before Y?" or "what is the
right approach for Z?" — go in `plans/questions/` using the same
format as discipline-level questions.

## Lifecycle

```
draft → proposed → accepted → active → completed
                 → rejected (with reason)
                 → deferred (not now, maybe later)
                   accepted → abandoned (started but stopped, with reason)
```

- **draft**: still being written by the author (agent or human)
- **proposed**: ready for emsenn's review — the plan is complete
  enough to evaluate
- **accepted**: emsenn has approved the plan but work hasn't started
- **active**: approved and in progress
- **completed**: all acceptance criteria met
- **abandoned**: started but stopped, with a log entry explaining why
- **deferred**: not rejected, but not now — will revisit later
- **rejected**: reviewed and declined, with reason recorded in log

Agents may move plans from draft to proposed when the plan is
complete. Only emsenn moves plans from proposed to accepted. Agents
move accepted plans to active when they begin work on them.

## Priority

Plans carry a priority field for ordering:

- **critical**: blocks other plans or addresses a fundamental gap
- **high**: important and should happen soon
- **medium**: valuable but not urgent
- **low**: nice to have, do when nothing else is pressing

### How to decide what to work on next

1. If any **active** plan is blocked, unblock it
2. If any **accepted** plan isn't started, start the highest-priority
   one
3. Review **proposed** plans with emsenn — accept or reject
4. If nothing is accepted, check for unplanned work and write plans
   for important items
5. If nothing is pending, ask emsenn for direction

When two plans have the same priority, prefer the one that **unblocks
the most other plans** (check `depends-on` fields across all plans).

## Milestones

A milestone is a named group of related plans. Milestones are not
separate files — they are a `milestone:` field in plan frontmatter.
Plans with the same milestone value belong to the same group.

Milestones help answer "what does finishing X look like?" — a
milestone is complete when all its plans are completed.

## Plan review process

The `review-plans` skill handles plan review at session start:

1. Read goals/ first — board review without goals is tactical noise
2. Read all plan files and their statuses
3. Report proposed plans to emsenn for accept/reject decisions
4. Sort accepted/active plans by priority, then by dependency count
5. Recommend the next plan to work on

## Naming convention

Plans and decisions use a four-digit sequential number. The number is
assigned at creation time from the next available integer. Numbers are
never reused.

```
plans/
  index.md              (this file)
  _template.md          (plan template)
  decisions/
    index.md
  questions/
    index.md
  archive/              (closed plans — completed, superseded, abandoned, rejected)
  0001-short-title.md   (first plan)
  0002-short-title.md   (second plan)
```

## Archive

Closed plans (status: completed, superseded, abandoned, rejected) move
to `plans/archive/` when their status is set. The record is preserved;
only the location changes. Plan numbers are never reused. See decision
0011 for rationale.

The `review-plans` skill scans `plans/[0-9]*.md` for active plans and
may optionally report archive counts for closed milestones.

## Principles

These follow from FOSS planning practice:

1. **Plans are proposals, not mandates.** A plan requires emsenn's
   approval to become active. (BDFL model.)
2. **Decisions are immutable records.** They capture the state of
   understanding at the time. Supersede, don't edit.
3. **Lightweight over heavyweight.** A plan is a markdown file, not a
   project management tool. If it takes longer to write the plan than
   to do the work, skip the plan.
4. **Log as you go.** The plan's log section is where session progress
   accretes. This is the planning equivalent of the knowledge
   accretion principle.
5. **One plan per body of work.** Do not combine unrelated work in one
   plan. If work forks, create a new plan.
6. **Foundation before features.** Plans that improve infrastructure
   (planning, governance, encoding) come before plans that add
   content. Build the system, then use the system.
7. **Proportional process.** A 2-line plan for a 10-minute task is
   fine. The governance should be lighter than the work it governs.
