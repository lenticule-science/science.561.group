---
title: YAML Frontmatter as Relational Expression Syntax
description: Documents the discovery that YAML frontmatter is the corpus's relational expression syntax, defines its constituent parts, and identifies missing query and reduction features.
date-created: 2026-04-04
type: note
name: relational-expression-syntax
keywords:
  - relational-expressions
  - frontmatter
  - dsl
  - query-syntax
  - language-design
specialization: idea
date-modified: 2026-04-06
serves: [relational-computer, flatfile-system, ordering-first-computation]
aliases:
  - Relational Expression Syntax — the DSL we're already writing
in-service-of: lib/emsenn/services/561-group/services/561-group-services-section
updated: 2026-04-06
---

## Captain's prompt (2026-04-04)

> At some point, we're even going to have our own like, "relational expression syntax," a bespoke DSL we use internally for our relational algebraics, but we're not there yet.

## Update (2026-04-06): We ARE there. We're writing it right now.

YAML frontmatter IS the relational expression syntax. Every `key: value` in frontmatter is a directed relation (subject=file, predicate=key, object=value). The enrichment work happening across the codebase — adding `requires:`, `produces:`, `enables:`, `depends-on:`, `serves:`, `charter-function:` to records — IS writing relational expressions that respond() computes over.

The syntax is:
- **Atoms:** entity ids, strings, numbers
- **Relations:** frontmatter keys (each key IS a predicate)
- **Lists:** YAML arrays express one-to-many relations
- **Composition:** respond(entity-A, entity-B) composes their fibers via ⊙
- **Inference:** respond(entity-A ⇒ entity-B) computes residuation
- **Values:** {t, f, ⊤, ⊥} — the bilattice evaluation of each predicate

What we don't yet have:
- A **query syntax** beyond MCP tool parameters (something like `respond(office, {type: task, status: open})` expressed as a string)
- **Reduction rules** expressed in the syntax itself (currently in JavaScript)
- **Constraint declarations** in the syntax (currently signatures are implicit)

These are extensions of the existing syntax, not a separate DSL to be built later. The frontmatter IS the language; what's missing are more expressive forms within it.

## Implication for infrastructure

Every decision about frontmatter conventions IS a language design decision. The `writing-frontmatter` skill IS the language specification. The `frontmatter-foundations` plan IS the language's type system. The convergent enrichment work IS writing programs in this language. This should be recognized explicitly — not as "we'll have a DSL someday" but as "the DSL is YAML frontmatter and we're actively developing its vocabulary and semantics."
