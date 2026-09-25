---
name: prose
description: Specification of resource files under a theory's `prose/` directory. Prose is recorded substrate interaction — sequences of speech-act → adjudication cycles, projected onto chosen cells, intended for downstream agent reading. Mathematically grounded in the speech-act / adjudication factorization (every operationally-realizable settling step is one such cycle) and in the entity-as-model framing (response is the substrate's consequence under inference).
title: prose
---

A prose resource file presents one recorded path of substrate interaction — a story or a remark constructed from speech acts and their adjudicated results.

## What prose is, mathematically

Per the [locution / illocution / perlocution factorization theorem](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/locution-illocution-perlocution-factorization.md) of the [speech-act](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/speech-act.md) framework, every operationally-realizable settling step factors as:

1. **Locution** — selection of a predication cell $\phi = (s, p, o)$.
2. **Illocution** — a positing morphism $\mathrm{posit}_{(\phi, q)}$ injecting evidence-datum $q$ at $\phi$.
3. **Perlocution** — the closure operator $\mathrm{cl}$ deriving consequences.

The substrate's behavior is therefore a sequence of these cycles.
A **prose document is a recorded projection** of that sequence — a chosen subset of cells, ordered by closure-step, presented for downstream reading.

This is the math of "telling a story about the substrate": prose selects which cells to follow, the order in which their values evolved, and the agents (per [agentive positing morphisms](../../../../../../notes/undated/agentive-positing-morphism.md)) who posited along the way.

Per AgOP's [entity-as-model](../../../entity/entity-as-model.md) framing, an entity's response to a query is the substrate's consequence under inference.
Prose can be read as a recorded *thread* of such queries and responses — the substrate's narrative voice, available to other agents reading the corpus.

Two distinguished kinds emerge from the math:

- **Narrative** — a multi-cell, multi-step projection: a path through many cells over many closure steps.
  Tells how a theory's content arose or relates.
  Sequence length is typically large.
- **Remark** — a single-cell or single-atom projection: a commentary attached to one structure, transformer, or claim.
  Sequence length is typically one.

Both are recordings of substrate interaction; they differ in the projection's scope.

## Why this matters in an agentic substrate

Per AgOP's multi-observer setting and [agential-self-generation](../../../../agent/agential-self-generation/agential-self-generation.md), agents read the substrate to learn what it commits to.
Atomic content (structures, transformers, claims, concepts) tells them *what is*; prose tells them *how it got there and how to read it*.
Without prose, the substrate's algebraic content is inaccessible to agents who lack the closure-by-closure traversal capability to reconstruct the interaction themselves.

Prose is therefore not editorial decoration; it is the substrate's record of its own interaction history, projected and shared.

## Layout

The `prose/` directory contains two canonical sub-directories:

- `prose/teaching/explanations/` — multi-cell, multi-step paths.
  One file per path.
  See predication-categories' [`prose/teaching/explanations/_index.md`](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/prose/teaching/explanations/_index.md) for prior-art convention.
- `prose/remarks/` — single-atom commentary.
  One file per remark.

A `prose/` directory MAY contain other organizational sub-divisions if the realization requires.

## File location

- Narratives: `<theory>/prose/teaching/explanations/<narrative-slug>.md`
- Remarks: `<theory>/prose/remarks/<remark-slug>.md`

## Frontmatter

### `name`

The slug naming this prose document.
Required.

### `description`

One-sentence statement of what path this prose walks or what atom this remark comments on.
Required.

### `depends-on`

List of atoms (structures, transformers, claims, concepts) the prose projects onto.
The substrate uses this to compute the prose's positioning relative to its sources and to detect which prose documents depend on a given atom.
Optional, multi-valued.

## Body

For narratives: 500–3000 words.
Shorter and it is probably a paragraph that belongs in an atom's body; longer and it is doing too many things and should be split.

For remarks: 100–600 words.
Single-topic, single-atom commentary.

## What this specification does not pin

The structured form of "this prose records this sequence of speech-act → adjudication cycles" is not encoded in frontmatter — the body carries the projected sequence in human-readable form.
A future refinement may pin a `projects-cells:` and `over-steps:` frontmatter pair for machine-readable prose-as-substrate-interaction-trace.

Renderer-positioning relations (`introduces:` / `recaps:` / `discusses:`) used in upstream conventions are not part of this spec; positioning is computed from `depends-on:` and atom-presence in the substrate, not from explicit positioning declarations.
