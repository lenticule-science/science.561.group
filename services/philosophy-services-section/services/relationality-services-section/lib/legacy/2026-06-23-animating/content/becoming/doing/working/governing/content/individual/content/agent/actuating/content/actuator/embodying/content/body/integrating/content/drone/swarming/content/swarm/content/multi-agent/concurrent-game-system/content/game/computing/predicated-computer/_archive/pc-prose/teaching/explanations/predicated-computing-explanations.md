# narratives/

Short rhetorical documents (≈500–3000 words) that walk a path through the material, linking [objects](../objects/), [morphisms](../morphisms/), [theorems](../theorems/), and [concepts](../teaching/explanations/) into a story. Not authoritative for the engineering content; multiple narratives can cover the same structures from different angles. The [substrate-opener](substrate-opener.md) is the corpus's first framing document.

A narrative has a *voice* and a *position*. The voice may be motivational, recapitulating, comparative, or expository. The position determines where in the linear render the narrative goes — see the `introduces:` / `recaps:` / `discusses:` frontmatter keys.

## Frontmatter

```yaml
---
type: narrative
status: current | draft | superseded
introduces: [...]
recaps: [...]
discusses: [...]
chapters: [...]
---
```

## Body shape

A narrative is prose. It is not a theorem with a proof; it is not a definition with components; it is a paragraph-level argument about *how the corpus is organized* or *why a particular piece matters*. The body is structured as needed by the argument; section headings are used freely.

## When to add a narrative

When an argument or framing benefits the reader and would not fit naturally inside an object or theorem body. Examples: opening narratives that frame the corpus's overall stance, comparison narratives that relate the corpus to nearby external work, recap narratives that consolidate what a section has established.

A narrative is the corpus's primary tool for *the through-line* — the story that the kind-by-kind organization alone would not produce.
