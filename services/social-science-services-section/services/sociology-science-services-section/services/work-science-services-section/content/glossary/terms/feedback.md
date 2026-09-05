---
name: "Feedback"
description: "The stage that closes the operations loop — modifying future work based on review findings. Without feedback, the system runs open-loop: it plans and executes but never learns."
date-created: 2026-04-07
instance-of: [stage, act]
part-of-cycle: operations-loop
position-in-cycle: 6
follows: review
precedes: planning
input-from: [finding]
output-to: [adjustment]
contrasts-with: [review, planning]
grounded-in:
  - feedback-and-organizational-learning-survey
  - ontology-of-work-operations
traditions: [argyris-double-loop, senge-fifth-discipline, deming-pdca, kolb-experiential, beer-vsm]
settlement-role: "Feedback is where settlement happens between cycles. Review identifies what's open. Feedback closes it — by adjusting plans, encoding procedures, creating terms, promoting instincts."
---

Feedback is the stage that closes the [operations loop](./operations-loop-stage.md). [Review](./review.md) identifies what went as planned and what didn't. Feedback acts on those findings — modifying future plans, adjusting processes, updating policies, creating new vocabulary.

Without feedback, the system runs open-loop: it plans, dispatches, executes, tracks, and reviews, but the review findings go nowhere. The next cycle starts from the same assumptions. The same mistakes are made. The same gaps persist. Feedback is what makes the loop a LOOP rather than a line.

## Two kinds of learning

Argyris (*On Organizational Learning*, 1999) distinguishes:

- **Single-loop learning** — adjust within the current model. The plan was right but execution was off. Fix the execution. Tighten the procedure. This is most feedback.

- **Double-loop learning** — question the model itself. The plan was wrong. The goal was wrong. The way we define "success" was wrong. Change the structure, not just the parameters. This is rare and difficult — it requires examining assumptions that the current cycle takes for granted.

## What feedback produces

| Input from review | Feedback act | Output |
|---|---|---|
| Execution deviated from plan | Adjust the plan or the procedure | Modified plan, tighter procedure |
| A pattern recurs across reviews | Encode it as an instinct or skill | New instinct, new skill |
| A term was used inconsistently | Define or sharpen the term | New or enriched library term |
| An office couldn't handle its work | Reassess the office's capability signature | Modified office definition |
| Cost-per-workunit increased | Identify what regressed and why | Diagnostic, targeted fix |

## Feedback and the settlement path

Feedback IS the settlement mechanism between cycles. Each cycle of the loop settles some open questions. Feedback records those settlements — as procedures, terms, skills, policies — so the next cycle starts from a more settled position. Over time, the system's vocabulary gets richer, its procedures get tighter, its processes get more deterministic. That's the [settlement path](./settlement-path.md) operating across cycles.

The [duty of progressive encoding](../../../services/governance-services-section/content/glossary/terms/duty-of-progressive-encoding.md) is the obligation to perform this settlement step. Every office bears it. Feedback is where it's discharged.

## Feedback and continuous learning

The [continuous learning pipeline](./continuous-learning.md) IS the feedback stage operationalized. Observations (from tracking) produce instincts (from review/pattern-detection) produce skills (from feedback/encoding) produce tools (from further feedback/formalization). The CL pipeline is feedback running continuously, not just at the end of each cycle.

## The cybernetic reading

Beer's Viable System Model (1972) describes governance as continuous sensing + correction. The operations loop IS the VSM applied to work. Tracking is sensing. Review is comparison (actual vs. intended). Feedback is correction. The loop's health is measured by how quickly corrections propagate — how many cycles between "something went wrong" and "the system adjusted."

Deming's PDCA (Plan-Do-Check-Act) is the same structure: Plan = planning, Do = dispatch + execution, Check = tracking + review, Act = feedback. The important insight: "Act" in PDCA is not "do more work" — it is "adjust the system based on what Check revealed." Feedback is adjustment, not effort.

## See also

- [Review](./review.md) — the stage that precedes feedback (evaluates what happened)
- [Planning](./planning.md) — the stage that follows feedback (incorporates adjustments)
- [Settlement path](./settlement-path.md) — the trajectory feedback moves work along
- [Duty of progressive encoding](../../../services/governance-services-section/content/glossary/terms/duty-of-progressive-encoding.md) — the obligation to perform the feedback step
- [Feedback and Organizational Learning Survey](../../documents/notes/2026-04-03-note-on-feedback-and-organizational-learning-survey.md) — the full disciplinary grounding
