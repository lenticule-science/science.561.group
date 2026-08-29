---
title: lab/hacking cleanup against the four-regime grammar
date: 2026-05-28
established:
  - second-tier generators being/doing/working/governing live as hacking-admitted morphisms parallel to the primitives, with placeholder carrier objects
  - tradition-bucket clusters dissolve to flat concept-siblings (Lakota-style placement)
  - knowledge-domain clusters with internal structure (sciences, technology, games) park as cohesive sub-libraries under predicate-category/hacking/library/discourse-domain-locus/library/
  - relationlessness sits as a library term at lab/hacking root, sibling of articulating
  - lab/hacking/articulating now carries its own articulating.md + schema (lifted from the duplicate copy under relationlessness/)
---

## What this cleanup did

The lab/hacking tree was carrying a large body of philosophical/sociological/governance content (~150+ concepts) placed before the four-regime grammar stabilized on 2026-05-27. The placements implied a flat phenomenological taxonomy (being → doing → working → governing as a CHAIN) that contradicts the corrected grammar where these four are PARALLEL second-tier generators (each downstream of one of the primitive opener morphisms articulating/predicating/positing/settling).

This session re-routed the content into landing zones inside the correct regime categories, using `hacking/library/<regime>-locus/<morphism>/library/<concept>` as the honest placement pattern where `<regime>-locus` is the placeholder carrier-object the second-tier generator lives under (not yet derived).

## Second-tier generators

| Morphism | Codomain regime | Landing zone under |
|---|---|---|
| being | aperiodic-articulation-category | aperiodic-articulation-category/hacking/library/being-locus/being/library/ |
| doing | transfinite-predication-category | transfinite-predication-category/hacking/library/doing-locus/doing/library/ |
| working | scott-continuous-posit-category | scott-continuous-posit-category/hacking/library/working-locus/working/library/ |
| governing | finite-settlement-algebra | finite-settlement-algebra/hacking/library/governing-locus/governing/library/ |

## Placement principles confirmed

- **Concept-level placement, not tradition-bucketing.** The Lakota cosmology content at aperiodic-articulation-category/hacking/library/{heyokha, iyokheya, mitakuye-oyasin, ...} sits as flat siblings, not nested under indigenous/lakota/. Same principle now applies to philosophy-tradition clusters: buddhist/, ontological-turn/, caribbean/, process-philosophy/ were dissolved into flat concepts (animism, multinaturalism, perspectivism, actual-occasion, etc. as siblings).

- **Cohesive knowledge-domain libraries preserve internal structure.** Sciences (math, cosmology, biology, medicine, chinese-medicine, pharmacology, astronomy) and the equivalent for technology and games have legitimate nested structure (algebra is a subfield of math, not its sibling). These park as `predicate-category/hacking/library/discourse-domain-locus/library/<domain>/`, preserving internal trees.

- **Never lose content.** Byte-identical duplicates can be deleted (preserved in git history). Differing duplicates are preserved as docs/dev/scraps/ entries.

## Done this session

| Task | Result |
|---|---|
| Establish 4 landing zones | Created `hacking/library/<regime>-locus/<morphism>/library/` under each regime category |
| Re-route being/library/ flat terms (86 → reclassified) | 7 settlement-regime to governing-locus; 3 predicating-regime to doing-locus; ~75 articulation-regime to being-locus; 7 sciences to discourse-domain-locus; tradition clusters dissolved |
| Re-route being/doing/library/ (27 → doing-locus) | community subtree merged into governing-locus/community/ preserving 18 sub-concepts; attribution-theory de-duplicated |
| Re-route being/doing/working/library/ (4 → working-locus) | education, norm, ordinal-society, work |
| Re-route being/doing/working/governing/library/ (5 → governing-locus) | governance, ideology, politics, power, risk (each with their internal sub-concept trees preserved) |
| Audit deep stale chain: stable-articulation-cell/predicating/... | Renamed and re-routed to canonical position under aperiodic-articulation-cell/library/stable-aperiodic-articulation-cell/ (peer of potential-aperiodic-articulation-cell); 11k internal files preserved for per-concept extraction in future sessions |
| Park games-extra, tech-extra, references | Routed under predicate-category/hacking/library/{discourse-domain-locus/library/{games, technology}, references} |
| Lift relationlessness/articulating fiber | articulating.md + schema + scripts + docs lifted from lab/hacking/library/relationlessness/articulating/ to lab/hacking/articulating/ |

## Final lab/hacking shape

```
lab/hacking/
├── articulating/                          (now has its own fiber)
│   ├── articulating.md
│   ├── articulating.schema.json
│   ├── scripts/
│   ├── docs/
│   └── library/
│       └── aperiodic-articulation-category/
│           ├── hacking/library/being-locus/being/library/   (103 concepts)
│           └── library/aperiodic-articulation-cell/library/
│               ├── potential-aperiodic-articulation-cell/   (canonical chain)
│               │   └── predicating/library/
│               │       └── transfinite-predication-category/
│               │           ├── hacking/library/
│               │           │   ├── doing-locus/doing/library/
│               │           │   └── predicate-category/
│               │           │       ├── hacking/library/
│               │           │       │   ├── discourse-domain-locus/library/
│               │           │       │   │   ├── math/ cosmology/ biology/
│               │           │       │   │   ├── medicine/ chinese-medicine/ pharmacology/
│               │           │       │   │   ├── astronomy/ technology/ games/
│               │           │       │   └── references/
│               │           │       └── ...
│               │           └── library/transfinite-predication-cell/...
│               │               └── positing/library/scott-continuous-posit-category/
│               │                   ├── hacking/library/working-locus/working/library/
│               │                   └── library/scott-continuous-posit-cell/...
│               │                       └── settling/library/finite-settlement-algebra/
│               │                           └── hacking/library/governing-locus/governing/library/
│               └── stable-aperiodic-articulation-cell/      (renamed + re-routed; 11k stale files for per-concept extraction)
└── library/
    └── relationlessness/                  (articulating's domain, root-level term)
```

## Open follow-up

- Per-concept extraction from `active-aperiodic-articulation-cell/predicating/hacking/library/predication-cell-set/...` (11k files of pre-stabilization implementation; many likely dupes of canonical chain content)
- Dissolution of the `community/{18 nested sub-concepts}` cluster at governing-locus — these sub-concepts (kinship, affinity-group, mutual-aid, etc.) should likely lift to flat siblings per the Lakota-style principle
- The placeholder `<regime>-locus` carrier name awaits derivation of the actual second-tier-generator carrier object
