---
type: concept
class: ux-discipline
depends-on: [governance, governance-as-modal-restriction, governance-decision-modal-decidability, dispatch-composes-authorization, modal-necessity-operator, predication-fiber-algebra, four-bilattice]
see-also: [authorization, dispatch, work-item-acceptance]
title: User decision
description: The substrate's primitive for converting a UI gesture (button click, menu select, form-submit) into a substrate-content predication that downstream operations can consume.
---

# User decision

The substrate's *primitive for converting a UI gesture (button click, menu select, form-submit) into a substrate-content predication that downstream operations can consume*.
In the substrate's hyperdoctrine setting, a user decision is *the substrate-side instance of a [governance decision](governance.md) made by an end-user*: the click is a session-signed admission, the resulting predication is the input to a [governance-decision-modal-decidability](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/governance-decision-modal-decidability.md) check, and the downstream effect proceeds via [dispatch-composes-authorization](../dispatch/dispatch-composes-authorization/dispatch-composes-authorization.md).

Without this concept, the substrate's UX has a structural gap: clicks are runtime events, but the substrate's algebra operates on predications.
The bridge — what predication a click produces, how it's bound to the session, how downstream operations consume it — needs explicit substrate-spec.

## Why this concept exists

Per [read-discipline](../../teaching/explanations/read-discipline.md), the substrate's reasoning runs on substrate predications, not on runtime branches.
A button-click that gates substrate behavior via "if user clicks Accept, run X" is a violation — the conditional belongs in substrate content as a closure rule, not in runtime UI code.
This concept fixes the discipline: clicks are admissions, the conditional fires as a substrate operation.

PredComp has [authorization](../governance/authorization/authorization.md), [governance](governance.md), [dispatch](dispatch.md), but no concept naming the *user-gesture-as-admission* pattern.
Without it, implementations may scatter UI-event handling across the runtime in non-substrate-recorded ways — breaking audit, federation, and replay-determinism.

## The user-decision admission

When a user makes a UI gesture (clicking Accept on a print-widget-request), the substrate admits a `user-decision` cell:

```json
{
  "kind": "user-decision",
  "decision-id": "<canonical hash of remaining content>",
  "decision-kind": "<accept | reject | choose | dismiss | defer | ...>",
  "subject": "<entity-hash the decision is about>",
  "predicate": "<the decision's predicate, e.g., 'accepts'>",
  "object": "<the decision's object, often the same as subject for simple gestures>",
  "session-hash": "<the session that produced the gesture>",
  "submitted-at-ordinal": <substrate ordinal>,
  "submitted-at-declared-time": "<ISO 8601 UTC>",
  "context": {
    "<application-specific context, e.g., view-state, selection>"
  }
}
```

Per [hash-injectivity-under-canonical-form](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-injectivity-under-canonical-form.md), the decision-id is the canonical-form hash.
Per [signature-binds-witness-to-identity](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/signature-binds-witness-to-identity.md), the user-decision is signed by the session's signing key — the substrate verifies the gesture really came from the authenticated session.

## Decision kinds

The substrate's catalog of canonical decision-kinds:

- **accept** — user agrees to a proposal, request, or invitation.
  Triggers downstream dispatch.
- **reject** — user declines a proposal.
  Triggers retraction or escalation per the application's discipline.
- **choose** — user selects from multiple options.
  The chosen option is in `context`.
- **dismiss** — user acknowledges a notification without acting.
  Updates user-state.
- **defer** — user postpones a decision.
  Updates substrate state to re-surface the proposal later.
- **submit** — user submits a form (per [form-submission-envelope](../../interactive-application-platform/concepts/form-submission-envelope.md)).
- **edit** — user begins or commits an edit.
  Triggers collaborative-editing coordination per [user-state-predications](../../interactive-application-platform/concepts/user-state-predications.md).
- **delete** — user requests deletion (typically retraction per [retraction](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/retraction.md)).
- **share** — user shares an entity with others.
  Triggers federation envelope per [federation-envelope](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-envelope.md).

Application-specific decision-kinds may extend the catalog, with the same envelope structure.

## Authorization check

Per [governance-decision-modal-decidability](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/governance-decision-modal-decidability.md), every user decision triggers a $\Box_R$ check:

1. The substrate looks up the user's session-capability (per [authentication-as-modal-restriction](../../interactive-application-platform/theorems/authentication-as-modal-restriction.md)).
2. The decision's required capability is determined by the decision-kind and subject (e.g., `accept` on a `print-widget-request` requires `dispatch:print` capability).
3. The substrate evaluates $\Box_R$ at the user-decision's world: does the session's modally-restricted capability include the required capability?
4. If yes, the decision proceeds: the closure rule fires, downstream effects ensue.
5. If no, the decision is admitted (the gesture is recorded), but the closure rule's premise on capability fails, so no downstream effect.
  Per [witness](../../teaching/explanations/witness.md), the failed authorization produces a witness — auditable.

