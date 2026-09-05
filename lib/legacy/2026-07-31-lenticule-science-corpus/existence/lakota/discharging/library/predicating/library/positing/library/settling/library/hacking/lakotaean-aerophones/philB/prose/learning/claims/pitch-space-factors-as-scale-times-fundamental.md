# Claim. The pitch space of the cedar courting flute factors as the product of a relative scale and a free fundamental.

**Claim.** The pitch space P of the cedar courting flute admits a canonical factorization

P ≅ Z₅ × R⁺

where Z₅ is the set of five relative scale degrees (taken cyclically modulo octave) and R⁺ is the free fundamental frequency.
The factorization is canonical in the sense that the two projections π_S : P → Z₅ and π_F : P → R⁺ are well-defined music-theoretic operations: π_S extracts the scale-degree identity of a pitch event, and π_F extracts its absolute frequency.

**Argument.**

*Scale invariance under transposition.* For each instrument, the realized pitches are the five points {f₀, 2^(3/12)·f₀, 2^(5/12)·f₀, 2^(7/12)·f₀, 2^(10/12)·f₀} (and octave extensions).
The interval ratios between adjacent realized pitches — fixed by the interval signature ⟨3, 2, 2, 3, 2⟩ — are independent of f₀.
Therefore the scale Z₅ is intrinsic to the instrument family and the fundamental f₀ is a free parameter ranging over a particular instrument.

*Independence of f₀ across instruments.* Empirically, Lakotaean flutes are constructed without reference to a global pitch standard (no A=440 anchor).
Two flutes from the same maker differ in fundamental by amounts that are not commensurate with the scale (i.e., the difference is not a rational multiple of the scale's interval ratios).
Therefore f₀ is genuinely free — it is not a discrete choice from a finite set of "valid" fundamentals.

*The factorization is canonical.* Any pitch event on a given flute is fully specified by giving its scale-degree (which of the five fingerings was used) and the flute's fundamental.
There is no third independent coordinate at the pitch-space level.
(Block position, breath pressure, and ornament shift pitch slightly but are pitch-space morphisms, not additional coordinates — see [transposition.md](./../code/transformers/transposition.md) and related.)

**Structures produced.**

- [pitch-space](../code/structures/pitch-space.md) — the product object Z₅ × R⁺.
- [pentatonic-minor-scale](../code/structures/pentatonic-minor-scale.md) — the relative scale Z₅ with interval signature ⟨3, 2, 2, 3, 2⟩.

**Transformers produced.**

- [transposition](../code/transformers/transposition.md) — the action of R⁺ on P shifting the fundamental.
