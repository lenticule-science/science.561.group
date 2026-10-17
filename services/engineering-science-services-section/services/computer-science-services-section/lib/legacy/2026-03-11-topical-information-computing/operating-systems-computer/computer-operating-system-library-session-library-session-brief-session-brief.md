---
title: Session brief
description: A single markdown record produced at character-install time, composed from slices of the character's identity, office record, project canonical facts, and current focal-task content. The session brief is what a Claude session reads at SessionStart; replacing the cat-eight-surface-files pattern with one composed lawful brief.
derives-from:
  - ../transformers/derives-from.md
  - character.md
  - claude-session.md
  - file.md
  - prose.md
  - resource-file.md
---

A session brief is a markdown resource record produced by composing slices of the records a Claude session needs at start.
It is the install-time output the SessionStart hook reads, replacing the pattern in which the hook concatenates multiple surface files at session-open and forces the session to resolve pointers itself.

## Observation features

- Path: a known location the SessionStart hook reads.
  Conventional: `BRIEF.md` at the repo root, or `<character-dir>/composed-brief.md` if multi-character.
- Frontmatter `derives-from`: lists every source record the brief was composed from.
  The frontmatter DAG of the brief is therefore the union of every source's reachable DAG.
- Body: ordered sections produced by the composing transformer per a composition spec.
  Sections correspond to slices: identity, sources of truth, project facts, office authority, focal task, standing checks, working norms.

## Conformance

A session brief is lawful when:

- Every source path in `derives-from` exists in the repository at the time of composition.
- The body's slices are each verbatim or declared-rewrite excerpts from the listed sources; no slice originates outside the source list.
- The brief itself passes the resource-file lint manifest at role-class `prose`.
- Every project term used in any slice's body is reachable via the brief's composed `derives-from` DAG.
  The brief is in normal form against the corpus.

## Position

A session brief is the install-time projection of a character into the run-time context an opening session needs.
It is content, not address: the brief is regenerated each install from its sources; it is not hand-edited.
