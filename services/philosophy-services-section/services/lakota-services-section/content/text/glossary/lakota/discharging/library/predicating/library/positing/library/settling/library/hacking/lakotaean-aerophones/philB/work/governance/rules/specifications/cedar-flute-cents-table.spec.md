---
title: "Specification: cedar-flute-cents-table"
description: Normative specification of a correct realization of cedar-flute-cents-table.
---
# Specification: cedar-flute-cents-table

Normative specification of a correct realization of [cedar-flute-cents-table](../../../../code/structures/cedar-flute-cents-table.md).

## Invariants (MUST)

1. **Anchored fundamental and octave.** The cents-table MUST assign 0 cents to scale-degree 1 (the [fundamental](../../../../prose/teaching/explanations/fundamental.md)) and 1200 cents to scale-degree 8 (the octave).
  These are acoustic constraints, not free parameters.
2. **b3 in conventional range.** Scale-degree b3 MUST be assigned a cents-range whose minimum is no lower than 250 cents and whose maximum is no higher than 300 cents.
  Values flatter than 250 cents would be septimal or below; values sharper than 300 cents would coincide with 12-TET, which is not characteristic of the tradition.
3. **b7 in conventional range.** Scale-degree b7 MUST be assigned a cents-range whose minimum is no lower than 960 cents and whose maximum is no higher than 1000 cents.
  The reasoning parallels the b3 case.
4. **Perfect fourth and fifth close to just.** Scale-degrees 4 and 5 MUST be assigned cents-ranges whose values are within ±10 cents of the just perfect fourth (498 cents) and just perfect fifth (702 cents) respectively.
  Larger deviations would be perceptually "out of tune."

## Conditions (SHOULD)

1. The cents-table SHOULD express each scale-degree's cents-value as a range (interval) rather than as a single point value, reflecting documented variation across makers and instruments.
2. The cents-table SHOULD note the relationship of each value to the nearest just-intonation interval (the b3 to the just minor third or septimal minor third; the b7 to the just minor seventh or septimal minor seventh; etc.) where such a relationship illuminates the tradition's intonational basis.
3. The cents-table SHOULD distinguish *acoustic constraints* (the fundamental and octave's values) from *traditional conventions* (the b3 and b7's flatness).

## Forbidden (MUST NOT)

1. The cents-table MUST NOT assign 12-TET values (300, 1000 cents) to b3 and b7.
  The Lakotaean cedar flute is not a 12-TET instrument, and a cents-table that asserts 12-TET values is not the cents-table of this tradition.
2. The cents-table MUST NOT assign cents-values that would imply a non-pentatonic-minor scale (e.g., a 400-cent major third in place of a 300-cent minor third would imply a major-pentatonic scale, not the minor-pentatonic of the cedar flute tradition).
3. The cents-table MUST NOT collapse the per-instrument variation into a single canonical tuning.
  Different cedar flutes have measurably different cents-profiles, and the cents-table should express this variation rather than overcommitting to one specific instrument's measurement.
