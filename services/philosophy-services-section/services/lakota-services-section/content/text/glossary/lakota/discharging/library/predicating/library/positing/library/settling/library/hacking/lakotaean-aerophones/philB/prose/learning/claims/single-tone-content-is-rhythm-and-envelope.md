# Claim. A single-tone aerophone's music-theoretic content is concentrated in temporal pulse structure and timbral envelope, not in pitch sequence.

**Claim.** For a single-pitch (or near-single-pitch) aerophone — eagle wing-bone whistle, elk/crane whistle in its single-pitch mode, grass-dance whistle — the pitch coordinate of the pitch space is degenerate (a single point) and the music-theoretic content lives in two other coordinates:

1. The **breath-pulse sequence**: a temporal structure of (pulse-duration, inter-pulse-silence) pairs.
2. The **timbral envelope**: the attack-sustain-decay shape of each pulse, controlled by breath dynamics.

The single-tone object is fully music-theoretic.
Treating it as outside music theory because "it only plays one note" is a category error: it is *music whose theoretical content is not pitch*.

**Argument.**

*The pitch coordinate is degenerate.* The eagle wing-bone whistle is constructed to produce one definite pitch determined by bone length; breath pressure modulates loudness, not pitch (within the stable regime).
The elk/crane whistle has at most two pitches, set by the metal-plate-covered hole's open/closed state.
The grass-dance whistle has one pitch.

*The temporal coordinate is full.* Each instrument is driven by discrete breath pulses.
Each pulse has a definite onset, duration, and offset.
The sequence of pulses over time is a function ρ : N → R⁺ × R⁺ assigning to each pulse index a (duration, post-silence) pair.
This sequence is the principal musical content.

*The timbral coordinate is full.* Within each pulse, the player controls the breath envelope: sharp attack vs. gradual attack, sustained level vs. crescendo/decrescendo, sharp termination vs. decay.
Each pulse therefore carries a continuous envelope e : [0, T] → R⁺ (instantaneous loudness) as a second music-theoretic content.

*The aggregate coordinate is full.* When multiple single-tone instruments play simultaneously, the aggregate produces a stochastic cluster (see [single-tone-aggregates-form-stochastic-clusters](./single-tone-aggregates-form-stochastic-clusters.md)) — a music-theoretic object distinct from a chord and distinct from noise.

**Structures produced.**

- [single-tone-object](../code/structures/single-tone-object.md) — the music-theoretic object whose pitch dimension is degenerate and whose content is rhythm and envelope.
- [breath-pulse-sequence](../code/structures/breath-pulse-sequence.md) — the temporal structure of pulse-and-silence pairs.
- [timbral-envelope](../code/structures/timbral-envelope.md) — the within-pulse loudness function.
