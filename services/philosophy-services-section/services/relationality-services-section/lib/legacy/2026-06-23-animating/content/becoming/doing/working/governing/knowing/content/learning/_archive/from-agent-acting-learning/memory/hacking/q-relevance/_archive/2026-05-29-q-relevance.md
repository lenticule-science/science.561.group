---
date: 2026-05-29
kind: object-placement
$thing: q-relevance
parent-category: memory
schema: ../../q-relevance.schema.json
script: ../scripts/q-relevance.mjs
status: hacking-placement
---

# q-relevance placement

## Why this exists

Memory's `relevance` was typed as a value corner.
But relevance is a graded **presence strength** ("how present is this entity to the agent now?") — a dimension *orthogonal* to the claim's truth (which stays a charge, in positing/settling).
The harness's `sense > remembered-sense > learning` recognition-weighting was a **hack** approximating exactly this grading.
Per the user: "weighting was a hack for better categorical machinery you can add — fuzzy Q."
The proper machinery is a value in a **quantale** Q (`docs/GENEALOGY.md` §6).

This is not a bolt-on: the lab's Laplacian/MLD already lives on **Q-enriched cellular sheaves** (`spotcomp/MODULI-DESCENT-LAPLACIAN.md`), so making relevance Q-valued *unifies* memory-relevance with the consensus/dissent (`H¹`) machinery under one enrichment, instead of grafting a provenance order onto the bare value.

## Chosen Q

The **unit-interval product quantale**: carrier `[0,1]`, order `≤`, join `= max` (sup), meet `= min`, tensor `⊗ = product`, unit `1`, bottom `0`.
Commutative, unital, sups distribute over `⊗` — a quantale.
The closure rules become quantale ops:

- **promotion** = `qJoin` with a high value (recency / strong evidence wins for presence)
- **decay** = `qTensor` by a factor `f<1` — and **persistence is `f=1`** (sense never decays)
- **dismissal** = `qMeet 0`

The provenance bridge `qFromProvenance` retires the tier-order hack as graded Q with per-tier decay (`sense → {1.0, decay 1.0}`, `remembered-sense → {0.8, 0.95}`, `learning → {0.5, 0.7}`).

## Coincidence: bare value corners ⊂ Q on the presence reading

`qFromCorner` maps `bottom → 0` (absent) and any held corner (`true`/`false`/`top`) `→ 1` (present).
This is a **coincidence on the presence reading**: relevance cares only about presence-strength, so on that reading the value corner and its Q image agree. **Off-scope** (the truth/bilattice reading) the map is lossy — that is the declared distinctness.
`learning`/`mutation` keep the original value path when `relevance` is a string and switch to Q ops when it is a number, so the embedding is backward-compatible.

## Why `hacking/`

The choice of quantale and the Laplacian tie-in are **asserted direction**, not derived: the unit interval is one of several admissible Q; the enrichment of the sheaf Laplacian by this Q is cited from `MODULI-DESCENT-LAPLACIAN.md`, not reproved.
Honest admission per repo `CLAUDE.md`.

## Obligations

- Justify the unit-interval product quantale against alternatives (Łukasiewicz, Gödel, the Lawvere `[0,∞]` cost quantale) for the relevance reading.
- Make the `qFromCorner` presence-coincidence a formal statement with scope, not just a mapping.
- Wire the Q-enriched relevance into the Laplacian/MLD computation (currently only the value carrier is Q; the sheaf-Laplacian consumer is not yet built here).
