---
title: "Cents"
description: "A logarithmic unit of pitch-distance equal to one hundredth of a semitone; the standard unit for measuring intonational deviation from a reference scale."
aliases:
  - "cent"
  - "musical cent"
date-created: 2026-05-17
---


The cent is a logarithmic unit of pitch-distance equal to one hundredth of a 12-tone-equal-tempered semitone, and therefore one twelve-hundredth of an octave.
The unit was introduced by the 19th-century English musical scientist Alexander Ellis as a way of expressing intonational differences between scales and instruments precisely and comparatively.
Two pitches whose frequencies are in the ratio *r* are separated by 1200 × log₂(*r*) cents — so an octave (ratio 2:1) is exactly 1200 cents, a semitone of 12-tone equal temperament is exactly 100 cents, the just perfect fifth (ratio 3:2) is approximately 702 cents, the just minor third (ratio 6:5) is approximately 316 cents, the just major third (ratio 5:4) is approximately 386 cents, and so on.

The cent is the standard unit for describing intonational characteristics of an instrument or musical tradition because it allows precise statements that are independent of the absolute pitch reference.
Saying "the [cedar-flute](../cedar-flute/cedar-flute.md)'s scale-degree b3 sits 25 cents flat of 12-tone equal temperament" is a definite claim about the interval between the [fundamental](../../philB/prose/teaching/explanations/fundamental.md) and the b3, regardless of what the fundamental's absolute pitch is on a given instrument.
Saying instead "the cedar flute's b3 is at 270 Hz when the fundamental is at 220 Hz" would also be a definite claim but a less useful one — it would have to be re-stated for every individual instrument with a different fundamental.

Why the cent is logarithmic rather than linear: pitch perception is logarithmic in frequency — the *interval* (the perceived distance) between two pitches depends on their frequency *ratio*, not their frequency *difference*.
The pitch-distance between 100 Hz and 200 Hz is the same as the pitch-distance between 200 Hz and 400 Hz (both are octaves), even though the frequency differences are 100 Hz and 200 Hz respectively.
A linear pitch unit would be useless for music; a logarithmic unit is what matches human pitch perception.
The cent's choice to make 1200 cents = 1 octave (rather than, say, 100 or 1000) is conventional and tied to the 100-cent semitone of 12-tone equal temperament — a convenient compatibility, since most readers in the European-influenced musical world know the 12-TET semitone as a reference.

For describing the intonation of the [cedar-flute](../cedar-flute/cedar-flute.md), the cent is the principal unit used in the [cedar-flute-cents-table](../../philB/code/structures/cedar-flute-cents-table.md) structure.
The cents-deviation of each scale-degree from 12-tone equal temperament tells the reader (and the player, and the music-theoretic analyst) what the scale actually sounds like — whether the b3 is "in tune" with 12-TET (close to 300 cents) or noticeably flat (closer to the just minor third at 316 cents, or to the septimal minor third at 267 cents).
The cents-deviations of the cedar flute's scale, as documented by makers and ethnomusicologists, place the b3 typically in the 270–290 cent range (flat of 12-TET), the b7 typically in the 970–1000 cent range (flat of 12-TET's 1000 cents and closer to the just minor seventh at 996 cents or even to the septimal minor seventh at 969 cents), with the perfect fifth and the octave close to their just values (702 cents and 1200 cents respectively).

The use of cents allows the theory to make claims that are *precise* about intonation without overcommitting to a single canonical tuning: a claim that the cedar flute's b3 sits in the 270–290 cent range allows for the variation across instruments and makers, while still excluding the 12-TET 300-cent value as not characteristic of the tradition.
Without the cents framework, intonational claims either have to be vague ("the third is flat") or specific to a particular instrument's measurement ("on Joseph Coyote's flute the third is 277 cents") — the cents framework lets the theory say something precise *as a generalization*.

See also: [interval](./interval.md), [pentatonic-minor-scale](./pentatonic-minor-scale.md), [fundamental](../../philB/prose/teaching/explanations/fundamental.md), [cedar-flute](../cedar-flute/cedar-flute.md).
