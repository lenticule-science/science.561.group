---
name: derived-state-via-walks
description: "The discipline that an entity's lifecycle state is a walk, not a cell."
type: concept
class: framing
depends-on: [referencing-entity-pattern, settling-monotonicity, fiber, edge]
see-also: [event-sourcing, entity-as-model, validation-as-settlement]
title: derived-state-via-walks
---

# Derived state via walks

The discipline that *an entity's lifecycle state is a walk, not a cell*.
When a consumer asks "is task $T$ active?", "is assignment $A$ discharged?", "is plan $P$ on schedule?", FARS answers by composing the entity's intrinsic fiber with the witnessing cells of every [referencing entity](../flatfile/referencing-entity-pattern/referencing-entity-pattern.md) the substrate's reverse-edge index returns.
The state is computed at the moment of the query; nothing in the entity's own fiber claims its state directly.

The discipline is what makes lifecycle compatible with [settling-monotonicity](../../../../teaching/explanations/settling-monotonicity.md).
Lifecycle transitions in the work vocabulary — `open → active`, `active → discharged`, `active → suspended → active` — are non-monotone in the natural reading: an `active` state at $t$ can become `suspended` at $t' > t$, and `suspended` can return to `active` later.
If those transitions were cells on the entity, settling-monotonicity would forbid them.
They are not cells; they are folded readings over a *growing set* of additive witnessing entities, and the fold's output can change over time without any cell ever being retracted.

## The discipline

A query for entity $E$'s state at time $t$ proceeds:

1. **Locate referencing entities.** Walk the substrate's reverse-edge index from $E$ along the named ports the lifecycle question depends on (`assigns-task`, `concerns-task`, `under-assignment`, `observes`, `responds-to`, …).
  Result: a set $\{R_i\}$ of referencing Notes.
2. **Filter by cadence and validity.** Keep $R_i$ whose own fiber satisfies the lifecycle question's preconditions — for instance, an assignment's `retracted` cell is at $\bot$, or an execution event's `at` cell is within the relevant window.
3. **Order by temporal cell.** Sort the surviving $R_i$ by their `at`/`sent-at`/`observed-at`/`applied-at` cells, descending.
4. **Fold most-recent-first.** Combine the witnessing cells under the bilattice's truth-order operations until a settled answer emerges, or report $\bot$ if the walk produced no determining witness.
5. **Apply specialization rules.** Map the folded value to the lifecycle vocabulary via [closure rules](../../../../teaching/explanations/closure-rule.md) that connect generic state-change predicates to the entity-kind-specific lifecycle states.

The output is the entity's state *at the moment of the walk*.
A subsequent walk after a new referencing entity is admitted may yield a different answer; this is correct, and it is not a retraction of any prior claim.

## What the discipline implies

- **Non-monotone semantics from monotone substrate.** The lifecycle answer can change over time without any cell ever being retracted.
  Each new referencing entity is an additive contribution; the fold's ordering produces the most-recent-first reading that natural-language lifecycle vocabulary expects.
  The substrate's settling-monotonicity is preserved because the substrate stores only the additive cells; the non-monotonicity is in the fold, not in the storage.

- **No state-cache invalidation.** A FARS realization MAY cache lifecycle answers as a derived index per [source-of-truth](../../../../teaching/explanations/source-of-truth.md), but the substrate's authoritative answer is always the walk.
  Stale-cache bugs cannot corrupt substrate state because the cache is not authoritative; reconstructing the lifecycle state from referencing entities is always available and always correct.

- **Lifecycle vocabulary is content, not kernel.** The mapping from folded-witness values to lifecycle words (open/active/completed/suspended) is closure-rule content the substrate's rule system holds.
  A realization that reorganizes the lifecycle (adds a `negotiating` state, distinguishes `paused` from `suspended`) does so by adding closure rules and possibly new witnessing-cell vocabulary — never by extending the substrate's kernel.

- **Audit is automatic.** Every lifecycle answer's witnessing geometry is recoverable: the walk's intermediate result is itself a fiber whose cells cite the referencing entities that contributed.
  A consumer that wants "why is this task `suspended`?" gets the chain of referencing entities and their cells, not a single state cell with no provenance.

## Worked example

A task $T$'s lifecycle is computed from:

- **Open** — the walk along `assigns-task` reverse-edges yields no live [assignment](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/assignment.md) Note, or every such Note has $\langle A_i, \texttt{retracted} \rangle = \mathbf{t}$.
- **Active** — at least one assignment Note is live, *and* the walk along `concerns-task` reverse-edges from $T$ yields an [execution-event](../../../../../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/glossary/terms/execution-event.md) with $\langle E, \texttt{state-change}, \texttt{started} \rangle = \mathbf{t}$.
- **Completed** — the fold over execution events yields $v|_{G_T} = v^*_T$ (the task's goal cells are at their target valuation) and the result is stable under further closure firing — i.e., the task has reached quiescence.
- **Suspended** — the most recent execution event with a state-change witness has $\langle E, \texttt{state-change}, \texttt{paused} \rangle = \mathbf{t}$, and no later event with a contradicting state-change exists.
- **Resumed** — the most recent execution event has $\langle E, \texttt{state-change}, \texttt{resumed} \rangle = \mathbf{t}$, after a `paused` event.
  The task is back in **active**.

None of these states is a cell on $T$.
Each is a walk from $T$ outward through the reverse-edge index, folded against the lifecycle's closure rules.
Adding a `resumed` event after a `paused` event flips the lifecycle answer from `suspended` to `active` without retracting either event — the fold simply picks up the newer one.

## What this is not

- **Not query laziness.** The walk is not a deferred-computation hack.
  It is the substrate's authoritative semantics for what lifecycle *means*.
  A realization that wrote lifecycle states as cells would be storing a derived value as if it were primary; the substrate's source-of-truth is the referencing-entity log, and the walk is how that source becomes a state.

- **Not "events instead of state".** The substrate has both.
  Intrinsic state — what an entity *is* — lives in cells on the entity (a task's `has-goal`, an office's `provides-capability`, a plan's `contains-task`).
  Lifecycle state — what an entity is *currently doing* — lives in walks over referencing entities.
  The two are different kinds of state with different storage disciplines.

- **Not a performance technique.** Walks are how the substrate is *correct*, regardless of whether a particular realization can answer them in microseconds or seconds.
  Performance is a realization concern; correctness is a substrate concern.
  A faster derived-index does not change the answer; it only changes how quickly the answer arrives.

## Position

Derived-state-via-walks is the read-side discipline that pairs with [referencing-entity-pattern](../flatfile/referencing-entity-pattern/referencing-entity-pattern.md)'s write-side discipline.
Together they constitute FARS's commitment to a substrate where lifecycle semantics ride on top of monotone storage without contradiction.
The discipline depends on [`Edge`](../objects/edge.md) (the substrate-level reverse-index that makes walks possible) and on the [closure rule system](../objects/closure-rule-system.md) (which holds the mapping from witnessing cells to lifecycle vocabulary).

The discipline composes with [entity-as-model](../entity/entity-as-model.md): a query about lifecycle is a query the entity-as-model answers by extending its fiber with the witnessing entities the walk surfaces, and reading off the response.
It composes with [event-sourcing](event-sourcing.md): the referencing entities the walk visits are themselves projected from events, and replay reproduces both the entities and the lifecycle answers byte-for-byte.
