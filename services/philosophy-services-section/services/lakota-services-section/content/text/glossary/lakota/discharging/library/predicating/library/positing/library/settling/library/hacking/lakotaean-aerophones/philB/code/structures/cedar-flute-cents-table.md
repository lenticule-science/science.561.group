---
title: cedar-flute-cents-table
description: The table of actual cents-deviations from 12-tone equal temperament for each scale-degree of the standard cedar-flute.
---
# cedar-flute-cents-table

The table of actual [cents](../../../b4/cents/cents.md)-deviations from 12-tone equal temperament for each scale-degree of the standard [cedar-flute](../../../b4/cedar-flute/cedar-flute.md).

## Definition

A **cedar-flute cents-table** is a function

C : ScaleDegree → (cents_low, cents_high) ⊂ R

assigning to each scale-degree of the [pentatonic-minor-scale](./pentatonic-minor-scale.md) on the cedar flute the range of [cents](../../../b4/cents/cents.md)-deviation from 12-tone equal temperament observed across the standard tradition of makers.
The deviation is given as a *range* rather than a single value because there is documented variation across makers and across individual instruments; the range expresses the conventional intonational profile of the tradition.

The standard cedar-flute cents-table:

| Scale-degree | Interval from fundamental | 12-TET cents | Conventional cedar-flute cents | Cents deviation |
|---|---|---|---|---|
| 1 (fundamental) | unison | 0 | 0 | 0 (definitional) |
| b3 | minor third | 300 | 270–290 | −30 to −10 |
| 4 | perfect fourth | 500 | 495–505 | −5 to +5 |
| 5 | perfect fifth | 700 | 700–705 | 0 to +5 |
| b7 | minor seventh | 1000 | 970–990 | −30 to −10 |
| 8 | octave | 1200 | 1200 | 0 (definitional) |

The b3 and b7 sit noticeably flat of 12-TET — closer to the just minor third (316 cents) and just minor seventh (996 cents) in some makings, sometimes flatter still toward the septimal minor third (267 cents) and septimal minor seventh (969 cents).
The perfect fourth and perfect fifth are close to their just values (498 cents and 702 cents respectively), which are also close to their 12-TET values.
The octave is the just octave (1200 cents) by acoustic necessity (an octave on a cylindrical [bore](../prose/teaching/explanations/bore.md) is the second [harmonic](../../prose/teaching/explanations/harmonic.md), which is exactly 2:1 by physics).

## Properties

- **Anchored at fundamental and octave**: C(1) = 0 and C(8) = 1200 by definition; these are not free parameters.
- **Range, not point values**: Each interior scale-degree's cents-value is a range, reflecting variation across makers and instruments.
- **Acoustic stability**: The perfect fourth and perfect fifth are constrained close to their just values by the acoustic stability of those intervals on a cylindrical bore; deviations of more than ~10 cents would be perceived as "out of tune" by knowledgeable listeners.
- **Tradition-defining**: The flat b3 and b7 are characteristic of the tradition and are not "out of tune" with respect to it — they are the tradition's intonational identity.

## Source claim

[cedar-flute-standard-tuning](../../prose/learning/claims/cedar-flute-standard-tuning.md).

## Specification

[cedar-flute-cents-table.spec](../../work/governance/rules/specifications/cedar-flute-cents-table.spec.md).
