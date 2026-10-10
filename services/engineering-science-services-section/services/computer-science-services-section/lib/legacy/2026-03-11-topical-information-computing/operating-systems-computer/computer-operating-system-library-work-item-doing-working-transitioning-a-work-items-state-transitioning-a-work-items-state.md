---
name: transitioning-a-work-items-state
description: A contesting positing-morphism that updates a work-item's has-status cell after validating the proposed (from, to) transition against the lifecycle-state-machine. The single parameterized parent transformer for all lifecycle transitions; replaces the directory-of-15-siblings hack at doing/working/hacking/doing/working/positing/contesting/transitioning-a-workflow-state/.
specializing: contestation-positing-morphism
acting-on-predicate: has-status
acting-on-shape: work-item
---

A **transitioning-a-work-items-state** call is the contesting positing-morphism that replaces the current value of (target, has-status, \_) with a new value, after validating the transition against the [lifecycle-state-machine](../../../library/lifecycle-state-machine/lifecycle-state-machine.md).

Per the work-item-as-predication-shape derivation, all status-changing positings are contesting in Belnap's speech-act partition — they replace the prior value with a new one at the same cell, neither asserting fresh evidence nor adding a negative claim.

## Inputs

- `--target` — repository-relative path to the work-item record file.
- `--from` — the current has-status value the caller observed (used as a precondition check; if the file's actual current state differs, the transition is rejected).
- `--to` — the proposed new has-status value.
- `--reason` — (required when `--to=blocked`) the blocking reason that populates the work-item's blocked-by cell.

## Algorithm

1. Read the target's frontmatter; parse the current has-status value.
2. Compare against --from; if they differ, reject with a "stale-observation" error.
3. Look up the lifecycle-state-machine's transitions map; check that --to is in the list for --from.
  If not, reject with a "invalid-transition" error.
4. Apply the contesting positing: replace has-status with --to in the target's frontmatter.
5. If --to = blocked, write the blocked-by cell with --reason.
6. If --from = blocked and --to != blocked, clear the blocked-by cell.
7. Append a witness row to the work-item's jsonl: `{e: <slug>, a: "transitioning-a-work-items-state", v: {from, to, reason?}, t: <iso-timestamp>}`.
8. Return the updated target path and the witness row.

## Outputs

JSON object: `{status: "transitioned", target, from, to, witnessAppendedTo}`.

Or error: `{status: "rejected", reason: "stale-observation" | "invalid-transition" | "missing-blocked-by-reason", details}`.
