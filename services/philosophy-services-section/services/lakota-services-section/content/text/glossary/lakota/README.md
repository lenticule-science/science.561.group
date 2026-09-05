# @561-group/theories/existence/lakota

**Existence, derived in Lakota cosmogonic form.** Built the way [existence](../existence) and [voidmath](../../active/voidmath-kernel) are built: the directory tree *is* the type language; a path is a typing judgment; an address is a categorical coordinate.
The nesting *is* the derivation.

This package is a **consolidation** of prior, scattered notes on Lakota philosophy (the cosmogony, the kin-metaphysics, the lifeway, the polity).
It is **notes-only**: each `$thing/docs/dev/notes/` collects that thing's raw note-versions, unioned across all the trees they were scattered in, deduplicated by content, and tagged by provenance (`--philA`, `--philB`, `--b4`, `--b4flat`, `--romkeldar`, …).
Nothing was dropped.
No derived `$thing.md` has been written yet — that is a later pass.

## The spine: it starts before the discharge, and it fractals

There are **not** four flat corners of four regimes.
The four closure-ordinal regimes — aperiodic / transfinite / scott-continuous / finite — **nest, tile, and fractal**.
The corpus says this in its own voice: the four-superior structure is *"fractal* … the same four-valued structure runs at every scale … the cosmos is self-similar across scales of relational complexity" (`…/tobtob-kin/docs/dev/notes/tobtob-kin--*.md`).
A thing therefore carries an *outer context* and an *inner regime* at once — e.g. **wolakota is aperiodic, but within a finite algebra.**

So the package does not begin at a regime; it begins at **Íŋyaŋ-in-Haŋhépi prior to discharging** — the alone-stone-in-darkness whose aloneness is structurally impossible — and unfolds outward by the morphism `discharging` (Íŋyaŋ's self-emptying).
This directionality is worked out in `docs/dev/journal/2026-05-28-curry-howard-yoneda-directionality-from-heyokha--b4.md`, the Curry-Howard-Yoneda spec this layout follows:

| categorical position | Lakota | path |
|---|---|---|
| initial ⊤ — the cosmogonic seed | Íŋyaŋ-in-Haŋhépi | `discharging/library/iyan-hanhepi/` |
| the discharge morphism | discharging | `discharging/` |
| discharge codomain (four-times-four) | Tóbtób Kiŋ | `discharging/library/tobtob-kin/` |
| ⊥ (supreme judge / moving-principle) | Škáŋ | `…/tobtob-kin/library/skan/` |
| t (luminous affirmation) | Wí | `…/tobtob-kin/library/wi/` |
| f (grounded complement) | Makȟá | `…/tobtob-kin/library/makha/` |
| ⊤-residue (the spent rock) | Íŋyaŋ-residual | `…/tobtob-kin/library/inyan-residual/` |
| extension-bearer at ⊤ (lived contradiction) | Heyókha | `discharging/library/heyokha/` |

Per the **two-things-in-one-word** principle (a Lakota term bundles what Western proof-tree splits into morphism + object — the Yoneda duality), the **morphism-name** takes the path-position (`discharging/`, `heyokha/`) and the object-side is carried by the notes and the `library/` children it generates.

**A tension preserved, not resolved (notes-only):** the directionality journal reads Íŋyaŋ-in-Haŋhépi as the *initial ⊤* (contradiction-seed); the concept file `iyan-hanhepi--philA.md` reads it as the cosmogonic *⊥* ("nothing yet distinguished").
Both readings are kept in the notes; the *placement* follows the journal's directionality (discharge runs **from** the seed outward).

## Layout

- `discharging/` — the cosmogonic self-emptying. Seats the aperiodic base:
  - `library/iyan-hanhepi/` (`library/iyan/`, `library/hanhepi/`) — the seed.
  - `library/tobtob-kin/` — the four-fold field (`skan`, `wi`, `makha`,
    `inyan-residual`; `wi`/`makha`/`inyan-residual` are referenced-only so far —
    `hacking/` placeholders).
  - `library/heyokha/` — the ⊤-bearer (`wakinyan`, `wakinyan-vision`,
    `heyokha-bearer`, `contrary-conduct`).
  - `library/mitakuye-oyasin/`, `library/wakhan/`, `library/iyokheya/`.
  - `library/predicating/` — transfinite kin-morphisms and objects (`takuye`,
    `wotakuye`, `iyuha-sni`, `yuhoha-sni`, `yuhapi`, `wowichake`, `wichoni`,
    `kin-relation-as-primitive`, `extended-entity-set`).
    - `.../positing/` — scott-continuous (`wolakota`, `four-virtues`, `seven-rites`).
      - `.../settling/` — finite (`wicozani`).
- The political/governance/work/music corpus is parked in `hacking/` buckets at its
  regime tier (`…/positing/library/hacking/lakotaean-politics/`,
  `…/settling/library/hacking/lakotaean-governance/`,
  `…/settling/library/hacking/lakotaean-aerophones/`) — coarse this pass, to be placed
  precisely later.
- `docs/dev/` — the package's references (Walker), the two intros and two umbrella
  indices, and the dev journals (incl. the directionality spec). Session log:
  `docs/dev/journal/2026-06-02-consolidate-lakotaean-existence.md`.

## Honesty

The substantive Lakota tradition is held by Lakota knowledge holders in living tradition; this package carries it under the captain's vested authority as a Lakota person (per the intros).
The substrate-algebraic form is a **tool**, never the tradition.
Any coordinate not yet derived is wrapped in `hacking/` — Lean-`sorry`-grade, derivation-in-progress, not theorem.
