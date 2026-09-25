---
name: canonical-interpretation-rules
description: "What canonical interpretation rules does FARS commit to?"
type: question
status: open
explores: [frontmatter-as-presentation, interpret, fiber]
title: canonical-interpretation-rules
---

# What canonical interpretation rules does FARS commit to?

The [`interpret`](../code/transformers/interpret.md) morphism translates a [`Note`](../objects/note.md)'s presentation-layer content into a [`Fiber`](../code/structures/fiber.md) of bilattice-valued cells.
The translation is governed by *interpretation rules* — declarations of which presentation patterns produce which fiber cells with which values.
Per [frontmatter-as-presentation](../flatfile/frontmatter-as-presentation/frontmatter-as-presentation.md), the rules are themselves substrate content (entities the substrate stores and operates on, not hard-coded operator logic).

The substrate-side question — *should presentation-to-algebra interpretation be a substrate-level concern in [the predicated-computing theory](../../../../../README.md)?* — is open and tracked at [presentation-and-algebraic-layers](../../../../questions/presentation-and-algebraic-layers.md).
This question is downstream: assuming the layer split exists at the FARS scope, which interpretation rules does FARS canonically commit to?

The question matters because the rules are what determine, byte-for-byte, what fiber an entity has.
Two FARS realizations that interpret the same note's `status: draft` differently produce different inference.
Pinning canonical rules is what makes FARS realizations interchangeable on the inference axis (per the [settlement-determinism](../theorems/) commitment, where stated).

## Concrete cases

- **What is the default value-domain mapping for a scalar?** A frontmatter `status: proved` is naturally a $t$-valued cell at the predicate `status=proved`.
  Are alternative cells (a $t$-valued `is-proved`, a $f$-valued `status=draft`, a multi-valued enum cell) admissible under different rule choices, or does FARS canonicalize one mapping?
- **How does FARS represent told-false and contested?** The bilattice's $f$ and $\top$ values need a presentation syntax.
  A YAML tag (`!false`, `!contested`)?
  A nested mapping (`status: {value: proved, contested: true}`)?
  An explicit predicate (`denies-status: draft`)?
  Different choices have different ergonomics for human authors and different brittleness under mechanical edits.
- **What predicates does the path predicate?** A file at `theorems/bilattice-adjunction.md` minimally has `kind=theorem` (from the directory) and `slug=bilattice-adjunction` (from the filename stem).
  Beyond these, what does the path predicate?
  Scope (from a `scope/` segment)?
  Domain (from a `domains/` segment)?
  The rules need to be explicit about which path-derived predicates are produced and at what value.
- **What body patterns produce predications?** Markdown links (`[foo](foo.md)`) produce `link` predicates.
  Citation patterns (`[@key]`) produce reference predicates.
  Headers (`## Section`) — do these produce predicates, or are they presentation-only?
  Code blocks, math blocks, footnotes — what's load-bearing?
- **What is the rule-evaluation order, and what wins?** Frontmatter-pass cells, body-pass cells, default-pass cells: how does precedence resolve when the same cell is produced by multiple passes?
  Does later overwrite earlier (overriding semantics) or compose under $\odot$ (extending semantics)?
  The two produce different fibers.
- **How are interpretation rules themselves expressed?** As markdown notes with frontmatter?
  As a separate rule format?
  Per [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), they SHALL be substrate content; the question is what kind of substrate content, and how an authoring affordance for rule edits looks.

## Relevance

A resolved answer pins what a FARS corpus *is*, byte-for-byte, given its source notes and rule set.
Without canonical rules, FARS realizations diverge on inference and the spec's [determinism](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/determinism.md) invariant becomes a per-realization invariant rather than a cross-realization one.
With canonical rules, two FARS implementations are interchangeable under the substrate's content — the engineering claim FARS commits to.

The question is also entangled with the substrate-level [presentation-and-algebraic-layers](../../../../questions/presentation-and-algebraic-layers.md) question.
If the layer split is admitted as a substrate-level concern, the substrate may impose constraints on what canonical rules can look like (round-trip discipline, idempotence, witness-emission).
If it remains realization-specific, FARS has more degrees of freedom but bears more of the engineering weight alone.

## Structural constraints now established

Per [rule-addition-is-substrate-local](../rule-addition-is-substrate-local/rule-addition-is-substrate-local.md), any set of canonical interpretation rules that FARS commits to has the following engineering property: **changing one interpretation rule (editing the rule entity's `premise` or `conclusion` predications) only re-settles entities whose fibers match the new premise.** This means canonical rules can be refined incrementally — adding finer-grained rules for new frontmatter conventions, or narrowing a rule's `match-radius`, is a local substrate operation.
The corpus does not require a global re-interpret after any rule change; only the matching entities are re-settled.
This establishes a *safety envelope* for the canonical rules' evolution: rule-set refinement is non-catastrophic.

Per [scope-composition-is-knowledge-order-monotone](../scope-composition-is-knowledge-order-monotone/scope-composition-is-knowledge-order-monotone.md), the cell-precedence question (last bullet in the concrete cases) has a structural answer: if multiple passes (frontmatter, body, default) produce cells for the same predicate and the resolution is $\odot$ (pointwise fusion), then the result is $\leq_k$-monotone in each pass's contribution.
Passes that add information ($\bot \to t$) never destroy information from other passes; passes that contradict ($t$ meets $f$ via $\odot$ toward $\top$) produce $\top$-cells that surface as substrate contradictions.
This makes $\odot$-composition the canonical conflict-resolution discipline for multi-pass interpretation — not "later overwrites earlier" (which is non-monotone and destroys information), but "compose via $\odot$ and surface $\top$-cells as interpretation conflicts."

## Status

Open at the concrete-rule level; structurally constrained.
Two of the concrete cases now have principled answers (the conflict-resolution discipline is $\odot$; rule-set evolution is local).
The remaining cases — default value-domain mapping for scalars, presentation syntax for $f$ and $\top$, path-derived predicates, body-pattern predications — require prior-art extraction and realization testing.
