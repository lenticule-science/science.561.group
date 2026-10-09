---
type: question
class: scoping
status: open
explores:
  - frontmatter-relation
  - depends-on
  - realizes
  - see-also
  - introduces
  - recaps
  - discusses
  - instantiates
  - explores
  - closes
  - chapters
see-also:
  - ../specifications/frontmatter-relations.md
  - ../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md
title: What is the minimum frontmatter relation vocabulary?
description: "Predication-categories declares twelve frontmatter relations: depends-on, realizes, see-also, introduces, recaps, discusses, instantiates, closes, chapters, explores, class, symbol."
---

# What is the minimum frontmatter relation vocabulary?

Predication-categories declares twelve frontmatter relations: `depends-on`, `realizes`, `see-also`, `introduces`, `recaps`, `discusses`, `instantiates`, `closes`, `chapters`, `explores`, `class`, `symbol`. Of these, the first eight are positional/topological relations the renderer uses to produce a sound reading order; `closes` and `chapters` are book-assembly relations specific to the monograph build; `class` and `symbol` are typing/disambiguation relations.

The question: is this twelve-relation set the minimum, or can it be reduced? Conversely, are there relations the corpus needs but does not yet declare?

## Why it matters

Every relation added to the vocabulary is a load on contributors: another decision per note, another rule for FARS to enforce, another column for the renderer to consume. Every relation omitted is a structural fact the corpus cannot represent — the structure migrates into prose, where it is not queryable, or into ad-hoc per-theory conventions, where it is not portable.

The relation vocabulary is a *language*; like any language, what it can say bounds what the corpus can know about itself.

## Sub-questions

1. **Can `realizes:` be derived from `depends-on:`** plus the type of the source and target? An object that depends on a concept is realizing that concept; an object that depends on another object is composing it. If yes, `realizes:` is redundant; if no, it carries information that `depends-on:` does not.
2. **Are the three narrative relations (`introduces:`, `recaps:`, `discusses:`) really three or really one?** They differ only in positioning (before-first, after-last-inline, after-last-grouped). The information they carry is "this narrative concerns these items"; the positioning is a rendering choice. Could a single `concerns:` relation plus a `narrative-position:` field do the same work?
3. **Is `see-also:` doing work `depends-on:` could not?** `see-also:` is non-ordering, but the renderer treats it as a hyperlink anyway. Is the order/no-order distinction load-bearing, or is it a habit from earlier corpora?
4. **What relations are missing?** Inspection of the typed corpus reveals candidates the existing vocabulary does not cover:
   - `contradicts:` — when one theorem rules out another's statement.
   - `subsumes:` / `superseded-by:` — when a newer construction replaces an older one.
   - `attempts:` — when a theorem-with-`status: sketch` attempts to close a question.
   - `audience:` — communication-theoretic; see [audience-and-pragmatics-of-each-note-type](audience-and-pragmatics-of-each-note-type.md).
5. **How are cross-theory edges expressed?** Within a theory, `depends-on: [foo]` resolves `foo` to a sibling slug. Across theories, the only current option is a relative path. Should the corpus introduce a globally-resolvable slug namespace, or stay with paths?

## What an answer would look like

A defended relation set: each relation kept is justified by what queries or rendering rules it enables that the others cannot; each relation cut is justified by what the cut costs and how that cost is recovered. The set should be presented in two layers:

- **Core layer** — relations every theory in the corpus uses.
- **Extension layer** — relations that specific theories opt into (e.g., `chapters:` is monograph-specific).

The answer should also state the resolution rules: what does a bare slug refer to? what does a relative path refer to? what is an error?
