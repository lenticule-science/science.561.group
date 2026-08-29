---
title: "Lakotaean content placed against the four-regime grammar"
date: 2026-05-28
---

# Lakotaean content placed against the four-regime grammar

The 2026-05-27 grammar stabilization (CLAUDE.md → "The four-regime grammar (stabilized 2026-05-27)") fixed the names of the four primitive morphisms' generated categories.
This session placed the Lakotaean content in `lab/` against that grammar.

## Chain

The full chain was built in `lab/hacking/articulating/`:

- `aperiodic-articulation-category/hacking/library/` — articulating tier
- `…/predicating/library/transfinite-predication-category/hacking/library/` — predicating tier
- `…/positing/library/scott-continuous-posit-category/hacking/library/` — positing tier
- `…/settling/library/finite-settlement-algebra/hacking/library/` — settling tier

Every Lakotaean-specific term sits at one of these four tiers, wrapped in `hacking/` because the derivation from the generic regime-category to the Lakotaean specialization is not yet worked out.

## Placement by tier

**Articulating (primitives and umbrella):** `animism`, `finger-conception-of-energy`, `hanhepi`, `heyokha`, `iyan`, `iyan-hanhepi`, `iyokheya`, `iyuha-sni`, `lakotaean-philosophy` (umbrella with introductions and Walker references in `docs/dev/`), `lakotiyapi` (the language, with `adposition` nested), `mitakuye-oyasin`, `skan`, `sword-tobtob-kin`, `takuye`, `tobtob-kin`, `two-spirit`, `wakhan`, `wotakuye`, `wowichake`, `yuhapi`, `yuhoha-sni`.

**Predicating (cell-and-rule structure):** `extended-entity-set`, `kin-relation-as-primitive`, `wakhan-as-cell-quality`.

**Positing (norms, ceremonies, governance):** `four-virtues`, `four-virtues-as-evaluation-predicates`, `hunka-as-kin-cell-installation`, `lakotaean-politics` (with full sub-tree of akicita, hunka, naca, oceti-sakowin, omniciye, oyate, paha-sapa, tiyospaye, wiping-of-tears, consensus-by-withdrawal), `seven-rites`, `seven-rites-as-witness-morphisms`, `wolakota-as-closure-discipline`.

**Settling (quiescence, settled forms, cultural artifacts):** `lakotaean-aerophones` (full instrument sub-tree), `wichoni`, `wicozani`, `wicozani-as-quiescence`, `wiping-of-tears-as-polity-quiescence-restoration`, `wolakota` (the way as settled lifeway).

## Rule of thumb applied

The substance, not the vocabulary, decided each placement.
The lab content was written before the 2026-05-27 grammar stabilized, so its own use of "category" / "predication" / "settling" is unreliable.
Each item was placed where its substantive claim lands:

- Names a primitive entity or field in the Lakotaean worldview → articulating tier.
- Names a cell-and-rule structure (kin-cells, marked cells, the predicate-category structure) → predicating tier.
- Names a normative discipline, ceremony, or governance practice (the *selection* of which rules count) → positing tier.
- Names a quiescent / settled state, or a finite-step cultural artifact → settling tier.

## Duplicate handling

The previous flat structure under `lab/hacking/library/being/library/indigenous/` carried near-complete duplicates of `…/indigenous/lakotaean-philosophy/`: every concept that existed in both was bit-identical.
Per the rule "if there are duplicates you have to preserve the duplicate under `$thing/docs/dev/scraps/`," the `lakotaean-philosophy/<concept>/` version was kept as canonical at the regime tier, and the `indigenous/<concept>/` version was moved to `<canonical>/docs/dev/scraps/<concept>-from-indigenous-flat/`.

Two additional same-content pairs collapsed the same way:

- `lakotaean-politics` in `community/politics/` and `governing/library/politics/` were identical; `governing/` was taken canonical, `community/` placed in scraps.
- The four `walker1917/1980/1982/1983` reference dirs moved into `lakotaean-philosophy/docs/dev/references/`.

## Open

- The chain backbone's *intermediate* category dirs (`aperiodic-articulation-cell`, `transfinite-predication-cell`, `scott-continuous-posit-cell`) are empty placeholders — they exist in path only, with no `.schema.json`, `.jsonl`, or `scripts/`.
  They make the path well-formed but the categories themselves are not yet earned.
- The derivation from each generic regime-category to its Lakotaean specialization stays admitted (the leading `hacking/`).
  Earning that derivation — showing that Lakotaean philosophy *as a system* really does occupy these regime tiers and not just look like it does — is downstream work.
- The empty `lab/hacking/library/being/library/indigenous/lakotaean-philosophy/hacking/` shell remains where the old flat layout was; git ignores empty dirs, so it persists as a no-op artifact until the parent path is removed by some later move.
- `lab/archive/` carries many more historical copies of this content (older organizational layouts, WSL backups, composted research trees).
  Those were left untouched; archive material is preserved as historical record, not as substrate.
