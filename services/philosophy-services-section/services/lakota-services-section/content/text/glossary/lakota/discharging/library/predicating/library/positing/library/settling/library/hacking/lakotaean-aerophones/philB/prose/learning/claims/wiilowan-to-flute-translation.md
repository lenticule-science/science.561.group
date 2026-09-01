# Claim. The cedar flute renders wiilowan vocal song by a regular translation: pitch quantization to scale-degrees, syllable-duration preservation, syllable-boundary marking by breath-pulse, and vowel-quality contrast as ornament-choice contrast.

**Claim.** The [cedar-flute](teaching/explanations/cedar-flute.md) [instrumentalization](teaching/explanations/instrumentalization.md) of a [wiilowan](teaching/explanations/wiilowan.md) vocal song proceeds by a specific, definite set of translation rules: (a) vocal pitches are quantized to the nearest scale-degree of the [pentatonic-minor-scale](teaching/explanations/pentatonic-minor-scale.md) on the flute; (b) vocal syllable durations are preserved as flute note durations; (c) vocal syllable boundaries are marked on the flute by [breath-pulse](teaching/explanations/breath-pulse.md) articulation; (d) vocal vowel-quality contrast is rendered as flute [ornament](teaching/explanations/ornament.md)-choice contrast; and (e) cadential moments are reinforced on the flute by adding a [warble](teaching/explanations/warble.md) regardless of whether the vocal source had a corresponding ornament.
The translation is regular enough that knowledgeable players produce mutually consistent flute renderings of the same vocal source, and knowledgeable listeners recognize the flute rendering as the vocal song.

**Argument.**

*Pitch quantization.* The vocal [voice](teaching/explanations/voice.md) can sound any pitch continuously and is not constrained to a discrete pitch grid.
The [cedar-flute](teaching/explanations/cedar-flute.md) is constrained to the pitches its [finger-hole](teaching/explanations/finger-hole.md) chart admits — the five scale-degrees of the [pentatonic-minor-scale](teaching/explanations/pentatonic-minor-scale.md) plus the octave, with limited microtonal access via [finger-slide](teaching/explanations/finger-slide.md).
The instrumentalization must therefore map continuous vocal pitches to discrete flute scale-degrees.
The mapping rule is *quantization to nearest scale-degree*: each vocal note's pitch is identified with the nearest available flute scale-degree, and the flute renders that scale-degree.
Vocal microtonal inflections within a sustained tone (small expressive pitch deviations) become either ignored on the flute (the flute sustains a single scale-degree) or rendered as [finger-slide](teaching/explanations/finger-slide.md) ornaments where the inflection is large enough to cross a scale-degree boundary.

*Duration preservation.* The duration of each vocal syllable is preserved as the duration of the corresponding flute note.
This rule is straightforward — the [cedar-flute](teaching/explanations/cedar-flute.md) admits notes of variable duration via [rubato](teaching/explanations/rubato.md) pacing, and the player simply matches the syllable durations of the vocal source.
The phrase's overall pacing — the [rubato](teaching/explanations/rubato.md) shape of the vocal phrase — is similarly preserved.
The flute's [phrase](teaching/explanations/phrase.md)-bounded-by-single-breath structure aligns naturally with the vocal phrase-bounded-by-single-breath structure (both vocal and instrumental phrases share this physiological constraint), so phrase boundaries map directly.

*Syllable-boundary articulation by breath-pulse.* The flute cannot pronounce syllables — it has no way to articulate consonants or vowel onsets directly.
But the flute can mark *where* syllables would begin in the vocal source by means of [breath-pulse](teaching/explanations/breath-pulse.md) articulation.
Each vocal syllable boundary becomes a flute breath-pulse: a brief modulation of breath pressure that produces an audible articulation between the pre-pulse note and the post-pulse note, marking the syllable boundary perceptually.
This is the principal mechanism by which the vocal source's syllable structure is preserved in flute rendering.
A listener who knows the vocal source can follow the flute rendering's syllable structure by attending to the breath-pulse articulations.

*Vowel-quality contrast as ornament-choice contrast.* Lakotaean vocal style admits contrast between open vowels (*a*, *e*, *o*) and closed vowels (*i*, *u*) that gives the vocal tone color variation.
The flute has only one fixed tone color for a given fingering and cannot directly render vowel-quality contrast.
The contrast is rendered, instead, as variation in [ornament](teaching/explanations/ornament.md) choice.
The convention — variable across players and not universally observed — is roughly: open vowels become tones with [finger-pop](teaching/explanations/finger-pop.md) or [trill](teaching/explanations/trill.md) ornaments (sharp, sparkling textures, mirroring the open vocal-tract acoustic of open vowels); closed vowels become tones with [finger-slide](teaching/explanations/finger-slide.md) or [tap](teaching/explanations/tap.md) ornaments (smoother, more muted textures, mirroring the closed vocal-tract acoustic of closed vowels).
This rule is the most variable of the translation rules and is the one most subject to player-tradition variation.

*Cadential reinforcement.* The cadential moments of the vocal source are typically reinforced on the flute by the addition of a [warble](teaching/explanations/warble.md) at the terminal [tonic](teaching/explanations/fundamental.md).
The vocal source may or may not have a warble-like ornament at the cadence; the flute version typically does, regardless.
This rule *adds* musical content rather than preserving or simplifying — the flute rendering is, in this respect, not a faithful preservation of the vocal source but an *idiomatic* rendering that adds flute-specific cadential reinforcement.
The warble's specific [jet-instability](teaching/explanations/warble.md) mechanism is flute-idiomatic (it has no direct vocal analogue), so the rule reflects the flute idiom's specific cadential vocabulary rather than the vocal source's.

*Translation regularity.* The translation rules are regular enough that two knowledgeable players, given the same vocal source, produce mutually consistent flute renderings — not identical (the ornament choices in particular admit player variation), but recognizable as renderings of the same source.
This is what allows the [courting-song](teaching/explanations/courting-song.md) repertoire to function as a flute repertoire that knowledgeable listeners can identify with their vocal sources.
The translation is not arbitrary; it is *learnable*.

*Asymmetry of the relation.* The flute-to-vocal direction is less regular than the vocal-to-flute direction.
Given a flute rendering, multiple vocal renderings could be its source (the flute does not encode syllable identity, vowel quality, or sub-quantization pitch detail, so a flute rendering underdetermines the vocal source).
The vocal-to-flute mapping is therefore a *quantizing* mapping that loses information; the reverse mapping is a *guessing* mapping that has to fill in lost information.
This is why the relation is conventionally called *instrumentalization* (vocal-to-flute) rather than by a symmetric term.

**Structures produced.**

- *(No new structures — this claim describes an operation on existing structures, [voice](teaching/explanations/voice.md) and [cedar-flute](teaching/explanations/cedar-flute.md).)*

**Transformers produced.**

- [vocal-to-flute-quantization](../code/transformers/vocal-to-flute-quantization.md) — the operation taking a vocal melody specification to its flute melody specification, implementing the translation rules above.
