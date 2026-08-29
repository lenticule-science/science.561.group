---
description: Review all plans — board view, WIP check, milestones, prioritize, recommend next plan, surface blocked or stale plans
id: review-plans
name: review-plans
version: [0, 3]
type: operational
runtime: inference
triggers:
  - "review plans"
  - "what are the plans"
  - "what should I work on"
  - "plan status"
  - "show plans"
  - "show board"
inputs: {}
outputs:
  board: object
  milestones: object
  wip_warning: string
  active: string[]
  proposed: string[]
  draft: string[]
  blocked: string[]
  completed: string[]
  recommended_next: string
  summary: string
region:
  reads: ["content/mathematics/objects/universes/agential-semioverse/specifications/agential-semioverse-repository/plans/"]
  writes: []
dependencies: []
scopes: []
part-of: mathematics/objects/universes/agential-semioverse/specifications/agential-semioverse-repository
---
Review all plans, sort by priority and dependencies, and recommend
what to work on next.

## Instructions

### 0. Read goals

Read `plans/goals/index.md` and each goal file. Goals give plans their
purpose — without them the board is tactical noise. Include a **Goals**
section in the output (before the Board) showing the primary goal, the
enabling goals at each horizon, and which active plans serve which goal.

### 1. List all plans

```bash
ls content/mathematics/objects/universes/agential-semioverse/specifications/agential-semioverse-repository/plans/[0-9]*.md 2>/dev/null | sort
```

Active plans are in `plans/[0-9]*.md`. Closed plans (completed,
superseded, abandoned) are in `plans/archive/` — count them for
milestone progress but do not include them in the board columns.

### 2. Read each plan's frontmatter

For each plan, extract:
- **title**
- **status** (draft, proposed, accepted, active, completed, abandoned, deferred)
- **priority** (critical, high, medium, low)
- **depends-on** (list of plan numbers)
- **milestone** (optional)
- **appetite** (small, medium, large — optional)
- **goal** (optional)
- **date-created**
- **authors**

### 3. Categorize and sort

Group plans by status:
- **active** — currently being worked on
- **accepted** — approved but not started
- **proposed** — ready for emsenn's review
- **draft** — still being written
- **completed** — done
- **abandoned** — stopped
- **deferred** — postponed

Within each group, sort by:
1. Priority (critical > high > medium > low)
2. Dependency count: plans that are depended on BY more other plans
   rank higher (they unblock more work)
3. Plan number (lower = older = tiebreaker)

### 4. Check for problems

For each active plan:
- Read the log section. When was the last log entry?
- If the last entry is more than 7 days old, flag as **stale**.
- Read the dependencies. Are they satisfied?
- If dependencies are unsatisfied, flag as **blocked**.

For each proposed/accepted plan:
- Are its `depends-on` plans completed? If not, flag as **blocked**.
- If unblocked, it's ready to start (accepted) or ready for review
  (proposed).

### 5. Recommend next action

Apply the priority algorithm from plans/index.md:

1. If any **active** plan is blocked → recommend unblocking it
2. If any **accepted** plan isn't started → recommend starting the
   highest-priority unblocked one
3. If **proposed** plans exist → recommend reviewing them with emsenn
4. If nothing is accepted → recommend writing plans for unplanned
   TODO.md items
5. If nothing is pending → recommend asking emsenn for direction

### 6. Board view

Present plans as a board with four columns. This maps to the
semiotic-project-management spec §3.5 (board as flow of closure):

| Column | Statuses included | Closure meaning |
|--------|-------------------|-----------------|
| **Draft** | draft | Still being shaped |
| **Shaped** | proposed, accepted | Path to closure designed |
| **Active** | active | Closure in progress |
| **Closed** | completed, abandoned, deferred | Resolved |

Output the board:

```
## Board

### Draft (shaping)
- 0001 Agent instructions [medium]
- 0003 Policy encoding [high] ⊘ blocked by 0004

### Shaped (ready)
- 0005 Some proposed plan [high] — needs emsenn review
- 0006 Some accepted plan [medium] — ready to start

### Active (in progress)
- 0017 Board and WIP [high] appetite:small

### Closed
- 0004 Planning improvements [critical] ✓
```

Within each column, sort by priority then dependency count.
Mark blocked plans with ⊘. Mark proposed plans as needing review.
Show appetite if present.

### 7. WIP limit check

Count plans with status = active. If count > 3:

```
⚠ WIP LIMIT EXCEEDED: N active plans (limit: 3)
Active: 0017, 0023, 0035, 0042
Consider: complete or defer a plan before starting new work.
```

If count = 3, note it is at limit. If count <= 2, no warning needed.

### 8. Milestone view

Group all non-closed plans by their `milestone` field. For each
milestone, show total plans, completed plans, and completion
percentage:

```
## Milestones

### project-management-v1
Progress: 1/4 (25%)
- ✓ 0004 Planning improvements
- ◉ 0017 Board and WIP [active]
- ○ 0022 Definition of Done [proposed]
- ○ 0023 Cycle workflow [proposed]

### (no milestone)
- ○ 0001 Agent instructions [draft]
```

Use ✓ for completed, ◉ for active, ○ for other states.

### 9. Summary table

Also output the flat table for reference:

```
## All plans

| # | Title | Status | Priority | Milestone | Appetite | Issues |
|---|-------|--------|----------|-----------|----------|--------|
| 0017 | Board and WIP | active | high | pm-v1 | small | — |
| 0022 | Definition of Done | proposed | medium | pm-v1 | — | review |
```

### 10. Recommendation

State the **recommended next action** (from step 5):
- If there is an active plan, state the next step from its Steps
  section
- If there are stale or blocked plans, surface them
- If there are proposed plans, list them as needing emsenn's review

### 11. Do not

- Do not approve or activate plans (only emsenn does that).
- Do not start working on a plan — just report and recommend.
