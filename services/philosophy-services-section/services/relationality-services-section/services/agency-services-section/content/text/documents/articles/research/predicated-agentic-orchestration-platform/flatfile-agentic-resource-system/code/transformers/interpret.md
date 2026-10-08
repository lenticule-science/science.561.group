---
source: [note, rules]
target: [fiber]
name: interpret
description: "The morphism that translates a Note (presentation-layer content) into a Fiber (algebraic-layer content)."
type: morphism
class: operator
depends-on: [note, fiber, frontmatter-as-presentation, substrate-value-domain]
see-also: [load, respond, settle]
explores: [presentation-and-algebraic-layers]
title: interpret
---


The morphism that translates a [`Note`](../objects/note.md) (presentation-layer content) into a [`Fiber`](../structures/fiber.md) (algebraic-layer content).
`interpret` is the bridge across the presentation/algebra layer split that [frontmatter-as-presentation](../../flatfile/frontmatter-as-presentation/frontmatter-as-presentation.md) names; it is what produces the bilattice-valued bundle the rest of the algebra reads.

The substrate-level question — *should presentation-to-algebra interpretation be a first-class substrate morphism in [the predicated-computing theory](../../../../../README.md)?* — is open and tracked at [presentation-and-algebraic-layers](../../../../questions/presentation-and-algebraic-layers.md).
FARS commits to a particular answer (the morphism defined here) without claiming the answer generalizes; the upstream question will resolve when enough realizations converge on a shared signature.

## Signature

```
interpret(note; rules) → fiber
```

Inputs:

- **`note`** — the source-of-truth presentation content (the [`Note`](../objects/note.md) record's required fields).
  Per [source-of-truth](../../../../teaching/explanations/source-of-truth.md), the note is authoritative; the fiber is derived.
- **`rules`** — the substrate's current interpretation rules: which frontmatter keys map to which predicates, which body patterns produce which predications, which value-domain elements absent keys produce.
  The rules SHALL themselves be substrate content (entities with frontmatter), not hard-coded operator logic.

Output:

- **`fiber`** — the entity's [predication-fiber](../../../../teaching/explanations/predication-fiber.md) under the supplied rules.
  Determined entirely by `(note, rules)`; two calls with byte-identical inputs SHALL return byte-identical fibers.

## Operational semantics

`interpret` SHALL proceed in three phases:

1. **Frontmatter pass.** For each key in the note's frontmatter mapping, look up the rule that governs the key.
  The rule declares which predicate the key produces, and how the key's value maps to value-domain elements.
  Default convention: a scalar produces a $t$-valued cell at the predicate; a list produces one cell per element; a mapping produces structured cells; explicit negation or contested tags (the realization's mapping format SHOULD provide a syntax for these) produce $f$- or $\top$-valued cells.
  Cells are accumulated into the fiber.
2. **Body pass.** Scan the note's body for predication-bearing patterns declared in the rules: link references to other entities (producing `link` predications), citation keys (producing reference predications), kind-specific patterns.
  Cells are accumulated into the fiber.
3. **Default pass.** For predicates the rules declare as having defaults (e.g., `kind` defaulting from `dir`), apply the defaults where no cell was produced in earlier passes.

The result is a [`Fiber`](../structures/fiber.md) whose `cells` mapping is the union of cells from all three passes (with later passes overriding earlier passes per the rules' precedence) and whose `provenance` mapping records which pass and which presentation source produced each cell.

## Normative invariants

- **Deterministic.** Given the same `(note, rules)`, `interpret` SHALL return byte-identical fibers.
  No hidden state, no time-dependent values, no realization-defined ordering.
- **Idempotent on a fiber's projection.** If a fiber `F` is projected back to presentation form (a hypothetical inverse morphism `present`) and then re-interpreted, `interpret(present(F), rules)` SHALL equal `F`.
  The round-trip discipline is what makes the layer split coherent; a `present`/`interpret` pair that fails round-tripping has lost information across the layer.
- **Locality-respecting.** `interpret` SHALL read only the source note and the interpretation rules.
  It SHALL NOT read other notes, the global graph, or runtime state.
  A note's interpretation depends on its own content and the substrate's interpretation policy, nothing else.
- **Witness-emitting (as part of [`respond`](respond.md) chains).** A bare `interpret` call does not emit a witness — it is a derivation, not a substrate edit.
  When `interpret` is invoked as a step inside [`respond`](respond.md) or [`settle`](settle.md), the containing operation's witness SHALL record the interpretation's input hash and output hash so the derivation is replayable.

## Relationship to the substrate

In substrates whose stored form is already algebraic (e.g., an EAVT triple store with explicit value cells), interpretation is a no-op — the stored form *is* the fiber.
In FARS, interpretation is non-trivial because the stored form is presentation-layer frontmatter and the algebraic form is bilattice-valued cells; the gap between them is what the morphism bridges.

Per [presentation-and-algebraic-layers](../../../../questions/presentation-and-algebraic-layers.md), this morphism MAY eventually be subsumed by a substrate-level `interpret` morphism with shared commitments; until that question resolves, FARS commits to the morphism defined here as a sub-theory specialization.
Other realizations facing the same layer split may converge on the same signature; that convergence is what would warrant the substrate-level promotion.

## What `interpret` is not

- **Not a parser.** Frontmatter parsing happens earlier — the note's `fm` field is already a parsed mapping.
  `interpret` reads the parsed mapping and produces algebraic content; the bytes-to-mapping step is part of [`load`](load.md), not part of interpretation.
- **Not validation.** Validation against shapes is a separate operation that reads fibers and checks shape predications.
  Interpretation produces the fibers validation reads.
  A note whose frontmatter does not satisfy the substrate's shapes still interprets to a fiber (potentially with $\top$ or $\bot$ cells where shape predications would be expected); validation reports the mismatch as a witness.
- **Not normalization.** Some closure rules canonicalize predications (e.g., normalize a slug's casing).
  These run as closure-rule applications during [`settle`](settle.md), not during interpretation.
  `interpret` produces the substrate's view of the note's content under current rules; canonicalization is a separate substrate move that may follow.
