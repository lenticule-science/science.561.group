---
title: Relationality Research Program concept publication
description: Current realization of the RRP's Markdown concept records and their public projections.
---
# Relationality Research Program concept publication

The Relationality Research Program uses Markdown documents as a human-readable carrier for concept declarations. A declaration can name a concept, describe it, attach tags and annotations, state `same_as` identity claims, and select publication channels. The useful result is a diagnosable, immutable cut of those declarations that can be rendered as a website; it is not a separate research database or a claim that the formal SSCU proposal has been implemented.

## Current realization

| Effect | Carrier and owner |
| --- | --- |
| Read Markdown, frontmatter, links, callouts, and code-fence metadata safely | Markdown data service |
| Project declarations, retain source provenance, form deterministic identity classes, report unresolved references, select publication records, and compare two cuts | SignCell concept-universe data |
| Turn selected records into one HTML view or a set of concept pages | Static-site publisher system projector |
| Decide whether unresolved references advise or refuse a release; write, verify, and serve artifacts | Static-site publisher system |

The Markdown-to-concept projection accepts `id`, `title`, `tags`, `same_as`, `ann`, `publish`, `publish_to`, and `status`. `same_as` creates a deterministic equivalence class without discarding the competing source records. Reference annotations are transported to a class representative and remain resolved or unresolved diagnostics. Publication is a selection over that data, not a mutation of it.

The publisher's default unresolved-reference policy is permissive (`warn`): diagnostics remain visible but the release can proceed. A caller can request `refuse` to make an unresolved reference block the release. This is a release policy, not a property of the research record.

## Research boundary

The [formal Stewardable Semiotic Concept Universe proposal](stewardable-semiotic-concept-universe.md) remains a research document. Its Heyting, modal, comonadic, closure, failure, and stewardship-operator claims require an independently specified mathematical realization and evidence. The current software carries only the concrete document facts above: declarations, identity assertions, references, provenance, diagnostics, comparison, and publication selection. It must not present those facts as a proof of the proposed semantic closure or its theorems.

## Retired implementation

The Python `ssc-universe` package formerly combined all of these effects with a private YAML configuration dialect, pickle cache, Git fingerprinting, Jinja templates, and filesystem/zip sinks. It was superseded on 2026-09-25. The private configuration, cache, and template machinery had no independent research meaning. Artifact identity, conformance, and release verification now belong to the website publisher; the semantic cut is directly comparable as SignCell data.

To publish a concept corpus now, author the Markdown declarations, project them into a concept universe, then contribute that universe through the static-site publisher's concept-universe projector. There is no `sscu` executable, cache directory, or auxiliary repository to maintain.

## Provenance

This replaces the operational claims formerly carried by `2026-02-stewardable-semiotic-concept-universe` in the semiotic-system legacy archive. The contemporaneous imported repository README remains dated archival context, not current operating instructions.
