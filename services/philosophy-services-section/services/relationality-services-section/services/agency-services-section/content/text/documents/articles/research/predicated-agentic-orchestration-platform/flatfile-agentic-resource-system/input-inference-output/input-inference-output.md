---
name: input-inference-output
description: "A single message traced from arrival to settled response, naming each FARS object and morphism at each gutter. The narrative's running example is a question put to one entity in a corpus. The same shape generalizes: dispatch is the same arc applied across many candidate entities; the heartbeat tick is the same arc applied repeatedly to unsettled entities; cross-entity wavefronts are the same arc cascading along relation predicates."
type: narrative
depends-on:
  - flatfile
  - frontmatter-as-presentation
  - entity-as-model
  - fiber
  - note
  - witness
  - interpret
  - respond
title: input-inference-output
---

# Input → inference → output

A single message traced from arrival to settled response, naming each FARS object and morphism at each gutter.
The narrative's running example is a question put to one entity in a corpus.
The same shape generalizes: dispatch is the same arc applied across many candidate entities; the heartbeat tick is the same arc applied repeatedly to unsettled entities; cross-entity wavefronts are the same arc cascading along relation predicates.

## Setup

A FARS substrate is a directory of markdown files (per [flatfile](../flatfile/flatfile.md)).
One file is `theorems/bilattice-adjunction.md`:

```yaml
---
type: theorem
status: proved
depends-on: [bilattice, residuated-pair]
realizes: [adjunction]
---

# Bilattice adjunction
The four-valued bilattice $\{\bot, t, f, \top\}$ admits the residuated pair
$\odot \dashv \Rightarrow$ ...
```

The disk content is presentation-layer material — YAML keys and string values, plus a markdown body.
Per [frontmatter-as-presentation](../flatfile/frontmatter-as-presentation/frontmatter-as-presentation.md), it is *not yet* algebra: the dict `{"kind": "theorem", "status": "proved", "depends-on": [...]}
` carries no bilattice values until interpretation runs.

A caller wants to ask: *does this entity claim to be proved?* The caller's question is itself a FARS message — a small bundle of predications encoding the query.

## Input

The arc begins with two reads.

**Reading the entity.** [`load`](../morphisms/load.md) walks the substrate root, parsing each `.md` file's frontmatter and body.
Each file produces a [`Note`](../objects/note.md) — `Note(slug='bilattice-adjunction', dir='theorems', kind='theorem', fm={'kind': 'theorem', 'status': 'proved', 'depends-on': ['bilattice', 'residuated-pair'], 'realizes': ['adjunction']}, body='# Bilattice adjunction\n...', path='theorems/bilattice-adjunction.md', mtime=...)
`.
The note is presentation content; nothing has been interpreted yet.

**Constructing the message.** The caller's question encodes as a fiber-shaped message.
For a simple status query, the message's fiber has one cell — `(status, "proved")` with value $t$ — meaning "tell me whether you carry `status=proved` as $t$."
The message is itself constructable as a `Note` (a synthesized one) and passed through the same interpretation pipeline as any other entity.

Both reads are presentation-side.
The next gutter crosses to algebra.

## The presentation→algebra gutter

[`interpret(note, rules)`](../code/transformers/interpret.md) runs against both the entity's note and the message's note.
It produces two [`Fiber`](../code/structures/fiber.md) values:

- `entity_fiber` — the bilattice-valued projection of `theorems/bilattice-adjunction.md`.
  The frontmatter pass produces cells like `(kind, "theorem")`-as-$t$, `(status, "proved")`-as-$t$, `(depends-on, "bilattice")`-as-$t$, `(realizes, "adjunction")`-as-$t$.
  The body pass produces additional cells from markdown links and citation patterns.
  The default pass fills in path-derived defaults (the directory `theorems/` confirms `kind=theorem`).
- `message_fiber` — the message's projection.
  One cell — `(status, "proved")`-as-$t$ — carrying the caller's commitment that the answer they want is "yes, status is proved."

Per [predication-fiber](../../../../../teaching/explanations/predication-fiber.md), every cell carries a value in $\{\bot, t, f, \top\}$.
Every cell records its provenance — which note, which frontmatter key (or which body pattern) it came from — for the witness chain.

