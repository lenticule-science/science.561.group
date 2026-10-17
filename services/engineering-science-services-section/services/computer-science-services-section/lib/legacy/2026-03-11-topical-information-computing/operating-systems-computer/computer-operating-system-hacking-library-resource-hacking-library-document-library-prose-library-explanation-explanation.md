---
name: explanation
description: A prose refinement for the Diátaxis why-mode. Sentence positings address conceptual and causal cells — what something is, why it is the case, how it relates to other concepts — and reject procedural imperatives.
derives-from:
  - prose.md
---

An explanation is a [`prose`](prose.md) body whose addressing surface is restricted to conceptual and causal cells.
The mode commits the prose to the reader's question *why is this the case*; admissible positings answer that question.

## Admissible cells

The cells an explanation addresses are predicates of the form *is*, *is-a-kind-of*, *consists-of*, *because*, *follows-from*, *enables*, *prevents*, *distinguishes-from*, and similar conceptual or causal relations.
The subject of such a cell is the concept the explanation is about; the object is another concept or property.

## Inadmissible cells

An explanation must not posit on procedural cells — predicates of the form *do-this-then-that*, *type-this-command*, *click-this-button*, *expect-this-output*.
Those belong in a [`guide`](guide.md) or [`tutorial`](tutorial.md).
An explanation containing a procedural positing is structurally incoherent: the reader querying *why* gets *how* instead, and the modal interval at the addressed procedural cell is empty under the explanation mode.

Mode coherence is checked by the lint manifest at [`work/governance/rules/specifications/prose/`](../../work/governance/rules/specifications/prose/) via the `mode-coherence` check kind.

## Position

The Diátaxis why-mode.
The location for content that answers *what is this and why does it work this way?* — concept definitions, theoretical groundings, design rationales, mathematical exposition.
