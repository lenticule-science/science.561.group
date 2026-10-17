---
title: "Markdown typed against finite-settlement-algebra"
date: 2026-05-28
type: "[[journal entry]]"
status: draft
about: Markdown
in-light-of: positing, scott-continuous-posit-category, finite-settlement-algebra, finite-predication-cell-trace, hashup
supersedes-overclaims-in: this same file's earlier draft, which described Markdown via no-fail / closed-AST / settling-regime properties without typing it against the potential tree's positing/settling infrastructure
date-created: 2026-05-28
description: "A first pass at this entry described Markdown as: total parsing function, closed AST vocabulary (~17 CommonMark node kinds), rigid spec-time binding, settling-regime (κ<ω) at every level."
---

## The earlier draft of this entry described, but did not type

A first pass at this entry described Markdown as: total parsing function, closed AST vocabulary (~17 CommonMark node kinds), rigid spec-time binding, settling-regime (κ<ω) at every level. Those descriptions are not wrong, but they stop short of the actual typing. The potential tree has `finite-settlement-algebra` already defined as the κ<ω category, with `finite-predication-cell-trace` as one of its inhabitants. This entry types Markdown directly against that schema.

## Markdown typed

Markdown is a finite-predication-cell-trace in finite-settlement-algebra. Specifically:

- **Cell-set Φ_md**: the positions of every CommonMark-recognized token in the source string, plus the positions of all literal text. Each cell φ = (s, p, o) has s = source-location, p = AST-node-kind (paragraph, emphasis, code-span, heading-1..6, link, image, …), o = the node's content or target.
- **Positing-trace**: CommonMark itself, interpreted as a function source-string → positing-trace. The parser walks the source, and at each recognized token-pattern it emits a positing-step `posit_{(φ, q)}` with φ at the token's position, q at the FOUR datum encoding "this AST-node-kind is present here, with this content."
- **Valuation**: the result of applying the CommonMark-generated positing-trace from the all-⊥ initial valuation. This is the AST_md, presented as a valuation over Φ_md.
- **Rendering**: settling-projection of the valuation into a target output format (HTML, etc.).

Markdown is thus *fully specified by* the function that maps source-strings to positing-traces. CommonMark IS that function, written down deterministically. The AST is just the settled valuation.

## What the earlier observations correspond to, under the typing

The earlier-draft observations re-cast:

- **No-fail / totality** = the CommonMark function source-string → positing-trace is total. Every source-string maps to *some* positing-trace, even if a trivial one (the source is one literal-text cell). Malformed Markdown produces a positing-trace with fewer non-⊥ positings, not an error.
- **Closed AST vocabulary** = the predicate-category from which Φ_md's p-components are drawn is fixed at spec-time. CommonMark fixes the set of AST-node-kinds.
- **Rigid spec-time binding** = the function source-string → positing-trace is fixed at spec-time. The trace is determined by the source given the spec; there is no parameter to vary.
- **Settling-regime (κ<ω) at every level** = inherited from being in finite-settlement-algebra. The source is finite, the positing-trace is finite, the valuation is finite, the rendering settles in finite steps.

These are not separate properties; they are consequences of Markdown being typed as: *the finite-predication-cell-trace produced by applying a fixed (spec-time) total function source → positing-trace to a source string.*

## How Hashup sits in the same picture

Hashup is also a finite-predication-cell-trace in finite-settlement-algebra. The differences from Markdown:

- **Cell-set Φ_hashup ⊆ Φ_md**: hashup's cells are only the hashtag-positions. All other token-positions are dropped; they remain as literal text. This is a sub-object inclusion in finite-settlement-algebra.
- **Positing-trace is supplied at evaluation, not at spec**: instead of CommonMark generating the trace from the source, the user supplies a binding-table B which is itself a positing-trace. Hashup's "spec" is just "the function from binding-table to positing-trace is the identity."
- **Default valuation is all-⊥** and remains so at every cell whose word is not in dom(B). This is just settling of an under-populated positing-trace.

So Markdown and Hashup are both finite-predication-cell-traces; both use positing as their generator; both settle in `finite-settlement-algebra`. They differ in *who supplies the positing-trace* (CommonMark spec vs. user-supplied binding-table) and in *which cells are in the cell-set* (all CommonMark tokens vs. only hashtags).

This is enough to make `markdown/hacking/restricting/library/hashup/` correct as a placement: hashup is a restriction of Markdown in finite-settlement-algebra (sub-object inclusion on cell-sets), with a parameterized positing-trace instead of a spec-fixed one.

## What this typing makes clear

- Markdown is not a special new kind of object. It is a finite-predication-cell-trace, the same kind of object the potential tree already defines and operates on.
- The CommonMark spec is, in this typing, a particular function source-string → positing-trace. The spec is a piece of code; the math is the positing.
- Hashup's relation to Markdown is sub-object inclusion plus positing-trace parameterization. Neither move requires new infrastructure.
- The four-regime tower already houses Markdown and Hashup. Nothing here climbs regimes; both live at the floor (finite-settlement-algebra).

## Where this would live if it were active substrate

Markdown (the markup language) is in `lab/` because it is a tool used by the work, not an potential proof-engine artifact. If it became active, the right placement would be somewhere under `finite-settlement-algebra/library/` as a particular finite-predication-cell-trace-family parameterized by the CommonMark spec. Hashup would sit beside it as the restricted-cell-set, parameterized-trace variant.

## Open questions that survive the typing

- **Whether CommonMark or a richer Markdown flavor is the right object.** GFM, Pandoc, MultiMarkdown all give different positing-trace-generation functions. The math doesn't care which; the spec-completion does.
- **Whether the rendering target (HTML, plain text, …) should be modeled as a separate functor out of the settled valuation or as part of the settling itself.** Settling currently produces a finite presentation; rendering to HTML is a further pass. The two-stage factorization in CommonMark (source → AST → output) is naturally settled in this picture.
