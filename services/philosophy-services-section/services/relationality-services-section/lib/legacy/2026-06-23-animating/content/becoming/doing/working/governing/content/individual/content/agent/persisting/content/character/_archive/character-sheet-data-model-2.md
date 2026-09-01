---
title: "Character sheets for offices — level, XP, passion, mood, achievements"
specialization: task
date-created: 2026-04-05
plan: sunday-funday-sprint
assigned-to: harness-optimizer
work-type: procedure
department: command
serves: operations-loop
priority: 1
requires-capabilities: [review, respond, search]
produces: [character-sheet]
enables: [character-command, quest-view, achievement-system]
depends-on: convergent-enrichment-plan
status: open
---

**Action:** Character sheets for offices — level, XP, passion, mood, achievements

**Why:** Each office gets a JSON character sheet tracking level, XP, completed tasks, quality average, passion per work-type, mood, achievements.
Updates on task-completed events.

## Algebraic grounding (from predication-world-sim)

The character sheet IS the office's fiber rendered as JSON.
Not metadata ABOUT the office — the fiber ITSELF.
Every field maps:

| Field | Algebraic meaning | Contrast with conventional games |
|-------|-------------------|----------------------------------|
| XP per track | Closure convergence in that domain | Not additive points — diminishing returns as fixed point approaches |
| Level | Formality tier (F0→F3) | Not arbitrary gates — the mathematical reality of how settled the work-type is |
| Mood | 1 − normalized(closure distance from fixed point) | Not weighted-sum (Rimworld) — structural distance measure |
| Passion | Bilattice content-context affinity (2D, ⊙-composed) | Not a scalar multiplier — a composition that can produce ⊥ or ⊤ |
| Achievements | Settlement thresholds crossed (entity reached F5.3) | Not "first 10 tasks" — real mathematical conditions |
| Inventory | Assets per chart-of-accounts | Not metaphorical — literal accounting entries |

### Target state

The character sheet should be a FARS entity whose predicates are computed by respond(), not hand-maintained JSON.
`respond(first-officer, {channel: character-context})` loads it at session-start.
Events settle into it.
Its ⊥ entries directly indicate where convergent enrichment has the most leverage.

### New fields from world-sim

- **entangled-pairs**: geometric history (voidmath F8) — what interactions shaped this office.
  Not a log but structural residue.
  The office's "backstory" IS its entanglement structure.
- **dream-state**: what `respond(self, self)` produces — internal compositions from accumulated entanglements.
  Between-session time = self-settlement.
  The office integrates its experience.
- **settlement-partners**: who the office is co-settling with.
  Collaborative work = collaborative settlement.
  Partners determine what vocabulary the office produces at the tower/fold.
- **lusory-constraints**: which predicates the office has voluntarily suppressed (set to ⊥) by accepting the game's rules.
  The lusory attitude IS the list of self-imposed constraints.
  Cheating = using a constrained predicate (detectable as ⊤ in respond(rules, action)).
