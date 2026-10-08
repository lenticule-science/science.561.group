---
title: "Specification: phrase-shape"
description: Normative specification of a correct realization of phrase-shape.
---
# Specification: phrase-shape

Normative specification of a correct realization of [phrase-shape](../../../../code/structures/phrase-shape.md).

## Invariants (MUST)

1. **Finite phrase-shape set.** A phrase-shape instance MUST belong to the documented finite set Φ = {descending-cadence, peak-and-return, repeat-and-vary}.
2. **Per-phrase tagging.** Each phrase in a musical realization MUST be assignable to exactly one phrase-shape tag.

## Conditions (SHOULD)

1. A realization SHOULD permit hybrid phrase shapes (e.g., a peak-and-return that also functions as repeat-and-vary at the strophic level).
2. A realization SHOULD support extension of Φ if new documented phrase shapes emerge from further survey work.

## Forbidden (MUST NOT)

1. A phrase-shape tag MUST NOT be assigned to a phrase that does not exhibit the corresponding contour (e.g., a phrase that rises throughout is not a descending-cadence).
