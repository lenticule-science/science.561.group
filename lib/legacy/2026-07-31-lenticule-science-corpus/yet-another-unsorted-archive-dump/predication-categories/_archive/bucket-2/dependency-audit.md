# Dependency-graph audit

Notes scanned: **625**.
Dependency edges (resolved): **1979**.

## Cross-ref vs depends-on consistency

Body links classified by their relation to the citing note's `depends-on`:
- *direct*: in `depends-on` (good)
- *descendant*: M's proof depends on N (forward-pointer, dropped)
- *ancestor*: M is a transitive ancestor of N (dependency implicit)
- *sibling*: reachable from a direct dep — usually benign 'see also'
- *unrelated*: none of the above (highest-priority signal)

- **Unrelated body references**: **25 pairs** across 21 notes. Most likely real missing dependencies.
- **Sibling body references**: **341 pairs** across 172 notes. Mostly 'see also' cites — usually benign.
- **Ancestor body references**: **325 pairs** across 146 notes. Lower priority — transitive dependency present.
- `depends-on` lists a note but body never cites it: **809 pairs** across 287 notes.

*Filter context: 1240 unfiltered → 25 unrelated + 341 sibling + 325 ancestor (549 pairs dropped as forward-pointers / informational).*

### Unrelated body references (highest priority)

Body cites a note that's not in `depends-on`, not a descendant, not a transitive ancestor, and not a sibling. Either the note IS a real dependency, OR it's an arbitrary cross-reference.

- `predicate` (descendants=340, kind=concept, status=—): `predication-fiber-algebra`
- `priestley-space` (descendants=249, kind=definition, status=—): `bilattice`, `twist-product`
- `pairwise-stone-space` (descendants=229, kind=definition, status=—): `twist-product`
- `husainov-acyclicity` (descendants=228, kind=concept, status=—): `dual-predication-hyperdoctrine`
- `bitopological-settling-site` (descendants=227, kind=definition, status=—): `anderson-putnam-direct-limit`
- `anderson-putnam-direct-limit` (descendants=132, kind=definition, status=—): `aperiodic-settling`, `four-regime-dichotomy`
- `settling-automorphism-decomposition` (descendants=87, kind=theorem, status=proved): `predicate-generator-exhaustiveness`
- `q-enriched-transfinite-cellular-sheaf` (descendants=58, kind=definition, status=—): `aperiodic-regime-cohomology-via-direct-limit`
- `transfinite-bounded-regime-d-frame-cohomology` (descendants=40, kind=theorem, status=sketch): `mutually-locally-derivable`
- `cech-derived-comparison-on-bitopological-site` (descendants=1, kind=theorem, status=proved): `transfinite-induction-settling`
- `cohomological-framework` (descendants=1, kind=concept, status=—): `anderson-putnam-direct-limit`
- `multi-observer-system-with-rules` (descendants=1, kind=definition, status=—): `distributed-settling-system`
- `benchmark-7-transfinite-induction` (descendants=0, kind=example, status=verified): `verdier-duality-bitopological-site`
- `benchmark-lorentzian-causal-set` (descendants=0, kind=example, status=verified): `benchmark-lawvere-quantale-settling`
- `canonical-step-shift-resolution` (descendants=0, kind=theorem, status=proved): `step-n-meta-stratification`
- `classifying-morphism-is-stack-morphism` (descendants=0, kind=theorem, status=proved): `aperiodic-regime-moduli-classification`, `combinatorial-classification-across-regimes`, `transfinite-bounded-regime-moduli-classification`
- `closure-monad-no-non-trivial-periodic-orbits` (descendants=0, kind=theorem, status=proved): `internal-z2-gauge`
- `meta-moduli-deformation-theory` (descendants=0, kind=theorem, status=sketch): `regime-stratification-non-semicontinuity`
- `object` (descendants=0, kind=concept, status=—): `predicate-object-projection`
- `strict-regime-mld-trivial` (descendants=0, kind=theorem, status=proved): `finite-settling-h0-polynomial-time`
- `subject` (descendants=0, kind=concept, status=—): `predicate-subject-projection`

## Top 20 load-bearing notes (most descendants)

These notes have the most transitive dependents — an error in any of them propagates farthest. Re-check the proofs / definitions are tight.

| Rank | Note | Descendants | Kind | Status |
|---:|---|---:|---|---|
| 1 | `pre-bilattice` | 393 | definition | — |
| 2 | `knowledge-order` | 391 | concept | — |
| 3 | `truth-order` | 391 | concept | — |
| 4 | `negation` | 390 | morphism | — |
| 5 | `bilattice` | 387 | definition | — |
| 6 | `twist-product` | 369 | definition | — |
| 7 | `residuated-lattice` | 366 | definition | — |
| 8 | `entity-set` | 362 | definition | — |
| 9 | `bilattice-homomorphism` | 350 | morphism | — |
| 10 | `predicate-category` | 348 | definition | — |
| 11 | `predication-fiber-algebra` | 347 | definition | — |
| 12 | `predicate-set` | 342 | definition | — |
| 13 | `predicate` | 340 | concept | — |
| 14 | `settling-bound` | 318 | definition | — |
| 15 | `predicate-specialization` | 315 | morphism | — |
| 16 | `predicate-subject-projection` | 315 | morphism | — |
| 17 | `predicate-converse` | 314 | morphism | — |
| 18 | `predicate-object-projection` | 314 | morphism | — |
| 19 | `predication-fiber-functor` | 307 | theorem | proved |
| 20 | `twist-product-right-residual` | 305 | morphism | — |

## Foundation distance

Longest dependency chain from an atomic note (empty `depends-on`) to a leaf: **39** edges.
Average distance: **12.4** edges across 624 notes.

### Top 10 deepest notes (longest distance from atoms)

| Note | Distance |
|---|---:|
| `padovan-deformation-tangent` | 39 |
| `padovan-meta-classification` | 39 |
| `fibonacci-deformation-tangent` | 38 |
| `fibonacci-meta-classification` | 38 |
| `padovan-strong-mld-orbit` | 38 |
| `transfinite-induction-meta-classification` | 37 |
| `fibonacci-strong-mld-orbit` | 37 |
| `transfinite-induction-deformation-tangent` | 37 |
| `social-network-meta-classification` | 36 |
| `social-network-six-functor-tensor` | 36 |

