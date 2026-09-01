---
name: triage
description: "Subtheory typing the cohesive ∞-topos, RITM (relational infinity-topos modality), and the stratified directed ∞-site as predication-categorical objects: cohesive quadruple, KZ-comonadic flow, latching/matching ambidexterity, recursive realization, and the Heyting-algebra shadow of the four cohesive functors."
component-of: categories
status: triage
---

The categorical study of the **relational ∞-topos** — a cohesive ∞-topos equipped with the four-functor adjoint quadruple

$$\Pi^{\to} \;\dashv\; \Box_r \;\dashv\; \Diamond_l \;\dashv\; \nabla^{\leftarrow}$$

interpreted as the *Relational Infinity-Topos Modality* (RITM), together with its stratified directed refinement (the SD ∞-site) on which latching/matching neighborhoods produce a constructible/ambidexterity calculus.

This subtheory imports three near-overlapping drafts from `from-sloppyresearch` and synthesizes them into a single typed structure that conforms to predication-categories' note-shape (concepts / objects / morphisms / theorems / narratives / questions / examples / references). The drafts are three attempts at the same theory: see the [synthesis report](synthesis-report.md) for which constructs survived, where the drafts disagree, and which disagreements are recorded as [questions](questions/).

## Position in the program

This is the **geometric layer** of the relational program. It sits above:

- [Predication categories](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/_index.md) — the bilattice-hyperdoctrine layer, source of the [closure 2-monad](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md), [predication settling](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md), and the [knowledge-order](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) / [truth-order](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/truth-order.md) bilattice valuation. The ∞-categorical setting here generalizes the 1-categorical settling-on-a-bitopological-site picture there.
- [Relational calculus pilot](../../../../relational-calculus/triage/_index.md) — the philosophical-narrative layer that *names* the cohesive quadruple, [RITM](../../../../relational-calculus/triage/concepts/ritm.md), [Flow](../../../../relational-calculus/triage/concepts/flow.md), and [Stratifying](../../../../relational-calculus/triage/concepts/stratifying.md), but does not type them as objects with formal frontmatter.

What is added here: typed objects (`relational-infinity-topos`, `ritm`, `stratified-directed-infinity-site`, `exit-infinity-category`), typed morphisms (the four cohesive functors, the [KZ comonad](morphisms/kz-comonad-G.md) $G$, the [latching](morphisms/latching-functor.md)/[matching](morphisms/matching-functor.md) functors, the [ambidexterity comparison](morphisms/ambidexterity-comparison.md)), and theorems with `depends-on:` chains terminating in either predication-categories' or the relational-calculus pilot's existing notes.

## Status — triage

This is **triage-status** material. Frontmatter conforms to the predication-categories conventions (`type:`, `class:`, `symbol:`, `depends-on:`, `status:`), but `status:` is `sketch` on every theorem. No theorem here is `proved`. The Lean project compiles a stub module declaring the central signatures; every markdown theorem is bound by a `lean:` field to a real declaration in `lean/RelationalInfinityTopoi/Basic.lean`, but those declarations are stubs (`:= trivial` against `True`). Promotion out of triage requires:

1. Fixing the [presheaf-vs-CartSp base question](questions/presheaf-vs-cartsp-base.md) — the three drafts disagree on the cohesive site.
2. Fixing the [cohesive-quadruple-notation question](questions/cohesive-quadruple-notation.md) — three notations are in play.
3. At least one theorem promoted from `sketch` to `draft` with a substantive (non-stub) Lean witness.
4. A second pass of [dependency-audit](dependency-audit.md) with zero unresolved cross-vault links.

## Layout

Standard predication-categories shape:

- `concepts/` — semantic anchors that recur (cohesive ∞-topos, modality, KZ-comonad, ambidexterity, constructibility, exit ∞-category, recursive realization, latching/matching).
- `objects/` — typed structures (the relational ∞-topos itself, RITM, the stratified directed ∞-site, the exit ∞-category as object, SD-constructible stack, field-of-existence).
- `morphisms/` — the cohesive quadruple's four functors, the [KZ comonad](morphisms/kz-comonad-G.md), latching/matching functors, ambidexterity comparison, Verdier-duality functor.
- `theorems/` — RITM existence, SD-ambidexterity, recursive-realization, Verdier duality on the SD site, the [Heyting-closure shadow](theorems/heyting-closure-shadow.md), RT self-stabilization, and filter-induced restriction of RITM.
- `narratives/` — the synthesis-of-three-drafts story, position vs predication-categories, position vs relational-calculus, the three-divergent-models comparison.
- `questions/` — the four divergences carried over from the source drafts plus the KZ-vs-closure-2-monad relationship.
- `examples/` — the minimal presheaf cell $\mathrm{PSh}(\{0 \to 1\})$, the exit category of a stratified space, the relational cell.
- `references/` — Lawvere 1986, Schreiber 2013, Riehl–Verity 2018, Lurie HTT 2009, Ayala–Francis–Rozenblyum 2015, Kock on KZ-monads, Shulman on cohesive HoTT.
- `lean/` — Lake project (`leanprover/lean4:v4.30.0-rc2`), root module declaring the central signatures.
- `tools/` — Python package with link registry, structural validator, and dependency audit.

Frontmatter conventions follow [predication-categories](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/_index.md): every note declares `type` (matching its directory) and `class`; every non-reference note declares a non-empty `depends-on:` (every concept/object/morphism/theorem/narrative/question/example must point at least one dependency, local slug or live cross-vault relative path; bibliographic references are exempt); every object/morphism additionally declares `realizes:` and (where applicable) `symbol`; every theorem additionally declares `status:` and `lean:`; every reference declares `authors`, `year`, `title`, `venue`.

## Convention for cross-vault references

`depends-on:` entries that resolve outside this subtheory take the form of relative paths into one of two live sister theories on disk:

- [predication-categories](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/_index.md) at `library/theories/humanities/theories/math/theories/categories/theories/predication-categories/`. From a note in `concepts/`/`objects/`/`morphisms/`/`narratives/`/`questions/` (depth 13 from repo root), the relative prefix is `../../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/...`.
- [relational-calculus pilot](../../../../relational-calculus/triage/_index.md) at `operations/engineering/triage/library/humanities/theories/math/theories/relational-calculus/`. From a note in `concepts/` etc., the prefix is `../../../../../relational-calculus/triage/...`.

Both prefixes are validated as live filesystem paths by `tools/dependency_audit/audit.py`. The audit additionally enforces no cycles and no orphans (notes lacking inbound and outbound local edges, references/ exempted).
