---

specialization:
  - command-term
  - finding
  - library/domains/humanities/domains/sociology/domains/work/terms/finding.md
description: "How a command structure uses a finding — the operational predicates a finding carries beyond its library definition."
has: [variance, cause, scope, severity, observed, expected, part-of, date-created]
observed-takes: observation
expected-takes: [plan, goal, objective, baseline]
part-of-takes: review
severity-values: [minor, significant, critical]
date-created: 2026-04-12
---

A finding in a command context carries the library definition (a judgment comparing observed outcomes to expected outcomes) plus operational predicates: what was observed, what was expected, what review it belongs to, and its severity.

The `variance` predicate describes the gap between observed and expected. The `cause` predicate attributes why the variance occurred. Together these are the substance of the finding — not just "something went wrong" but "this specific gap, for this specific reason."
