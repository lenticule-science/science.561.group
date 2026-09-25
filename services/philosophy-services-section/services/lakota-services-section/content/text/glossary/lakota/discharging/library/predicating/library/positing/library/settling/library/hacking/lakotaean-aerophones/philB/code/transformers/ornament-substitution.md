---
title: ornament-substitution
description: The operation taking a flute note with a current ornament (possibly "plain") and producing a variant flute note with a different ornament drawn from the ornament-glossary, respecting placement and combination rules.
---
# ornament-substitution

The operation taking a flute note with a current ornament (possibly "plain") and producing a variant flute note with a different ornament drawn from the [ornament-glossary](../structures/ornament-glossary.md), respecting placement and combination rules.

## Definition

The **ornament-substitution** transformer is the partial map

σ : FluteNote × Orn → FluteNote

where a *flute note* is a triple (s, d, current-orn) consisting of a scale-degree s, a duration d, and the current ornament current-orn ∈ Orn ∪ {plain}, and the second argument new-orn ∈ Orn ∪ {plain} is the proposed substituted ornament.
The map is *partial* — it is defined only when new-orn is admissible at the note's position within the host [phrase](../../prose/teaching/explanations/phrase.md).

The substitution σ((s, d, current-orn), new-orn) produces the substituted flute note (s, d, new-orn), provided that new-orn satisfies the *placement constraint*:

placement(new-orn) ∋ position(s within phrase)

where placement(orn) is the set of admissible positions for the ornament orn (per the [ornament-glossary](../structures/ornament-glossary.md)), and position(s within phrase) is the position of the host note within its containing phrase (cadential, mid-phrase, phrase-beginning, etc.).

If the placement constraint is violated, σ is undefined for this argument pair — substituting an ornament into a position that does not admit it produces an unidiomatic result.

For ornaments that combine sequentially or simultaneously, σ may also take a multi-ornament tuple as the second argument (e.g., σ((s, d, plain), ([finger-slide](../../../b4/finger-slide/finger-slide.md), [warble](../../../b4/warble/warble.md))) for a slide-into-tonic followed by a held-tonic-warble cadence).
The combination constraint (per the [ornament-glossary](../structures/ornament-glossary.md)'s combine column) must be satisfied for combined substitutions.

## Properties

- **Partial**: σ is defined only for argument pairs satisfying the placement constraint; substitutions violating placement produce undefined results.
- **Identity-preserving on plain → plain**: σ((s, d, plain), plain) = (s, d, plain) (the trivial substitution).
- **Invertible on simple substitutions**: σ(σ((s, d, plain), orn), plain) = (s, d, plain) — removing an ornament returns the plain form (assuming the plain placement is admissible).
- **Not melody-altering**: σ does not change the scale-degree s or the duration d; only the ornament changes.
  (Substitutions involving [finger-slide](../../../b4/finger-slide/finger-slide.md) or [trill](../../prose/teaching/explanations/trill.md) introduce additional pitch content within the note, but the note's principal scale-degree identity is preserved.)
- **Basis for strophic variation**: The principal use of σ is in [strophic-variation](./strophic-variation.md), which produces a variant strophe by applying σ at selected positions of the source strophe.

## Source claim

[ornament-vocabulary](../../prose/learning/claims/ornament-vocabulary.md).
