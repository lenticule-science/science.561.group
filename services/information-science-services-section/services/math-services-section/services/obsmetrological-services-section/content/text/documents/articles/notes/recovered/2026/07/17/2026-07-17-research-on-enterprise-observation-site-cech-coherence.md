---
title: "Research on enterprise observation site and Cech coherence"
date-created: 2026-07-17
issuing-office: requirements-analysis-team
status: analysed-for-revision-4
---

# Research on enterprise observation site and Cech coherence

## Question and pinned evidence

This note analyses the site, valuation, cover, local-section, Cech, and closure
relations needed to answer the independent Revision 3 PQA review at SHA-256
`ac85a5e77aaf636011f9e6dfdb2bff32a9de23955ad819bc7d6b4b48db861e54`.
The reviewed Revision 3 contract remains at SHA-256
`568ebfd84938456f039adef75ba5b96f7416daf21af0f0a14e97a091148e9cb6`.

The configured Obsmetrologia Lean LSP operations were attempted first but are
not exposed in this session's tool registry. The analysis therefore used exact
source inspection, a package-local `#check` harness, and package-local Lake
compilation. The missing LSP does not decide any conclusion below.

The exact source snapshots inspected were:

| Carrier | SHA-256 |
|---|---|
| `Obsmetrologia/Site/Basic.lean` | `086368eb7e5d583d686ec4fb5bc3ccdcbe190c983cbcc6d6422ae3f13ea87ccc` |
| `Obsmetrologia/Site/Claim.lean` | `9da0cdb8e5ff39ab64901434e5f43aac5433199ceed579421b7ddcd33e0e8232` |
| `Obsmetrologia/Site/Topic.lean` | `dd15a44655a572e9bed25af5998f7b1fe447dc40b1d134f577566dbd550c5a51` |
| `Obsmetrologia/Site/Sheaf.lean` | `d5a440c9f3affedec0d411ca15d1e6a881cf5e5af4242ce76a4705b03a2c3d4d` |
| `Obsmetrologia/Site/Section.lean` | `aded2ea11388b9164331573a017baae914a8835118df378cd78bad0b9a239f89` |
| `Obsmetrologia/Site/Intension.lean` | `62dee292f6500bb0755ea7ffb1fc76ea9c750f5238700165d233cc96c1d5f51f` |
| `Obsmetrologia/Cohomology/SettlingCohomologyH1.lean` | `16a573388e1616778050fc8cae155ee58bcf9f5ab8ca5e50203937064efd2780` |
| `Obsmetrologia/Cohomology/CoordinationCohomology.lean` | `2465e0ddf440d6d1aac6471dc5422166823aa7c7d34d3e2f5039f001fd5886b5` |
| `Obsmetrologia/Closure/RuleSystem.lean` | `e360df0dba12f61da2b799a425996dcca4105338de5b0a5c4e45dd799ed936cd` |

The companion harness is
`scripts/CheckEnterpriseObservationSiteCechGrounding.lean`. It contains only
imports and `#check` commands for existing declarations and compiles through
the package-local Lake environment.

## Classification of the needed relations

The statuses below are deliberately distinct:

- **existing theorem** means the exact relation is already proved now;
- **compositionally derivable** means existing definitions and theorems suffice
  to prove it without adding mathematical structure;
- **candidate obligation** means Revision 4 must require the relation at the
  enterprise boundary, with the stated type or an equivalent one; and
- **absent** means the reusable carrier or theorem is not proved and requires
  upstream formalization before Revision 4 may claim to reuse it.

### Site points and fiber-local support

**Existing theorem.** `Claim.SitePoint` is exactly `Site.SiteObj Claim`, hence it
carries a claim `q`, a settling stratum `tau : Nat`, and a clopen support `U`.
`Claim.sitePoint_claim`, `Claim.sitePoint_stratum`, and
`Claim.sitePoint_support` prove all three projections of the named constructor.
`Claim.FiberHom` fixes claim and stratum while ordering support by clopen
inclusion.

**Existing theorem.** A `Claim.Topic` carries `point`, `cover`, and
`covers : Site.Covers point.U cover`. `Topic.cover_is_fiber_local` proves both

```lean
(∀ Ui ∈ cover, Ui ⊑ point.U) ∧ Site.joinList cover = point.U
```

The cover is therefore about the clopen support at one fixed claim and site
stratum. `Site.no_temporal_covers` confirms that changing the stratum is not a
cover refinement. Revision 4 must carry its temporal relation separately; it
must not encode time by varying cover patches.

**Candidate obligation.** Revision 3 already equates site-point claims with the
flat record-cell sequence. Revision 4 must additionally bind their other two
coordinates to the one observation site:

