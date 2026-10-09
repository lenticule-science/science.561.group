---
title: Curry-Howard-Yoneda directionality, worked out on the heyokha case
date: 2026-05-28
established:
  - iyan-hanhepi is the INITIAL absurd articulation (⊤, the cosmogonic seed), not the pre-articulation ⊥
  - discharging is the morphism by which iyan-hanhepi's contradiction empties outward into the four-fold field
  - heyokha is an extension generator-and-category that lives at discharging/hacking/library/heyokha, derived from discharging's codomain category
  - Lakota and Western categorical machinery are literally the same content in different presentations (per tobtob-kin.md, wakhan-as-cell-quality.md "realizes:" frontmatter, kin-relation-as-primitive.md "realizes:" frontmatter)
  - the Lakota "two-things-in-one-word" phenomenon (Skan-as-morphism + Skan-as-cell, iyan-hanhepi-as-state + discharging-as-act, heyokha-as-principle + heyokha-as-bearer-class) maps to the Yoneda-duality between object-presentation and morphism-presentation in Western proof-tree
date-created: 2026-05-28
description: "The user's challenge: figure out the Curry-Howard-Yoneda directionality of heyokha — its morphism-direction, its codomain category, its derivation chain."
---

## What this entry records

The user's challenge: figure out the Curry-Howard-Yoneda directionality of heyokha — its morphism-direction, its codomain category, its derivation chain.
The reasoning is generic: if heyokha can be placed correctly, the same procedure places anything.

## The correction that mattered

Initial reading (wrong): iyan-hanhepi at ⊥ (pre-articulation, no-information-yet); heyokha as the morphism ⊥→⊤.

Corrected reading (per user): iyan-hanhepi is the INITIAL ABSURD articulation — ⊤, the cosmogonic seed of contradiction.
The reason is in iyan-hanhepi.md: Íŋyaŋ is "soft and shapeless, omnipresent, all-powerful BUT power-with-nothing-to-act-on is contradiction."
Both-positive-and-negative-determined simultaneously is ⊤, not ⊥.
The cosmogony runs FROM ⊤ outward (discharging), not toward ⊤.
Heyokha is an extension generator of discharging's codomain category — the lived-bearers who continue the cosmogonic contradiction in perpetuity.

## The mapping established

| Categorical position | Lakota |
|---|---|
| INITIAL ⊤ (cosmogonic seed) | iyan-hanhepi |
| The discharge morphism (cosmogonic act) | discharging (captain's name for Íŋyaŋ's self-emptying) |
| Discharge codomain (the four-times-four) | tobtob-kin |
| Post-discharge ⊥ (potential-cell, supreme judge, moving-principle) | Skan |
| Post-discharge t (active-cell, luminous-affirmation) | Wí |
| Post-discharge f (stable-cell, grounded-complement) | Makȟá |
| Post-discharge ⊤-residue (absurd-cell, the spent rock) | Íŋyaŋ-residual |
| Extension-bearer at ⊤ (continuing-discharge in lived practice) | heyokha |
| ⊤-bearing source of heyokha-vocation | Wakíŋyaŋ (Thunder-beings; to be minted under heyokha) |
| Differentiation morphism (creates first distinction) | iyokheya |
| Kin-cell (relation as object) | takuye |
| Kin-relating (binding morphism) | wotakuye |
| Withdrawal morphism (complement of wotakuye) | iyuha-sni |
| Witness-act morphism | yuhapi |
| Global theorem on aperiodic-articulation-category | mitakuye-oyasin |
| Cell-quality marking sacredness | wakhan |
| Encompassing wakhan-pattern on whole substrate | Wakȟáŋ Tȟáŋka |
| Closure-rule subsystem for proper conduct | wolakota (already at positing tier) |
| Quiescence condition on settling | wicozani (already at settling tier) |

## The two-things-in-one-word principle

In Lakota cosmology, key terms bundle what Western proof-tree separates into morphism+object pairs: - **Skan** = the moving-principle (morphism) AND the ⊥-cell (object) — Lakota names both at once - **iyan-hanhepi** = the initial-⊤-state (object) AND the source-of-discharging (domain-of-morphism) — Lakota names the state, the morphism is implicit - **heyokha** = the contradiction-as-generative principle (morphism) AND the bearer-vocation-class (object-class) — Lakota names both at once

