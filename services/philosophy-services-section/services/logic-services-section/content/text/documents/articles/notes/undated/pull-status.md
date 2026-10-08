---
title: "predication-categories pull status"
date-started: 2026-05-28
description: The 469-file predication-categories/ archive was written before the 2026-05-27 four-regime grammar stabilized.
---

# Pull status

The 469-file `predication-categories/` archive was written before the 2026-05-27 four-regime grammar stabilized. Its mathematical content is already substantially aligned with current grammar — concepts like `aperiodic-settling`, `scott-continuous-closure`, `settling-quiescence` directly correspond to the regime-prefixed categories of the stabilized chain. The pull rule is: for each file, decide `$best-spot` in the current chain, `git mv` to `$best-spot/docs/dev/scraps/<old-file>`, then mint NEW directories and markdown notes at `$best-spot` in current canonical language.

## Pulled so far (2026-05-28)

| Source | $best-spot | What was minted |
|---|---|---|
| `concepts/aperiodic-settling.md` | `aperiodic-articulation-category/` | `docs/dev/journal/2026-05-28-aperiodic-regime-derivation.md` |
| `concepts/scott-continuous-closure.md` | `scott-continuous-posit-category/` | `docs/dev/journal/2026-05-28-scott-continuous-regime-derivation.md` |
| `concepts/settling-quiescence.md` | `settling/` | `docs/dev/journal/2026-05-28-settling-quiescence-derivation.md` |
| `concepts/closure-rule.md` | `scott-continuous-posit-category/hacking/library/closure-rule/` | new $thing `closure-rule.md` |
| `objects/four-bilattice.md` | `…/twist-product/library/four-bilattice/` | new $thing `four-bilattice.md` |
| `objects/bilattice.md` | `…/twist-product/library/bilattice/` | new $thing `bilattice.md` |
| `concepts/knowledge-order.md` | `…/bilattice/library/knowledge-order/` | new $thing `knowledge-order.md` |
| `concepts/truth-order.md` | `…/bilattice/library/truth-order/` | new $thing `truth-order.md` |
| `concepts/entity.md` | `transfinite-predication-category/hacking/library/entity/` | new $thing `entity.md` |
| `concepts/subject.md` | `…/hacking/library/subject/` | new $thing `subject.md` |
| `concepts/predicate.md` | `…/hacking/library/predicate/` | new $thing `predicate.md` |
| `concepts/object.md` | `…/hacking/library/object-as-cell-coordinate/` | new $thing `object-as-cell-coordinate.md` |
| `concepts/predication-cell.md` | `…/transfinite-predication-cell/docs/dev/scraps/` | scrap only; canonical-language note pending |
| `morphisms/closure-operator.md` | `…/variety/library/lattice/library/closure-operator/docs/dev/scraps/` | scrap only; existing $thing already covers it |
| `morphisms/settling-morphism.md` | `settling/docs/dev/scraps/` | scrap only; canonical-language note pending |
| `objects/closure-ordinal.md` | `…/finite-settlement-algebra/hacking/library/closure-ordinal/` | new $thing `closure-ordinal.md` |

**~104 files pulled (Round 5 complete: all concepts/objects/morphisms closed). ~365 remaining.**

## Round 5 status (2026-05-28, complete)

All substrate-math archive items now placed. Counts: concepts 0 remaining (was 27), objects 0 remaining (was 57), morphisms 0 remaining (was 20). Total 104 substrate items placed across 5 rounds with substantive notes and kind-appropriate frontmatter.

What remains: 137 theorems, 35 examples, 50 questions, 68 narratives, 45 references, 5 root files, lean/ and tools/ directories.

Round 6 begins on theorems, placing each under its primary object's `docs/dev/theorems/<theorem-name>.md`.



## Second-pass pulls (2026-05-28, continued)

