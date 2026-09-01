---
description: Assess the endeavor's current state against its goals and recommend the highest-leverage next action with reasoning
id: situational-assessment
name: situational-assessment
version: [0, 2]
type: operational
runtime: inference
triggers:
  - "assess situation"
  - "where are we"
  - "what should we do"
  - "situational assessment"
  - "take stock"
inputs: {}
outputs:
  goal_progress: object
  method_practice_spec_gaps: string[]
  leverage_ranking: object[]
  recommendation: string
  reasoning: string
region:
  reads:
    - "content/technology/specifications/agential-semioverse-repository/plans/"
    - "content/technology/specifications/agential-semioverse-repository/plans/goals/"
    - "content/technology/specifications/semiotic-project-management/"
    - "content/technology/specifications/semiotic-endeavor/"
    - "content/technology/specifications/semiotic-endeavor-specification/"
    - "content/personal/projects/emsemioverse/policies/"
  writes: ["content/technology/specifications/agential-semioverse-repository/plans/assessments/"]
dependencies:
  - review-plans
scopes: []
part-of: technology/specifications/agential-semioverse-repository
---

Assess the current state of the endeavor and recommend what to do
next, with reasoning. This skill interprets data; review-plans
reports data. Run review-plans first to get the mechanical view, then
run this skill to get the evaluative view.

## Instructions

### 1. Gather data

Run or read the output of the review-plans skill. You need:
- All plans grouped by status
- The board view
- The milestone completion percentages
- Any WIP warnings, blocked plans, stale plans

Also read:
- All goal files in `plans/goals/`
- The 5 most recent git log entries in the content submodule
  (`git -C content log --oneline -5`)
- The policies at `content/personal/projects/emsemioverse/policies/`

### 2. Evaluate goal progress

For each goal, answer three questions:

1. **Movement**: Has recent work moved this goal closer to
   completion? Check: which plans serving this goal have been
   completed or progressed recently? Which key results are met?
2. **Blockage**: Is progress toward this goal blocked? Check: are
   the plans serving this goal blocked by unmet dependencies? Are
   there no plans at all serving this goal?
3. **Readiness**: Could work on this goal begin or continue right
   now? Check: are there accepted or proposed plans for this goal
   with satisfied dependencies?

Output a goal progress table:

```
## Goal progress

| Goal | Horizon | Movement | Blocked? | Ready? | Key results |
|------|---------|----------|----------|--------|-------------|
| 004 Finish methodology | near | advancing (0017 done) | no | yes (0022, 0023 proposed) | 4/6 met |
| 002 Planning infra | mid | partial | no | yes (multiple proposed) | 2/6 met |
```

### 3. Identify method-practice-specification gaps

Gaps exist along two axes: method vs practice, and practice vs
specification. Check all four directions:

**Method without practice** — things the specifications say should
happen but don't:
- Read semiotic-project-management: which specified practices are
  not yet implemented? (e.g., retrospectives specified in §3.7
  but never conducted; satisfaction deficit specified in §1.2 but
  not measured)
- Read semiotic-endeavor-specification: which conformance
  requirements are not met by the current repository?
- Read policies: which policies are not being followed in practice?

**Practice without method** — things we actually do but haven't
specified:
- Are there recurring patterns in recent work that aren't captured
  in any skill or specification?
- Are there decision patterns that get made ad hoc each time
  instead of being documented as procedures?