```lean
sitePoint_claims :
  sitePoints.map (fun point => point.q) = predicationCells
sitePoint_strata :
  ∀ point, point ∈ sitePoints → point.tau = siteCover.point.tau
sitePoint_supports :
  ∀ point, point ∈ sitePoints → point.U ⊑ siteCover.point.U
```

These are not implied by equal claim projection. They are the minimal laws that
make the list one observation at one stratum inside one bounded support.

### Valuation, clopen patches, and cover support

**Existing theorem.** `Claim.ValuatedTermReading` binds a term reading to one
valuation and proves truth-firing on that term's direct claim profile through
`supports_profile`. Its cover restrictions preserve the same valuation and
profile support. `coverRestriction_overlap_valuations_agree` proves that the
two restrictions induced by cover members carry equal valuations on their
common clopen restriction.

**Existing theorem.** `ValuatedTermReading.clopenPatch v U` reads a pairwise
Stone clopen against the positive and negative slots of each cell's charge. The
theorems `clopenPatch_join` and `clopenPatch_joinList_true` turn a finite clopen
join into pointwise patch coverage.

**Existing theorem.** `ValuatedTermReading.topicPatchFamily` is the exact bridge
from a topic's fiber-local clopen cover to Boolean cell masks. Its support is

```lean
ValuatedTermReading.clopenPatch R.valuation R.reading.topic.point.U
```

and its patches are the topic cover mapped through `clopenPatch R.valuation`.
Its `covers_support` field proves a *relative* cover: every cell admitted by the
displayed support occurs in a patch.

**Candidate obligation.** An enterprise observation must prove its record cells
belong to the valuation-read observation support:

```lean
recordCells_in_site_support :
  ∀ cell, cell ∈ predicationCells →
    ValuatedTermReading.clopenPatch
      siteCover.valuation siteCover.point.U cell = true
```

Together with the fiber-cover equation and `clopenPatch_joinList_true`, this is
compositionally derivable into the exact coverage readout:

```lean
∀ cell, cell ∈ predicationCells →
  ∃ U, U ∈ siteCover.cover ∧
    ValuatedTermReading.clopenPatch siteCover.valuation U cell = true
```

This links record cells, valuation, clopen support, and cover patches without
requiring every predication cell in the universe to belong to the observation.

### Relative topic cover versus global sheaf cover

**Existing theorem, with a strong precondition.** `topicSheafCover R hfull`
produces a global `Sheaf.Cover` only from

```lean
hfull : ∀ φ,
  ValuatedTermReading.clopenPatch
    R.valuation R.reading.topic.point.U φ = true
```

That hypothesis says the topic support contains every predication cell. It is
not implied by a bounded enterprise observation and must not be silently
postulated merely to obtain `Cech1`, whose cover is global.

**Compositionally derivable.** A relative `PatchFamily` can be totalized without
claiming its bounded support is universal. Add the complementary Boolean patch
`fun φ => !(family.support φ)` to `family.patches`. A case split on the support
bit proves a `Sheaf.Cover`. Mask the canonical valuation cochain to the bounded
support,

```lean
AssocSheaf.restrict family.support
  (Cohomology.identityCochain valuation)
```

and define each local section by restricting that supported section to its
patch. A package-local stdin proof compiled the resulting global cover, Cech
datum, cocycle, and `glue_coboundary` application. This was a proof trial, not a
production carrier.

This totalization has a precise meaning: the complement records that everything
outside the observed support contributes zero to this observation. It does not
pretend that the bounded topic itself is a global topic.

### Local sections, Cech agreement, and gluing

**Existing theorem.** `AssocSheaf.restrict`, `restrict_vanishes`, and
`restrict_comp` provide the actual local-section operation and its support and
composition laws. `Sheaf.separated` and `AssocSheaf.cochain_separated` prove
that global sections are determined by a global cover.

**Existing theorem.** `Cohomology.Cech1` carries a global `Sheaf.Cover` and a
cochain per patch. `Cocycle` is exact overlap agreement; `Coboundary` says all
local sections restrict one global cochain; `glue` constructs that cochain;
`glue_coboundary` and `glue_unique` prove existence and uniqueness for a
cocycle.

**Compositionally derivable.** If every local section is

```lean
AssocSheaf.restrict patch supportedSection
```

then two locals agree wherever both patch masks hold. This proves
`Cohomology.Cocycle` by unfolding `AssocSheaf.restrict`. The existing
`glue_coboundary` then proves gluing. Revision 4 should derive these results
from the named construction rather than accept an arbitrary `Cech1`, a freely
chosen `Cocycle`, and a separately supplied gluing proof.

