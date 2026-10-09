---
name: frontmatter-as-presentation
description: "The discipline that distinguishes, in FARS, between presentation-layer content (the structured key-value mapping as written in a file's frontmatter) and algebraic-layer content (predications carrying values in the substrate's value-domain)."
type: concept
class: layer-distinction
depends-on: [substrate-value-domain, flatfile]
see-also: [interpret, fiber, identity-by-relations]
title: frontmatter-as-presentation
---

# Frontmatter as presentation

The discipline that distinguishes, in FARS, between *presentation-layer* content (the structured key-value mapping as written in a file's frontmatter) and *algebraic-layer* content (predications carrying values in the [substrate's value-domain](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/substrate-value-domain.md)).
A raw frontmatter key/value pair is a string and a structured value; it is *not yet* a predication with a bilattice value.
The move from presentation to algebra is [interpretation](../../code/transformers/interpret.md), and interpretation is what produces a [fiber](../../code/structures/fiber.md).

The distinction is load-bearing.
Earlier readings of FARS conflated the two layers, treating a frontmatter key as a $t$-valued predicate by virtue of being present in the file.
This collapses the substrate's value-domain to a Boolean lattice (presence = $t$, absence = $\bot$), and forecloses the four-valued bilattice's ability to express *told false* ($f$) and *contested* ($\top$).
FARS restores the layer split: presentation is what's on disk; algebra is what the substrate computes; interpretation is the bridge.

## The two layers

**Presentation layer.** The file's frontmatter as a parsed mapping — keys-to-structured-values.
Keys are strings.
Values are strings, lists, mappings, numbers, dates, booleans (and whichever scalar types the realization's frontmatter format admits).
The presentation layer is what a human writes and a parser produces.
It SHALL carry no algebraic commitments: the value `42` for the key `priority` is the integer forty-two, not a fiber element.
A `depends-on: [foo, bar]` entry is a list of two strings, not a pair of $t$-valued predications.

**Algebraic layer.** The fiber computed by interpreting the presentation.
A fiber is a mapping from predicate names (and parameters where required) to values in the substrate's value-domain — for FARS, $\{\bot, t, f, \top\}$.
The fiber is what the substrate's algebra operates on; closure rules SHALL read fiber values, not presentation strings.

## Why the split matters

The same presentation MAY produce different fibers under different interpretations.
A frontmatter key `status: draft` could be interpreted as:

- a $t$-valued predication of `is-draft`, with `is-final` defaulting to $\bot$;
- a $t$-valued predication of `status=draft`, with `status=final` defaulting to $f$ (the values are exclusive in this interpretation);
- a $\top$-valued predication of `status` if a *different* source asserts `status: final` and the interpreter aggregates conflicting claims as contested.

None of these interpretations is wrong; the choice depends on what the substrate's [shape](../../../scope/shape/shape.md) for `status` declares.
The flatfile carries the presentation faithfully; the interpretation is governed by substrate content (shapes, vocabulary, value-domain commitments) and SHALL run deterministically given that content.

A practical consequence: enriching an entity by adding a frontmatter key is a *presentation-layer* edit.
The corresponding *algebraic-layer* effect arises only after interpretation.
Closure rules that fire on the new predication fire after the next interpretation; operators that compose fibers ([`respond`](../../code/transformers/respond.md), [`dispatch`](../morphisms/dispatch.md)) see the new value only after re-interpreting.

## What this is not

- **Not a serialization choice.** YAML-vs-JSON-vs-TOML for the frontmatter is a presentation choice within the presentation layer; the layer split is not about which serialization format is used.
  A FARS realization MAY swap YAML for another structured-mapping format and the layer split is unchanged.

- **Not the body/frontmatter split.** The body of a file is also presentation content (it is human-readable text); some predications are extracted from the body (link references, citation patterns).
  The body and the frontmatter are both presentation; they differ only in which predicates are encoded by which conventions.
  The algebraic layer aggregates predications from both.

- **Not a parser quirk.** The split is structural to FARS's commitment to realize a [predication-graph store](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) over a value-domain richer than Boolean.
  A realization without the split (frontmatter-as-fiber-directly) would be a *Boolean* substrate over a different value-domain than the four-valued bilattice FARS commits to.

## Open

Interpretation rules — which presentation patterns produce which fiber values — SHALL themselves be substrate content (shape records, vocabulary rules), not hard-coded operator logic.
The canonical interpretation rules FARS commits to are not yet pinned in this spec; the question is tracked at [questions/canonical-interpretation-rules](../../canonical-interpretation-rules/canonical-interpretation-rules.md) and at the upstream PC question [presentation-and-algebraic-layers](../../../../questions/presentation-and-algebraic-layers.md), which asks whether the layer split deserves substrate-level standing in the parent theory.