Per [governance-decision-modal-decidability](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/governance-decision-modal-decidability.md), the check is decidable in PSPACE.

## Composition with dispatch

Per [dispatch-composes-authorization](../dispatch/dispatch-composes-authorization/dispatch-composes-authorization.md), dispatch composes capability with authorization in one $\odot$ application.
A user-decision that triggers dispatch is structurally:

1. User-decision cell admitted (the gesture).
2. Closure rule fires: "if user-decision of kind 'accept' on a print-widget-request, emit a dispatch cell."
3. Dispatch cell carries the work-item (the print-widget-request) and the dispatcher's required capability (`dispatch:print`).
4. Per [graded-dispatch-via-q-enriched-fusion](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/graded-dispatch-via-q-enriched-fusion.md), dispatch-matching picks the strongest-match agent (the printer with the right material, capacity, location).
5. The chosen agent's queue receives the work-item.

Per [dispatch-composes-authorization](../dispatch/dispatch-composes-authorization/dispatch-composes-authorization.md), the dispatch's authorization check is the same $\Box_R$ evaluation that authorized the user-decision — composed via $\odot$ in one substrate operation.

## Idempotence

User decisions are idempotent: the same gesture produced twice (network retry, double-click) produces the same decision-id, and the substrate deduplicates per [hash-injectivity-under-canonical-form](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-injectivity-under-canonical-form.md).
The substrate's discipline is to use content-addressing for deduplication — no separate "request-id" mechanism needed.

The decision's `submitted-at-ordinal` and `submitted-at-declared-time` differ between the two attempts, but per the canonical-form rule, only the canonical-content fields contribute to the hash; ordinal and declared-time are typically excluded from the decision-id computation (or included as "submission-instance" sub-cells, separate from the decision-id itself).

## Federation: cross-substrate decisions

When the user is on substrate $A$ but the decision affects an entity on substrate $B$ (e.g., user accepts a request from a contractor on a different substrate):

1. Substrate $A$ admits the user-decision cell.
2. Substrate $A$'s closure rule wraps the decision in a [federation-envelope](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-envelope.md) with `payload.kind: "user-decision-delivery"`.
3. Envelope crosses to substrate $B$.
4. Substrate $B$ admits the decision into its own scope.
5. Substrate $B$'s closure rules fire, dispatching downstream effects.

Per [federation-trust-bilattice-graded](../../../theorems/federation-trust-bilattice-graded.md), substrate $B$'s acceptance of substrate $A$'s decision depends on the federation accessibility cell — substrate $B$ may admit decisions only from trusted-peer substrates.

## What the discipline rules out

- **UI events that bypass substrate admission.** A button-click that directly calls a runtime function (without producing a user-decision cell) is invisible to the substrate's audit, federation, and replay disciplines.
  Per [read-discipline](../../teaching/explanations/read-discipline.md), the substrate refuses such bypassing — the conditional must be expressed as a closure rule on a user-decision admission.
- **User-decisions without session binding.** A decision admitted without a session reference can't be attributed; per [signature-binds-witness-to-identity](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/signature-binds-witness-to-identity.md), the substrate refuses unsigned decisions.
- **Decisions exceeding session capability.** Per [authentication-as-modal-restriction](../../interactive-application-platform/theorems/authentication-as-modal-restriction.md), a session can't exercise more capability than the account; a user-decision claiming capability beyond the session's $\Box_R$ value is rejected at the authorization check.
- **Implicit decisions inferred from behavior.** A decision derived by NLP or runtime heuristic (e.g., "the user seems to want to accept based on their reading time") is not a user-decision per the substrate's discipline.
  Decisions are explicit gestures producing explicit substrate predications.

## Position

User decisions are the substrate's *user-gesture-to-substrate-operation primitive*.
Per [authentication-as-modal-restriction](../../interactive-application-platform/theorems/authentication-as-modal-restriction.md), the gesture's authority is the session's modally-restricted capability; per [governance-decision-modal-decidability](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/governance-decision-modal-decidability.md), the authorization check is decidable; per [dispatch-composes-authorization](../dispatch/dispatch-composes-authorization/dispatch-composes-authorization.md), the decision triggers downstream dispatch with composed authorization.

The concept composes with [authorization](../governance/authorization/authorization.md), [dispatch](dispatch.md), [governance](governance.md), [authentication-as-modal-restriction](../../interactive-application-platform/theorems/authentication-as-modal-restriction.md), [form-submission-envelope](../../interactive-application-platform/concepts/form-submission-envelope.md) (form submissions are a particular kind of user decision), and [user-state-predications](../../interactive-application-platform/concepts/user-state-predications.md) (decisions update user-state).
