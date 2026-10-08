---
type: definition
class: formal-model
status: settled
depends-on:
  - teaching/explanations/_index.md
see-also:
  - vault.md
  - relation-graph.md
  - theories/predicated-markdown-vault-knowledge-system/concepts/note.md
name: Note
description: "A note is the parent-level formal model of a single markdown file in a vault: a record of a single semantic commitment, with a typed identity and a structured set of edges to other notes."
---


A **note** is the parent-level formal model of a single markdown file in a [vault](../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/services/markdown-services-section/content/text/glossary/terms/vault.md): a record of a single semantic commitment, with a typed identity and a structured set of edges to other notes.

## Definition

A note $n = (p, t, F, B)$ consists of:

- $p$ — the note's *path*: its location in the vault's directory tree. The path is the note's identity; two notes cannot share a path, and changing a note's path is a relocation (see [relation-graph-update](relation-graph-update.md)).
- $t$ — the note's *type*: a member of the discipline-defined finite set of note types. The type is declared in the frontmatter's `type:` field.
- $F$ — the note's *frontmatter*: a YAML record carrying the type, the typed relation edges, and any type-specific metadata.
- $B$ — the note's *body*: the markdown text following the frontmatter, conformant to the type's body register and structural conventions.

A note is *well-formed* iff its frontmatter validates against the discipline's type spec and its body conforms to the type's register.

## What the model commits to

1. **One note = one commitment.** A note carries exactly one semantic commitment: a definition, a claim, an example, a question, a reference, a narrative thread. Notes that try to carry two commitments are split.
2. **The type is declared.** The note's type is in its frontmatter, not inferred from path or body. This makes type-checking a frontmatter-level operation.
3. **Edges are typed.** Every relation a note declares is typed: `depends-on`, `see-also`, `realizes`, `instantiates`, `defines`, `lean`. Untyped wiki-links are not first-class citizens.
4. **Frontmatter is part of the source.** The frontmatter is not metadata in the "extra-textual" sense; it is part of the note proper, and the discipline's validation operates on it directly.

## Note types (parent-level enumeration)

The parent-level model enumerates the note types the vault discipline commits to:

- `concept` — a load-bearing semantic anchor.
- `definition` — a precise structural object.
- `morphism` — an operation between objects.
- `theorem` — a claim with proof, sketch, or refutation.
- `example` — a concrete instance of an object or theorem.
- `question` — an open inquiry.
- `narrative` — an ordered path through other notes.
- `reference` — an annotated bibliographic entry.
- `triage` — a holding pen for un-typed or in-progress material (operations-side; should not appear in `library/`).

The per-type structural and pragmatic specs live at the [predicated child theory's specifications/note-types/](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/theories/predicated-markdown-vault-knowledge-system/specifications/note-types) and refine these parent-level types into predication-cell-bearing typed notes.
