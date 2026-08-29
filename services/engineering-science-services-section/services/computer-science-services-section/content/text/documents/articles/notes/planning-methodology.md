---
title: "ASR Planning Methodology"
date-created: 2026-03-07T00:00:00
authors:
  - emsenn
  - claude
type: specification
keywords:
  - ProjectManagement
  - Methodology
  - AgentialSemioverse
  - ProgressiveAutomation
description: "Specification for how strategic planning operates in the ASR: goals, cadence, gates, constraints, and outcome verification."
cites:
  - "PDCA (Shewhart/Deming)"
  - "Theory of Constraints (Goldratt, 1984)"
  - "OKRs (Andy Grove, Intel, 1970s)"
  - "Technology Readiness Levels (NASA, 1970s)"
  - "Pre-registration (Chambers, 2013)"
  - "Architecture Decision Records (Michael Nygard, 2011)"
  - "Shape Up (Ryan Singer, Basecamp, 2019)"
requires:
  - "plans/index.md"
---

This specification defines how strategic planning operates in the
Agential Semioverse Repository. It wraps around the existing plan
format (see [plans/index.md](plans/index.md)) to provide the
methodology that connects plans to goals through defined processes.

The plan format tells you how to write a plan. This methodology tells
you what to plan, when to plan, how to evaluate a plan, what to plan
first, and whether planning worked. See
[planning without methodology](./planning-without-methodology.md)
for the analysis that motivated this spec.

## Goals

### What goals are

A goal is a declared objective that plans serve. Goals answer "where
is this project going?" Plans answer "what do we do next to get
there?"

Goals are not plans. A plan has steps and acceptance criteria. A goal
has a direction and key results. Plans are completed when their tasks
are done. Goals are achieved when their key results are met — which
may require multiple plans, or different plans than originally
anticipated.

### Goal format

Goals live at `plans/goals/` as markdown files.

```yaml
---
title: "Goal title"
date-created: 2026-01-01T00:00:00
authors: [emsenn]
type: text
status: active | achieved | abandoned | deferred
horizon: near | mid | far
tags:
  - GoalTag
description: "One sentence stating the objective."
---
```

**Horizons:**
- **near** (1-3 sessions): what we're working on right now
- **mid** (1-4 weeks): what we're building toward
- **far** (months+): where the project is going

**Sections:**
- **Objective** — one sentence: what does achieving this look like?
- **Key results** — 2-5 measurable outcomes. Each is verifiable: you
  can answer "is this done?" with evidence, not judgment.
- **Serving plans** — list of plan numbers that contribute to this
  goal. Updated as plans are created and completed.
- **Constraints** — what is currently blocking progress toward this
  goal? Updated at each review.

### Connecting plans to goals

Every plan SHOULD have a `goal:` frontmatter field referencing the
goal it serves. Plans without goals are legitimate (tactical
maintenance, opportunistic fixes) but should be the minority. If most
plans have no goal, the planning system is reactive rather than
strategic.

When creating a plan, the author identifies which goal it serves. If
no existing goal fits, either:
1. The plan addresses a gap — create a goal for it.
2. The plan is tactical — leave the goal field empty but note why.

## Gate criteria

### What gates are

A gate is a set of conditions that must be met before a plan moves
to the next lifecycle state. Gates prevent plans from progressing
without evidence that they're ready.

### The gates

**Draft → Proposed** (agent gate):
- [ ] Plan has all required sections (summary, motivation, steps,
  done-when, dependencies)
- [ ] Plan references a goal (or explicitly states why not)
- [ ] Dependencies are listed and their status is known
- [ ] Steps are concrete enough that another agent could execute them
- [ ] "Done when" criteria are verifiable (evidence-based, not
  judgment-based)

**Proposed → Accepted** (emsenn gate):
- [ ] emsenn has read the plan
- [ ] emsenn agrees the goal is worth pursuing
- [ ] emsenn agrees the approach is reasonable
- [ ] No unresolved questions that would change the plan's direction

**Accepted → Active** (agent gate):
- [ ] Dependencies are satisfied (depended-on plans are completed)
- [ ] No higher-priority active plans that would be displaced
- [ ] The agent has the context and tools to begin

**Active → Completed** (evidence gate):
- [ ] All "done when" criteria are met with evidence
- [ ] A log entry records what was done and what was learned
- [ ] An outcome assessment is written (see outcome verification)

## Review cadence

### What cadence is

A review cadence is a regular rhythm for assessing trajectory. Without
cadence, planning is reactive — plans appear when someone thinks of
work. With cadence, the system periodically asks: are we moving toward
our goals? What should we be planning that we aren't?

### The cadences

**Session start** (every session):
- Run the review-plans skill
- Check: is there an active plan? If so, continue it
- Check: are any goals near-horizon and unserved by plans?

**Weekly review** (suggested, emsenn-driven):
- Assess each active goal: what progress was made? What's the
  current constraint?