| Source | $best-spot | What was minted |
|---|---|---|
| `objects/predication-cell-set.md` | `transfinite-predication-category/hacking/library/predication-cell-set/` | new $thing |
| `objects/predication-fiber-algebra.md` | `…/hacking/library/predication-fiber-algebra/` | new $thing |
| `objects/predicate-category.md` | `…/hacking/library/predicate-category/` | new $thing |
| `objects/predication-valuation.md` | `…/hacking/library/predication-valuation/` | new $thing |
| `objects/predication-settling.md` | `finite-settlement-algebra/hacking/library/predication-settling/` | new $thing |
| `objects/pre-bilattice.md` | `…/twist-product/library/pre-bilattice/` | new $thing — corrects the variety chain: `lattice → twist-product → pre-bilattice → bilattice → four-bilattice` |
| `morphisms/negation.md` | `…/twist-product/library/bilattice/library/negation/` | new $thing — the operator that closes pre-bilattice to bilattice |
| `concepts/closure-rule-system.md` | `scott-continuous-posit-category/hacking/library/closure-rule-system/` | new $thing |
| `concepts/closure-rule-language.md` | `…/hacking/library/closure-rule-language/` | new $thing |
| `concepts/evidence.md` | `…/twist-product/library/evidence/` | new $thing |

## Third-pass pulls (2026-05-28, continued)

| Source | $best-spot | What was minted |
|---|---|---|
| `concepts/settling-monotonicity.md` | `settling/hacking/library/settling-monotonicity/` | new $thing |
| `concepts/settling-continuity.md` | `settling/hacking/library/settling-continuity/` | new $thing |
| `morphisms/settling-endofunctor.md` | `settling/hacking/library/settling-endofunctor/` | new $thing — the F_U 2-functor that operationally IS settling |
| `objects/settling-bound.md` | `settling/hacking/library/settling-bound/` | new $thing |
| `morphisms/predicate-specialization.md` | `predicate-category/library/predicate-specialization/` | new $thing — 1 of 4 canonical morphism classes |
| `morphisms/predicate-converse.md` | `predicate-category/library/predicate-converse/` | new $thing — 2 of 4 |
| `morphisms/predicate-subject-projection.md` | `predicate-category/library/predicate-subject-projection/` | new $thing — 3 of 4 |
| `morphisms/predicate-object-projection.md` | `predicate-category/library/predicate-object-projection/` | new $thing — 4 of 4; the predicate-category's morphism structure is now fully placed |

## Fourth-pass pulls (2026-05-28, continued)

| Source | $best-spot | What was minted |
|---|---|---|
| `objects/predication-hyperdoctrine.md` | `transfinite-predication-category/hacking/library/predication-hyperdoctrine/` | new $thing — fibration + ≤_k and ≤_t quantifier adjoints |
| `objects/predication-priestley-dual.md` | `finite-settlement-algebra/hacking/library/predication-priestley-dual/` | new $thing — Jung-Rivieccio dual of a predication-settling |
| `objects/predication-settling-category.md` | `finite-settlement-algebra/hacking/library/predication-settling-category/` | new $thing — preorder of settlings (not the moduli 2-category) |
| `objects/increment-sequence.md` | `scott-continuous-posit-category/hacking/library/increment-sequence/` | new $thing — input data driving closure-driven settling |
| `morphisms/closure-2-monad.md` | `settling/hacking/library/closure-2-monad/` | new $thing — fiberwise closure functor |
| `morphisms/conflation.md` | `…/bilattice/library/conflation/` | new $thing — bilattice's other unary; sibling of negation |
| `concepts/adjudication.md` | `transfinite-predication-category/hacking/library/adjudication/` | new $thing — operational name for what FOUR provides |
| `concepts/closure-drivenness.md` | `settling/hacking/library/closure-drivenness/` | new $thing — identifiability condition on settlings |
| `concepts/bilattice-homomorphism-naturality.md` | `predicate-category/library/bilattice-homomorphism-naturality/` | new $thing — Sym(E)-equivariance forbidding entity-identity-sensitivity |
| `concepts/cohomological-framework.md` | `finite-settlement-algebra/hacking/library/cohomological-framework/` | new $thing — four-framework apparatus for cohomology of dualized settlings |