**Candidate obligation.** The Revision 4 datum must be definitionally equal, or
proved equal, to the totalized restriction datum constructed from the same
valued site cover used by the record cells. Its local-section law is:

```lean
∀ patch, patch ∈ cechDatum.cover.patches →
  cechDatum.local_ patch =
    AssocSheaf.restrict patch
      (AssocSheaf.restrict supportMask
        (Cohomology.identityCochain siteCover.valuation))
```

`Cocycle cechDatum` and
`Coboundary cechDatum (Cohomology.glue cechDatum)` should be derived theorems.
Carrying them as unrelated assumptions would repeat the Revision 3 defect.

### Closure settlement

**Existing theorem.** `ClosureRule.SClosed S valuation` is exactly
`ClosureRule.Tstep S valuation = valuation`. `rule_respecting` proves that every
fired rule's consequent already holds in a closed valuation.
`generated_closure_is_least` proves least-fixed-point content only when the
contract supplies the stronger hypothesis that `clS S seed` is closed.

**Candidate obligation.** The minimal object-level closure relation remains:

```lean
closureRules_cells_observed :
  ∀ rule, rule ∈ closureRules → rule.cell ∈ predicationCells
closureRules_settle_valuation :
  ClosureRule.SClosed closureRules siteCover.valuation
```

Revision 4 may retain these successful Revision 3 laws, expressed through the
named `SClosed` predicate. It must not claim leastness, a generated seed, or
rule completeness without carrying the corresponding seed and fixed-point
hypotheses.

**Absent.** A `ClosureRule.antecedent` is an opaque function
`Valuation → Bool`; the current carrier has no inspectable list of cells on
which an antecedent depends. Therefore “every rule reads only observed cells”
is not proved now and cannot be stated from the current rule structure. If that
stronger locality is required, the closure-rule language needs an upstream
dependency-support carrier.

## The carrier decision

Revision 4 should carry a smaller reusable valued-site-cover carrier, not
`ValuatedTermReading` itself.

`ValuatedTermReading` contains a `TermContext`, a term, an FCA concept, intent
and extent membership, and truth support for the term's direct profile. The
enterprise record encoding supplies none of those term-semantic witnesses.
Inventing them solely to obtain `clopenPatch` and `topicPatchFamily` would move
the same incoherence one layer inward. It would also strengthen Revision 3's
non-bottom record-cell valuation to truth-firing without an accepted reason.

The reusable core is absent as a named carrier. Its candidate upstream type is
exactly:

```lean
structure ValuatedSiteCover where
  point : Claim.SitePoint
  valuation : Valuation
  cover : List Site.Clopen
  covers : Site.Covers point.U cover
```

From these four fields, the existing `clopenPatch_joinList_true` proof yields a
relative patch family with support `clopenPatch valuation point.U`; the
totalization and restriction construction above yields the Cech datum. An
upstream constructor from any `ValuatedTermReading C` to this smaller carrier is
immediate, so term readings retain their richer semantics without making those
semantics mandatory for every enterprise observation.

## Minimal honest Revision 4 object-level contract

The minimal Revision 4 site/Cech tranche is therefore:

1. Retain the exact record partition and flattened record-cell equation from
   Revision 3.
2. Carry one upstream `ValuatedSiteCover`, once that named reusable carrier is
   formalized.
3. Carry site points for the record cells and require exact claim projection,
   one common site stratum, and support inclusion in the valued cover point.
4. Require every record cell to satisfy the valuation-read observation support;
   derive its membership in a cover patch.
5. Construct, rather than freely choose, the totalized `Sheaf.Cover`, bounded
   supported section, local restrictions, and `Cech1` datum.
6. Derive overlap agreement, `Cocycle`, `glue_coboundary`, and uniqueness from
   that construction and the existing theorems.
7. Retain rule-consequent scope and `ClosureRule.SClosed` for the same valuation,
   without claiming a least generated closure unless a seed is added.

This is the smallest carrier that honestly connects record cells, valuation,
site stratum, clopen support, cover patches, local sections, Cech gluing, and
closure settlement. It gives Revision 4 a concrete object-level coherence
boundary while reusing the present Obsmetrologia mathematics.

## Explicit non-claims

This analysis does not prove or authorize Revision 4, production observation
code, a general relative-Cech library, or a new site carrier. It does not claim
transition-level preservation, causal order, duplicate-free causal events,
authorization, evidence-identity stability, nerve connected-component
derivation, H1 cycle-rank correctness, Landauer preservation, or the
value-level converse. Those remain distinct obligations and cannot be inferred
from object-level site and Cech coherence.
