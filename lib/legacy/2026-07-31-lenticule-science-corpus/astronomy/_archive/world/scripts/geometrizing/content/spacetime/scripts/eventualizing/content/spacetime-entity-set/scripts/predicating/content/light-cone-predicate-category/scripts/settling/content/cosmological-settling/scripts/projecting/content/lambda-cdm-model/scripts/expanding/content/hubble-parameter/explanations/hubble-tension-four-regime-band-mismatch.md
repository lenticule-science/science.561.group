# Plan: the Hubble tension as a cosmic band-mismatch — cosmos's own four-regime descent

## Context

First day with the four regimes (descent stages vs closure-ordinal bands) cleanly
disambiguated; we're reworking the cosmology cells built earlier this session to play with the
new math. The reframe, settled across the last few turns:

- **H₀ is a growth rate** (H = ȧ/a), and the `settlement-spiral`'s Pisot inflation factor λ
  *is* a growth rate. So **H₀ = the local inflation factor of a cosmic settlement at a stage.**
- The Hubble tension is not (only) an H¹ between two settlings of one cell. It is a **band
  mismatch**: the late-time/local pipeline reads the growth rate in cosmos's **strict-finite**
  band (κ<ω, plastic ρ≈1.3247); the early-time/CMB pipeline reads it **propagated to the
  limit** via `flow` in cosmos's **scott-continuous** band (κ=ω, golden φ≈1.618). Comparing a
  κ<ω rate to a κ=ω rate is a category error — a THIRD resolution beside "close the H¹" and
  "new physics," computable from the per-regime Pisot tower. φ vs ρ is where the shelved
  `φ^(1/6)` coincidence gets a *mechanism* (recorded as an open question, not a claim).
- **The observer's own existence selects the band**: being a finite settlement at stage τ_now
  is *why* the local measurement is strict-finite/plastic. First-class object: `observer-stage`.

**The load-bearing correction (user, this turn):** a `cosmic-settlement` *comes from cosmos*,
so by the placement rule it goes **under cosmos**, NOT as a sibling of `collatz-settlement`
under the root `finite-settlement-algebra`. Consequence: **cosmos grows its own full
four-regime descent** (the spine is fractal — every category generated at a stage can
recapitulate the whole tower inside itself). cosmos was generated at the aperiodic-articulation
level; it now re-descends through its **own** cosmic-aperiodic → cosmic-transfinite →
cosmic-scott → cosmic-finite, bottoming out in cosmos's own finite-settlement, where
`cosmic-settlement` lives. The Hubble band-mismatch reads across cosmos's *own* cosmic-finite
(late) vs cosmic-scott (early).

