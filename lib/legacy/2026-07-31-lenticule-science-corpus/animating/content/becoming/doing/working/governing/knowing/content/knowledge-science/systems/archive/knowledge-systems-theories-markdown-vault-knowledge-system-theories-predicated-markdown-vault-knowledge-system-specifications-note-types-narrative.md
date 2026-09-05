---
title: "Narrative notes"
---


A *narrative note* (frontmatter `type: narrative`, directory `narratives/`) is a 500–3000 word rhetorical document that walks a path through the material, linking concepts / objects / morphisms / theorems into a story. Narratives are not authoritative for the math or the engineering — the typed notes are. Multiple narratives can cover the same territory from different angles; that is by design.

Narratives are where the *through-line* work happens. Atomization on its own loses the story; narratives put it back.

## Required frontmatter

```yaml
---
type: narrative
---
```

## Positioning frontmatter (one or more)

A narrative SHOULD declare exactly one of three positioning relations — they tell the renderer where to place the narrative in a linear reading:

- **`introduces: [...]`** — place the narrative immediately *before* the first listed item. Used for introductions, motivations, outlines, and previews that orient toward what follows.
- **`recaps: [...]`** — place the narrative immediately *after* the last listed item, inline with the surrounding material. Used for section summaries, revisitations, and informal interpretations.
- **`discusses: [...]`** — place the narrative *after* the last listed item, grouped at the end of the surrounding region. Used for chapter-end discussions, bridges to outside literature, and forward-pointing outlook.

A narrative MAY carry more than one positioning relation when it does more than one job (introducing some items, recapping others). In practice, most narratives have a single role.

The semantic kind (introduction vs. motivation vs. summary vs. comparison vs. outlook) is body content; the positioning relation is renderer-facing.

## Recommended frontmatter

- `status:` — `current | obsolete | superseded`. A superseded narrative SHOULD link to the narrative that replaced it.
- `chapters: [...]` — for *Part narratives*: the ordered list of chapter narratives belonging to this Part. Used by the renderer to assemble Parts in a published monograph.
- `see-also: [...]` — non-load-bearing related narratives.

## Body conventions

Narratives have *less* structure than other typed notes — they are prose. Some heuristics:

- 500–3000 words. Below 500 the narrative is too thin to do its job; above 3000 it should split.
- A narrative SHOULD have an explicit voice and perspective. Two narratives on the same material from different angles is the point.
- A narrative MAY freely cite concepts, objects, morphisms, and theorems. Citations are wikilinks (relative paths) per the corpus convention.
- A narrative MUST NOT introduce new mathematical content that the typed notes do not already carry. If a narrative needs a new concept or theorem, the typed note SHOULD be authored alongside it.
- A narrative MAY use display math, code, tables, diagrams — whatever the through-line needs.

## When to use `narrative` vs. alternatives

- Use `narrative` for any 500–3000 word piece of prose that walks through material — introductions, motivations, summaries, outlooks, comparisons.
- Use [concept](concept.md) when the content is fixing the meaning of a recurring word.
- Use [theorem](theorem.md) when the content is a single claim with a proof.
- Use a README for a directory's *front-door* description (what's here, how to read it, status). Not every theory's prose needs to be a narrative; some belongs in the README.

## Validation rules (informal)

- A narrative note MUST declare `type: narrative`.
- A narrative SHOULD declare at least one of `introduces:`, `recaps:`, `discusses:`, or `chapters:`. A narrative without any positioning relation is a floating note — it can be read but the renderer cannot place it.
- A narrative's positioning targets MUST resolve to existing notes.
- A narrative SHOULD NOT exceed 3000 words. Longer narratives are signals to split.

## Examples

- Procedural narrative: [computation-protocol](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/prose/teaching/explanations/computation-protocol.md). `discusses:` predication-settling and the four-regime dichotomy. An eight-step pipeline for benchmarking any concrete settling end-to-end.
- Engineering walkthrough: [input-inference-output](../../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/narratives/input-inference-output.md). Traces a message from arrival to settled response through FARS's algebra core.
