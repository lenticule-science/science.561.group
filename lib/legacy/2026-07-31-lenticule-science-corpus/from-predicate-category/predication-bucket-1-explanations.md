# narratives/

Short rhetorical documents that walk a path through the material, linking objects, theorems, concepts, and examples into a story. One path per file.

Narratives are not authoritative for the math. The authoritative content lives in `objects/`, `morphisms/`, `theorems/`. A narrative is a *reading* of that material. Multiple narratives can cover the same objects from different angles without conflict.

This is where the through-line work happens. Atomization makes definitions precise but loses the question "why are we doing all this." Narratives answer that question, repeatedly, from different angles, without forcing a single canonical story.

## Frontmatter

```yaml
---
type: narrative
status: draft | current
depends-on: [...]                # the notes the narrative walks through
---
```

`current` is the working state. When a later narrative replaces an earlier one for its angle, the earlier file is *deleted* — keeping a superseded narrative usually just confuses readers about which one is live.

## Length

Aim for 500–3000 words. A narrative longer than that is doing too many things; split it. A narrative shorter than that is probably a discussion paragraph that belongs inside an object or theorem note.

## Examples of narrative angles

- "How truth changes shape across the program."
- "The cohomology story: from CRDT merges to derived functors."
- "Why bilattices, and why these bilattices."
- "The four regimes and what each one is for."
- "How the program will continue: from moduli to deformation theory to representation theory."

A narrative does not need to be exhaustive. It should be a *good walk*, not a survey.

## When narratives become papers

Eventually some narratives, alone or in combination, will become arXiv papers. That is an output, not a goal that should pull narratives toward paper-shape. A narrative that reads like a paper introduction is fine; one that reads like a paper section is probably trying to do the work that an `objects/` or `theorems/` note should be doing.