**Practice without specification** — things we do that have no
specification enabling their measurement:
- Which skills, procedures, or conventions are practiced but have
  no semiotic-* specification? (e.g., triage processing is
  practiced but semiotic-triage doesn't exist yet)
- Which plan types, artifact types, or workflows are used but not
  formally specified?
- A practice without a spec cannot be measured, tested, or
  conformance-checked — it exists only as habit.

**Specification without practice** — specifications that exist but
aren't being used:
- Which semiotic-* specifications have sections that no skill,
  script, or procedure actually implements or checks against?
- Are there conformance requirements that nothing in the repo
  verifies?
- A spec without practice is dead letter — it describes a shape
  nothing is measured against.

Output a gap list:

```
## Method-practice-specification gaps

### Method without practice
- Retrospectives (semiotic-PM §3.7): specified, never conducted
- Satisfaction deficit (semiotic-PM §1.2): specified, not measured

### Practice without method
- "Think through" plans: used in practice, not documented as a
  plan type

### Practice without specification
- Triage processing: practiced (enrich-triage skill), no
  semiotic-triage spec exists
- Skill system: practiced extensively, no semiotic-skill spec

### Specification without practice
- semiotic-changelog: spec exists, no skill or procedure uses it
  for verification
```

### 4. Leverage analysis

For each candidate next action (active plans needing next step,
accepted plans ready to start, proposed plans needing review), apply
this decision protocol:

**Leverage score** = how many of the following are true:

1. **Unblocks other plans**: completing this action allows other
   plans to start or progress. Count: how many plans list this one
   in `depends-on`?
2. **Serves a near-horizon goal**: the action directly advances a
   goal with `horizon: near`.
3. **Closes a method-practice gap**: the action addresses one of
   the gaps identified in step 3.
4. **Improves future decisions**: the action produces a procedure,
   specification, or measurement that makes subsequent task
   selection more informed. (This is meta-leverage: leverage on
   leverage.)
5. **Is ready now**: all dependencies satisfied, no prerequisites
   missing.

Score each candidate 0-5. A candidate scoring 4-5 is high leverage.
A candidate scoring 0-1 is low leverage regardless of its priority
field.

Output a leverage ranking:

```
## Leverage ranking

| Candidate | Serves goal | Unblocks | Closes gap | Improves decisions | Ready | Score |
|-----------|------------|----------|------------|-------------------|-------|-------|
| 0038 Situational assessment | 004 (near) | — | yes (no assessment procedure) | yes (this IS the decision tool) | yes | 4 |
| 0022 Definition of Done | 002 (mid) | — | yes (no shared DoD) | no | yes | 3 |
```

### 5. Recommendation

State the recommended next action. The recommendation MUST include:

1. **What**: which specific plan or action
2. **Why**: which leverage factors make this the best choice
3. **Why not alternatives**: what the top 2-3 alternatives are and
   why they score lower
4. **What changes after**: what completing this action enables that
   is currently impossible

Format:

```
## Recommendation

**Do**: [plan number and title]

**Why**: [1-2 sentences citing specific leverage factors]

**Over**: [alternative 1] because [reason]; [alternative 2]
because [reason]

**Then**: [what becomes possible or what to assess next]
```

### 6. Decision protocol for ties

If two candidates have the same leverage score, break ties using
this protocol in order:

1. Prefer the action that serves a nearer-horizon goal
2. Prefer the action with higher priority field
3. Prefer the action that is depended on by more other plans
4. Prefer the action with smaller appetite (faster to complete,
   faster feedback)
5. If still tied, present both to emsenn with the tie-breaking
   analysis — the tie itself is informative

### 7. Save the assessment

Write the full assessment output to a dated file at
`plans/assessments/YYYY-MM-DD.md` with frontmatter:

```yaml
---
title: "Situational assessment YYYY-MM-DD"
date-created: YYYY-MM-DDT00:00:00
type: assessment
authors:
  - claude
---
```

The body is the full output from steps 2-5 (goal progress, gaps,
leverage ranking, recommendation). This creates a diffable record:
comparing two assessments shows what moved, what stalled, and whether
recommendations were followed.

If an assessment already exists for today's date, append a sequence
suffix: `YYYY-MM-DD-2.md`.

### 8. Do not

- Do not activate or start plans. This skill assesses and
  recommends; it does not execute.
- Do not fabricate leverage factors. If a candidate has no
  unblocking effect, score it 0 on that factor, do not invent one.
- Do not weight the priority field above the leverage analysis.
  Priority is the plan author's judgment at creation time; leverage
  is the current assessment. They may disagree — that disagreement
  is informative and should be noted.
- Do not ignore method-practice gaps. They are first-class inputs
  to the assessment, not footnotes.
