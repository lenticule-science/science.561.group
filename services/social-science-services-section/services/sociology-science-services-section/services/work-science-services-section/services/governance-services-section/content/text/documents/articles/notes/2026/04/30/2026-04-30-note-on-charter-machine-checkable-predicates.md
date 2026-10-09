---
title: Charter Rules as Machine-Checkable Predicates
description: Outlines work to make charter rules machine-verifiable by defining checkable predicates that the dispatch script can enforce.
date-created: 2026-04-30
type: note
name: charter-machine-checkable-predicates
keywords:
  - machine-checkable
  - charter-rules
  - checkable-predicates
  - dispatch-validation
  - rule-enforcement
specialization: plan
horizon: month
work-type: derivation
serves: [operations-loop, dispatch, governance]
depends-on: [operational-records-as-dag]
contributes-to: [charter-and-organizational-infrastructure]
produces: enforceable-charter-rules
status: draft
in-service-of: lib/emsenn/services/561-group/services/561-group-services-section
---

The charter (5 rules + 7 guidelines + 4 preferences) is the constitution. Today it is prose. The dispatch script can't enforce "Rule 3: No Invisible Labor" because the rule's checkable signature isn't in the file — only its principle. The gap between "the charter says X" and "the script can verify X" is the difference between a constitution and a runtime contract.

Each rule needs a machine-checkable predicate alongside the principle. For example, "No Invisible Labor" implies: every task that touches the system must have `produces:` (visible output), `assigned-to:` (named owner), `status:` (trackable state). A dispatch that creates a task missing these violates the rule.

## Tasks

- `charter-add-checkable-fields-to-rules` — for each of the 5 rules, add a `checkable:` block listing concrete predicates the rule implies (e.g., for no-invisible-labor: `requires-on-task: [produces, assigned-to, status]`)
- `charter-add-checkable-fields-to-guidelines` — same for guidelines, but with looser semantics (warning, not violation)
- `charter-write-rule-checking-skill` — define a `skill: check-charter-binding` that takes (entity, charter-binding) and returns a list of violations
- `charter-update-dispatch-script-to-call-checks` — `dispatch.py` calls the rule-check on each candidate dispatch; rejects with cited rule on violation
- `charter-add-violations-as-recordable-events` — when a check fails, the event should be recordable (records/events/triage/) so we can audit attempted-but-rejected dispatches

## Acceptance

- Each charter rule has a `checkable:` field with concrete predicates
- A test fixture (a known-violating task) is rejected by the dispatch script with the violated rule cited
- The check pattern generalizes — adding a new rule adds a new checkable section without script changes

## Open question

Should the predicates be expressed in YAML alongside the prose, or in a sibling structured file (`rules/<rule>/checkable.yaml`)? YAML alongside is closer to the source; sibling separates concerns. Decide as part of `charter-add-checkable-fields-to-rules`.
