---
title: Claim. The cedar bore, being approximately cylindrical and open at both ends, admits the full harmonic series, with the second partial reachable by overblowing.
description: Claim.
---
# Claim. The cedar bore, being approximately cylindrical and open at both ends, admits the full harmonic series, with the second partial reachable by overblowing.

**Claim.** The cedar duct flute's bore is approximately cylindrical and acoustically open at both ends (labium and distal opening).
Such a bore supports a standing-wave spectrum at integer multiples of a fundamental f₀:

fₙ = n · (c / 2L_eff), n = 1, 2, 3, ...

The full harmonic series is therefore available in principle.
The **second partial (n=2)** is reliably accessible by overblowing — increased breath pressure shifts spectral energy from n=1 to n=2, producing the octave above each fingered note.
Higher partials (n ≥ 3) are not reliably reached on this instrument family.
The practical melodic range is therefore approximately 1.3 octaves, rather than the theoretical 2 octaves of full first-and-second-partial use, because overblow stability degrades on the higher fingered notes.

**Argument.**

*Bore geometry.* The cedar flute is constructed by hollowing two split halves and rejoining; the resulting bore is approximately a cylinder of uniform diameter, with construction-driven minor irregularities.
There is no deliberate taper of the conical-bore (oboe/saxophone) type.

*Boundary conditions.* The labium provides an open boundary (atmospheric pressure node, displacement antinode).
The distal end of the sound chamber is open (similar boundary).
For a cylindrical bore with two open ends, the allowed standing-wave wavelengths satisfy 2L_eff = nλ, giving fₙ = n·c/(2L_eff).
All integer harmonics are present (compare: cylindrical bore stopped at one end, e.g., clarinet, which supports only odd harmonics).

*Overblow accessibility.* The jet's preferred oscillation frequency tracks the resonant frequency of the bore; at moderate breath pressure the n=1 partial dominates, and at sufficiently high pressure the n=2 partial dominates.
This is the standard duct-flute overblowing mechanism.
The transition is continuous in pressure but the stable regimes are well-separated.

*Range degradation.* On low fingered notes (long acoustic length), the n=2 partial is at moderate frequency and the jet mechanism overblows cleanly.
On high fingered notes (short acoustic length), the n=2 partial is at high frequency, and the jet mechanism is less stable in that range.
Empirically the upper third of the second register is unreliable; the practical range is therefore ~1.3 octaves rather than 2.

**Structures produced.**

- [harmonic-series](../../../code/structures/harmonic-series.md) — the integer-indexed family of partials {fₙ = n·f₀ : n ∈ N} of an open-open cylindrical bore.
- [bore](../code/structures/bore.md) — the acoustic structure of a cylindrical air column open at both ends, with finger-hole-driven effective-length modification.

**Transformers produced.**

- [overblow](../../../code/transformers/overblow.md) — the n-th-partial selection morphism, with the n=2 selection realized in practice.
- [finger-hole-shortening](../../../code/transformers/finger-hole-shortening.md) — the effective-length reduction by an open finger-hole.
