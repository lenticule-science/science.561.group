---
title: "Migrating term notes to the typed vocabulary"
description: "The corpus contains 2054 notes with type: term (and a further 953 with type: text)."
---


The corpus contains 2054 notes with `type: term` (and a further 953 with `type: text`). These predate the typed-note discipline established by predication-categories and inherited by predicated-computing. They are encyclopedic, free-form, and have no schema beyond a loose family of frontmatter keys (`defines:`, `aliases:`, `made-of:`, `distinguished-from:`, `instances:`, `used-by:`, etc.).

This note states the migration discipline: when to upgrade a term to the typed vocabulary, what target type to choose, what frontmatter to translate, and what the cost-benefit is. **Bulk migration is forbidden** per [CLAUDE.md](../research/2026/07/31/CLAUDE.md); this is per-note manual work, done as need arises.

## Why term notes exist

Term notes are *encyclopedia entries*: a slug, a definition, a discussion of how the term sits among neighboring terms in the literature. They are valuable as *lexical anchors* — they let other notes cite a term by stable name without committing to a structural definition. The skill term ([engineering/theories/tech/terms/skill.md](../research/2026/07/31/lenticule-import/animating/engineering/theories/tech/terms/skill.md)) is a good example: it traces the concept's lineage through Aristotle, Ryle, the Dreyfus brothers, and into agentic systems, without committing to any particular substrate-level shape.

Term notes are *not* second-class — for many parts of the corpus (the encyclopedic-leaning humanities theories especially), they remain the right shape. The migration discipline is about identifying the cases where the typed vocabulary is more useful, not about deprecating terms wholesale.

## When to upgrade a term to the typed vocabulary

Upgrade a term to a typed note when:

1. **A theory has earned [theory status](theory-discipline.md) and the term is one of its concepts.** The skill term is exactly this case: the agential-orchestration-platform has earned theory status and has its own [skill](../research/2026/07/31/lenticule-import/animating/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/concepts/skill.md) concept note. The two notes coexist — the term is the lexical/encyclopedic anchor; the AOP concept is the theoretical commitment.

2. **The term is cited in `depends-on:`, `realizes:`, or `instantiates:` by typed notes.** When typed notes cite a term as a structural dependency, the term is doing the work of a concept (or object, or morphism) and SHOULD have a typed sibling that the citations resolve to.

3. **The term has accumulated structural commitments in its body.** A term whose body says "an X has the structure (a, b, c) such that ..." is doing object-level work. The structural commitments belong in an [object note](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/note-types/object.md); the term remains as the lexical anchor.

Do *not* upgrade a term when:

- The term is a pure encyclopedia entry — biography, lineage, lexical clarification, traditions of use. These belong in `terms/` indefinitely.
- The term is in an area that has not earned theory status. Upgrading the term in isolation is premature; the theory should mature first.
- The term is in `triage/`. Triage notes are out-of-scope for typed-note migration until they are triaged out.

## Choose the target type

When upgrading, the target type follows from the term's actual content:

- **`concept`** — the term names a *role* the theory recurs to (a "binding of a user to an authentication method", a "ranking of values by epistemic content"). Most term-to-typed migrations land here. The lexical/encyclopedic content stays in the term note; the structural-role content moves to the new concept note.
- **`object` (`type: definition`)** — the term names a *thing with structure* (a tuple, a record, a category-theoretic object). The structural definition moves to the new object note.
- **`morphism`** — the term names an *operator* (a function, a functor, an action). The signature and operational semantics move to the new morphism note.
- **`theorem`** — rare. A term is unlikely to *be* a theorem; if the term's body asserts a claim, the claim becomes a theorem note and the term references it.

The two notes (the term and its typed sibling) coexist. The term remains the lexical citation target ("the *skill* term") and the typed note becomes the structural citation target ("the agential-orchestration-platform's [skill] concept"). Where a typed note has been authored, the term note's body SHOULD link to it ("→ realized as the [skill concept](../research/2026/07/31/lenticule-import/animating/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/concepts/skill.md) in the agential-orchestration-platform").

## Frontmatter translation

The mapping from term-vocabulary frontmatter to typed-vocabulary frontmatter:

| Term frontmatter | Typed equivalent | Notes |
|---|---|---|
| `type: term` | `type: concept` (or `definition`, `morphism`) | Choose per the rules above. |
| `defines: <slug>` | (drop) | The note's `# H1` heading already names what it defines. |
| `aliases: [...]` | (keep) | Aliases are useful for full-text-search and navigation; the typed-note vocabulary admits them. |
| `made-of: [...]` | (move to body) | "Made-of" relationships are part-whole structure; they belong in a `## Components` section in an object note. |
| `distinguished-from: [...]` | (drop, or fold into prose if substantive) | Most "distinguished-from" lists were AI-generated negation framing; drop unless the distinction carries real content. |
| `instances: [...]` | (move to body, or invert) | Instance lists are usually enumerations of children; either move to a `## Realizations` section or invert the relation by adding `realizes: <this>` on each instance's note. |
| `used-by: [...]` | (drop) | Use-by is implicit in the corpus's `depends-on:` graph (the using note declares `depends-on:` on this one). |
| `component-of: [...]` | (keep) | Component-of survives in the typed vocabulary. |
| `tags: [...]` | (consider `class:`) | Many tag-based groupings are better expressed as a single `class:` value. |

The translation is *manual per note* — there is no mechanical script that does it correctly. The judgment call about which target type to choose, and which body content to move where, is what the migration buys.

## Cost-benefit

Migrating a term to a typed note is *not free*:

- The two notes must be kept consistent (or the term must be deleted, which loses the lexical citation target other notes may rely on).
- Citations to the term from typed notes must be redirected to the new typed note.
- The term's neighbors (other terms in the same `terms/` directory) may need their cross-references updated.

The benefit:

- Typed citations resolve. Currently, a typed note that says `depends-on: skill` resolves either to the AOP concept or the term — and the corpus's slug-collision lint flags the ambiguity. Migrating produces a single canonical resolution.
- The toolkit can validate the typed note. Term notes have no schema; typed notes do.
- The theory's structural commitments become explicit. A theory that depends on a term is borrowing without committing; a theory that depends on a typed concept has put its commitment on record.

## Order of operations

When in doubt, migrate concepts first, then objects, then morphisms. Concepts have the smallest schema and the lowest migration cost; the typed concept's first paragraph and the term's first paragraph often look similar.

For a single migration:

1. Identify the term and the target theory.
2. Confirm the target theory has earned [theory status](theory-discipline.md). If not, defer.
3. Author the new typed note in the theory's appropriate directory (`concepts/`, `objects/`, etc.). Use the term's body as starting material; pare to what fits the typed-note shape.
4. Update the term note: drop the structural content that moved, keep the lexical/encyclopedic content, add a "→ realized as [...]" link to the new typed note.
5. Update typed notes that previously cited the term: their `depends-on:` / `realizes:` / `instantiates:` now resolves to the new typed note.
6. Run `fars validate` to catch dangling references.

## Out-of-scope

- Deleting term notes. Even after migration, the term retains its lexical-anchor role unless the corpus has explicitly decided otherwise.
- Bulk-converting `type: text` notes. Most text notes are prose with no clean typed-vocabulary target; they need narrative-or-be-deleted judgment that this convention does not pre-script.
- Migrating triage. Triage is its own curation problem.
