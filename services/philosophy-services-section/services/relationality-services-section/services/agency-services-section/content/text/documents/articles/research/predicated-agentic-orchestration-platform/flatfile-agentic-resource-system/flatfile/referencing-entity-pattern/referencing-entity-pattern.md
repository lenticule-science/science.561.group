---
name: referencing-entity-pattern
description: "The discipline that relationships between entities are themselves entities, not predicates that mutate one of the related parties."
type: concept
class: framing
depends-on: [predication-fiber, settling-monotonicity, edge, note]
see-also: [event-sourcing, entity-as-model, dispatch, derived-state-via-walks]
title: referencing-entity-pattern
---

# Referencing-entity pattern

The discipline that *relationships between entities are themselves entities*, not predicates that mutate one of the related parties.
When work in FARS produces a relation — an assignment of a task to an office, an execution event against a task, an observation about a plan, a finding about an execution event, an adjustment in response to a finding — the relation is realized as its own [`Note`](../objects/note.md) whose [fiber](../../code/structures/fiber.md) carries the relation's claims and whose `Note` references the related entities by their substrate addresses.
The referenced entity remains *thin* — its own fiber is unchanged by the new relation.

The referencing-entity pattern is a *substrate commitment*, not a content suggestion.
FARS realizations SHALL store relations as referencing entities rather than as cells on the referenced entity, because the alternative (writing relation cells onto the referenced entity) would either break [settling-monotonicity](../../../../teaching/explanations/settling-monotonicity.md) on revocation or require the substrate to support non-monotone retraction of cells — which the value-domain does not provide.

## The pattern

When an operation produces a claim of the form *"$X$ stands in relation $\rho$ to $Y$"*, FARS realizes the claim as a Note $R$ with three classes of cells:

- **Self-typing.** $\langle R, \texttt{is-a}, \rho \rangle = \mathbf{t}$ — the relation Note declares its own kind.
- **Reference cells.** $\langle R, \pi_X, X \rangle = \mathbf{t}$ and $\langle R, \pi_Y, Y \rangle = \mathbf{t}$ where $\pi_X, \pi_Y$ are the relation's named ports (`assigns-task`, `to-office`, `concerns-task`, `under-assignment`, `observes`, etc.).
  These are the [`Edge`](../objects/edge.md) cells the substrate's index reverses for walk queries.
- **Witnessing cells.** Whatever predicates the relation needs to carry: timestamps (`sent-at`, `at`, `observed-at`), bounds (`authority-bound`, `cadence-window`), values (`capability-match`, `state-change`, `value`, `severity`), and lifecycle markers (`retracted`, `discharged-at`, `lapsed-at`).

The referenced entities $X, Y$ are *unchanged*.
No `assigned-to` cell appears on a task; no `current-state` cell appears on an executing assignment; no `velocity` cell appears on a plan.
The relation's content lives wholly on $R$.

## What the pattern implies

- **Effective-fiber walks.** A consumer asking about the referenced entity's state computes an *effective fiber* by walking from the entity outward along reverse-indexed reference cells, folding the referencing entities' witnessing cells most-recent-first.
  The task's effective fiber at time $t$ is $T \odot \bigoplus_i R_i$ where $R_i$ ranges over Notes with $\langle R_i, \pi_T, T \rangle = \mathbf{t}$ at $t$.
  See [derived-state-via-walks](../../derived-state-via-walks/derived-state-via-walks.md) for the discipline these walks observe.

- **Revocation by addition.** Withdrawing a relation does not retract the relation Note's cells.
  A `retracted` (or equivalent) cell is added to $R$ and reaches $\mathbf{t}$; downstream walks fold most-recent-first and treat $R$ as superseded.
  Settling-monotonicity is preserved — every step is additive — and the audit log retains the original relation cells together with the retraction.

- **Hohfeldian invariants attach to the relation Note.** The four invariants on delegation — derivativity, accountability non-transfer, boundedness, revocability — are [closure rules](../../../../teaching/explanations/closure-rule.md) on $R$'s cells (per [`assignment`](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/assignment.md)).
  They are not built into the dispatch operator and they are not enforced by the referenced entity.
  They are *substrate content* enforced by the rule system.

- **Relation Notes are first-class.** They participate in dispatch, querying, and federation exactly like any other Note.
  A query "list all assignments to office $O$ in the last 24 hours" is a fiber composition over assignment Notes, not a special-cased projection.

## Why writing the relation onto the referenced entity does not work

A naive realization might add a cell to the referenced entity — for example, $\langle T, \texttt{assigned-to}, O \rangle = \mathbf{t}$ at dispatch time.
Two failures follow.

- **Reassignment requires retraction.** Reassigning $T$ from $O$ to $O'$ requires either (a) retracting the old cell, which the value-domain's monotone settling does not support, or (b) writing $\langle T, \texttt{assigned-to}, O' \rangle = \mathbf{t}$ alongside the old cell, which produces $\top$ at the index $\langle T, \texttt{assigned-to}, \cdot \rangle$ — the substrate now sees two contradictory assignments rather than a clean handoff.
  Neither is faithful to the operational reading.

- **Audit collapses.** The cell on $T$ records *that* an assignment happened but loses *who dispatched it, under what authority, when, and why*.
  Recovering the audit trail requires somewhere to put those witnesses.
  The natural place to put them is the relation entity, which is exactly the referencing-entity pattern.

The referencing-entity pattern is what falls out when these two failures are taken seriously.
It is not an aesthetic preference; it is the only realization that preserves both monotonicity and audit.

## What this is not

- **Not a foreign-key convention.** The pattern is not a recommendation that "tables should reference each other" in a relational sense.
  The substrate has no tables; it has Notes whose fibers compose under the algebra.
  The pattern is about *which Note carries which claims*, not about indexing topology.
- **Not a prohibition on cells.** Entities still carry cells about themselves — a task's `has-goal`, `requires-capability`, `decomposes-into` cells live on the task.
  The pattern restricts only the relation cells whose semantics commit to a *changing* relationship over time.
  Self-describing cells (a task's intrinsic shape) are unaffected.
- **Not a runtime kernel concern.** The discipline is enforced at substrate-content level: by which Notes the substrate emits and by closure rules over those Notes' cells.
  Nothing in the inference primitive [`respond`](../../code/transformers/respond.md), the composition operator [`compose`](../morphisms/compose.md), or the settler [`settle`](../../code/transformers/settle.md) needs to know that a Note is a "relation Note" — they treat it as any other Note.
  The pattern is a *content* commitment.

## Position

Referencing-entity pattern is the substrate-realization side of the [predicated-work](../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/documents/articles/notes/undated/predicated-work.md) commitment that [assignments](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/assignment.md), [execution-events](../../../../../../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/glossary/terms/execution-event.md), [observations](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/observation.md), [findings](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/finding.md), and [adjustments](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/adjustment.md) are first-class cell-systems referencing the entities they concern.
The math (residuated composition under the four-valued bilattice) lives upstream in [predication-categories](../../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/2026/06/19/2026-06-19-predication-categories.md); FARS commits to the substrate pattern that makes those mathematical objects realizable as flatfile entities under monotone settling.

The pattern composes with [event-sourcing](event-sourcing.md): each emission of a referencing entity is a substrate edit producing an event, and the event log retains the full chain of relation Notes for replay.
It composes with [entity-as-model](../../entity/entity-as-model.md): a relation Note is itself a model whose fiber is its content and whose response under [`respond`](../../code/transformers/respond.md) is the relation's reading from any direction.
