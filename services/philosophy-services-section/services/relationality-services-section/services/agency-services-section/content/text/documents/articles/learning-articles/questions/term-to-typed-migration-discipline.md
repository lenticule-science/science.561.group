---
type: question
class: internal
status: open
explores:
  - term
  - concept
  - definition
  - aliases
  - migration
see-also:
  - ../specifications/term-to-typed-migration.md
  - ../specifications/note-types/concept.md
  - ../specifications/note-types/object.md
title: How do term:-style notes migrate to typed notes?
description: "The corpus carries 2,054 notes with type: term and an aliases: list — the older lexical/encyclopedic vocabulary that predates the typed concept | object | morphism | theorem | question | narrative | example | reference family established…"
---

# How do `term:`-style notes migrate to typed notes?

The corpus carries 2,054 notes with `type: term` and an `aliases:` list — the older lexical/encyclopedic vocabulary that predates the typed `concept | object | morphism | theorem | question | narrative | example | reference` family established by predication-categories. Some of those term notes are now better expressed as concepts; some as definitions/objects; some as references; a few as full narratives. Some are duplicates of typed notes that already exist elsewhere in the corpus. Some name things that have no current typed home and may not belong in the corpus at all.

The question: what is the discipline by which a `term:` note migrates to its typed home, what makes a migration *correct*, and what is the policy for terms that resist migration?

## Why it matters

Two parallel vocabularies in the same corpus is the largest source of slug collisions (284 currently), broken cross-references, and contributor confusion ("which kind of note do I write?"). Without a migration discipline, the older vocabulary lingers indefinitely and the typed vocabulary cannot become the single source of truth.

But bulk migration is the wrong answer (CLAUDE.md says so explicitly): bulk lifts from the older corpus have produced disasters before. Migration must be principled, incremental, and reversible.

## Sub-questions

1. **What governs the type assignment.** When a `term:` note is migrated, what determines whether it becomes a `concept`, an `object` (`type: definition`), a `reference`, or stays a `term`? See [concept-vs-object-disambiguation](concept-vs-object-disambiguation.md); the migration depends on that question's answer.
2. **What happens to `aliases:`.** The older vocabulary used `aliases:` for synonyms; the typed vocabulary doesn't currently have a clean equivalent. Should aliases survive as a `synonyms:` relation? Should they be flattened into the body? Should each alias become its own note (one slug per alias) with cross-pointers?
3. **What happens to `defines:`.** The older `defines: <term>` field said "this note is the definition of `<term>`." The typed vocabulary uses the type itself (`type: definition`) plus filename to convey that. Migration must preserve the meaning, but `defines:` was sometimes used to define multiple things in one note — a pattern the typed vocabulary disallows. What happens to multi-definition notes?
4. **What about terms with no typed home.** Some `term:` notes name things that don't fit any typed category (e.g., a colloquial phrase that is not a concept, object, or reference). Are they kept as terms? Demoted to body content of a related note? Deleted? Triaged?
5. **Reversibility.** A migration that turns out to be wrong (e.g., something migrated as a concept but better as an object) needs to be reversible without losing history. The migration discipline must say how reversal works.
6. **Slug collisions.** A term named `transaction` collides with a typed concept also named `transaction` in a different theory. Migration must either (a) confirm they are the same and merge, (b) confirm they are different and disambiguate slugs, or (c) confirm the term is the wrong name and rename. Which of the three is the default?
7. **Pacing.** Bulk migration is forbidden. What is the *unit* of migration that is small enough to be safe? One file at a time? One subdirectory? One day's worth of inspection?

## What an answer would look like

A short migration specification: per-`term:`-note triage rules (what determines its target type), per-target rewrite recipe (how `aliases:`, `defines:`, body, and references transform), conflict resolution policy (what happens at collisions), reversibility convention (how a migration is logged and undone), and a stated unit of safe migration.

Plus an inventory commitment: at any moment, the corpus knows how many `term:` notes remain and what kind of migration each is queued for.

## What is at stake in the wrong answer

A wrong answer either freezes the older vocabulary in place forever (the typed vocabulary never becomes load-bearing) or triggers a bulk migration that breaks references and produces a worse corpus than the one we started with.
