---
name: "Concept Package"
type: "page"
date-created: 2026-03-18
description: "A ConceptPackage is a Package organized around one Concept: it colocates the concept's full grammatical family (noun, adjective, flat verb, gerund specs) with its operational artifacts (runbooks, scripts) under a single named boundary."
---

A ConceptPackage is a Package organized around one Concept: it colocates the concept's full grammatical family (noun, adjective, flat verb, gerund specs) with its operational artifacts (runbooks, scripts) under a single named boundary.

# Concept Package

## What this is

A **ConceptPackage** is a [Package](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/package.md) organized around one [Concept](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/concept.md).

It colocates the concept&rsquo;s full grammatical family — the noun spec, the adjective/quality spec, the flat-verb/relation spec, and the gerund/act spec — together with the operational artifacts that implement the concept: runbooks that sequence its operations and scripts that implement individual steps.

The result is a named directory where everything about one concept lives together.
An agent retrieving the concept retrieves the package; nothing is scattered.

## Contents

A ConceptPackage for concept C contains:

File
What it is

`C.md`
Noun spec — defines C as an entity: what it is, its structure

`C-ness.md` or standard adjective
Quality spec — the property of being C; what it means to *have* C

`C.md` (relation section) or dedicated relation file
Flat-verb spec — C as a relation between entities

`Cing.md`
Gerund spec — C as an ongoing act or process

`runbook.md`
Runbook — operational procedure for working with C

`C.sh` or equivalent
Script — implementation of the atomic operation

Not all slots need to be filled — a concept may not warrant a dedicated script, or the adjective form may be covered in the noun spec. The package is a home for these; it does not mandate their existence.

## Boundary

The package boundary is the directory.
The directory name is the kebab-case form of the concept name.
Items inside the package share a scope and can reference each other by short relative path.
Items outside the package reference the package by its directory name and access its contents through that path.

## Open questions

- Whether the package itself needs a top-level `index.md` that declares the package&rsquo;s identity and lists its contents, or whether the noun spec (`C.md`) serves that role.

- Whether the grammar-form files are always separate files or whether thin forms can be sections of the noun spec.
