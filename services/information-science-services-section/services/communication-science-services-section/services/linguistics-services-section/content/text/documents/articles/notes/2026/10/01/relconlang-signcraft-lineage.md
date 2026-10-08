---
title: "RelConLang SignCraft Lineage"
date-created: 2026-10-01
kind: lineage-note
status: historical
tags: [relconlang, signcraft, parser, semantics, evaluation]
---

# RelConLang SignCraft Lineage

A distinct RelConLang parser existed in Bare Cedar Fog's SignCraft inference kernel by September 2026 and remains current experimental software.

On 2026-10-01, commit `73ba9caef7af9ea580d162b771fe22d2c0600944` ("Realize SignStuff libraries outside departmental runtime trees") moved the implementation from the departmental `src/signcraft/inference` tree into the standalone SignStuff library:

`lib/emsenn/services/561-group/services/engineering-services-section/services/computer-engineering-services-section/lib/signstuff/signcraft/src/inference/relconlang.mjs`

The package is `@red-cup-engineering/signcraft`, which exports `./inference/relconlang` and `./inference/speak`.

The September commits below remain important lineage for how the current implementation acquired its semantics.

At commit `3e32de554ae4840348ce8daf0333ac70002ee34a`, the parser:

- parsed only declared RelConLang nouns/pronouns/verb roots rather than generic unknown words;
- normalized aspect-suffixed verbs to their verb root and stored aspect separately;
- carried a clause-level reading from `ta/na/sha/mu`;
- represented dialogue force as a discourse row;
- represented provenance/locus/kind as explicit event attributes;
- represented complement clauses as links to embedded clause events;
- converted clause events to `(s,P,o)` cells for saturation experiments.

Its stance map was `ta/na → potential`, `sha → stable`, `mu → absurd`, explicitly rejecting the manifest's stale `ta → active` witness-journal row.

On 2026-09-25, the implementation deliberately changed its terminology and carrier from metrologic charge to **knowledge reading**, reflecting a wider SignCraft change from charge carriers to reading-valued inference.

This lineage matters because several structures now being proposed for the blind-dialogue experiment — canonical verb root, separate aspect, explicit oblique roles, embedded-event links — are already implemented in the current SignCraft experimental parser. They should be reused as experimental evidence and compared against the shared language-neutral parser rather than reinvented.

It remains an experimental, specialized path and does not settle the current design:

- the parser collapses `ta` and `na` before preserving their richer Chu profiles;
- it has no speaker/addressee deictic grounding;
- dialogue force is recorded but cross-turn relations are not inferred;
- its saturation evaluation uses hand-authored semantic feature side information from the full corpus.

See the separate saturation-evaluation audit for that last point.
