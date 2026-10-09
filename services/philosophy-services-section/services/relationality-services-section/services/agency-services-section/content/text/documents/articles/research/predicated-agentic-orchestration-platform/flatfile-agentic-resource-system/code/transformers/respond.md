---
source: [entity, message, rules, fuel]
target: [output, witness]
name: respond
description: "The inference primitive at FARS's substrate-API surface: given an entity's fiber and a message's fiber, compose them under the substrate's value-domain and settle the result to fixed-point under the platform's closure rules."
type: morphism
class: composed-operator
instantiates: [skill-invocation]
depends-on: [fiber, interpret, substrate-value-domain]
see-also: [settle, dispatch, entity-as-model, witness]
title: respond
---


The inference primitive at FARS's substrate-API surface: given an entity's [fiber](../structures/fiber.md) and a message's fiber, compose them under the [substrate's value-domain](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/substrate-value-domain.md) and settle the result to fixed-point under the platform's [closure rules](../../../../teaching/explanations/closure-rule.md).
The output is the fiber the entity concludes about the message — the *consequence* under the [entity-as-model](../../entity/entity-as-model.md) framing — together with a [witness](../objects/witness.md) recording the invocation.

The name `respond` is a placeholder.
It carries forward from earlier FARS documentation where the verb was load-bearing.
Whether the morphism should be called `respond`, `infer`, `consequence`, `entail`, `saturate-against`, or something not yet on this list is an open naming question; the morphism's signature and commitments below are normative regardless of name.

## Signature

```
respond(entity, message; rules, fuel) → (output, witness)
```

Inputs:

- **`entity`** — the entity's fiber, typically obtained by [`interpret`](interpret.md) of the entity's [`Note`](../objects/note.md).
  Per [source-of-truth](../../../../teaching/explanations/source-of-truth.md), the note is authoritative; the fiber is its derived view.
- **`message`** — the message's fiber.
  A message MAY originate as a `Note` (synthesized for the call, or read from a messages region of the substrate) and pass through `interpret`; or it MAY be constructed directly by a caller that has fiber-level intent (a closure rule firing, a dispatch operator composing).
- **`rules`** — the active closure-rule system at the entity's scope.
  The rule system is itself substrate content; loading it is a substrate read.
- **`fuel`** — the iteration bound passed through to [`settle`](settle.md).
  Realizations SHOULD default this to a value sufficient for typical FARS match-radii (the substrate's bounded-match-radius discipline keeps the number small).

Outputs:

- **`output`** — the entity's fiber after extension by the message and saturation to fixed-point.
  The value-domain's structure is preserved: cells with $\bot$ in both inputs remain $\bot$; cells with concordant evidence advance to $t$ or $f$; cells with discordant evidence advance to $\top$.
- **`witness`** — a [`Witness`](../objects/witness.md) carrying the input entity-fiber hash, the input message-fiber hash, the rule-system version, the consumed fuel, the output fiber hash, and the per-layer settle witness chain.

## Operational semantics

`respond` SHALL proceed in three phases:

1. **Compose.** Compute the extending composition $\textsf{entity} \odot \textsf{message}$ pointwise on cells (per [fiber](../structures/fiber.md), per [`compose`](compose.md)).
  The composition admits the message's commitments as additional cells on the entity's fiber and produces $\top$-valued cells where the entity and the message commit to incompatible values.
2. **Settle.** Invoke [`settle`](settle.md) on the composed fiber with the supplied rule system and fuel.
  Closure rules whose premises match against the composed fiber's cells fire; their conclusions are added to the fiber; rules whose premises match the new conclusions fire next; the wavefront propagates until no rule's premise matches against an unrecorded conclusion (quiescence) or fuel is exhausted.
3. **Witness.** Aggregate the per-layer witnesses from the settle into a single `Witness` for the response, citing the inputs' hashes and the output's hash.

## Normative invariants

- **Deterministic.** Same `(entity, message, rules, fuel)` SHALL return byte-identical `(output, witness)`.
- **Locality-respecting.** `respond` reads the entity's fiber, the message's fiber, and the rule-system's predications at the rule's match-radius.
  It SHALL NOT read the global graph.
  Closure rules that read across entity-fiber boundaries do so at their declared match-radii; the call's working memory is the active wavefront's width, not the corpus size.
- **Replayable.** The witness SHALL be sufficient to replay the response: an auditor with the rule-system version and the input fibers can reconstruct the output fiber without access to the runtime that produced it.
- **Idempotent on settled input.** When the entity's fiber and the message's fiber are already in a settled relationship under the rule system (the rule system has nothing to add), `respond` SHALL return the entity's fiber unchanged, with a witness recording "no advance" and zero fuel consumed.

## What `respond` is and isn't

`respond` *is* the FARS realization of AgOP's [skill-invocation](../../../skill/skill-invocation/skill-invocation.md) at the value-domain level.
A skill in AgOP terms is an invocable procedure with preconditions, body, and postconditions; in FARS, every closure rule that fires during the settle is one step of the skill's body, with the rule's premise as precondition and the rule's conclusion as postcondition.

`respond` is *not* the dispatch operator.
[`dispatch`](dispatch.md) selects which entity to send a given message to, by composing the message's required-capability predications with each candidate entity's offered-capability predications under the same algebra.
The dispatch operator's output is a ranked candidate list; `respond` is what runs at each candidate.

`respond` is *not* the heartbeat loop.
The heartbeat selects unsettled entities and emits messages at them; the messages are dispatched to skills; the skills invoke `respond` on each (entity, message) pair.
The heartbeat owns scheduling; `respond` owns the per-message inference.

## Position

`respond` is the morphism that makes FARS *an inference engine over a corpus*.
Every higher-level FARS operation that asks "what does the corpus say about X?" reduces to a sequence of `respond` calls — sometimes a single call (a direct query against one entity), sometimes a wavefront (the response's output predications fan out to neighbors, triggering further responses, until the platform's closure rules quiesce).
The morphism is what pins the [entity-as-model](../../entity/entity-as-model.md) framing to substrate-level operation: an entity is a model precisely because `respond` is the operation that asks the model what it concludes.
