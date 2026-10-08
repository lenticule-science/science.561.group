---
type: morphism
class: substrate-operator
realizes: [view]
depends-on: [view-record, authorization]
see-also: [mode-transition, revoke]
title: Regenerate view
description: The operator that recomputes a view-record's derived fields after the underlying composing fibers have changed.
---

# Regenerate view

The operator that recomputes a [view-record](../view-record/view-record.md)'s derived fields after the underlying composing fibers have changed.
Regenerate-view is what keeps the agent's view *live*: when the agent's authorization changes, the active mode shifts, the location moves, or the substrate's content at the location changes, the view's `available-operations` and `visible-entities` are recomputed.

## Signature

`regenerate-view(view) → (updated-view-record, witness)`

Input:

- **`view`** — reference to the [view-record](../view-record/view-record.md) being recomputed.

Output:

- **`updated-view-record`** — the view record with `available-operations` and `visible-entities` updated.
  If the recomputation produces no change, the witness records "no change."
- **`witness`** — records the regenerate: input view's hash, composing fibers' current hashes, output view's hash.

## Operational semantics

Regenerate-view proceeds in five steps:

1. *Read composing fibers.* Per [view](../view.md), the view is composed from the agent's identity fiber, the agent's [office](teaching/explanations/office.md) fiber, the location's content fiber, plus any active [mode](teaching/explanations/mode.md) constraint fibers.
  Each fiber is read at its current substrate state.
2. *Compose authorization.* The agent's effective [authorization](../../../governance/authorization/authorization.md) is computed: powers (granted by office plus individual), duties (attached to powers plus office plus individual), privileges (exempting some duties), immunities (shielding from some duties).
  Per the four [Hohfeldian positions](../../../governance/authorization/authorization.md), the composition produces an effective-authorization predication.
3. *Apply mode constraints.* If a mode is active, the mode's `active-powers` further narrow the agent's effective powers; non-mode-active powers are suppressed.
4. *Compute available-operations.* From the constrained authorization, derive which substrate operations the agent is admissible to invoke at this view.
  The list is the operations whose required-powers are in the agent's mode-constrained powers.
5. *Compute visible-entities.* From the location, traverse to entities visible at the agent's scope and authorization.
  The list is what `look` and similar query operations would return.

## Engineering invariants

- **Live recomputation.** Regenerate-view is invoked whenever a composing fiber changes: an authorization grant or revoke, a mode transition, a location change, a substrate edit at the location.
  The discipline is that the view *is* always-current with respect to the composing fibers; stale views are violations.
- **Deterministic.** Given the same composing fibers (same canonical hashes), regenerate-view produces the same output.
  Per [determinism](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/determinism.md), the view is a deterministic function of its inputs.
- **Witness-recorded.** Every regenerate produces a witness; the substrate's audit can show every view-update event.
- **Cheap.** Regenerate-view reads at bounded radius (the view's fibers and the location's content); cost is proportional to the fiber sizes, not the substrate's total size.

## Failure modes

- **Composing fiber missing.** A cited fiber is no longer substrate-resident (an office record was retired, an agent record has expired).
  The substrate's policy: either the view is invalidated (the session is forced to a degraded state) or the missing fiber is treated as empty (the view shows reduced content).
  Per substrate policy.
- **Authorization composition produces conflict.** Two granting sources produce contradictory authorization (an office grants a power, an individual revoke retracts it; an immunity shields a duty that a privilege explicitly invokes).
  Per [coherence-glue](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/coherence-glue.md), the conflict is resolved by the substrate's repair catalog.

## Position in the platform

Regenerate-view is the substrate's *view-state-currency primitive*.
Without it, views are computed once at session-open and become stale; with it, views track their composing fibers in real time.
The discipline is what makes the agent's experience match the substrate's current state, even when state changes during the session (a privilege granted during a session, a scope edit by another agent, a federation update).
