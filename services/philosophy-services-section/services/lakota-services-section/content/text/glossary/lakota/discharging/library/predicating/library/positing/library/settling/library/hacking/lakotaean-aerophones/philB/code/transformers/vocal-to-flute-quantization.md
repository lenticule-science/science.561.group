# vocal-to-flute-quantization

The operation taking a vocal melody specification to its [cedar-flute](../prose/teaching/explanations/cedar-flute.md) melody specification, implementing the [instrumentalization](../prose/teaching/explanations/instrumentalization.md) of [wiilowan](../prose/teaching/explanations/wiilowan.md) vocal song.

## Definition

The **vocal-to-flute quantization** is the map

Q : VocalMelody → FluteMelody

where a *vocal melody* is a sequence of triples (p, d, v) where p ∈ R⁺ is the pitch (in Hz, continuous), d ∈ R⁺ is the duration (in seconds), v ∈ Vowels is the vowel quality of the syllable; and a *flute melody* is a sequence of triples (s, d, orn) where s ∈ ScaleDegree is a scale-degree of the [pentatonic-minor-scale](../structures/pentatonic-minor-scale.md), d ∈ R⁺ is the duration (preserved from source), and orn ∈ Orn ∪ {plain} is an [ornament](../prose/teaching/explanations/ornament.md) from the [ornament-glossary](../structures/ornament-glossary.md) or "plain".

The map Q applies to each source-triple (p_i, d_i, v_i):

1. **Pitch quantization**: s_i = argmin_{s ∈ ScaleDegree} | log(p_i) − log(freq(s)) | — the scale-degree whose pitch is closest in log-frequency to the source pitch.
  (If |log(p_i) − log(freq(s_i))| exceeds a threshold corresponding to a scale-degree-boundary crossing within the note, the note is split into a sequence of scale-degree notes with [finger-slide](../prose/teaching/explanations/finger-slide.md) ornaments between them.)
2. **Duration preservation**: d_i is preserved unchanged.
3. **Ornament selection**: orn_i = V→Orn(v_i) where V→Orn is the vowel-quality-to-ornament-choice map (open vowels → [finger-pop](../prose/teaching/explanations/finger-pop.md) or [trill](../prose/teaching/explanations/trill.md); closed vowels → [finger-slide](../prose/teaching/explanations/finger-slide.md) or [tap](../prose/teaching/explanations/tap.md); the specific choice may be deterministic or stochastic depending on player tradition).

After applying Q to each source-triple, the resulting flute melody is post-processed to:

- **Insert [breath-pulse](../prose/teaching/explanations/breath-pulse.md) articulations** between successive flute notes where the source had syllable boundaries (every pair of source-triples (p_i, d_i, v_i) and (p_{i+1}, d_{i+1}, v_{i+1})), unless the boundary is a phrase-boundary (in which case a breath-rest replaces the breath-pulse).
- **Add cadential warble**: at the final flute note of each phrase, if the cadence is one of the descending cadences from [cadence-set](../structures/cadence-set.md), attach a [warble](../prose/teaching/explanations/warble.md) ornament to the terminal tonic regardless of whether the source had a corresponding ornament.

## Properties

- **Not injective**: Multiple vocal melodies may map to the same flute melody (pitch quantization is lossy; syllable-identity is lost; sub-quantization pitch detail is lost).
- **Information-losing**: The map loses information about exact pitch, syllable identity, and (in general) precise vowel-quality detail.
  The reverse map flute-to-vocal is therefore underdetermined.
- **Phrase-structure preserving**: The map preserves phrase boundaries (vocal phrase boundaries become flute phrase boundaries) and duration structure (note durations are preserved).
- **Cadence-augmenting**: The map adds a [warble](../prose/teaching/explanations/warble.md) at cadential moments regardless of source, augmenting the source musical content with flute-idiomatic cadential reinforcement.
- **Player-variable in ornament selection**: The vowel-quality-to-ornament-choice map V→Orn varies across players and traditions; Q is therefore a *family* of maps parameterized by player tradition, not a unique map.

## Source claim

[wiilowan-to-flute-translation](../prose/learning/claims/wiilowan-to-flute-translation.md).
