---
type: explanation
article-kind: narrative
status: current
depends-on: [typing-judgment, curry-howard-correspondence, inhabitation]
title: Types as the grammar of meaning
description: "This narrative argues for the corpus posture that type theory is what underwrites the corpus's type: and class: frontmatter conventions: every typed note carries a type assignment, and a status: proved claim is a claim of inhabitation."
---

# Types as the grammar of meaning

This narrative argues for the corpus posture that *type theory is what underwrites the corpus's `type:` and `class:` frontmatter conventions*: every typed note carries a type assignment, and a `status: proved` claim is a claim of [inhabitation](../../../../glossary/terms/inhabitation.md).

## The propositions-as-types view

The [curry-howard-correspondence](../../research-articles/curry-howard-correspondence.md) makes the following identifications precise:

- A *proposition* is a *type*.
- A *proof* is a *term*.
- *To assert that $A$ is true* is *to claim that the type $A$ is inhabited*.
- *To verify a proof* is *to type-check the term*.

Read the other way: every type-theoretic statement has a proof-theoretic content, every proof-theoretic statement has a type-theoretic content, and the translation between them is mechanical.

## The corpus's `type:` field as a (small) type system

The corpus's frontmatter convention — every note has a `type:` and may have a `class:` — is structurally a *small type system*. The `type:` is a sort (concept, definition, theorem, axiom, ...) and the `class:` is a refinement. The predicated-markdown-vault-knowledge-system frontmatter-relations spec treats the relations between notes (`depends-on:`, `realizes:`, `class:`) as a *typed-predication structure*: each predicate has a typed signature.

This is informal type theory, working as a sense-making aid for human readers. Whether it should become *formal* type theory — checked by a validator that knows the typing rules — is the open question [questions/fars-type-field-binding](../../research-articles/questions/fars-type-field-binding.md).

## What this directory contributes

By naming the type-theoretic vocabulary explicitly — [typing-judgment](../../../../glossary/terms/typing-judgment.md), [typing-context](../../../../glossary/terms/typing-context.md), [inhabitation](../../../../glossary/terms/inhabitation.md), [normalization](../../../../glossary/terms/normalization.md), [universe-level](../../../../glossary/terms/universe-level.md) — and by deriving the [curry-howard-correspondence](../../research-articles/curry-howard-correspondence.md) here rather than informally, the directory makes the corpus's type-conventions *legible as type theory*. A future revision of the FARS toolkit can then adopt these terms verbatim when formalising what `type:` and `class:` actually mean.

The downstream `depends-on: [pi-type]` edge added to [logic/concepts/quantifier.md](../../../../glossary/terms/quantifier.md) is the load-bearing demonstration: the [universal quantifier](../../../../glossary/terms/quantifier.md), defined categorically as the right adjoint to substitution, is *the same thing* as the [pi-type](../../../../glossary/terms/pi-type.md), defined syntactically as a type former. The corpus says so by saying so — typographically, with a `depends-on:`.
