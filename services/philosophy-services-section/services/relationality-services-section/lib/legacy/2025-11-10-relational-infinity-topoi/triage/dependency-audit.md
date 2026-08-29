# Dependency-graph audit — triage pass

Subtheory: `relational-infinity-topoi/triage`. Automated audit run by `tools/dependency_audit/audit.py` enforces:

- (a) every bare-slug `depends-on:` entry resolves to a markdown note within this subtheory;
- (b) every relative-path `depends-on:` entry resolves to an existing file on disk (live cross-vault dependency);
- (c) the local-edge graph contains no cycles;
- (d) no note in a non-`references/` directory is an orphan (no inbound or outbound local edges).

Companion validator `tools/relational_infinity_topoi/validate.py` enforces:

- type-directory consistency (every file in `concepts/` declares `type: concept`, every file in `objects/` declares `type: object`, etc.);
- per-kind required relation fields (objects/morphisms require `realizes:`; theorems require `lean:` and `status:`; narratives require `discusses:`; questions require `explores:`; examples require `instantiates:`; references require bibliographic fields);
- every note declares `depends-on:` (use `depends-on: []` for primitives).

Latest run: **51 notes, 103 local edges, 0 cycles, 0 orphans, validation passed.**

## Note count

| Type | Count |
|---|---:|
| concepts | 9 |
| objects | 6 |
| morphisms | 10 |
| theorems | 7 |
| narratives | 4 |
| questions | 5 |
| examples | 3 |
| references | 7 |
| **total** | **51** |

## Cross-vault dependency targets

All cross-vault `depends-on:` entries resolve to live files on disk and are validated automatically. The two sister theories and their on-disk roots:

| Sister theory | On-disk root | Relative prefix from a depth-13 note |
|---|---|---|
| `predication-categories` | `library/theories/humanities/theories/math/theories/categories/theories/predication-categories/` | `../../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/` |
| `relational-calculus` (pilot) | `operations/engineering/triage/library/humanities/theories/math/theories/relational-calculus/` | `../../../../../relational-calculus/` |

### Into `predication-categories` (live, validated)

| Target file | Notes that depend |
|---|---|
| `concepts/knowledge-order.md` | `concepts/cohesive-infinity-topos`, `concepts/modality`, `concepts/heyting-algebra-shadow` |
| `concepts/truth-order.md` | `concepts/cohesive-infinity-topos`, `concepts/heyting-algebra-shadow` |
| `objects/bilattice.md` | `objects/relational-infinity-topos` |
| `objects/predicate-category.md` | `objects/relational-infinity-topos` |
| `morphisms/closure-2-monad.md` | `concepts/kz-comonad`, `morphisms/kz-comonad-G`, `questions/kz-comonad-vs-closure-2-monad` |
| `morphisms/modal-necessity-operator.md` | `morphisms/flat-comonad` |
| `morphisms/modal-possibility-operator.md` | `morphisms/sharp-monad` |
| `_index.md` | `narratives/relation-to-predication-categories` |

### Into `relational-calculus` triage (live, validated)

| Target file | Notes that depend |
|---|---|
| `concepts/cohesive-chain.md` | `concepts/cohesive-infinity-topos`, `morphisms/cohesive-quadruple` |
| `concepts/stratifying.md` | `concepts/ambidexterity`, `concepts/constructibility`, `concepts/exit-infinity-category`, `concepts/latching-matching`, `objects/exit-infinity-category-object`, `objects/stratified-directed-infinity-site` |
| `concepts/generative-closure.md` | `concepts/recursive-realization`, `theorems/recursive-realization-theorem` |
| `theorems/heyting-closure-of-movement-i.md` | `theorems/heyting-closure-shadow` |
| `theorems/filter-induced-reflexive-reconstruction.md` | `theorems/filter-induced-restriction-of-ritm` |
| `_index.md` | `narratives/relation-to-relational-calculus` |

## Slug collision: `ritm`

The slug `ritm` appears both as a concept in the relational-calculus pilot (`relational-calculus/triage/concepts/ritm.md`) and as a typed object here (`objects/ritm.md`). The collision is intentional: same name covers the philosophical concept and its formal type. Inside this subtheory, bare-slug `ritm` in `depends-on:` resolves to the local object; body links to the pilot use explicit relative paths.

## Top load-bearing notes (this subtheory)

By count of inbound `depends-on:` edges within this subtheory:

| Rank | Note | Inbound | Kind |
|---:|---|---:|---|
| 1 | `cohesive-infinity-topos` | 9 | concept |
| 2 | `relational-infinity-topos` | 8 | object |
| 3 | `cohesive-quadruple` | 7 | morphism |
| 4 | `ritm` | 6 | object |
| 5 | `kz-comonad-G` | 5 | morphism |
| 6 | `stratified-directed-infinity-site` | 5 | object |
| 7 | `constructibility` | 4 | concept |

These are the highest-priority notes for the next promotion pass — an error in any of them propagates farthest.

## Lean binding coverage

Every theorem in `theorems/` carries a `lean:` frontmatter field bound to a real declaration in `lean/RelationalInfinityTopoi/Basic.lean`. The Lean declarations are triage stubs (`theorem ... := trivial` against `True`); promotion replaces each right-hand side with a substantive statement. The `lean:` symbol names are stable across the rewrite, so existing markdown bindings continue to resolve.

| Theorem note | Lean symbol |
|---|---|
| `theorems/ritm-existence` | `RelationalInfinityTopoi.ritm_existence` |
| `theorems/sd-ambidexterity` | `RelationalInfinityTopoi.sd_ambidexterity` |
| `theorems/recursive-realization-theorem` | `RelationalInfinityTopoi.recursive_realization` |
| `theorems/verdier-duality-on-sd-site` | `RelationalInfinityTopoi.verdier_duality_on_sd_site` |
| `theorems/heyting-closure-shadow` | `RelationalInfinityTopoi.heyting_closure_shadow` |
| `theorems/rt-self-stabilization` | `RelationalInfinityTopoi.rt_self_stabilization` |
| `theorems/filter-induced-restriction-of-ritm` | `RelationalInfinityTopoi.filter_induced_restriction_of_ritm` |

## Open audit items

1. **Promote at least one Lean binding from stub to substantive.** All `lean:` references currently bind to `True`-valued stubs. Promoting any one to a substantive statement-with-proof unblocks the third triage exit criterion.
2. **Slug-collision policy for `ritm`.** Reaffirm or rename. Current decision: keep the collision.
3. **Body-text vs depends-on consistency.** Several notes link cross-vault notes in body prose without listing them in `depends-on:` — these are *see-also* citations. A second-pass audit should classify each body link as direct / sibling / unrelated.
