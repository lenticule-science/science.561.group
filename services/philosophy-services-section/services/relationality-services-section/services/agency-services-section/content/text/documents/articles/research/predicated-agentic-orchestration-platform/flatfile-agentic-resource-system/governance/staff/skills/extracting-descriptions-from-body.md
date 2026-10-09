---
name: extracting-descriptions-from-body
description: Skill for populating a resource's description frontmatter from its existing body text without producing slop — extraction source depends on kind (H1 for questions/friction-logs, first paragraph for narratives, first body sentence for concepts/structures/transformers).
title: extracting-descriptions-from-body
---

## Why this skill exists

The migration that ran on 2026-05-14 extracted `description:` from every file's H1 heading.
For many files (transformer signatures like `# load`, concept titles like `# Algebra-as-protocol`) the H1 IS the slug or a title-case rendering of it, and the result was `description: load` — useless, lint-flagged by `description-is-just-slug`.

The lesson: different resource kinds have different conventions about what is informative in their body.
The right extraction differs by kind.

## Per-kind extraction rule

| Kind | Source of description |
|---|---|
| friction-log (under `work/logs/friction/`) | H1. Friction-log H1s are full descriptive sentences ("Fresh `uv tool install fars` is missing jinja2 — every template-driven harness fails"). |
| question (under `questions/`) | H1. Question H1s are the question itself ("Are routable LLM endpoints federation-graph members?"). |
| prose narrative (under `prose/teaching/explanations/`) | First paragraph after the H1. Narratives' H1s are short titles ("Input → inference → output"); the first paragraph carries the actual summary. |
| concept (under `concepts/`) | First sentence of the first paragraph after the H1, with markdown inlines stripped. Concept H1s tend to be slug-as-title-case; the first body sentence states the concept's role. |
| structure (under `structures/`) | First sentence of first paragraph after H1, markdown-stripped. Same shape as concepts. |
| transformer (under `transformers/`) | First sentence of first paragraph after H1, markdown-stripped. Transformer H1s are usually just the operator name; the first body sentence states what the operator does. |
| claim (under `claims/`) | Either the H1 (if it's a descriptive sentence) or the first body sentence. Inspect first; claims have mixed conventions. |

## How to apply

For each resource file:

1. Identify the kind from its directory location.
2. Apply the per-kind rule.
3. Strip markdown inlines from the extracted text: `[text](url)` → `text`, `` `code` `` → `code`, `*emph*` → `emph`, `**bold**` → `bold`, `[[wikilink]]` → `wikilink`.
4. For sentence-level extraction, split on `[.!?]
  ` followed by whitespace.
5. Write back as `description: "<extracted>"` (quote because descriptions often contain colons, brackets, or other YAML-special characters).

## What this skill does not do

- Does not write descriptions from scratch when the body has no useful summary.
  For files where the body's first sentence is "See [adjacent-doc]" or otherwise useless, leave the description unset and surface as a lint violation — a human must write it.
- Does not enforce length limits.
  Real ograph-grade descriptions are 100–160 chars; this skill's extractions are typically that, but it does not truncate.
  Aggressive truncation produces dangling sentences.
- Does not handle markdown extensions (code fences inside paragraphs, callouts, math blocks).
  For files with such content, the extracted description may include code or formula text.
  Manual review for these.
- Is NOT a substitute for an LLM-delegated description rewrite.
  The extractions are mechanically-derived from existing prose; they preserve information but rarely improve clarity.

## Source

This skill captures the heuristic used by the per-kind Phase 2 description population (2026-05-14).
It is not yet wrapped in a reusable script — current practice is per-kind one-shot Python inline scripts via Bash.
A future iteration may add a script under `scripts/` that takes a `<kind>` argument and applies the corresponding rule.
