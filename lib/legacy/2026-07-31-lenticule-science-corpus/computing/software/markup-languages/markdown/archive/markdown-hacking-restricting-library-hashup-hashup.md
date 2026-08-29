---
title: "HashUp"
description: "HashUp is a semantic-plaintext markup language designed by emsenn that uses hashtags as the sole markup token: each `#word` is a call to a configurable processor function, with optional arguments supplied as `#word{args}`, recording authorial semantic intent rather than visual typography."
defines: HashUp
related: Markdown, Barnabus, Hashtag, OrgMode
date-created: 2026-05-28
sources:
  - lab/archive/emsenn/hacking/composting/library/bare-cedar-fog-operations-department/operations/projects/writing/letters-to-the-web/2020-10-23-hashup-semantic-plaintext-markup.md
  - lab/archive/wsl-backup/collected-texts/HashUp, Semantic Plaintext Markup--001800.md
  - lab/archive/wsl-backup/collected-texts/Journal, 2025-07-08--001158.md
  - lab/archive/wsl-backup/collected-texts/Journal, 2025-07-09--001130.md
  - lab/archive/wsl-backup/combined.md (Barnabus letter, ~line 59927 and ~line 60097)
origin-repository: https://code.cyberearth.systems/emsenn/hashup
announced: 2020-10-23 (emsenn's Letters to the Web)
---

## What HashUp is

**HashUp** is a plaintext markup language designed by emsenn. Its single markup token is the hashtag. The hashtag — borrowed from social-media convention rather than from typesetting tradition — is the only piece of punctuation HashUp asks the writer to introduce into otherwise ordinary prose.

The HashUp processor reads source text and, for every `#word` it finds, looks up a processor function bound to `word` in the writer's configuration. If a function is bound, the hashtag is replaced with whatever string that function returns. If no function is bound for `word`, the text is left untouched. A pair of curly braces immediately following the hashtag — `#word{arguments}` — passes arguments to the processor function for that word.

This minimal surface (one token, one lookup, one optional argument-payload) is the entire language.

## What HashUp is for

HashUp is built against a specific complaint about existing tools: the dominant ways of producing computer-readable text — WYSIWYG editors like Microsoft Word, and visual-formatting markup languages like Markdown — both serve **typography**, not **semantic encoding**. They let a writer record that a phrase is italicized, but not *why* it is italicized.

When a writer italicizes a word, the underlying intent is almost always something more specific: this is a foreign term, this is a character's internal monologue, this is an emotional emphasis, this is the first appearance of a defined concept, this is the title of a work. Italics is a single visual signal collapsed across all of those distinct intents. Markdown and Word both preserve the italics; both throw away the reason.

HashUp's premise is that writing tools should preserve the reason. A writer marks `#foreign{lebenswelt}` rather than `*lebenswelt*`; the reason for the styling is recorded directly in the source, and the visual rendering becomes one of many possible outputs derivable from that semantic record.

The lineage emsenn draws on:

- **Org-mode macros** — emsenn's previous practice was to wrap potentially-emphasized text in Org-mode macros so the same source could export to different rendered forms (e.g. emphasizing in print, hyperlinking in HTML). HashUp generalizes that practice into a standalone language no longer tied to Emacs.
- **Social-media hashtags** — chosen as the syntactic token because they are already familiar to anyone who has used Twitter, Mastodon, or Instagram, lowering the cost of adoption.
- **Programming languages** — the `#word{args}` form is borrowed from function-call syntax. A hashtag *is* a function call.

## How HashUp behaves

HashUp's evaluation model is direct text substitution driven by a lookup table. There is no nesting and no scope-awareness: any block-opening hashtag must be matched by a block-closing hashtag, because the processor cannot infer where a block ends. The writer (or a standard library of processor functions, if one exists) is responsible for supplying the function-bindings; HashUp itself ships no semantics.

This makes HashUp a **kernel** rather than a finished tool. What HashUp guarantees is the syntactic discipline (one token, one optional argument payload, graceful fallthrough when undefined) and the substitution mechanism. The semantics — what `#foreign`, `#emphasis`, `#character-thought`, `#citation` actually mean and produce — are supplied per-author, per-project, per-rendering-target.

## HashUp's place in emsenn's stack

HashUp sits below **Barnabus**, emsenn's static-site-generator-shaped publishing tool. Barnabus consumes source documents and renders them as HTML; the documents are written in HashUp; Barnabus dispatches the HashUp processor against a chosen set of processor functions to produce the rendered output. The 2020-10-30 letter announcing Barnabus notes that it is also the first piece of writing emsenn drafted *in* HashUp.

HashUp is therefore the **markup layer** and Barnabus is the **publishing layer** in a small two-piece pipeline: writer → HashUp source → Barnabus → HTML.

## The 2025 revision — referencing vs defining

In a 2025-07-09 journal entry, emsenn revisits HashUp in light of large-language-model capabilities and proposes a subtler distinction inside the syntax itself:

- A single `#` before a term — `#cyberearth` — marks that the term is being **referenced**: the writer is naming something already-defined.
- A double `#` before a term — `##cyberearth` — marks that this use of the term is being offered as **defining material**: text where the term appears in this way should be weighed as part of what the term means.

This distinction is aimed at a workflow where AI does the labor of resolving links and constructing knowledge graphs from the writer's prose, and the writer only needs to flag, in passing, whether a given mention is a citation or a contribution. emsenn notes the live concern that *every* use of a term contributes to its definition in some part, which may make the binary referencing/defining distinction overly clean — but the proposal stands as the current direction of HashUp's evolution.

## How HashUp differs from Markdown

| | Markdown | HashUp |
|---|---|---|
| Primary purpose | visual formatting | semantic encoding |
| Markup tokens | many (`*`, `_`, `#`, `>`, `` ` ``, `[]()`, …) | one (`#`) |
| Output | tree of formatting elements | string produced by user-supplied functions |
| Behavior of unknown markup | error or literal | passes through unchanged |
| Authority over meaning | parser / spec | writer's processor functions |

Markdown and HashUp are not rivals at the same level of the stack: Markdown gives you a typeset document; HashUp gives you an authored record from which any number of typeset documents can be derived.

## Status

HashUp exists as a working but limited prototype announced in 2020 at `code.cyberearth.systems/emsenn/hashup`. The 2025 revision (referencing-vs-defining) is named but not yet realized. HashUp has not been formally specified; the description above is reconstructed from the announcement letter, the Barnabus letter, the 2025-07-08 and 2025-07-09 journal entries, and emsenn's running references to it as an in-progress side project.

## Open questions

- Whether the `#word{args}` form is positional or keyword-style, and how multi-argument calls are punctuated. The announcement letter says only "the arguments to the relevant processor function" without specifying.
- Whether HashUp processor functions are pure (string → string) or may carry state across a document (needed for matched-block forms like `#open` … `#close`).
- Whether `##term` (defining-use) and `#term` (referencing-use) are intended to coexist with `#word{args}` (function-call), and whether they would share or shadow the same lookup table.
- How HashUp interacts with HashUp-aware Markdown — whether a document is HashUp-with-Markdown-as-output, or HashUp embedded inside Markdown, or HashUp processed *after* Markdown parsing.
