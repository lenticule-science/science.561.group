---
title: "Frontmatter relations"
description: The corpus-wide reference for the frontmatter relations that connect typed notes into a sound dependency graph.
---


The corpus-wide reference for the frontmatter relations that connect typed notes into a sound dependency graph. This is lifted and generalized from [predication-categories' relations table](../research/2026/07/31/lenticule-import/animating/humanities/theories/math/theories/categories/theories/predication-categories/_index.md#frontmatter-relations) — the canonical statement — and reflects the relations actually used across the typed corpus.

Each relation is a composable rule. Together they form the directed graph the FARS toolkit walks to produce reading orders, dependency audits, orphan detection, and slug-collision reports.

## Ordering relations

These relations impose a partial order on notes; together they define what topological sort the renderer respects.

| Relation | Where it applies | Rendering rule |
|---|---|---|
| `depends-on: [...]` | any | Every listed item MUST appear *before* this note. The strict logical-dependency edge: what the soundness of proofs and the determinacy of derivations rests on. A `depends-on:` cycle is a soundness diagnostic. |
| `introduces: [...]` | narratives | Place this narrative immediately *before* the first listed item's appearance in the linear render. For introductions, motivations, outlines, and previews. |
| `recaps: [...]` | narratives | Place this narrative immediately *after* the last listed item, inline. For section summaries, revisitations, and informal interpretations. |
| `discusses: [...]` | narratives | Place this narrative *after* the last listed item, grouped at the end of the surrounding region. For chapter-end discussions, bridges to outside literature, forward-pointing outlook. |
| `instantiates: [...]` | examples (and sometimes objects) | Place this example *after* every listed item. An example follows what it exemplifies. Used by objects to declare specialization of an upstream parent's object (a FARS object instantiates an AOP object). |
| `closes: <slug>` | morphisms | Marks this morphism as the chapter-closing operator for `<slug>`. The renderer positions it at the end of the chapter `<slug>` anchors. |
| `chapters: [...]` | Part narratives | The ordered list of chapter narratives belonging to a Part. Used to assemble Parts in a published monograph. |

## Cross-reference relations

These relations connect notes for navigation but impose no ordering constraint.

| Relation | Where it applies | Meaning |
|---|---|---|
| `realizes: [...]` | objects, morphisms | Names which concepts this structure realizes. Used for grouping and cross-reference. |
| `see-also: [...]` | any | Non-ordering. Produces hyperlinks/footnotes; for "this connects to..." remarks that are not logical dependencies. |
| `explores: [...]` | questions | Names the entities a question is inquiring into. Treated as outgoing-graph edges; questions with non-empty `explores:` are exempted from orphan detection. |
| `instantiates: [...]` | objects, morphisms (in subtheories) | Names the upstream parent-theory entity this realization specializes. A FARS `Fiber` object instantiates RC's `predication-fiber`. |
| `component-of: <slug>` | any (often `_index.md`) | Names the parent theory or domain this directory is a component of. Used by the renderer to build navigation. |

## Classifier relations

These relations are *typed labels* used for queries and groupings.

| Relation | Where it applies | Meaning |
|---|---|---|
| `class: <classifier>` | concepts, objects, morphisms, theorems, … | Classifier for the kind of mathematical or engineering thing this is — `set`, `entity`, `algebra`, `operator`, `category`, `record`, `program-unit`, `pattern`, `discipline`. Provides typed DAG edges: a query "all things of `class: entity`" returns the family. Not an ordering relation. |
| `symbol: <s>` | concepts, objects, morphisms | The canonical mathematical symbol denoting this term. Symbols SHOULD be unique within a theory; cross-theory symbol collisions are warnings. The validator surfaces collisions because two notes claiming the same symbol break disambiguation. |
| `status: <s>` | theorems, conjectures, questions, examples, narratives | The note's maturity status — `proved`, `sketch`, `draft`, `open`, `refuted`, `verified`, `partial`, `current`, `obsolete`, etc. The exact vocabulary is per-type (see the per-type specs). |
| `type: <t>` | every typed note | The note's type per [note-types](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/note-types). MUST match the directory the note lives in. |

## Verification relations

| Relation | Where it applies | Meaning |
|---|---|---|
| `lean: <module>` | objects, morphisms, theorems | The Lean 4 module path that mirrors this entity. Validated at build time: a theorem with `status: proved` and a `lean:` reference is *machine-checked*. |

## Bibliographic relations

| Relation | Where it applies | Meaning |
|---|---|---|
| `key:` | references | The citation key matching the `.bib` entry. |
| `authors:`, `year:`, `title:`, `venue:`, `doi:`, `eprint:`, `eprinttype:`, `url:` | references | Bibliographic metadata. See [reference notes](../../../../../../../content/text/glossary/terms/reference.md). |

## Skill / runbook relations

These relations connect operational artifacts (SKILL.md files in `governance/skills/`) to their theoretical anchors. See [skill-colocation](skill-colocation.md) for the full discipline.

| Relation | Where it applies | Meaning |
|---|---|---|
| `realizes: <skill-record-slug>` | operational SKILL.md | The theoretical `skill-record` object this skill instance realizes. |
| `enables-capabilities: [...]` | operational SKILL.md | The capabilities an agent gains by holding this skill. |
| `region: {reads: [...], writes: [...]}` | operational SKILL.md | The substrate region the skill operates within. |
| `part-of: <theory-slug>` | operational SKILL.md | The theory whose machinery establishes this skill as possible. |

## Composition rules

The relations are designed to compose. A topological sort respecting `depends-on:`, `introduces:`, `recaps:`, `discusses:`, `instantiates:`, and `closes:` produces a sound reading order. Ties between siblings with no mutual dependency are broken alphabetically by slug, and overridden case-by-case if reading flow requires.

`realizes:`, `see-also:`, and `explores:` impose no ordering constraint. They are pure cross-reference.

`class:`, `symbol:`, `status:`, `type:`, `lean:` are labels — they classify and verify, not order.

## Adding new relations

The relation set is deliberately minimal. Adding a new relation is a corpus-wide commitment: the FARS toolkit must learn it, every theory's renderer must respect it, and every contributor must understand it. New relations SHOULD be added only when:

1. Three or more theories independently want the same relation.
2. No existing relation can be adapted (sometimes a new `class:` value or a per-theory frontmatter convention suffices).
3. The relation has a clear renderer rule and a clear validation rule.

When in doubt: do not pre-emptively scaffold relations that are not yet needed.