## Fifth-pass pulls (2026-05-28, continued)

| Source | $best-spot | What was minted |
|---|---|---|
| `objects/entity-set.md` | `transfinite-predication-category/hacking/library/entity-set/` | new $thing |
| `objects/predicate-set.md` | `…/hacking/library/predicate-set/` | new $thing |
| `objects/residuated-lattice.md` | `…/variety/library/lattice/library/residuated-lattice/docs/dev/scraps/` | archive-confirmation note (existing $thing body is consistent) |
| `objects/paired-priestley-space.md` | `finite-settlement-algebra/hacking/library/paired-priestley-space/` | new $thing |
| `objects/dual-predication-hyperdoctrine.md` | `…/hacking/library/dual-predication-hyperdoctrine/` | new $thing |
| `morphisms/twist-product-fusion.md` | `…/twist-product/library/twist-product-fusion/` | new $thing |
| `morphisms/twist-product-right-residual.md` | `…/twist-product/library/twist-product-right-residual/` | new $thing |
| `morphisms/modal-necessity-operator.md` | `transfinite-predication-category/hacking/library/modal-necessity-operator/` | new $thing |
| `morphisms/modal-possibility-operator.md` | `…/hacking/library/modal-possibility-operator/` | new $thing |
| `concepts/mutually-locally-derivable.md` | `aperiodic-articulation-category/hacking/library/mutually-locally-derivable/` | new $thing — at articulating tier because MLD is the equivalence for aperiodic-regime settlings |

## Remaining counts by subdir

- `concepts/`: 6 remaining (out of 27)
- `objects/`: 39 remaining (out of 57)
- `morphisms/`: 8 remaining (out of 20)
- `theorems/`: 138 remaining (all)
- `examples/`: 35 remaining (all)
- `questions/`: 50 remaining (all)
- `narratives/`: 68 remaining (all)
- `references/`: 45 remaining (all)
- Plus `lean/`, `tools/`, `_index.md`, `dependency-audit.md`, `references.bib`, `research.toml` — all not yet pulled.

## High-leverage next pulls

The foundational substrate is now broadly in place. Next-tier candidates:

- **Settling machinery**: `concepts/settling-monotonicity.md`, `concepts/settling-continuity.md`, `morphisms/settling-endofunctor.md`, `objects/settling-bound.md`.
- **Closure-driven concepts**: `concepts/closure-drivenness.md`, `concepts/adjudication.md`, `concepts/non-scott-continuous-firing-ordinal.md`.
- **Bilattice machinery**: `morphisms/bilattice-homomorphism.md`, `concepts/bilattice-homomorphism-naturality.md`, `morphisms/conflation.md`, `objects/bilattice-accessibility-relation.md`.
- **Multi-observer / distributed**: `objects/multi-observer-system.md`, `objects/multi-observer-system-with-rules.md`, `objects/distributed-settling-system.md`.
- **Cohomological framework**: `concepts/cohomological-framework.md`, `concepts/cohomological-equivalence.md`, theorems beginning `settling-cohomology-*`.
- **Predicate-category generators**: `morphisms/predicate-specialization.md`, `morphisms/predicate-converse.md`, `morphisms/predicate-subject-projection.md`, `morphisms/predicate-object-projection.md` (the four canonical morphism classes named in `predicate-category.md`).
- **Hyperdoctrine machinery**: `objects/dual-predication-hyperdoctrine.md`, theorems on Beck–Chevalley, etc.

## Heuristic

The rule used in this pull pass: read the file's mathematical content, identify which closure ordinal regime its substance is about (or which value-algebraic structure it parameterizes), and place at the corresponding regime category — usually as a new `hacking/library/<name>/` $thing if the content is its own object, otherwise as a `docs/dev/scraps/` preservation alongside the regime category's root with an accompanying journal note that restates the content in current canonical language.

The archive's prose is already substantially in current grammar — the main translation work is path placement (turning a generic `predication-categories/concepts/X.md` into a regime-tier-placed `<regime-cat>/hacking/library/X/X.md`), not rewriting.
