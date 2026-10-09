---
name: validation-as-settlement
description: "The discipline that validation is settle — checking whether an entity satisfies a shape, whether an event satisfies a channel's contract, whether a message is admissible at a scope is not a separate operation but a settle of the candidate fiber against the relevant constraint fiber."
type: concept
class: framing
depends-on: [event-sourcing, substrate-value-domain, fiber]
see-also: [event, apply-edit, settle, respond]
title: validation-as-settlement
---

# Validation as settlement

The discipline that *validation is settle* — checking whether an entity satisfies a shape, whether an event satisfies a channel's contract, whether a message is admissible at a scope is not a separate operation but a settle of the candidate fiber against the relevant constraint fiber.
The output's value-domain content IS the validation result: $t$-cells everywhere is "valid"; $\top$-cells are *contradictions* (the substrate's word for "rejected"); $\bot$-cells are *unknown* (the substrate's word for "not enough information to decide").

Validation-as-settlement is what frees FARS from a separate validation layer.
There is no schema-validation code, no precondition-checking pass, no shape-engine sitting between operators and the substrate.
The substrate's algebra IS the validator: a candidate edit is admitted iff settling it against the constraint produces no $\top$-cells; the failure cells (if any) describe *what is wrong* and *where*.

The discipline is what makes the four-valued bilattice load-bearing for engineering, not just for theory.
Classical Boolean validation reports "valid / not valid"; FARS validation reports four states with operationally distinct meanings:

- **All $t$**: the candidate satisfies the constraint affirmatively.
  Admit.
- **Mixed $t$ and $\bot$**: the candidate satisfies the constraint *partially* — some predicates affirmed, others unknown.
  Whether this is admissible depends on the constraint's strictness (declared on the constraint itself); strict constraints reject; permissive constraints admit with warnings.
- **Any $\top$**: the candidate *contradicts* the constraint on at least one predicate.
  Reject.
  The $\top$-cells point at the contradicting predicates.
- **Any $f$**: the candidate *denies* a predicate the constraint asserts.
  Reject.
  The $f$-cells point at the denied predicates.

The four-valued resolution makes the *failure mode* visible as substrate content: a developer or agent inspecting a rejected candidate reads the $\top$- and $f$-cells and learns *what to fix*, without needing a separate error-message layer.

## Where validation appears in FARS

Validation-as-settlement is invoked at several substrate boundaries:

- **Entity creation.** When an [`apply-edit`](../../code/transformers/apply-edit.md) creates a new entity, the candidate's fiber is settled against the kind's shape predications.
  A clean settle admits the entity; a $\top$-producing settle rejects.
- **Closure rule application.** When [`settle`](../../code/transformers/settle.md) runs, each rule's premise IS a fiber pattern; matching the premise against the substrate IS a restriction settle; firing the rule produces a conclusion fiber that's composed into the substrate, again with $\top$-detection.
- **Dispatch eligibility.** When [`dispatch`](../morphisms/dispatch.md) ranks candidates, each candidate's response fiber is the result of `respond(candidate, message)` — itself a settle.
  The four-valued result *is* the eligibility ranking.
- **Federation merge.** When a [federation](../../teaching/explanations/federation.md) handshake admits events from a peer, the peer's claims compose with the local substrate's via $\vee_k$; contradictions surface as $\top$-cells the local substrate's repair catalog can address.

## The force flag

A conformant realization MAY admit a *force flag* on edit operators: settle the candidate even if the result contains $\top$-cells, and create the entity in the contradictory state.
This is legitimate for *drafts in progress* and *triage entries* — content the substrate is not yet asked to make coherent.
The force flag SHALL produce an event whose payload records the contradicting predicates, so the contradictions are substrate-visible and addressable later.

The force flag is not a way around validation.
It is a substrate-level statement that "this entity is known to be in a contradictory state and is being admitted anyway."
Closure rules fire on $\top$-cells the same as on $t$-cells; the substrate's repair catalog has admissible recipes for resolving them; the contradiction's persistence is an operational metric the substrate tracks.

## What this is not

- **Not a schema engine.** There is no shape-validator running over JSON Schemas or Pydantic types.
  The shape is a substrate entity with predications; matching the candidate against the shape is a fiber composition; the result IS in the value-domain.
- **Not a precondition check.** Operators do not have separate precondition-validators that run before the operator's body.
  The operator's premise (in closure-rule terms) IS its precondition; matching the premise IS the precondition check; the rule's body fires only when the premise matches.
- **Not error-handling.** Errors-as-exceptions thrown out-of-band are not the substrate's idiom.
  Errors-as-substrate-content — $\top$-cells, $f$-cells, repair-catalog recipes — are.
  A FARS realization that wraps validation in try/catch has lost the discipline.

## Position

Validation-as-settlement is the framing under which substrate edits, closure-rule applications, dispatch rankings, and federation merges share one machinery.
It is what makes FARS coherent under [self-representation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md): the validator is a substrate operator, not a privileged off-substrate process, because the validator IS settle.

The framing depends on [event-sourcing](event-sourcing.md): the validation-as-settlement protocol is replayable iff settle is replayable iff the substrate is event-sourced.
The two framings together are what give FARS its audit-and-coherence story.
