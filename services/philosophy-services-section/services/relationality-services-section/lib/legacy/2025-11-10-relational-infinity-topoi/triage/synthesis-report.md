# Synthesis Report — three drafts into one subtheory

Records what was synthesized from the source dump, how the drafts were absorbed, where they diverge, and how those divergences are surfaced in the resulting subtheory.

## Source bundle

Three drafts at `operations/engineering/triage/library/triage/from-sloppyresearch/content/mathematics/infinity-topos/` (deleted at end of synthesis; the parent `mathematics/` directory was the sole holder of `infinity-topos/` and held no other content, so the empty parent was removed with the children — the absence of `mathematics/` after this pass is intentional and not the deletion of unrelated material):

| Draft | Lines | Bytes | Notation for the cohesive quadruple | Primary contribution |
|---|---:|---:|---|---|
| `constructing-relational-infinity-topoi/` | 1623 | ~58 000 | `Shape ⊣ Flat ⊣ Sharp ⊣ Crisp` | cohesive ∞-topos, RITM, SD ∞-site, SD-ambidexterity |
| `relational-infinity-topos-modality/` | 384 | ~15 500 | `Π → ⊣ □ ⊣ ◇ ⊣ ∇ ←` | modal reading, RT-equivalence, $R$ as decomposable reflexive operator |
| `stratified-directed-infinity-topos-geometry/` | 363 | ~14 500 | `Σ ⊣ ▸ ⊣ Π` (three-functor + Exit) | field of existence, recursive realization on SD site |
| **source total** | **2370** | **~88 000** | | |

The three drafts are independent re-derivations of overlapping content, with deliberately different notations, base sites, and emphasis. Bulk-copying any one would have privileged a single notation; bulk-merging would have produced contradictions in the frontmatter. Both rejected.

## Output bundle

| Layer | Files | Bytes |
|---|---:|---:|
| concepts/ | 9 | ~22 000 |
| objects/ | 6 | ~16 000 |
| morphisms/ | 10 | ~17 500 |
| theorems/ | 7 | ~14 500 |
| narratives/ | 4 | ~13 000 |
| questions/ | 5 | ~10 500 |
| examples/ | 3 | ~6 000 |
| references/ | 7 | ~3 500 |
| `_index.md`, `synthesis-report.md`, `dependency-audit.md` | 3 | ~22 000 |
| `lean/` (Lake project + root module) | 4 | ~7 000 |
| `tools/` (Python package, validator, dep-audit) | 12 | ~13 500 |
| `research.toml`, `references.bib`, `tools/build/`, scaffolds | 6 | ~3 500 |
| **output total** | **76** | **~149 000** |

Source-to-output ratio ~1 : 1.7. The expansion is frontmatter (every note carries 6–10 typed fields), per-note `depends-on:` graph (103 local edges), per-theorem Lean binding (7 stubs), per-divergence question file (5 files), and the cross-vault dependency-audit infrastructure — none of which existed in the source drafts.

Running total of repository bytes added over the synthesis (source dump removed at the end):
- start: 0 bytes in this subtheory; ~88 000 source bytes elsewhere.
- after synthesis: ~149 000 bytes in this subtheory; 0 source bytes (deleted).
- net: +149 000 bytes in subtheory; −88 000 bytes elsewhere; total +61 000 bytes.

## Synthesis decisions

### One subtheory, not three

All three drafts target the same content: the cohesive ∞-topos with the four cohesive functors, the modal reading (RITM), and the stratified-directed refinement. Absorbed as **one subtheory**. Differences surfaced as questions, not as separate sub-subtheories.

### Notation: pick one per slot, record the alternatives

Primary notation throughout `objects/`, `morphisms/`, and `theorems/`: the **Lawvere–Schreiber form**

$$\Pi^{\to} \;\dashv\; \Box_r \;\dashv\; \Diamond_l \;\dashv\; \nabla^{\leftarrow}$$

— matching the [relational-calculus pilot](../../../../relational-calculus/triage/concepts/ritm.md). Alternatives recorded:

