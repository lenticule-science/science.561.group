---
type: concept
class: structural
status: settled
depends-on:
  - theory-directory.md
see-also:
  - ../specifications/theory-discipline.md
  - ../morphisms/theory-promotion.md
  - ../morphisms/term-to-typed-migration.md
---

# Staging-area

A **staging-area** is a directory that accumulates notes toward potential [theory-directory](theory-directory.md) status without yet satisfying the [theory-discipline](../specifications/theory-discipline.md). Most directories under `theories/` are staging-areas.

A staging-area is honest about what it is: an `_index.md` that names the subject and the open work, possibly carrying `terms/`, `texts/`, and a partial `questions/`, but missing one or more of the discipline's requirements (no own concepts, no own objects-and-morphisms, no theorems, no visible open work as typed questions). A staging-area that *presents* itself as a theory — declares `depends-on:` against other theories from its `_index.md`, claims its layout — without satisfying the discipline is a curation defect.

## Why the distinction matters

Naming a directory a theory commits the corpus to it: outside readers cite it, dependent theories load on it, contributors take its commitments as established. A directory that claims theory status without satisfying the discipline gives those readers and contributors false load-bearings. The "staging-area" name is the corpus's way of saying *this is real work in progress, but it is not yet a theory; do not load on it*.

The corpus has many staging-areas in active development; this is normal and good. The discipline's load comes from honesty about which directories have crossed the threshold, not from minimizing the count of staging-areas.

## Promotion

A staging-area becomes a theory-directory by [theory-promotion](../morphisms/theory-promotion.md): the requirements are met (`status: closed` on the question of whether the directory is a theory), the `_index.md` is rewritten to declare the discipline, and the corpus updates inbound references that previously qualified the directory ("the staging-area at `foo/`") to remove the qualification.

Promotion is not reversible by accident. A directory that has earned theory status and then lapses (its claims are abandoned, its discipline is not maintained) requires explicit demotion — a captain decision recorded as a curation note.

## What a staging-area should carry

The discipline does not require staging-areas to be empty of structure. A staging-area should carry:

- An `_index.md` naming the subject, the position relative to the parent, and the open work.
- A `questions/_index.md` enumerating the structural questions whose answers would close the gap to theory status.
- Whatever typed notes have been written so far, in canonical sub-directories where applicable.

What a staging-area should *not* carry: claims that overstate its status, or `depends-on:` declarations that load other theories on it as if it were a theory itself.
