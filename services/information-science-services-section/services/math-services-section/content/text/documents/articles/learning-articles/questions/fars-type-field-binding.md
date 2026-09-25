---
type: question
status: open
depends-on: [typing-judgment, inhabitation, curry-howard-correspondence]
title: "Bind the corpus's type: field to a type-theoretic semantics"
description: "The corpus convention requires every typed note to carry a type: frontmatter value (one of: concept, definition, theorem, axiom, question, narrative, example, reference, ...) and an optional class: refinement."
---

# Bind the corpus's `type:` field to a type-theoretic semantics

The corpus convention requires every typed note to carry a `type:` frontmatter value (one of: `concept`, `definition`, `theorem`, `axiom`, `question`, `narrative`, `example`, `reference`, ...) and an optional `class:` refinement. The [predicated-markdown-vault-knowledge-system frontmatter-relations spec](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/specifications/frontmatter-relations.md) treats the `class:` field as a *typed-predication structure*: each note has a class, classes form a hierarchy, and predicates have typed signatures over classes.

This is informally a type system. The question is: should the corpus formalise it as one?

## What is established

- The [curry-howard-correspondence](../../research-articles/curry-howard-correspondence.md) makes the analogy precise: the corpus's `status: proved` for a `type: theorem` note is exactly *inhabitation* of the type corresponding to the theorem's claim. The [inhabitation](../../../../glossary/terms/inhabitation.md) concept names this directly.
- Existing classes (concept, definition, theorem, etc.) form a small fixed enumeration — not a hierarchy with subtyping. That makes the system structurally a *sum* of disjoint sorts, not a full type system.
- The FARS toolkit's validators currently check `type:` values against a string list, not against a typed schema.

## What remains open

- *Should the corpus's class system be lifted to a real (small) type theory?* This would let frontmatter validators do structural checking ("this `predicate` has typed arity (concept, theorem) → status") rather than string matching.
- *Is `class:` a refinement type, a sort, or a polymorphic class?* Each reading suggests a different formal toolkit (refinement types, many-sorted logic, type classes in the Haskell sense).
- *The downstream `depends-on: [pi-type]` edge from [logic/concepts/quantifier.md](../../../../glossary/terms/quantifier.md) demonstrates the binding pattern at a single note — quantifier ↔ Π-type. The toolkit-side analogue (validator that uses the type-theoretic structure to check note shapes) is the open work.*