- Four-name English form `Shape ⊣ Flat ⊣ Sharp ⊣ Crisp` mentioned at first use in [`morphisms/cohesive-quadruple.md`](morphisms/cohesive-quadruple.md).
- Three-functor `Σ ⊣ ▸ ⊣ Π` form (draft 3) recorded in [cohesive-quadruple-notation](questions/cohesive-quadruple-notation.md).
- Modal-only `□ / ◇` (draft 2) used in the *modal reading* of RITM ([`objects/ritm.md`](objects/ritm.md)).

### Each note rewritten

No source paragraph survives verbatim. Every note written from scratch with predication-categories frontmatter (`type`, `class`, `symbol`, `depends-on`, `status`, optional `lean`/`realizes`/`closes`/`discusses`/`explores`/`instantiates`). Drafts are substrate; notes are not transcripts.

## Per-construct typing decisions

Every construct surfaced from the source drafts received an explicit type, kind class, and source-draft attribution. Many-to-many: most slugs draw substance from two or three drafts; the *primary* draft is the one whose scaffold structure was kept.

### concepts/

| Slug | `class` | Primary source | Also drawn from | Rationale |
|---|---|---|---|---|
| `cohesive-infinity-topos` | `topos` | draft 1 | drafts 2, 3 | central object as concept (the *kind* of topos); distinct typed object follows in objects/ |
| `modality` | `modal-operator` | draft 2 | draft 1 | reading of the quadruple as a modal frame; distinct concept from each individual modality |
| `kz-comonad` | `2-comonad` | draft 2 | — | KZ structure as concept (the property); morphism `kz-comonad-G` is the typed instance |
| `ambidexterity` | `limit-colimit-property` | draft 1 | draft 3 | property concept; theorem `sd-ambidexterity` is the assertion that it holds |
| `constructibility` | `well-formedness` | draft 1 | draft 3 | concept underlying the SD-constructible stack |
| `exit-infinity-category` | `indexing-infinity-category` | draft 3 | — | concept of the exit ∞-cat; typed object `exit-infinity-category-object` is its instance for a specific stratified space |
| `recursive-realization` | `fixed-point-construction` | draft 3 | draft 2 | concept distinct from the theorem `recursive-realization-theorem` |
| `latching-matching` | `neighborhood-pair` | draft 1 | — | the *pair* as a concept; functors `latching-functor`/`matching-functor` are the typed instances |
| `heyting-algebra-shadow` | `algebraic-shadow` | draft 2 | — | the algebraic image of the cohesive quadruple; the theorem about it is `heyting-closure-shadow` |

### objects/

| Slug | `class` | Primary source | Realizes | Rationale |
|---|---|---|---|---|
| `relational-infinity-topos` | `topos` | draft 1 | `cohesive-infinity-topos`, `knowledge-order`, `truth-order` | the central typed object; carries the bilattice valuation |
| `ritm` | `modality` | draft 2 | `modality`, `cohesive-infinity-topos` | the typed modality as object; intentional slug collision with relational-calculus's concept `ritm` (philosophical version) |
| `stratified-directed-infinity-site` | `site` | draft 1 | `stratifying`, `exit-infinity-category` | the SD ∞-site as a typed site object |
| `exit-infinity-category-object` | `indexing-category` | draft 3 | `exit-infinity-category` | instance of the concept for a given stratified space |
| `sd-constructible-stack` | `stack` | draft 1 | `constructibility` | the constructible stack on the SD site |
| `field-of-existence` | `substack` | draft 3 | `recursive-realization` | the substack carved out by RITM-fixed elements |

### morphisms/

