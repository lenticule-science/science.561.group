---
extends: [record]
defines: adjustment
description: "A change made in response to a finding — what feedback produces. The act that closes the operations loop by modifying plans, processes, terms, or policies based on what review learned."
date-created: 2026-04-07
instance-of: act
part-of-stage: feedback
has: [target, change, rationale]
responds-to-takes: [finding]
target-takes: [plan, task, process, term, policy, office]
display:
  headline: title
  body: change
  metadata: [responds-to, target, rationale]
help-predicates: [id, responds-to, target, change]
references:
  deming1986:
    authors: ["W. Edwards Deming"]
    title: "Out of the Crisis"
    publication: "MIT Press"
    year: 1986
  argyris1999:
    authors: ["Chris Argyris"]
    title: "On Organizational Learning"
    publication: "Blackwell"
    year: 1999
  beer1972:
    authors: ["Stafford Beer"]
    title: "Brain of the Firm"
    publication: "Allen Lane"
    year: 1972
---

An adjustment is a change made in response to a [finding](./finding.md). It is what the [feedback](./feedback.md) stage produces. An adjustment takes a finding (something we learned from review) and produces a concrete change to an entity in the system — a plan, a process, a term, a policy, an office definition.

## What an adjustment carries

- **responds-to** — links to the finding(s) this adjustment addresses. An adjustment without a finding is an ungrounded change. A finding without an adjustment is a lesson ignored.
- **target** — what entity is being changed. A plan being revised, a process being tightened, a term being sharpened, a policy being added, an office's capability signature being updated. The target is always a specific entity, not a vague area.
- **change** — what specifically is different. Not "improve the dispatch process" but "add a capacity check predicate to office entities so dispatch can verify bandwidth before assigning." The change is the ground term — fully specified.
- **rationale** — why this change addresses the finding. The link from cause (in the finding) to fix (in the adjustment). If the finding's cause was "agents lack capacity information at dispatch time," the rationale is "adding capacity as a predicate makes it available to any composition that includes the office entity."

## Adjustments close the loop

Deming's PDCA cycle (1986) calls the feedback step "Act" — but Act does not mean "do more work." It means "adjust the system based on what Check revealed." An adjustment is not new work. It is a modification to the conditions under which future work happens. The distinction matters: new work enters through planning. Adjustments modify what planning, dispatch, execution, tracking, and review do next time.

An adjustment produces [events](../../../../philosophy/terms/event.md). Changing a plan is an act. Adding a predicate to a term is an act. Each adjustment, when applied, creates an event that enters the event stream. Future observations will reflect the changed state. The loop closes: finding → adjustment → event → observation → finding.

## Single-loop and double-loop adjustments

Argyris (1999) distinguishes two depths of learning. A single-loop adjustment changes parameters within the current model: tighten a procedure, add a check, adjust a timeline. A double-loop adjustment changes the model itself: redefine a term, restructure a plan, change what counts as success.

Single-loop findings produce single-loop adjustments: "execution deviated from plan, so we fix the execution." Double-loop findings produce double-loop adjustments: "the plan was wrong, so we change the plan" or "our definition of done was wrong, so we change the definition."

Most adjustments are single-loop. Double-loop adjustments are rarer and more consequential — they change the assumptions that subsequent single-loop adjustments operate within. A system that only makes single-loop adjustments optimizes for the current approach without questioning whether the approach is right.

## Adjustments in cybernetics

Beer's Viable System Model (1972) treats adjustment as the correction signal in a feedback loop. System 3 (operational management) compares actual performance against plans. When they diverge, System 3 issues a correction — an adjustment — to the operational units. System 4 (intelligence/strategy) compares the organization's model against reality. When they diverge, System 4 issues a correction to the model — a double-loop adjustment.

The health of the feedback loop is measured by latency: how many cycles between "something went wrong" and "the system adjusted." An organization that takes six months to adjust to a finding it made in January is running open-loop for half the year. The adjustment record makes this latency visible and measurable.

## See also

- [Feedback](./feedback.md) — the stage that produces adjustments
- [Finding](./finding.md) — the judgment that adjustments respond to
- [Event](../../../../philosophy/terms/event.md) — what applying an adjustment produces
- [Settlement path](./settlement-path.md) — adjustments move work along the path from open to determined
