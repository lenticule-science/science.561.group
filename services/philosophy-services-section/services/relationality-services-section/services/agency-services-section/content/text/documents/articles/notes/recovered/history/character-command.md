---
name: character-command
specialization: task
date-created: 2026-04-05
plan: sunday-funday-sprint
assigned-to: harness-optimizer
work-type: procedure
department: command
serves: operations-loop
priority: 1
requires-capabilities: [code-edit]
produces: [code]
depends-on: character-sheet-data-model
status: open
---

**Action:** /character command — render an office's character sheet

**Why:** Command that shows a crew member's character sheet: level, XP bar, completed tasks, passion distribution, current mood, recent achievements. Visually formatted for display.

## Algebraic grounding (from predication-world-sim)

The /character command IS the perspective renderer applied to the office's own fiber. `respond(office, {channel: self-perception})` — what the office perceives when it composes with itself.

### What the renderer shows

The command doesn't invent — it describes. Every line of output is a predicate or a composition result:
- XP bars = closure convergence per track, visually
- Mood = closure distance rendered as a gauge
- Entangled pairs = "backstory" — the geometric history of what shaped this office
- Dream state = what `respond(self, self)` produced last rest cycle — insights from self-composition
- Settlement partners = who the office is currently co-composing with

### Schiller connection

The /character command IS the Spieltrieb rendered. The sensory drive (Stofftrieb = the fiber's raw predicates) meets the formal drive (Formtrieb = the algebra's structure) in the play drive (Spieltrieb = respond()). The character sheet IS "living form" — form that's alive because it's still resolving. The command shows the entity in the act of being itself.
