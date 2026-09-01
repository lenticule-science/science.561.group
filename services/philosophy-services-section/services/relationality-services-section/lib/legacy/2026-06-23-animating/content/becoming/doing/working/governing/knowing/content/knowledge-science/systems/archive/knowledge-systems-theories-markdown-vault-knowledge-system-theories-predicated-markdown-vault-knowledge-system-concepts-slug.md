---
type: concept
class: identity
status: settled
depends-on:
  - note.md
  - ../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/identity-by-relations.md
see-also:
  - ../specifications/theory-discipline.md
  - frontmatter-relation.md
  - ../../teaching/explanations/filenames-are-stable-identifiers.md
  - ../../teaching/explanations/plain-text-first.md
---

# Slug

A note's **slug** is its filename minus extension, in lower-kebab-case. The slug is the note's identity within its directory; renaming a file is a meaningful editorial act, not a cosmetic one.

The discipline:

- **Lower-kebab-case.** Words separated by single hyphens, no underscores, no camel-case, no whitespace. `predication-cell.md`, not `PredicationCell.md` or `predication_cell.md`.
- **Stable.** Inbound `depends-on:`, `realizes:`, `see-also:` edges name the slug; renaming breaks every inbound reference. The corpus has no rename redirector at the substrate level — a rename is followed by a corpus-wide reference rewrite or the references dangle.
- **Unique within a directory.** Two files with the same slug in the same directory is a filesystem conflict (the second overwrites the first). Same-slug across directories is allowed but discouraged — see below.

## Cross-directory uniqueness

Two notes in different directories may share a slug (e.g. `concepts/note.md` and `engineering/.teaching/explanations/note.md`). The substrate's lookup tools (`fars show <slug>`, `fars context <slug>`) disambiguate by full path or by `--directory` flag. Cross-directory slug collisions are not errors but they are *defects*: every collision is a place where a future query has to disambiguate, and the corpus tracks them via `corpus-slug-uniqueness` for resolution where the collision is accidental.

The right resolution depends on the case:

- Two notes that mean the same thing in different theories → merge or `aliases:`.
- Two notes that mean genuinely different things and happen to share a name → rename one to a more specific slug.
- One note that is the canonical reference for the concept and others that locally re-introduce it → leave the canonical, replace the locals with `see-also:` edges.

## Why slugs (rather than auto-generated IDs)

The markdown-vault commitment is *plain-text first*: a vault must be useful with no tooling beyond a text editor and `grep`. A vault that identifies notes by UUIDs in frontmatter forces every navigation through tooling. Slug-as-identity makes the file system itself the index — `grep -r 'predication-cell'` is the substrate's basic query — at the cost of the rename-is-meaningful discipline. The trade is load-bearing for the markdown-vault commitments.

## Position in the substrate

A slug is the markdown-vault realization of substrate-level [identity-by-relations](../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/identity-by-relations.md): the entity's identity is fixed by the predications it participates in (its inbound and outbound relation edges, anchored at its slug). The slug is the identity *handle* — the string the relation graph uses to address the entity — and the relation graph itself is what *makes* the slug refer to that entity rather than to an empty label.
