# Claim. The cedar flute and the courting-song voice share pitch space and phrase grammar; instrumentalization is a morphism between them.

**Claim.** The cedar courting flute traditionally instrumentalizes the *wiílowaŋ* vocal courting-song genre.
The flute and the voice share:

1. The **pentatonic minor pitch space** (same scale, same modal-rotation availability).
2. The **rubato non-metric phrase grammar** (breath-paced phrases, descending cadence, strophic form).

The **instrumentalization morphism** ι : Voice → Flute sends a vocal melody to its flute realization.
The morphism preserves pitch content (modulo pitch-set degeneracy where the vocal pitch lies between two flute scale degrees — there, the morphism quantizes), preserves phrase grammar, drops linguistic content (text), and adds the flute's timbral and ornamental palette (six-ornament vocabulary).

**Argument.**

*Shared pitch space.* The Lakotaean vocal tradition documented by Densmore and contemporary practitioners uses a pentatonic-minor core scale with the same interval signature ⟨3, 2, 2, 3, 2⟩ as the cedar flute.
Vocal pitch is continuously variable in principle, but the practical scale of *wiílowaŋ* aligns with the flute's.
The shared pitch space is therefore Z₅ × R⁺ (with the voice's fundamental floating freely as the flute's does).

*Shared phrase grammar.* Both voice and flute use rubato, breath-paced phrases of similar duration; both end phrases on descending cadences to the tonic; both build large form by strophic repeat-and-vary.
The phrase grammar is therefore a structure shared between the two media, not separately invented.

*Instrumentalization is a morphism.* The mapping ι is well-defined on pitch (vocal pitch → nearest scale-degree on the flute) and on phrase grammar (preserved structurally).
It is not injective — multiple texts map to the same flute melody, since text is dropped.
It is not surjective — the flute can play scale-degree sequences that no vocal melody underlies.
But it is a morphism in the relevant sense: structure-preserving where structure is shared, deleting (text) and adding (timbre, ornament) at boundaries.

*Antiphonic mode.* In documented antiphonal configurations, voice and flute alternate phrases, producing a duet object in the literal sense.
The shared pitch space and phrase grammar make this possible without retuning or restructuring.

**Structures produced.**

- [flute-voice-duet](../code/structures/flute-voice-duet.md) — the ensemble object pairing flute and voice with shared pitch space and phrase grammar.

**Transformers produced.**

- [instrumentalization](../code/transformers/instrumentalization.md) — the morphism Voice → Flute.
