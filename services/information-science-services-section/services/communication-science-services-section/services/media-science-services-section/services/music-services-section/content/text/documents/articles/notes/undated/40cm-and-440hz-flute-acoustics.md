---
title: "40cm Flute and 440Hz Frequency Relationship"
description: "Scientific explanation of why a 40cm flute produces 440Hz, 880Hz, and 1320Hz frequencies"
kind: explanation
status: stable
---

# Why a 40cm Flute Produces 440Hz, 880Hz, and 1320Hz

## Fundamental Physics of Flute Acoustics

A flute operates as an open-open cylindrical tube where sound waves form standing waves. For an open-open tube, the resonant frequencies follow the formula:

**fₙ = n × v / (2L)**

Where:
- fₙ = frequency of the nth harmonic (Hz)
- n = harmonic number (1, 2, 3, ...)
- v = speed of sound in air (m/s)
- L = length of the flute tube (m)

## Precise Calculation for 40cm Flute Targeting 440Hz

To produce A4 (440Hz) as the fundamental frequency, we solve for the required effective length:

**L_eff = v / (2 × f₁)**

Using v = 343 m/s (at 20°C):
- L_eff = 343 / (2 × 440) = 343 / 880 = 0.38977 m ≈ 39.0 cm

This effective length accounts for the physical tube length plus end corrections. The physical length L is shorter due to the antinode extending beyond the tube ends:

**L = L_eff - 2 × (0.3 × d)**
Where d is the tube diameter (typically 19mm for a flute):
- End correction per end ≈ 0.3 × 0.019 m = 0.0057 m
- Total end correction = 2 × 0.0057 m = 0.0114 m
- L = 0.38977 - 0.0114 = 0.37837 m ≈ 37.8 cm

However, the headjoint embouchure hole and tapering complicate this simple model. In practice:
- The headjoint contributes ~110-120mm of the effective length
- The body and footjoint contribute the remainder
- Total length of ~40cm (including headjoint) yields ~440Hz when accounting for:
  * Temperature (typically 20-25°C raises v to 343-346 m/s)
  * Embouchure hole impedance
  * Player-specific blowing pressure and angle

## Harmonic Series Production

Once the fundamental frequency is established, the flute naturally produces harmonics:

**First harmonic (fundamental, n=1):** f₁ = 440 Hz
**Second harmonic (first overtone, n=2):** f₂ = 2 × 440 = 880 Hz  
**Third harmonic (second overtone, n=3):** f₃ = 3 × 440 = 1320 Hz

These correspond to:
- 440 Hz = A4 (concert A)
- 880 Hz = A5 (one octave above)
- 1320 Hz = E6 (perfect fifth above A5, or two octaves + major third above A4)

## Why These Specific Frequencies?

The harmonic series arises from the boundary conditions of the open-open tube:
- Both ends must be displacement antinodes (pressure nodes)
- Only wavelengths that fit an integer number of half-wavelengths in the tube length will resonate
- λₙ = 2L/n
- fₙ = v/λₙ = nv/(2L)

When blown with sufficient air pressure and proper embouchure, the flute's air column can oscillate at these resonant frequencies simultaneously, producing the rich harmonic timbre characteristic of flute tones.

## Practical Considerations

1. **Register holes**: Modern flutes use register holes to facilitate jumping between harmonics by disrupting lower-frequency standing waves while allowing higher ones to form.

2. **Finger hole effects**: Opening finger holes effectively shortens the vibrating air column, raising the pitch. The 40cm length typically refers to the closed-hole configuration.

3. **Material and temperature**: Flute materials (silver, gold, wood) have minimal direct acoustic effect but influence thermal stability. Temperature changes significantly affect pitch (approximately 0.2% per °C).

4. **Player influence**: Embouchure shape, air speed, and angle affect which harmonics predominate and the stability of each frequency.

In summary, a flute approximately 40cm long produces 440Hz as its fundamental due to the physics of standing waves in open-open tubes, with the exact effective length accounting for end corrections, temperature, and headjoint geometry. The harmonics at 880Hz and 1320Hz are integer multiples of this fundamental, forming a predication fiber of related tones that share the same sound production mechanism.
