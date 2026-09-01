---
title: "Guqin Corpus Collection"
description: "Index of the guqin corpus fixture under engineering-services-section's music-engineering-services-section, cross-linked here as a founding collection for music-science-services-section, not copied."
type: collection-index
date-created: 2026-08-21
source: "lib/emsenn/services/561-group/services/engineering-services-section/services/media-engineering-services-section/services/music-engineering-services-section/data/corpus/guqin"
source-relative-link: "../../../../../../../../../../../../../../engineering-services-section/services/media-engineering-services-section/services/music-engineering-services-section/data/corpus/guqin"
authors:
  - claude-sonnet-5
  - Claude Opus
---


**This is an index, not a copy.** The fixture lives at
`engineering-services-section/services/media-engineering-services-section/services/music-engineering-services-section/data/corpus/guqin/`
and stays there -- it is a working data fixture paired with a loader
script (`scripts/load-corpus-piece.mjs`) and is meant to be read in
context with that code, not lifted out of it. Follow the
[source link](../../../../../../../../../../../../../../engineering-services-section/services/media-engineering-services-section/services/music-engineering-services-section/data/corpus/guqin)
to read it in place.

## What's there

Two files:

- `source-note.md` -- an honesty ledger for the fixture below it, and the
  single clearest piece of methodology-writing in this whole tree about
  the difference between a documented fact and an invented one. It states
  plainly, up front, that the note-events in the fixture are **invented**,
  not decoded from any real historical source, and then draws the line
  exactly: the piece identity (*Meihua Sannong* / 梅花三弄, from the 1425
  *Shen Qi Mi Pu* anthology), the anthology's compiler and approximate
  date, jianzipu's real notational convention (string/position/technique
  specified; absolute pitch and rhythm not specified, historically
  transmitted by oral lineage instead), and the piece's documented
  harmonic-refrain/stopped-tone macro-form are all real and used as-is;
  every specific string, hui position, technique, and pitch value in the
  fixture's note-events is invented and marked `synthetic_illustrative` in
  the data itself. It explicitly names this as mirroring
  `verified-structures-as-compositional-grammar.md`'s house standard (in
  the music-theory service, cross-linked from this section's charter note)
  that an invented compositional-analogy layer is fine only when labeled
  as invented, never presented as proved when it isn't.
- `meihua-sannong-illustrative.json` -- the fixture itself: a
  `synthetic_illustrative`-tagged note-event corpus (13 note-events, 4
  sections) built to that honest schema, plus a separate render
  (`data/renders/zen-soundscape-pine-in-snow-note.md`, same engineering
  section) that explicitly did **not** draw on this fixture's invented
  note content, keeping it illustrative/synthetic as its own source note
  requires.

## Direct relevance to the charge-dynamics claim

The guqin corpus is a plucked-string counterpart to the aerophones'
breath-driven charge, and the two together bracket the founding note's
"charge without cells through form without content" claim from opposite
mechanical sides -- sustained breath-pulse envelope on one side, discrete
plucked-string attack/decay on the other -- as independent witnesses of
the same charge-without-reference stratum, in the founding note's own
phrase. Jianzipu itself is a striking structural fact for the "tonality is
a gauge" reading: it is a notation that specifies technique (how to
produce the charge) while historically leaving absolute pitch and rhythm
unspecified, transmitted instead through a teacher-student performance
lineage -- a notation system that encodes the *dynamics* of production
without committing to a fixed gauge chart, which is close to what the
founding note means by atonality as gauge-free composition, arrived at
here from an entirely different tradition's own notational history.

## What this collection does not do

It does not treat the fixture's invented note-level content as evidence of
anything about guqin music -- the fixture's own source note is explicit
that it isn't, and this collection inherits that limit without softening
it. The only load-bearing facts here are the ones the fixture's source
note itself marks as documented: the anthology, the piece identity, the
macro-form alternation pattern, and jianzipu's real notational convention.
Any future charge-dynamics work drawing on real guqin material would need
an actual transcription or scholarly edition in hand, per that source
note's own stated path to upgrading the fixture -- not attempted here.
