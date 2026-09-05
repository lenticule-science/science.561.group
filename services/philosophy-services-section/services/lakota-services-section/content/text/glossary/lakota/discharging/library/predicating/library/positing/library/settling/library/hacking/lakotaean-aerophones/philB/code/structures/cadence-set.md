# cadence-set

The named set of cadential gestures used in the [cedar-flute](../prose/teaching/explanations/cedar-flute.md) [courting-song](../prose/teaching/explanations/courting-song.md) repertoire, with their specific melodic content and conventional closural weights.

## Definition

A **cadence-set** is a finite indexed set

Cad = { (name, content, weight) | name ∈ Names }

where each cadence is identified by a name, has a specific melodic content (a sequence of scale-degrees terminating on the tonic, possibly with an attached [ornament](../prose/teaching/explanations/ornament.md) on the terminal tonic), and has a conventional closural weight (a partial ordering position indicating relative strength of closure).

The standard cedar-flute cadence-set Cad_std:

| Name | Melodic content | Terminal ornament | Closural weight |
|---|---|---|---|
| descending-minor-third | b3 → 1 | (optional) | 2 |
| descending-perfect-fourth | 4 → 1 | (optional) | 1 |
| descending-perfect-fifth | 5 → 4 → b3 → 1 | (optional) | 3 |
| held-tonic-with-warble | 1 (held) | [warble](../prose/teaching/explanations/warble.md) | +1 (modifier) |

The held-tonic-with-warble is a *modifier cadence* — it can stand alone (closural weight 2 as a standalone cadence) or be attached to one of the descending cadences (adding +1 to the descending cadence's closural weight, so descending-minor-third + held-tonic-warble has total closural weight 3, descending-perfect-fifth + held-tonic-warble has total closural weight 4).

## Properties

- **Finite and small**: The conventional cadence-set has exactly four entries (three descending cadences + one modifier).
- **Closural ordering**: The cadences are partially ordered by closural weight — higher weight = more conclusive closure.
- **Modifier compositionality**: The held-tonic-with-warble modifier composes with any of the descending cadences to produce a stronger combined cadence.
- **Tonic-terminating**: All descending cadences terminate on scale-degree 1 (the [fundamental](../prose/teaching/explanations/fundamental.md)).
- **Hierarchical use**: Cadences are deployed across a [strophic-form](./strophic-form.md) song to mark different levels of structural closure — internal phrases use lower-weight cadences, strophe-final phrases use higher-weight cadences, song-final phrase uses the highest-weight cadence.

## Source claim

[cadence-vocabulary](../prose/learning/claims/cadence-vocabulary.md).

## Specification

[cadence-set.spec](../work/governance/rules/specifications/cadence-set.spec.md).