| Slug | `class` | Primary source | Realizes | Rationale |
|---|---|---|---|---|
| `cohesive-quadruple` | `adjoint-quadruple` | draft 1 | `cohesive-infinity-topos` | the four-functor adjunction as one morphism object |
| `shape-functor` | `functor` | draft 1 | `cohesive-infinity-topos` | $\Pi^{\to}$ |
| `flat-comonad` | `idempotent-comonad` | draft 1 | `modality` | $\Box_r$ |
| `sharp-monad` | `idempotent-monad` | draft 1 | `modality` | $\Diamond_l$ |
| `crisp-functor` | `functor` | draft 1 | `cohesive-infinity-topos` | $\nabla^{\leftarrow}$ |
| `kz-comonad-G` | `2-comonad` | draft 2 | `kz-comonad` | $G$, the flow operator |
| `latching-functor` | `functor` | draft 1 | `latching-matching` | $L_i$ |
| `matching-functor` | `functor` | draft 1 | `latching-matching` | $M_i$ |
| `ambidexterity-comparison` | `natural-transformation` | draft 1 | `ambidexterity`, `latching-matching` | the comparison `Nm` whose inversion is ambidexterity |
| `verdier-duality-functor` | `autoequivalence` | draft 1 | `ambidexterity`, `constructibility` | $\mathbb{D}$ on the SD site |

### theorems/

| Slug | `class` | Primary source | `status` | `lean` binding |
|---|---|---|---|---|
| `ritm-existence` | `existence` | draft 2 | sketch | `RelationalInfinityTopoi.ritm_existence` |
| `sd-ambidexterity` | `equivalence` | draft 1 | sketch | `RelationalInfinityTopoi.sd_ambidexterity` |
| `recursive-realization-theorem` | `fixed-point` | draft 3 | sketch | `RelationalInfinityTopoi.recursive_realization` |
| `verdier-duality-on-sd-site` | `autoequivalence` | draft 1 | sketch | `RelationalInfinityTopoi.verdier_duality_on_sd_site` |
| `heyting-closure-shadow` | `shadow` | draft 2 | sketch | `RelationalInfinityTopoi.heyting_closure_shadow` |
| `rt-self-stabilization` | `reflectivity` | draft 2 | sketch | `RelationalInfinityTopoi.rt_self_stabilization` |
| `filter-induced-restriction-of-ritm` | `restriction` | draft 3 | sketch | `RelationalInfinityTopoi.filter_induced_restriction_of_ritm` |

### narratives, questions, examples, references

- 4 narratives: synthesis-of-three-drafts, position vs predication-categories, position vs relational-calculus, three-divergent-models comparison.
- 5 questions: the four substantive divergences in the source drafts plus the KZ-vs-closure-2-monad relationship to predication-categories.
- 3 examples: minimal-presheaf-cell, exit-category-of-stratified-space, relational-cell-psh-arrow.
- 7 references: Lawvere 1986, Schreiber 2013, Lurie HTT 2009, Ayala–Francis–Rozenblyum 2015, Kock 1995, Shulman cohesive HoTT, Zöberlein 1976.

## Cross-vault dependency additions

Synthesis added 21 cross-vault `depends-on:` edges: 8 into the live `library/.../predication-categories/` tree and 13 into `operations/.../relational-calculus/triage/`. All are validated as live filesystem paths by `tools/dependency_audit/audit.py`.

### Into `predication-categories` (live)

| Target | Inbound from this subtheory |
|---|---|
| `concepts/knowledge-order` | `cohesive-infinity-topos`, `modality`, `heyting-algebra-shadow` |
| `concepts/truth-order` | `cohesive-infinity-topos`, `heyting-algebra-shadow` |
| `objects/bilattice` | `relational-infinity-topos` |
| `objects/predicate-category` | `relational-infinity-topos` |
| `morphisms/closure-2-monad` | `kz-comonad` (concept), `kz-comonad-G` (morphism), `kz-comonad-vs-closure-2-monad` (question) |
| `morphisms/modal-necessity-operator` | `flat-comonad` |
| `morphisms/modal-possibility-operator` | `sharp-monad` |
| `_index` (chapter root) | `relation-to-predication-categories` (narrative) |

### Into `relational-calculus` triage (live)

