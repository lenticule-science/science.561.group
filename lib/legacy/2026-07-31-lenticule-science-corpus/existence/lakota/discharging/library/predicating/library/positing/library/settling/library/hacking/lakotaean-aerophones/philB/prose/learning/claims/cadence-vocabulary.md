# Claim. The cedar flute repertoire admits four principal cadences: descending b3 → 1, descending 4 → 1, descending 5 → 1, and held-tonic-with-warble.

**Claim.** The [cadence](teaching/explanations/cadence.md) vocabulary of the [cedar-flute](teaching/explanations/cedar-flute.md) [courting-song](teaching/explanations/courting-song.md) repertoire consists of four principal cadential gestures: (a) the descending minor-third cadence b3 → 1 (the canonical cadence), (b) the descending perfect-fourth cadence 4 → 1, (c) the descending perfect-fifth cadence 5 → 1, and (d) the held-tonic-with-[warble](teaching/explanations/warble.md) cadence.
These four cadences cover the vast majority of phrase- and song-endings in the documented repertoire; alternative cadential figures are rare or marginal.
The choice among the four cadences is a music-theoretic decision with definite consequences for the perceived strength of closure.

**Argument.**

*Cadences are music-theoretic objects with identifiable content.* A [cadence](teaching/explanations/cadence.md) is a phrase-ending gesture that resolves melodic motion to a stable tonal position.
Cadences are not merely "the way a [phrase](teaching/explanations/phrase.md) happens to end" — they are *named gestures with specific melodic content* that the player chooses among.
To identify the cadential vocabulary of the cedar flute repertoire is to identify the small set of gestures that the tradition recognizes as cadential and that players draw on at phrase-ends.

*The b3 → 1 cadence is the canonical cadence.* The most frequent phrase-ending in the documented cedar-flute repertoire is the descending minor-third motion from scale-degree b3 to scale-degree 1.
This motion is canonical for several converging reasons.
The b3 is the closest stable scale-degree above the [tonic](teaching/explanations/fundamental.md) within the [pentatonic-minor-scale](teaching/explanations/pentatonic-minor-scale.md) — there is no scale-degree 2 in the pentatonic, so the b3 occupies the position that scale-degree 2 would occupy in a heptatonic system.
The descending motion from b3 to 1 is therefore the closest descending approach available within the scale, and it is the most natural cadential gesture.
The descending minor-third is also the *characteristic interval* of the pentatonic minor (see [interval](teaching/explanations/interval.md)) — the interval that gives the scale its minor character — so a cadence that traverses this interval marks the scale's identity in addition to providing closure.

*The 4 → 1 cadence is the second-most-common cadence.* The descending perfect-fourth motion from scale-degree 4 to scale-degree 1 provides a slightly less close approach (the 4 is a larger interval from the tonic than the b3) and a slightly different musical character.
The 4 → 1 cadence appears in the repertoire as a variant of the b3 → 1 cadence, often appearing in inner phrases of a [strophe](teaching/explanations/strophe.md) (where a less-conclusive ending is appropriate) before the strophe-final phrase ends on the more-conclusive b3 → 1.

*The 5 → 1 cadence is the strongest in interval-content but less common.* The descending perfect-fifth motion from scale-degree 5 to scale-degree 1 has the strongest acoustic basis of the descending-to-tonic cadences (the perfect fifth is the most acoustically stable cadential interval), but it traverses the most intermediate scale-degrees in its descent and is therefore less compact than the b3 → 1 or 4 → 1 cadences.
It appears in the repertoire as a strong cadential figure for moments requiring particular closural weight — the song-final cadence of a longer or more elaborate [courting-song](teaching/explanations/courting-song.md), or the climactic cadence of a section.

*The held-tonic-with-warble cadence is the most characteristic flute-idiomatic cadence.* The held-tonic-with-[warble](teaching/explanations/warble.md) cadence does not necessarily involve a descending motion of its own — it can stand alone (the phrase concludes on the fundamental, held with warble) or it can follow one of the descending motions above as the terminal phase of the cadence.
The held-tonic-with-warble is the most flute-idiomatic of the four cadences — it has no direct vocal analogue, since the [warble](teaching/explanations/warble.md) is a [duct-flute](teaching/explanations/duct-flute.md) (or [embouchure](teaching/explanations/embouchure.md)-controlled) phenomenon specific to wind-instrument acoustics — and its presence marks the cadence as definitely flute music rather than as a generic instrumental rendering.
In the [courting-song](teaching/explanations/courting-song.md) repertoire, the song-final cadence is almost always a held-tonic-with-warble, with the warble's decay through the breath's fading providing the song's terminal moment.

*Cadential hierarchy.* The four cadences are not equivalent in closural weight.
Roughly: a 4 → 1 plain (no warble) is the least conclusive; a b3 → 1 plain is moderately conclusive; a b3 → 1 with held-tonic-warble is highly conclusive; a 5 → 1 with held-tonic-warble is the most conclusive.
Players use this hierarchy to mark different levels of closure within a [strophic-form](teaching/explanations/strophic-form.md) performance: internal phrases within a strophe end on less-conclusive cadences, strophe-final phrases end on more-conclusive cadences, and the song's final strophe ends on the most-conclusive available cadence.
The cadential hierarchy is the principal music-theoretic device for marking the form's structural levels audibly to the listener.

*Other cadential figures.* Cadences other than the four principal ones occasionally appear — terminal trills, fragmentary ascending gestures, or non-resolving phrase-endings — but these are marginal in the documented repertoire and are not part of the conventional cadential vocabulary.
A theory of cedar-flute music can name them as edge cases without including them in the core cadence vocabulary.

**Structures produced.**

- [cadence-set](../code/structures/cadence-set.md) — the named set of cadential gestures with their specific melodic content.

**Transformers produced.**

- [cadence-attachment](../code/transformers/cadence-attachment.md) — the operation selecting a cadence from the cadence-set and attaching it to a phrase as the phrase's terminal gesture.
