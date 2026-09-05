---
type: narrative
status: current
depends-on: [typing-judgment, curry-howard-correspondence, inhabitation]
---

# Types as the grammar of meaning

This narrative argues for the corpus posture that *type theory is what underwrites the corpus's `type:` and `class:` frontmatter conventions*: every typed note carries a type assignment, and a `status: proved` claim is a claim of [inhabitation](../teaching/explanations/inhabitation.md).

## The propositions-as-types view

The [curry-howard-correspondence](../theorems/curry-howard-correspondence.md) makes the following identifications precise:

- A *proposition* is a *type*.
- A *proof* is a *term*.
- *To assert that $A$ is true* is *to claim that the type $A$ is inhabited*.
- *To verify a proof* is *to type-check the term*.

Read the other way: every type-theoretic statement has a proof-theoretic content, every proof-theoretic statement has a type-theoretic content, and the translation between them is mechanical.

## The corpus's `type:` field as a (small) type system

The corpus's frontmatter convention — every note has a `type:` and may have a `class:` — is structurally a *small type system*. The `type:` is a sort (concept, definition, theorem, axiom, ...) and the `class:` is a refinement. The [predicated-markdown-vault-knowledge-system frontmatter-relations spec](../../../../../../../science/theories/information/theories/knowledge-systems/theories/markdown-vault-knowledge-system/theories/predicated-markdown-vault-knowledge-system/specifications/frontmatter-relations.md) treats the relations between notes (`depends-on:`, `realizes:`, `class:`) as a *typed-predication structure*: each predicate has a typed signature.

This is informal type theory, working as a sense-making aid for human readers. Whether it should become *formal* type theory — checked by a validator that knows the typing rules — is the open question [questions/fars-type-field-binding](../learning/questions/fars-type-field-binding.md).

## What this directory contributes

By naming the type-theoretic vocabulary explicitly — [typing-judgment](../teaching/explanations/typing-judgment.md), [typing-context](../teaching/explanations/typing-context.md), [inhabitation](../teaching/explanations/inhabitation.md), [normalization](../teaching/explanations/normalization.md), [universe-level](../teaching/explanations/universe-level.md) — and by deriving the [curry-howard-correspondence](../theorems/curry-howard-correspondence.md) here rather than informally, the directory makes the corpus's type-conventions *legible as type theory*. A future revision of the FARS toolkit can then adopt these terms verbatim when formalising what `type:` and `class:` actually mean.

The downstream `depends-on: [pi-type]` edge added to [logic/concepts/quantifier.md](../../logic/concepts/quantifier.md) is the load-bearing demonstration: the [universal quantifier](../../logic/concepts/quantifier.md), defined categorically as the right adjoint to substitution, is *the same thing* as the [pi-type](../objects/pi-type.md), defined syntactically as a type former. The corpus says so by saying so — typographically, with a `depends-on:`.