| Target | Inbound from this subtheory |
|---|---|
| `concepts/cohesive-chain` | `cohesive-infinity-topos`, `cohesive-quadruple` |
| `concepts/stratifying` | `ambidexterity`, `constructibility`, `exit-infinity-category`, `latching-matching`, `exit-infinity-category-object`, `stratified-directed-infinity-site` |
| `concepts/generative-closure` | `recursive-realization`, `recursive-realization-theorem` |
| `theorems/heyting-closure-of-movement-i` | `heyting-closure-shadow` |
| `theorems/filter-induced-reflexive-reconstruction` | `filter-induced-restriction-of-ritm` |
| `_index` | `relation-to-relational-calculus` (narrative) |

### Reverse direction

This pass adds no edges *out of* predication-categories or relational-calculus *into* this subtheory; reciprocation is left to a later pass once theorems here are promoted from `sketch`.

## Divergences as questions

Where the drafts disagree on substance — not just notation — the disagreement is recorded as a question, not silently resolved:

| Disagreement | Question |
|---|---|
| `PSh({0 → 1})` vs `PSh(CartSp)` as the cohesive base | [presheaf-vs-cartsp-base](questions/presheaf-vs-cartsp-base.md) |
| Three-functor (Σ⊣▸⊣Π) vs four-functor (Π⊣□⊣◇⊣∇) cohesion | [cohesive-quadruple-notation](questions/cohesive-quadruple-notation.md) |
| Ambidexterity for SD-constructible diagrams vs for the field of existence | [ambidexterity-scope](questions/ambidexterity-scope.md) |
| Existence-as-truncation vs existence-as-RT-equivalence | [existence-as-truncation-vs-rt-equivalence](questions/existence-as-truncation-vs-rt-equivalence.md) |
| RITM's KZ comonad $G$ vs predication-categories' [closure 2-monad](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) | [kz-comonad-vs-closure-2-monad](questions/kz-comonad-vs-closure-2-monad.md) |

These five are the agenda for the next pass.

## What is *not* absorbed (and why)

- **Philosophical-narrative material on relationlessness, reflex, articulation.** Already lives in the [relational-calculus pilot](../../../../relational-calculus/triage/_index.md) under `concepts/`. Duplication rejected; a `narratives/relation-to-relational-calculus.md` cross-references instead.
- **Algebraic proof attempts at the Heyting-algebra closure of Movement I.** Already lives at [`heyting-closure-of-movement-i`](../../../../relational-calculus/triage/theorems/heyting-closure-of-movement-i.md). The geometric *shadow* of that theorem — what the four cohesive functors do to a Heyting algebra — is here as [`heyting-closure-shadow`](theorems/heyting-closure-shadow.md). Algebraic statement not duplicated.
- **Sketched derivation of a typed lambda calculus $\lambda_R$ (draft 1, ~120 lines).** Belongs to a future *type-theoretic* subtheory; out of scope here. Not absorbed; deleted with the source dump.
- **Several proof outlines using the `Σ ⊣ ▸ ⊣ Π` three-functor framing (draft 3, ~80 lines).** The three-functor framing is recorded as the question `cohesive-quadruple-notation`; the proof outlines themselves were not absorbed because they assumed a notation that this subtheory does not adopt. To be revisited if/when the question is resolved in favor of three-functor cohesion.

## Lean project

Lake project at [`lean/`](lean/) compiles a stub module declaring central signatures (`RelationalInfinityTopos`, `Cohesive`, `RITM`, `KZComonad`, `Constructible`, `SDSite`) and seven `theorem ... := trivial` stubs against `True`. Each markdown theorem binds to its stub via the `lean:` frontmatter field. Toolchain pinned to `leanprover/lean4:v4.30.0-rc2` matching predication-categories. Promotion replaces the stubs with substantive statements; the binding symbol names are stable.

## Python toolkit

Package at [`tools/relational_infinity_topoi/`](tools/relational_infinity_topoi/): link registry mirroring predication-categories' `link.py` shape; structural validator (`validate.py`) enforcing type-directory consistency and per-kind required relation fields; forward-scaffold subpackages (`primitives/`, `theorems/`, `examples/`, `data/`) empty in triage and populated on promotion. Companion package `tools/dependency_audit/` runs the cross-vault dependency audit, cycle detection, and orphan detection. Latest validator run: 51 notes, 103 local edges, 0 cycles, 0 orphans, validation passed.
