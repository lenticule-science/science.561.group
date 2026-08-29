---

specialization:
  - command-term
  - review
  - library/domains/humanities/domains/sociology/domains/work/terms/review.md
description: "How a command structure uses a review record — the operational predicates a review carries beyond its library definition. Named review-record to distinguish from the review role."
defines: review-record
has: [scope, review-type, produces, input-from, date-created]
scope-takes: [session, plan, project, goal]
review-type-values: [session-review, plan-review, periodic-review, incident-review]
produces-takes: finding
input-from-takes: [observation, plan, goal]
date-created: 2026-04-12
---

A review record in a command context carries the library definition (comparing actual outcomes against planned outcomes) plus operational predicates: its scope (what it reviews), its type, what findings it produces, and what observations/plans/goals it takes as input.

Reviews are part of the operations loop's assessment stage. They produce findings — structured judgments about variance between expected and actual outcomes. A review without findings is incomplete; the findings are the review's output.

Note: this term defines the review as a work entity (a record produced by the review act). The review role (the capability to assess quality) is a separate term at `./review.md`.
