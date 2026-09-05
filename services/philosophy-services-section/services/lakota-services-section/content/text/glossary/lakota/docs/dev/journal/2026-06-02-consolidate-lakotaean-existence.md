---
title: Consolidating the scattered Lakota notes into lakotaean-existence
date: 2026-06-02
kind: consolidation (notes-only, move-is-move)
---

## Goal

Consolidate the existing, scattered notes on **lakotaean becoming** into a single `development/lab/lakotaean-existence/` package, modeled after `development/lab/existence/` and the other categorical (not object-oriented) unfoldings, now that the Curry-Howard / Yoneda-embedding directionality is worked out.

## What was found

The Lakota corpus already existed, half-formalized onto the bilattice/closure substrate, but scattered across (and divergent between) several trees:

- two flat humanities trees — `development/lab/archive/library/humanities/...
  ` (`philB`, older/partial) and `development/internal/hacking/library/from-lab-archive/library/humanities/...
  ` (`philA`, fuller);
- the fractal-placed `development/lab/archive/predication-categories/bucket-4/...
  ` (`b4`), which also kept `*-from-indigenous-flat` scrap copies (`b4flat`);
- character structures under `rom-keldar` (`romkeldar`), a survey under `from-predicated-computing`, and assorted strays.

The directionality spec lives in the bucket-4 journal `2026-05-28-curry-howard-yoneda-directionality-from-heyokha.md`: Íŋyaŋ-in-Haŋhépi is the initial ⊤; `discharging` empties it into the four-fold (`tobtob-kin`: Škáŋ=⊥, Wí=t, Makȟá=f, Íŋyaŋ-residual=⊤); `heyokha` is the ⊤-bearer continuing the discharge.
The regimes nest/tile/fractal rather than sitting in four flat corners.

## What was done

- **Notes-only, union + md5-dedup, provenance-tagged.** Each `$thing` became a directory at its fractal coordinate; every distinct note-version was gathered under `$thing/docs/dev/notes/<slug>--<tag>.md`.
  Byte-identical copies collapsed to one; divergent copies kept side by side.
  Nothing dropped.
- **Move-is-move.** Sources were relocated out of the archive (breaking archive links is acceptable per the captain).
  Emptied source dirs were pruned.
- **Becoming-core placed carefully** (discharging → iyan-hanhepi/iyan/hanhepi → tobtob-kin/skan(+wi,makha,inyan-residual) → heyokha+internals → mitakuye-oyasin, wakhan, iyokheya → predicating kin-morphisms → positing wolakota/four-virtues/ seven-rites → settling wicozani). ~52 note files.
- **Coarse tail parked in `hacking/`** at its regime tier: politics, governance, predicated-lakotaean-work, and the large aerophones corpus — to be placed precisely in a later pass.
- **Left in the archive intentionally:** personal essays ("moving to Lakota territory"), the "anarcho-nihilism" term, "elderhood-brotherhood" triage, and the live `development/internal/becoming/` wolakota survey — none are the becoming theory corpus.

## Snags (recorded for honesty)

- A concurrent session was committing+pushing in this repo mid-run; combined with a dead `git reset` that corrupted `.git/index`, the first `git mv` pass partially failed.
  Recovery: rebuilt the index from HEAD, switched all moves to plain `mv` (no index interaction), and staged with a single selective `git add` (never `-A`, to avoid sweeping in the concurrent voidmath/spacetime work).
- An over-broad `docs/dev/journal/*` glob first pulled 140 non-Lakota bucket-4 journals; they were restored to source via `git checkout`, and only the two genuine Lakota journals were re-captured by exact path.

## Open

- Write derived `$thing.md` definitions (define / generated-by / generates / prove-it), per the existence pattern.
- Place the coarse tail (politics/governance/work/aerophones) precisely; replace its `hacking/` wrappers with earned coordinates.
- Mint `wi` / `makha` / `inyan-residual` as standalone notes (currently referenced-only) and resolve the iyan-hanhepi ⊤-vs-⊥ reading with the captain.