These bundlings are the Yoneda-duality made visible: in Western proof-tree, an object IS its category of arrows into-and-from it (the Yoneda embedding); the "object" and "morphism" presentations of the same thing are formally distinguishable but ontologically identical.
Lakota holds them as one; Western proof-tree splits them by name and position.

When placing such a bundled concept: use the morphism-name for the path-position (`discharging/`, `heyokha/`) and let the object-side be carried by the `.md` documentation and the `library/` children that the morphism generates.

## What was moved in this session

```
absurd-aperiodic-articulation-cell/
  hacking/library/
    iyan-hanhepi/                          # INITIAL ⊤ (moved from articulating-tier flat sibling)
      iyan-hanhepi.md
      library/
        iyan/                              # moved (compositional: iyan-IN-hanhepi)
        hanhepi/                           # moved (compositional: iyan-in-HANHEPI)
      discharging/                         # MORPHISM (newly minted with discharging.md)
        discharging.md
        hacking/library/
          heyokha/                          # moved (extension generator-and-category)
          tobtob-kin/                       # moved (codomain: the four-times-four)

potential-aperiodic-articulation-cell/
  hacking/library/
    skan/                                   # moved (the ⊥-position wakhan)
```

## Plan for remaining Lakota content

Same Curry-Howard-Yoneda procedure for each:

- **iyokheya** (differentiation morphism) — lives at potential-aperiodic-articulation-cell as a sub-morphism that creates distinctions from the under-determined position.
  Codomain: a category of distinct-things-marked-by-iyokheya.
- **takuye** (kin-cell as object) — lives at the predicating tier as a primitive object in the Lakota predicate category.
  Co-located with kin-relation-as-primitive (which already lives there).
- **wotakuye** (kin-relating, the binding morphism) — lives at predicating tier as the binding morphism over takuye-cells.
  Its codomain contains the bound kin-relations.
- **iyuha-sni** (withdrawal morphism, complement of wotakuye) — lives at the same tier as wotakuye, as its dual/complement.
- **yuhapi** (witness-act morphism) — lives at predicating tier; produces witness-bearing predications.
- **mitakuye-oyasin** (global theorem) — lives as a docs/dev/theorem under aperiodic-articulation-category (or as a global-invariant object cross-cutting the category).
  Realized at predicating tier as kin-relation-as-primitive (already placed).
- **wakhan** (cell-quality) — already has companion at predicating tier (wakhan-as-cell-quality).
  Possibly stays at articulating tier as the quality-name, with the formal realization at predicating.
- **two-spirit** (gender category) — sociology, settled identity.
  Settling tier.
- **animism** (broad tradition) — comparative cluster; possibly stays at articulating tier as a topic-rather-than-derivation, or distributed.
- **lakotaean-philosophy** (umbrella with docs) — the documentation hub; stays as an umbrella at articulating tier, with cross-links updated as Lakota terms relocate.
- **finger-conception-of-energy, sword-tobtob-kin** (references) — stay where they are or move to lakotaean-philosophy/docs/dev/references/.
- **wowichake, yuhoha-sni** — read first, then place.

Mathematical companions (the same content via different presentation): - **invisible-automorphism-subgroup, aperiodic-classifying-invariant, aperiodic-co-classifying-invariant, mutually-locally-derivable** — these are the cohomological/sheaf machinery for the aperiodic regime.
They live at articulating tier (where the aperiodic regime is most operationally relevant), as cross-cutting tools rather than as cell-positioned objects.

After Lakota content placement, the heyokha-internal content (wakinyan, heyokha-bearer-vocation, contrary-conduct, wakinyan-vision) should be minted as objects in heyokha's generated library/.

## Open

- The Wí, Makȟá, Íŋyaŋ-residual wakhan are not yet standalone terms in the tree (referenced inside iyan.md and tobtob-kin.md).
  When they get minted as standalone notes, they move to active-, stable-, absurd-aperiodic-articulation-cells respectively.
- The discharging morphism's formal schema (discharging.schema.json + scripts/discharging.mjs) is not yet derived — discharging.md alone is currently the artifact.
  The morphism remains admitted via the `hacking/` wrapping until the schema/script pair is earned.
- The Lakota-Western literal identity claim (from tobtob-kin.md: "the four positions ARE the four logic positions, in Lakota cosmogonic form") means future work can derive Lakota content from the Western algebra and vice versa, with confidence the substrate is one.
