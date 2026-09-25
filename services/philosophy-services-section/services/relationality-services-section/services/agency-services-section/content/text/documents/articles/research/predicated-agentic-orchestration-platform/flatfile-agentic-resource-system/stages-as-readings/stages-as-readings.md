---
name: stages-as-readings
description: "The discipline that the stages of work — planning, dispatch, execution, tracking, review, feedback — are not categories of substrate operation requiring dedicated channels, dedicated objects, or dedicated kernel paths."
type: concept
class: framing
depends-on: [referencing-entity-pattern, derived-state-via-walks, respond, fiber]
see-also: [seven-channel-decomposition, entity-as-model, dispatch]
title: stages-as-readings
---

# Stages as readings

The discipline that the *stages* of work — planning, dispatch, execution, tracking, review, feedback — are not categories of substrate operation requiring dedicated channels, dedicated objects, or dedicated kernel paths.
Each stage is a *reading*: a composition over the same predicate vocabulary, asked from a different position.
The substrate's algebra is one machine; the stages are six questions it answers.

The framing matters because the natural intuition — "we have six stages, so we need six things in the substrate" — produces six parallel runtime systems that the algebra cannot relate.
FARS rejects that intuition.
The substrate has the algebra ($\odot$, $\Rightarrow$, [`compose`](../morphisms/compose.md), [`restrict`](../code/transformers/restrict.md), [`settle`](../code/transformers/settle.md), [`respond`](../code/transformers/respond.md)) and the [referencing-entity pattern](../flatfile/referencing-entity-pattern/referencing-entity-pattern.md).
Stages emerge from how those ingredients are combined; they are not new ingredients.

## The six stage-readings

Each work-cycle stage is a fiber composition over substrate Notes:

- **Planning** is the production of [task](../../../../../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/glossary/terms/task-cell-system.md) Notes whose fibers commit some predicates and leave others at $\bot$.
  The stage's reading: "what is the unsaturated form of this work?" — the plan as the $\odot$-fixpoint of task-assertion on a goal fiber.

- **Dispatch** is [`dispatch`](../morphisms/dispatch.md), with [assignment](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/assignment.md) Notes as the entities the dispatcher emits when the match valuation reaches threshold.
  The stage's reading: "which office's fiber composes with this task's requirement fiber under $\odot$?"

- **Execution** is the emission of [execution-event](../../../../../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/glossary/terms/execution-event.md) Notes against an active assignment, and the substrate's read of state via [derived-state-via-walks](../derived-state-via-walks/derived-state-via-walks.md).
  The stage's reading: "what state is this work in, walked through its execution events?"

- **Tracking** is the emission of [observation](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/observation.md) Notes per [observation-fiber-isolation](../observation-fiber-isolation/observation-fiber-isolation.md).
  The stage's reading: "what does this work look like from outside, without changing it?"

- **Review** is the emission of [finding](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/finding.md) Notes — referencing entities whose fibers carry the variance between plan and execution.
  The stage's reading: "where do plan-fiber and execution-fiber compose at $\top$ rather than $\mathbf{t}$?"
  The two sides of the adjunction $\odot \dashv \Rightarrow$ produce single-loop and double-loop variants of this reading.

- **Feedback** is the emission of [adjustment](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/adjustment.md) Notes that respond to findings by editing the substrate's content (changing claims, adding closure rules, retracting offices' capability cells, …).
  The stage's reading: "what content edit would make subsequent compositions settle differently?"

The vocabulary of predicates the six stages compose over — `requires-capability`, `provides-capability`, `has-goal`, `state-change`, `observed-at`, `produces`, `responds-to`, etc. — is *one* vocabulary.
The stages do not extend the vocabulary; they walk it from different starting points and with different composition methods.

## What stages-as-readings implies