The gutter is now crossed: the algebra has fibers to operate on.

## Inference

[`respond(entity_fiber, message_fiber, rules, fuel)`](../code/transformers/respond.md) is the inference primitive.
It runs the three-step composition:

1. **Compose.** The extending operation $\textsf{entity\_fiber} \odot \textsf{message\_fiber}$ runs pointwise on cells.
  The cell `(status, "proved")` is in both fibers — both at $t$.
  The composition is $t \odot t = t$ (per the [substrate value-domain](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/substrate-value-domain.md)'s extending table).
  The other cells in the entity's fiber pass through unchanged ($\bot \odot x = x$ for cells the message says nothing about).
2. **Settle.** [`settle`](../code/transformers/settle.md) runs on the composed fiber under the rule system at the entity's scope.
  Closure rules whose premises now match — for instance, "a theorem with `status=proved` is `verified=true`" — fire and add cells.
  Rules whose premises match the new cells fire next; the wavefront cascades within the bounded match-radius until quiescence (or fuel exhaustion).
  The composed fiber gains derived cells; no new presentation content is created.
3. **Witness.** A [`Witness`](../objects/witness.md) is constructed citing the entity-fiber hash, the message-fiber hash, the rule-system version, the consumed fuel, the per-layer hashes, the output fiber hash.
  The witness is appended to the substrate's event log.

The model-theoretic reading from [entity-as-model](../entity/entity-as-model.md) is at work: the entity is a structure assigning values to predicates; the message is a query (or extension); the response is the model's consequence under the algebra.
The four-valued bilattice surfaces what classical inference flattens — the answer is $t$ (the model concludes "yes, status is proved"), but if the entity had carried a contradicting `status=draft` somewhere else in its fiber the answer would have been $\top$ (contested), and a Boolean engine would have silently picked one.

## Output

The output is a tuple `(Fiber, Witness)`:

- **`Fiber`** — the entity's settled fiber under the message's extension.
  The cell `(status, "proved")` carries $t$.
  Derived cells from settle's closure-rule applications carry their respective values.
  Cells the message did not touch pass through unchanged.
- **`Witness`** — the audit record.
  An auditor with the input notes, the rule-system version, and the witness can replay `interpret` and `respond` and verify the output fiber's hash matches.

The caller reads what they need from the output fiber.
For a simple status query, they project the cell `(status, "proved")` and find $t$ — the answer is yes.
For a richer query, the caller may inspect the whole output fiber and use its cells programmatically; or the caller may format the fiber back to presentation and render it as a markdown block for human reading.

The witness lives on in the event log.
The entity's note on disk has not been edited; the entity's stored content is unchanged.
Inference is a derivation, not a substrate edit.
The next time a caller asks the same question with the same rule system, `respond` returns byte-identical output.

## What this arc generalizes to

The single-entity arc is the unit of FARS inference.
Every higher-level operation reduces to it:

- **Dispatch.** [`dispatch(message, candidates)`](../morphisms/dispatch.md) runs `respond` against each candidate's fiber, ranks the results by output fiber's $t$-cell count (or by a closure-rule-defined match-strength), and returns the ranked list.
  The arc is the same; the arc is repeated across candidates.
- **Wavefront.** When the output fiber's settled cells include predications about *other* entities (a derived `produces=X` cell at the source entity is also a `produced-by=source` cell at entity $X$), [`settle`](../code/transformers/settle.md) at the substrate level walks to the neighbor and runs the arc again at that entity's fiber.
  The wavefront is bounded by the rule's match-radius and the substrate's locality discipline.
- **Tick.** The [heartbeat](../../../teaching/explanations/heartbeat.md) selects unsettled entities (those whose fibers have not reached fixed-point under the current rule system) and emits messages at them.
  Each emitted message triggers the arc; the heartbeat owns scheduling, the arc owns inference.

The arc — *load → interpret → compose → settle → witness* — is FARS's whole operational claim at the inference layer, in five steps.
Other FARS spec sections (substrate edits, sessions, federation, governance, harness surfaces) compose this arc into larger workflows; none of them replace it.