- Identify the bottleneck (Theory of Constraints): which single
  impediment, if removed, would unblock the most progress?
- Adjust plan priorities based on constraint analysis
- Update goal key results with current evidence

**Monthly review** (suggested, emsenn-driven):
- Assess mid-horizon goals: are they still the right goals?
- Review completed plans: did they achieve their intended outcomes?
  (outcome verification)
- Review the goal set: add, retire, or revise goals based on what
  was learned
- Update far-horizon goals if the trajectory has shifted

### Automated review support

The review-plans skill should be extended to:
1. Check plans against gate criteria (mechanical check)
2. Report goal coverage (which goals have active plans, which don't)
3. Identify stale goals (no plan activity in 2+ weeks)
4. Compute basic progress metrics (plans completed / plans total per
   goal)

## Constraint identification

### What constraint identification is

The Theory of Constraints (Goldratt, 1984) holds that every system
has exactly one constraint at any time that limits its throughput.
Optimizing anything other than the constraint is waste. Constraint
identification names the current bottleneck.

### How to identify the constraint

At each review, ask:

1. **What goal has the most unmet key results?** That goal is
   underprogressed.
2. **Why is it underprogressed?** List the blocking factors:
   - Missing infrastructure (tools, scripts, skills)
   - Missing knowledge (research not done, concepts not defined)
   - Missing capacity (too many active plans, WIP overload)
   - Missing clarity (goal poorly defined, approach uncertain)
3. **Which blocking factor, if resolved, would unblock the most
   progress?** That is the constraint.
4. **Is there a plan addressing the constraint?** If not, create one
   and make it the highest priority.

### WIP limits

Per Kanban practice: limit the number of simultaneously active plans.
A single agent working with a single human should not have more than
2-3 active plans at any time. If there are more, the system is
thrashing rather than making progress.

## Outcome verification

### What outcome verification is

Outcome verification checks whether a completed plan achieved its
purpose — not just whether its tasks were done. This closes the
learning loop: the system discovers whether its plans were effective.

### How to verify outcomes

When a plan is completed, add an **Outcome** section:

```markdown
## Outcome

**Goal served**: [goal reference]
**Key results affected**: [which key results this plan moved]
**Evidence**: [what changed, measured against the goal]
**Lessons**: [what would we do differently?]
```

If a plan was completed but the goal did not advance, that is
valuable information — it means the approach was wrong, not that the
work was wasted. The lesson feeds into future planning.

## Relationship to existing specifications

This methodology wraps around existing infrastructure:

- **Plan format** (`plans/index.md`): retained as-is. This spec adds
  goals, gates, cadence, and verification.
- **Work-unit lifecycle** (`theory/work-unit-lifecycle.md`): governs
  individual atomic actions. This spec governs the strategic layer
  above work units.
- **Skill manifests** (`theory/skill-manifests.md`): skills execute
  plans. This spec determines which plans exist and in what order.
- **Policies** (`policies/`): standing commitments. Goals are
  directional; policies are behavioral. Both constrain planning.
- **Closure pressure** (`concepts/closure-pressure.md`): goals arise
  from closure pressure — when the system's current state fails to
  satisfy its closures, the pressure generates goals.

## Relationship to cross-disciplinary planning practices

This methodology draws on patterns identified in the
[cross-disciplinary survey](../../../../../services/structured-work-paradigms-services-section/content/text/documents/articles/notes/cross-disciplinary-survey-2026.md):

| Component | Source practice |
|---|---|
| Goals + key results | OKRs (Grove, Intel, 1970s) |
| Gate criteria | TRLs (NASA), CMMI maturity levels, DoD milestones |
| Review cadence | PDCA (Deming), sprint retrospectives (Scrum) |
| Constraint identification | Theory of Constraints (Goldratt, 1984) |
| Outcome verification | Pre-registration (Chambers, 2013), DMAIC Control |
| Decision records | Architecture Decision Records (Nygard, 2011) |
| WIP limits | Kanban (Anderson, 2004) |
| Plan format | RFCs (IETF), PEPs (Python) |

## Implementation

### Phase 1: Goal infrastructure
- Create `plans/goals/` directory with index.md
- Write 3-5 initial goals at near/mid/far horizons
- Add `goal:` field to plan template
- Retroactively tag existing plans with goals

### Phase 2: Gate enforcement
- Add gate checklist to plan template
- Extend review-plans skill to check gate criteria mechanically
- Plans that pass the draft→proposed gate get auto-proposed

### Phase 3: Cadence support
- Extend review-plans skill with goal coverage reporting
- Build a constraint-identification prompt for weekly reviews
- Add outcome section to plan template

### Phase 4: Automation
- Score goal progress mechanically (key results met / total)
- Identify stale goals automatically
- WIP limit enforcement (warn when >3 plans active)
