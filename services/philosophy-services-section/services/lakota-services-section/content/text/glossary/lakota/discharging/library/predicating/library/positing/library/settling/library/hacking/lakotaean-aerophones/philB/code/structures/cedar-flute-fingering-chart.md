# cedar-flute-fingering-chart

The function from six-finger-hole state to sounded scale-degree on the standard [cedar-flute](../prose/teaching/explanations/cedar-flute.md).

## Definition

A **cedar-flute fingering chart** is a function

F : {0,1}⁶ → ScaleDegree ∪ {⊥}

where {0,1}⁶ is the set of finger-hole states (each component indicating whether a given hole is closed (1) or open (0), indexed from foot (hole 1) to head (hole 6)), and ScaleDegree is the index set {1, b3, 4, 5, b7, 8, ...} of the [pentatonic-minor-scale](./pentatonic-minor-scale.md) including octave-doublings, and ⊥ indicates a non-conventional fingering producing a non-scale tone or no stable tone.

The standard cedar-flute fingering chart F_std is defined on the *conventional fingerings* (those in which holes from the foot are closed up to some position k, with holes above k all open) by:

| Finger-hole state | Bit pattern (h6 h5 h4 h3 h2 h1) | Scale-degree |
|---|---|---|
| All holes covered | 111111 | 1 (fundamental) |
| Hole 1 open | 111110 | b3 |
| Holes 1–2 open | 111100 | 4 |
| Holes 1–3 open | 111000 | 5 |
| Holes 1–4 open | 110000 | b7 |
| Holes 1–5 open | 100000 | 8 (octave) |

For non-conventional fingerings (in which the closed holes are not contiguous from the foot), F_std produces either a *cross-fingered* scale-degree (an alternate non-standard pitch) or ⊥.
Cross-fingerings are admissible idiomatic devices for fine tuning and for occasional non-scale tones; the specific cross-fingerings and their effects are instrument-dependent and not part of the conventional chart.

The second-octave register, reached by [overblowing](../prose/teaching/explanations/overblowing.md) any conventional fingering, extends the chart to F : {0,1}⁶ × {1,2} → ScaleDegree ∪ {⊥}, where the second argument is the harmonic register and overblowing to register 2 multiplies the sounded frequency by 2 (raising the scale-degree by an octave).

## Properties

- **Monotonicity**: For conventional fingerings, F is monotonic in the number of open holes — uncovering more holes (from the foot) produces a higher scale-degree.
- **Surjectivity on the scale**: F_std restricted to conventional fingerings is surjective onto the pentatonic-minor-scale degrees {1, b3, 4, 5, b7, 8}.
- **Determinism**: F_std is a well-defined function — each fingering state produces a definite scale-degree (modulo intonational variation across instruments; see [cedar-flute-cents-table](./cedar-flute-cents-table.md)).
- **Cross-fingering domain**: F_std is partial on non-conventional fingerings; the cross-fingered domain admits instrument-specific extensions but is not specified by the standard chart.

## Source claim

[cedar-flute-standard-tuning](../prose/learning/claims/cedar-flute-standard-tuning.md).

## Specification

[cedar-flute-fingering-chart.spec](../work/governance/rules/specifications/cedar-flute-fingering-chart.spec.md).
