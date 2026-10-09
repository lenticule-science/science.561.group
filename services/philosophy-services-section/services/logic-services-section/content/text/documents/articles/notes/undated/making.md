---
name: making
gerund: making
agent-noun: maker
imperative: make
description: Bringing a new repo object into existence at a canonical location with the conformance pieces its kind requires.
derives-from:
  - ../structures/resource-file.md
title: making
---

A making transformer takes a kind, a slug, and any kind-specific arguments, and produces a new repo record at the kind's canonical location with the files the kind's specification requires (a main record, an `_index.md`, any subdirectories such as `scripts/`). The made record is lint-clean at completion. Making refuses if the slug already exists at the canonical location; replacing an existing record is the job of an improving or rewriting transformer, not a making transformer.

## Domain and codomain

- **Domain:** a make-spec — a tuple `(kind, slug, kind-args)` where `kind` names the resource class (`skill`, `transformer`, `structure`, `task`, `character`, and so on), `slug` is the lowercase-hyphenated name the record will be addressed by, and `kind-args` are the additional fields the kind's specification requires at creation (such as the two-sentence description a skill requires).
- **Codomain:** a witness record naming the canonical location written to, the files placed there, the kind's lint result on those files, and whether catalog registration was performed or is named as required follow-up.

## Preservation conditions

- **Refusal on existing slug.** Making refuses to write if an object already exists at the canonical location for the given kind and slug. Replacement is the job of `improving` or `rewriting`, not `making`.
- **Lint-clean at completion.** The made object passes the kind's resource-file lint at the moment the making call returns. Making does not leave half-conformant objects on disk.
- **Catalog registration.** If the kind's specification requires registering the new slug in a sibling `_index.md`, in a character's `skills:` list, or in another index, making either performs the registration as part of the call or names it in the witness as required follow-up.

## Morphological forms in naming grammar

- `gerund: making` heads skills built on this transformer: `making-a-skill`, `making-a-transformer`, `making-a-task`, etc.
- `agent-noun: maker` is the English doer-noun for the operation (a maker of skills, of transformers); narrative reference only, not a record-resident entity.
- `imperative: make` heads scripts that body such skills: `make-a-skill.mjs`, `make-a-transformer.mjs`, etc.

## Distinction from writing and composing

- `writing` is unitary at the call boundary: one committed write of bytes to one address. A making invocation typically calls writing multiple times — one per file the kind's specification requires — to bring the object into existence.
- `composing` produces one target record by inlining slices from many source records. Making is parametrized by kind and slug, not by source records; its input is a spec, not a source list.
