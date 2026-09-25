---
name: input-as-message-from-entity
description: "The discipline that every input crossing into the substrate is a message from some entity to some other entity, and the substrate's algebra processes all such inputs uniformly under respond (and its compositions)."
type: concept
class: framing
depends-on: [respond, dispatch, fiber, predication-fiber, entity-as-model]
see-also: [event-as-transaction, referencing-entity-pattern, session-as-entity, interfacer]
title: input-as-message-from-entity
---

# Input as message from entity

The discipline that *every input crossing into the substrate is a message from some entity to some other entity*, and the substrate's algebra processes all such inputs uniformly under [`respond`](../../code/transformers/respond.md) (and its compositions).
The framing absorbs four classes of substrate operation that an unframed system would treat as distinct subsystems:

- **A session** is a stream of messages from a designated *model entity* (e.g., when a session opens with `MODEL_ENTITY=calder-underhill`, every message in that session is from Calder, and Calder's fiber bounds what those messages can claim about the substrate).
- **A command invocation** is a message *to* the command entity (e.g., `/briefing` is `respond(briefing-entity, message, sender=<office-or-agent>)` — the briefing entity's fiber composes with the sender's fiber to produce the briefing the sender is permitted to see).
- **A file creation** is a message asserting cells (the message's fiber carries the new (subject, predicate, object) triples; admitting the message is the substrate edit per [event-as-transaction](../../event-sourcing/event-as-transaction/event-as-transaction.md)).
- **A render or format** is a message to a display [interfacer](../../../../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/interfacer.md) entity whose fiber describes how it composes substrate content into external representation (e.g., a markdown-table interfacer is an entity whose `respond` produces formatted text from the input fiber).

Under the framing, the substrate has *one* input pathway — message admission — with the four classes above as substrate-content variations on it.
There is no separate "session protocol," "command runner," "file writer," or "renderer" beyond entities and the substrate's algebra.

## Sender as a third fiber

A message generally enters the substrate not as a free-floating fiber but as a *fiber from a sender*.
When a sender is named, the substrate's response is bounded by the sender's knowledge: the message's commitments are first composed with the sender's fiber (the sender cannot claim what its fiber does not support), and the result is what dispatches against the receiving entity.
Different senders submitting the same message text produce different responses because their fibers contribute different premises to the composition.

Three substrate cases:

- **Anonymous (system-as-sender).** No sender is named.
  The substrate treats the system itself as the implicit sender — maximal knowledge, no extra restriction.
  This is the unmarked default, recovered as the two-fiber composition $\textsf{entity} \odot \textsf{message}$ that [`respond`](../../code/transformers/respond.md) currently states.
- **Named sender.** A sender entity $S$ is named.
  The substrate's response is the three-fiber composition $\textsf{entity} \odot (\textsf{sender} \odot \textsf{message})$: the message is first bounded by the sender's fiber, then composed with the receiving entity.
  Cells the sender's fiber settles at $\bot$ block the message from claiming them at $\mathbf{t}$; cells the sender's fiber settles at $\mathbf{f}$ contradict the message and produce $\top$.
- **Federated sender.** A sender from another substrate, transiting via [`emit-federation-envelope`](../../code/transformers/emit-federation-envelope.md) and [`admit-federation-envelope`](../../code/transformers/admit-federation-envelope.md).
  The receiving substrate composes against the sender-entity's fiber as recorded in the federation envelope, with the federation-trust grading per [`federation-trust-bilattice-graded`](../../../theorems/federation-trust-bilattice-graded.md) modulating the composition's credit.

The sender's knowledge bound is not a permission check overlaid on the algebra — it is a structural restriction the algebra performs by composing the sender's fiber.
A sender lacking the cells to support a message claim does not produce a "permission denied" exception; the resulting fiber simply leaves the relevant cells at $\bot$, and downstream consumers see the absence rather than a refusal.
The substrate's audit trail per [event-as-transaction](../../event-sourcing/event-as-transaction/event-as-transaction.md) records the sender on the Δ-side of the event; the σ-side records what the sender's bound allowed to settle.

## What the framing implies

- **Commands are entities, not code.** A command that the substrate invokes is a Note whose fiber describes what the command does (preconditions, the predicates the response is composed from, the interfacer that renders the result).
  The substrate's host runtime evaluates [`respond`](../../code/transformers/respond.md) against this entity; the host runtime contains no command-specific logic.
  This is the substrate-realization of the [stages-as-readings](../../stages-as-readings/stages-as-readings.md) discipline applied to user-facing operations.

- **Sessions are streams, not state machines.** A session is a sequence of messages from a sender (typically a model entity, but could be a human, a script, a federated peer).
  The session's "current state" is the fold of these messages over the substrate's fibers — derived per [derived-state-via-walks](../../derived-state-via-walks/derived-state-via-walks.md), not stored as session-state cells.
  A session "ends" when the message stream stops; its content persists in the event log.

- **Renders are responses, not templates.** Producing a markdown table, a JSON document, a TUI widget, an HTTP response — each is a message to a display [interfacer](../../../../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/interfacer.md) entity.
  The interfacer's fiber describes how it composes inputs into external form; the substrate's response is the rendered output.
  There is no separate template system, no per-format string-substitution layer.

- **The host runtime is an evaluator, not an application.** Node.js, Python, the CLI driver — whatever evaluates the substrate's algebra — provides the inference primitive (`respond`), the storage (the flatfile substrate), and the dispatch wiring.
  It does not contain application logic.
  Application logic is in the entities; the runtime is what makes the algebra evaluable.

## The unmarked-default

The framing's elegance is that the system-as-sender case is the *unmarked default* — when no sender is named, the substrate behaves exactly as the two-fiber [`respond`](../../code/transformers/respond.md) describes.
Adding a sender is a structural enrichment that adds restriction; removing the sender (or never naming one) recovers the maximally-permissive composition.
A FARS realization that has never used named senders is operating in the unmarked-default regime and is fully conformant; named-sender support is an extension the realization opts into when it needs sender-bounded responses (e.g., for differential briefings, scoped queries, or per-agent permission-shaping).

## What this is not

- **Not a permission system.** The sender's fiber bounds what the message can claim, but the bound is structural (the algebra cannot derive what the sender's fiber does not support), not a policy check overlaid on the algebra.
  A FARS realization MAY layer a guard-channel policy on top of the structural bound for additional access control, but the bound itself is not a policy.

- **Not a routing primitive.** The sender names *who is sending*, not *where the message goes*.
  Routing — selecting which entity to respond against — remains the job of [`dispatch`](../morphisms/dispatch.md).
  A message may have a sender and still need to be dispatched against a candidate set; the sender just bounds what the message contributes to the dispatch's match-strength composition.

- **Not a replacement for the message Note.** A message is still a fiber the substrate processes.
  The sender extension says the substrate composes that fiber with a sender-fiber when one is named; it does not change what a message *is*.

## Position

Input-as-message-from-entity is the framing under which FARS's substrate has *no separate input subsystems*.
Sessions, commands, file creations, renders all flow through the same message-admission pathway with sender as an optional restriction parameter.
The framing depends on [`respond`](../../code/transformers/respond.md) (the inference primitive) and [entity-as-model](../entity-as-model.md) (the receiver-side reading of the same machinery); it composes with [event-as-transaction](../../event-sourcing/event-as-transaction/event-as-transaction.md) (every message admission is an event with Δ/σ structure, with sender appearing on the Δ-side) and with [referencing-entity-pattern](../../flatfile/referencing-entity-pattern/referencing-entity-pattern.md) (a sender-bearing message is a referencing entity that points at its sender).

The framing also raises an open spec question: should [`respond`](../../code/transformers/respond.md)'s signature explicitly carry an optional `sender` parameter, or should the sender be carried as a `from-sender` cell on the message fiber that the rule system composes against?
Both realizations satisfy the framing; the difference is whether the sender bound is a runtime-supplied parameter or a substrate-content cell.
The current `respond` signature does not specify either; resolving the question is downstream work.
