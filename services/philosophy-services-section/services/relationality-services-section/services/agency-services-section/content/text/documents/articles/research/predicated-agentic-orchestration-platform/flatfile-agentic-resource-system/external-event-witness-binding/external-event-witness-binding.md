---
name: external-event-witness-binding
description: "External-event witness binding — what events become substrate witnesses, and how?"
type: question
status: open
depends-on:
  - commit-as-witness
  - event-sourcing
see-also:
  - witness-as-increment
  - completion-as-quiescence
title: external-event-witness-binding
---

# External-event witness binding — what events become substrate witnesses, and how?

## Statement

A FARS realization records witnesses for in-process operator calls (the `fars` operator surface) but is silent about *external* operational events: git commits, CI runs, MCP tool invocations from outside the FARS process, agent-inbox messages, scheduled jobs, file edits made through non-`fars` paths.
The predicated-work [witness-as-increment correspondence](../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/text/glossary/terms/witness-as-increment.md) requires that every operational event correspond to an increment cell.
The question: *which* external events FARS commits to absorbing, *how* they become `Witness` records, and *who* is authoritative for the binding.

## Decomposition

### Sub-question A — the event-class perimeter

Which classes of external event are in scope for FARS to absorb?
Candidates: git commits (bound and unbound), CI run results, MCP tool invocations against `fars mcp`, agent-inbox messages received via `fars receive`, file edits visible only via filesystem mtime (no operator and no commit).
Each candidate has a different evidentiary shape and a different cost/benefit ratio for the substrate.

The [commit-as-witness](../event-sourcing/commit-as-witness/commit-as-witness.md) bridge is the first such commitment; it does not generalize automatically.

### Sub-question B — the binding rule's authority

For each event class, *who* publishes the rule that maps event → predication cell?
Three candidates:

1. **The substrate itself** — FARS publishes a stable parser for each event class, pinned per realization (the corpus's reference parsing rules for commit-as-witness are an example).
2. **The agent that emitted the event** — the commit author, the MCP client, the inbox sender all attach a binding directive themselves (e.g., a commit-message trailer `FARS-Witness: <task-slug>`).
3. **A downstream curator** — a separate pass walks unbound events and binds them retroactively, producing witness records under `.fars/event-log/`.

Each authority has a different failure mode: substrate-side parsing breaks when conventions drift; agent-emitted directives require discipline the agents may not have; curator binding is post-hoc and loses the agent-attestation property the witness-as-increment morphism requires.

### Sub-question C — the unbound-event remedy

For events the substrate cannot bind to a task (an unbound commit, an MCP call with no return value, an inbox message routed nowhere), what remedy does FARS take?
Three options:

- *Drop* — the event is not a witness; only bound events enter the event log.
  Unbound events are operational dark matter.
- *Quarantine* — the event lands in `.fars/event-log/unbound/` as a degenerate witness whose only increment cell is `<commit-record, c, exists>`.
  The substrate's audit verbs surface the quarantine as a worklist.
- *Block* — the substrate refuses to admit unbound events; the agent must either bind the event or the operator that produced it must fail.

The work-vocabulary's *defeasibility* property (per [plan.md](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/plan.md): "silent revision is forbidden — a revision-without-witness leaves the substrate in an inconsistent state") tilts toward *block* for substrate-internal events but allows *quarantine* for events from substrates FARS does not control (e.g., commits made before the bridge existed).

### Sub-question D — replayability under external-event absorption

Does an event log that includes externally-absorbed witnesses still satisfy the audit-replayable property the [event-sourcing concept](teaching/explanations/event-sourcing.md) commits to?
Specifically: can a fresh FARS instance reconstruct the substrate state by replaying the event log alone, given only the closure-rule system $\mathcal{S}_{\mathrm{op}}$?
For commits the answer is plausibly yes (commits already carry the diff); for MCP calls or inbox messages the call/message content must also be archived.
The question is whether each event class admits a replayable binding.

## What is established

- The [commit-as-witness](../event-sourcing/commit-as-witness/commit-as-witness.md) bridge is committed to for this corpus, with the three reference parsing rules pinned.
  This is one event class with one authority (substrate-side parsing) and one initial remedy (quarantine, surfaced via `fars audit-commits`).
- The math constraint is fixed: per witness-as-increment, every event must correspond to an increment cell; closure rules cannot synthesize witnesses retroactively.
- Per [rule-addition-is-substrate-local](../rule-addition-is-substrate-local/rule-addition-is-substrate-local.md), **sub-question D's replayability criterion has a precise structural formulation**: an event class admits a replayable binding iff the event record's content — together with the cited closure-rule system $\mathcal{S}_{\mathrm{op}}$ at the event's version — is sufficient to re-settle every entity within the event-absorption rule's match-radius to the same settled state that the original event absorption produced.
  Formally: let $r_{\mathrm{absorb}}$ be the event-class rule and let $E$ be the triggered set (entities whose fibers match $r_{\mathrm{absorb}}$'s premise at absorption time).
  An event class is *replayable* iff the event record carries enough payload to reconstruct the pre-absorption fiber state for every entity in $E$, so that re-running `settle` on that state under $\mathcal{S}_{\mathrm{op}}$ reproduces the post-absorption state byte-identically.
  For git commits this criterion is satisfied: the diff is the full payload and the triggered entities (the note records the commit modifies) are exactly the diff's targets.
  For MCP calls, the criterion requires the full request-and-response payload, not just the call signature; for inbox messages, the full message content.
  The criterion gives a *class-by-class test* that sub-question A's perimeter decision can now apply: an event class is in scope for absorption iff a replayable binding exists for it.

## What remains open

- The event-class perimeter (sub-question A) — no commitment beyond commits, but each candidate can now be tested against the replayability criterion from the established section.
- The authority allocation per event class (sub-question B) — no commitment; the three candidate authorities (substrate-side, agent-emitted, curator) remain open.
- The unbound-event remedy beyond commits (sub-question C) — no commitment.
- Replayability under multi-class absorption (sub-question D) — the criterion is now settled (see established section); the per-class application of the criterion is open until sub-question A closes.

## Why it matters

Until FARS publishes its full external-event perimeter, the operations settling this substrate represents is structurally incomplete.
The [completion-as-quiescence theorem](../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/concepts/completion-as-quiescence.md) cannot fire on a task whose completing event is an unwitnessed external action.
The [governance theory](../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/documents/articles/notes/undated/predicated-governance.md) cannot enforce charter compliance against actions it cannot see.
The agential self-generation invariant the parent theory commits to — *every operative element is itself a substrate entity* — fails for any operative element that acts via an unwitnessed channel.

The captain's recurrent merge-thrash visible in the commit log of 2026-05 is a symptom: agents and humans both produced commits that the substrate cannot bind to any task or settled cell, and the resulting opacity costs hours of repeated re-orientation.
Closing the perimeter — picking the event classes, the authorities, the remedies — is the precondition for the substrate to become operationally trustworthy.