- **No new channels per stage.** The [seven-channel decomposition](../architecture/seven-channel-decomposition/seven-channel-decomposition.md) holds without extension.
  Planning Notes enter on the mutation channel; dispatch happens via the dispatch operator (which itself uses the substrate's existing channels for its own substrate edits); execution events enter on a configured channel (typically `execution`); observations enter on the observation channel; findings and adjustments enter on the mutation channel.
  A FARS realization MAY route work-cycle entities onto dedicated per-stage channels for indexing convenience — the algebra does not care — but the stage decomposition is *not a substrate-channel commitment*.

- **No kernel paths per stage.** [`respond`](../code/transformers/respond.md), [`compose`](../morphisms/compose.md), [`restrict`](../code/transformers/restrict.md), [`settle`](../code/transformers/settle.md), [`dispatch`](../morphisms/dispatch.md) are the substrate's operators.
  None of them is stage-specific.
  A consumer doing planning calls the same `compose` and `settle` a consumer doing review calls; the difference is in which Notes' fibers are inputs and which questions are being asked.

- **Stage labels are content, not types.** A FARS realization MAY (and typically will) carry a `stage` cell on entities to make queries by stage convenient: $\langle E, \texttt{stage}, \texttt{review} \rangle$ on a finding Note.
  This is a *content* claim about the entity's role in the work cycle, and it is a perfectly fine claim to make.
  It is not a substrate-level type the kernel branches on.
  Closure rules that fire only on review-stage findings are content-level routing, not kernel-level dispatch.

- **Cross-stage compositions are first-class.** Because the stages share a vocabulary, compositions across stages are just compositions.
  A finding that compares an observation to a plan is a composition of three Notes' fibers; an adjustment that responds to a finding by emitting new closure rules is a composition that produces a new Note.
  The substrate does not have to know "this is a review-to-feedback transition"; it composes the fibers and emits the result.

## The third engine-implication

This concept absorbs the third "engine implication" stated in the original FARS algebraic readings of work terms: *stage queries are substrate entities, not scripts*.
A stage-level query like "what is the dispatch backlog?", "what are the open findings?", "which observations exceed their baselines?" is a Note whose fiber declares what to compute via predicate-relationship claims, invoked via [`respond`](../code/transformers/respond.md).
The realization rendering the response into prose for a human is a *thin pump* over the substrate's witnessing geometry — not a script that re-implements the computation in a host language.

A realization that ships per-stage scripts (a `tracking-status.py`, a `dispatch-work.sh`) is implementing the algebra in the wrong layer.
The stage-query Notes belong in the substrate; the rendering logic belongs in the [interfacer](../../../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/interfacer.md) layer.

## What this is not

- **Not a prohibition on stage-aware tooling.** A FARS realization MAY group entities by stage in its CLI, color findings differently from observations in a TUI, expose per-stage REST endpoints.
  The discipline restricts only the *substrate-level* commitments — what cells live where, what closure rules fire — not the presentation layer's organizational choices.

- **Not a claim that the stages are equivalent.** Planning, dispatch, execution, tracking, review, feedback are *substantively different* operational concerns: they have different artifacts, different cadences, different stakeholders, different vocabularies of intent.
  The framing does not collapse them.
  It says they share substrate machinery — one algebra, one storage discipline, one read pattern — not that they are the same activity.

- **Not a six-fold ontology.** The number six is descriptive: it counts the stages the [predicated-work](../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/documents/articles/notes/undated/predicated-work.md) theory currently distinguishes.
  A theory that identifies a seventh stage (e.g., a separate *commissioning* stage between planning and dispatch) does not require new substrate machinery either; it would be another reading over the same vocabulary.

## Position

Stages-as-readings is the framing that prevents stage-decomposition from leaking into the substrate as parallel subsystems.
It depends on [referencing-entity-pattern](../flatfile/referencing-entity-pattern/referencing-entity-pattern.md) (so that stage-emitted entities are first-class Notes), on [derived-state-via-walks](../derived-state-via-walks/derived-state-via-walks.md) (so that stage-level state is a walk rather than a cell), and on [observation-fiber-isolation](../observation-fiber-isolation/observation-fiber-isolation.md) (so that the tracking stage's outputs do not pollute the entities they observe).
With those three in place, the six stages are six questions the substrate answers without needing six substrate-machinery extensions.

The framing composes with [entity-as-model](../entity/entity-as-model.md): a stage-query Note is a model that, when asked via [`respond`](../code/transformers/respond.md), returns the witnessing geometry that *is* the stage-question's answer.
It composes with [formality-progression](../formality-progression/formality-progression.md): each stage's content can sharpen from F0 toward F3 independently — a planning vocabulary at F2 (typed task fields) can coexist with a review vocabulary at F1 (prose findings) — and the overall substrate cost path is the per-stage cost path summed.
