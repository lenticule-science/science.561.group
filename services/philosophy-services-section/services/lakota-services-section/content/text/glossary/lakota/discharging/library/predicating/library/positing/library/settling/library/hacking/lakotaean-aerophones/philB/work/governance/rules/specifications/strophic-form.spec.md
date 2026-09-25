---
title: "Specification: strophic-form"
description: Normative specification of a correct realization of strophic-form.
---
# Specification: strophic-form

Normative specification of a correct realization of [strophic-form](../../../code/structures/strophic-form.md).

## Invariants (MUST)

1. **Strophe-template, count, variation function.** A strophic-form instance MUST consist of three components: a strophe-template Σ (a sequence of phrase-templates with cadence selections), a strophe count n ∈ ℕ⁺ (number of strophe repetitions), and a variation function V mapping each strophe index to a variation specification.
2. **Identity preservation across strophes.** The melodic identity of Σ MUST be preserved across all n strophes.
  Variations across strophes are limited to [ornament-substitution](../../../../code/transformers/ornament-substitution.md) and small rhythmic shifts; substantial melodic modification across strophes constitutes a different form, not strophic-form.
3. **Each strophe a complete realization of Σ.** Each of the n strophes MUST be a complete realization of Σ — all phrases of Σ are present in each strophe, with their cadences (possibly substituted from the [cadence-set](../../../../code/structures/cadence-set.md) per the variation function).
4. **Strophe count n ≥ 1.** A strophic-form with n = 0 would be no performance at all; n MUST be at least 1.

## Conditions (SHOULD)

1. For solo [cedar-flute](../../../../../b4/cedar-flute/cedar-flute.md) [courting-song](../../../../../b4/courting-song/courting-song.md) performance, n SHOULD typically fall in the range 2 ≤ n ≤ 6.
2. The variation function V SHOULD assign increasingly conclusive cadences across the strophes — the final strophe SHOULD end on a higher-weight cadence than earlier strophes — to audibly mark the song's progression toward its end.
3. The variation function V SHOULD produce variation that respects the [ornament-glossary](../../../../code/structures/ornament-glossary.md)'s placement and combination rules at each position.

## Forbidden (MUST NOT)

1. A strophic-form MUST NOT alter the scale-degree content of Σ across strophes.
  The melody is invariant; only ornaments and timing vary.
2. A strophic-form MUST NOT use unrelated melodic material across strophes.
  Two performances using different melodic material on different repetitions are not a strophic-form performance; they are something else (a medley, a free improvisation, etc.).
3. A strophic-form's variation function MUST NOT specify ornament-substitutions that violate the [ornament-glossary](../../../../code/structures/ornament-glossary.md)'s placement or combination constraints.
  Variations must remain idiomatic.