Everything stays in `lab/`. Path anchors:
- `$COSMOS` = `…/aperiodic-articulation-category/cosmogenerating/library/cosmos`
- `$COSMOLOGY` = `$COSMOS/hacking/library/cosmology` (the study/measure side, already built)
- `$ROOTFSA` = the root `…/settling/library/finite-settlement-algebra` (general machinery we
  reuse and that cosmos's descent *instantiates* — we do NOT add cosmic cells here).

## The fractal placement

cosmos re-runs the descent inside itself. cosmic-settlement sits at the bottom of **cosmos's**
tower. The descent morphisms of cosmos's tower are admitted as `hacking/` stubs in the first
slice (honest: we assert the fractal recapitulation, we don't re-derive the whole spine).

```
$COSMOS/                                  cosmos (cosmic-aperiodic: the generated totality)
  cosmic-predicating/        (hacking/ stub — cosmos's transfinite descent morphism)
    …/cosmic-positing/       (hacking/ stub — cosmos's scott descent morphism)
      …/cosmic-settling/     (hacking/ stub — cosmos's finite descent morphism)
        …/cosmic-finite-settlement-algebra/
          …/settlement/library/cosmic-settlement/   ← THE settlement instance
```

`cosmic-settlement` mirrors `collatz-settlement`'s structure (frontmatter
realizes/depends-on/derives-from; `docs/dev/{notes,theorems,journal}`) but lives in **cosmos's
own tower**, citing the root machinery (`settlement`, `settling-endofunctor`, `closure-ordinal`,
`settlement-spiral`) as the general types it instantiates. The collatz relationship is recorded
as a **cross-tower analogy** (same construction, different tower; root-from-below vs
cosmos-from-above) — a reciprocal one-line note in each, not a same-folder sibling claim.

## The four cosmic regimes, read as cosmic epochs (user: map all four)

A named tower under cosmos, each band a regime object mapped to a cosmic epoch. These epoch
readings are **speculative and heavily `hacking/`-flagged** — physical interpretations we
cannot yet defend, recorded to be played with, not asserted:
- **cosmic-aperiodic** (κ≥ω₁, →2) — cosmos as generated totality: beyond the observable
  horizon, the future not-yet-articulated, the whole that "needs the outside." Where
  `cosmogenerating` deposits new world.
- **cosmic-transfinite** (ω<κ<ω₁, tribonacci) — deep/large-scale structure: the
  vocabulary-extending epoch (structure formation, the matter→Λ transition). Reading most
  tentative.
- **cosmic-scott** (κ=ω, golden φ) — the early universe via the CMB: the κ=ω directed-sup
  "join over all evidence," settled then and **propagated forward** by `flow`. Early-time H₀
  lives here.
- **cosmic-finite** (κ<ω, plastic ρ) — the local now: the observer's directly-counted
  neighborhood (distance ladder). Late-time H₀ lives here.

Each regime gets its own epoch-reading note with the `hacking/`/open-question flag explicit.

## Cells to write / rewrite

**Settlement-instance side (under cosmos's tower):**
- `cosmic-settlement` (mirrors `collatz-settlement`): expansion history as a settling-endofunctor
  orbit; H₀ = its `settlement-spiral` λ; read in two of cosmos's bands. `depends-on:
  [settlement, settling-endofunctor, cosmic-increment-sequence, closure-ordinal,
  settlement-spiral]`. `hacking/`: scale-factor-history = orbit is asserted (not derived from
  Friedmann); no `scripts/` yet.
- `cosmic-increment-sequence` (mirrors `collatz-increment-sequence`) under cosmos's tower's
  increment-sequence position, or cite root `redshift-reindexing` — decide while writing.
- `cosmic-finite` regime object (+ the cosmic-predicating/positing/settling `hacking/` stubs and
  cosmic-transfinite/aperiodic regime stubs).

**Study/measure side (under `$COSMOLOGY/library/`):**
- `observable/library/hubble-constant` — NEW. H₀ as growth rate (λ of the cosmic settlement),
  sibling to existing `hubble-parameter`. Two band-readings of one spiral.
- `observer-stage` — NEW. Finite observer ⟹ cosmic-finite band for local measurement.
- `hubble-tension` — REWRITTEN in place. Lead: band-mismatch (the two pipelines are observers
  in a `multi-observer-system`; no `calibration-link` glues them across bands; cite
  `settling-cohomology` for the H¹ that is only well-typed *within* a band). State all three
  resolutions (close-H¹ / new-physics-RFS / band-mismatch).
- Light cross-link amendments: `flow` (the early→now propagation into cosmic-scott),
  `cosmology.md` library listing, `lambda-cdm` (the band-blind null that *sees* a tension),
  `reflexive-friedmann-system` (the ρ_g new-physics artifact of refusing the band-mismatch).

## Reuse (confirmed by exploration — cite, don't reinvent)
- `multi-observer-system` (`$ROOTFSA/hacking/library/multi-observer-system`) — the two pipelines
  as observers V(early), V(late); permits disagreement. **Not** `distributed-settlement-system`
  (it asserts convergence — would erase the tension).
- `settling-cohomology` (`$ROOTFSA/hacking/library/settling-cohomology`) — the H¹ the current
  `hubble-tension` hand-waves; cite it. Punchline: H¹ is well-typed only within a band.
- `calibration-link` (`$ROOTFSA/hacking/library/settlement/library/calibration-link`) — the
  early↔late reconciliation morphism (the r_d ladder); its non-existence across bands is the tension.
- `settlement-spiral` — the ρ/φ/τ_trib→2 Pisot tower the whole band-reading rests on.

## Preservation (collatz-mirrored)
Only `hubble-tension` is rewritten. Before rewriting: move current
`$COSMOLOGY/library/hubble-tension/hubble-tension.md` → `…/hubble-tension/docs/dev/notes/`
with an `_index.md` provenance table (carry forward: g(z) peaks at 0.7<z<1.3; H¹ framing
retained as documented alternative, reinterpreted as within-band-only). Two notes:
`phi-sixth-root-numerology.md` (open question: φ vs ρ, and the mod-6 commutating modulus from
collatz vs the sixth-root — flagged not claimed) and `two-stage-both-finite-reading.md` (the
conservative alternative: both pipelines finite at different τ — recorded, not primary).

## Not doing
- No edits to `potential/voidmath/`. Nothing moved out of `lab/`. No cosmic cells added under the
  root `finite-settlement-algebra` (cosmos's tower instantiates it by citation).
- First slice does not fully re-derive cosmos's descent morphisms — they are honest `hacking/`
  stubs.

## Verification
- Link checker over `$COSMOS/**.md` (must stay 0 broken; deep nesting means recompute `..` depths).
- Placement audit: walk each new path against the CLAUDE.md generates-rule — especially
  `cosmos → cosmic-predicating → … → cosmic-settlement` and `cosmos → cosmology` (measure).
- Convention: each morphism/cell carries the frontmatter + matching `.schema.json` per the
  `collatz-settlement` / `commutating` templates.
- Honesty: every asserted step (fractal recapitulation, band assignments, scale-factor=orbit,
  φ^(1/6)) is named in a `hacking/` ledger or an open-question note.

## Build depth (settled: "just what you need, a little in each")

Build the *actual* descent path cosmos→cosmic-settlement — every level (cosmic-predicating,
cosmic-positing, cosmic-settling, cosmic-finite-settlement-algebra) gets a genuine placing
note, not a bare stub — but only as much substance as reaching `cosmic-settlement` honestly
requires. Weight goes to the **cosmic-finite floor** + **`cosmic-settlement`** (full cells with
schema, mirroring `collatz-settlement`); the upper descent morphisms get real notes with
`hacking/` where the spine-derivation would otherwise have to be reproved. All four regime
objects exist (with epoch readings); `cosmic-finite` and `cosmic-scott` are fleshed out because
the band-mismatch needs them, `cosmic-transfinite`/`cosmic-aperiodic` get lighter notes.
