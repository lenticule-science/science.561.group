---
title: "Curry-Howard-Lambek, Language Cones, Proof-Pathing, and Yoneda: An Asset Inventory"
description: "Full-corpus inventory (live, legacy, and git-history-only) of assets tied to the Curry-Howard-Lambek correspondence, the coined term Language Cone, proof-pathing, and the Yoneda embedding."
date-created: 2026-07-26
kind: research-note
keywords:
  - curry-howard-lambek
  - language-cones
  - proof-pathing
  - yoneda
  - category-theory
  - type-theory
  - asset-inventory
status: settled
declared-by: claude-interactive-session
type: research-article

---
# Curry-Howard-Lambek, Language Cones, Proof-Pathing, and Yoneda: An Asset Inventory

This note is the object: a full-corpus inventory of every asset — live, legacy, and git-history-only — tied to the Curry-Howard(-Lambek) correspondence, the repo-coined term "Language Cone," "proof pathing," and the Yoneda embedding. A subagent produced it by grepping the working tree and full git history (via the sanctioned Git Services Section wrapper, since raw `git` is blocked by standing order) across all ~1.34M tracked files. Raw case-insensitive hit counts: "curry.?howard" in 525 files, "lambek" in 869 files, "yoneda" in 647 files, "language.?cone" in 34 files, "proof.?path" in 92 files. The bulk of these hits are the terms recurring as load-bearing conceptual vocabulary through research notes, Lean modules, and design reviews, not incidental noise.

A path segment containing `legacy`, `_archive`, or `triage` still exists in the current working tree and is walkable now — it counts as historical in a curatorial sense, not as deleted. The findings below separate that from material recoverable only through git history.

## 1. Curry-Howard(-Lambek) correspondence

**Live canonical Lean source.** `Obsmetrologia/Language/Predicating/CurryHowardLambek.lean` (947 lines) states: "There is no dedicated Curry-Howard node in the corpus: the correspondence is the categorical-logic projection of the predication-hyperdoctrine... The math, authoritatively, is the Curry-Howard-Lambek correspondence: PROOFS = PROGRAMS = MORPHISMS." It defines `Ty`, `Tm`, `HasTy`, proves Church-Rosser confluence (`church_rosser`) by the Takahashi/Tait-Martin-Löf method, and proves `curry_howard`, `curry_howard_lambek`, and `chl_quartet_is_nuclear`.

**Live design notes.** `2026-07-09-ppa-proof-path-addressing.md` cites `CurryHowardLambek.lean:83-201` (Ty/Tm/HasTy), `:572-719` (church_rosser), and `:741-944` (curry_howard, ccc_exponential_adjunction, curry_howard_lambek, chl_quartet_is_nuclear), tagged "proven-in-Lean." `2026-07-06-research-on-axioms-proofs-theorems.md:798-800` states: "The Curry-Howard turn: propositions as types, proofs as programs... A proof of P is a term of type P" (citing Howard 1980).

**Legacy/archived material present in tree.** A full legacy directory at `content/assets/legacy/curry-howard-lambek/` holds six research/archive documents. A second archive tree holds `RelMath/CurryHowardLambekQuartet.lean` (plus four duplicated worktree copies). A voidmath legacy node names a `by-chl-language-cones` directory with a `categorical-model-as-cone-apex` sub-node, journaled 2026-05-24 — the same directory family that first names "language cones" (§2).

**Git-history-only.** `lib/proof-pathing` existed as an inline directory before commit `b04af64f` (2026-06-07), which converted it to the external `@561-group/proof-pathing` submodule ("the Meme-structure → typed-path / CHL fold"); its content lives in that separate private repo now. Commit `54783baba2` (2026-07-09) records the deletion of `RelMath/Lorentzian/LambekRicci.lean` with no surviving successor under any name — this one theorem name is genuinely gone, not renamed.

## 2. "Language Cone(s)"

This is a repo-coined term with two distinct lineages, both live.

**Earliest coinage — SPOTCOMP "CHL Language Cone Profile" (legacy path, dated 2026-05).** `spotcomp/docs/dev/notes/ai-slop/CHL-LANGUAGE-CONES.md` opens: "A CHL language is a category whose internal structure supports several column-leg functors projecting from a common categorical apex. The classical Curry-Howard-Lambek three-column pattern is a specialization, not the whole object." It lists six column legs (type-theory, proof-theory, category-theory, Scott/domain-theory, path-theory-over-POSIX, saturation/transfer) and states plainly: "The probe does not prove the cross-tradition coincidence theorem, derive the full path-theory cone-leg, or prove Yoneda." A companion JSON Schema, `chl-language-profile.schema.json`, requires `languageApex`, `columnLegs` (minimum 5), `morphismInventory`, `coincidencePolicy`, and `pathTheoryColumn`.

**Current coinage — PPA (Proof-Path Addressing) "Language Cone" (2026-07, live).** `2026-07-09-ppa-proof-path-addressing.md` now states the binding law: the filesystem realization is the canonical operational proof path, every earned segment is a restriction or generating morphism, and other protocol or language readings must preserve that descent. The same note states plainly that an LSP search for `LanguageCone`, `ReadingCone`, or `ConeOfReadings` found no declarations — the theorem that all protocol legs commute is a stated obligation (`PPA-FR-040 — Cone Of Readings`), not an existing proof, and it depends on `Infomaterial.Yoneda.yoneda_lemma`/`yoneda_fully_faithful`. A companion plan, `2026-07-08-plan-for-proofplayarena-and-language-cone-readouts.md`, gives full categorical definitions of `Cone(A, D)`/`Cocone(D, A)` for a diagram `D : J -> Lang` and `ReadCone(rho)` for a directory-derived apex.

Both the 2026-05 and 2026-07 sources state the coincidence/commutation theorem as an open obligation, not a proof.

## 3. "Proof pathing" / "Proof-Path Addressing"

**Live doctrine.** `computing-proof-pathing-explanation-placing-a-concept-by-its-generating-morphism.md` states: "It assumes you accept that a filepath is a Curry-Howard proof term and that a concept belongs under the morphism that generates it... The generator is the chain: articulate → predicate → posit → settle." `computing-explanation-proof-pathing-the-generative-unfolding-of-mathematics.md` states: "The path *is* the Curry-Howard coordinate of the concept: read root-to-leaf, it is the derivation... a path is a claim, and an unearned segment is a lie about a type." Term, import DAG, and earned physical path agree, and none substitutes for the filepath proof.

**Legacy material present in tree.** A dedicated node, `computing-with-posix/content/posix-filepathing-with-curry-howard-directionality-by-yoneda-embedding/`, states: "a path *is* a Curry-Howard proof coordinate, its segments *are* restriction/entailment morphisms, and a node *is* its bundle of arrows (the Yoneda embedding 𝒴(A)=Hom_C(−,A))." The categorical proof tree is the durable, traversable composition of those morphisms; it is not a disposable projection of them.

## 4. Yoneda embedding / Yoneda lemma

**Live Lean source.** `Obsmetrologia/Language/Predicating/YonedaArrowsFirst.lean` (452 lines) proves the arrows-first thesis: "an object is nothing over and above its bundle of incoming arrows, and is completely recovered from them via the Yoneda embedding into presheaves." It proves `repr`, `yoneda`, `yoneda_lemma` (`Nat (y X) P ≅ P X`), `yoneda_fully_faithful`, and `object_is_its_morphisms`.

**Live executable shadow.** `pymetrologic/yoneda.py` (370 lines) is "an executable shadow of `RelMath.Predicating.YonedaArrowsFirst`," exporting `yoneda_arrows_first`, `yoneda_recovers_homs`, `yoneda_faithful_on_homs`, and `object_recovered_by_representables`, with a matching test file.

**Git-history-only.** Commit `54783baba2` (2026-07-09) records the deletion of `RelMath/Predicating/YonedaArrowsFirst.lean` and its Verso chapter — both superseded by the current `Obsmetrologia/Language/Predicating/YonedaArrowsFirst.lean`, a namespace rename (`RelMath` → `Obsmetrologia`), not a loss.

## 5. Adjacent category/type/proof-theory material

`CurryHowardLambek.lean` ties Lambek's cartesian-closed-category semantics directly into the same file as Curry-Howard: "the type structure is a cartesian closed category: `prod` is the categorical product... the universal cone." `Obsmetrologia/Calculus/Logic/LambekCalculus.lean` (332 lines) formalizes the non-commutative Lambek calculus (Lambek 1958) as a residuated lattice, citing Galatos-Jipsen-Kowalski-Ono (2007), Lawvere (1969), Wurm (2012), and Pentus (1993). `Obsmetrologia/Calculus/Logic/FCALambekCircle.lean` (241 lines) proves that formal-concept-analysis closure equals settling closure and that a concept lattice is a complete lattice. `Obsmetrologia/CausalSets/Curvature/Lambek.lean` (228 lines) proves `residuals_coincide_iff_commutative` and a discrete Bianchi identity, reading spacetime curvature through Lambek bi-residuation.

## 6. Bibliography links found

From `2026-07-06-research-on-axioms-proofs-theorems.md`: plato.stanford.edu entries on proof theory, proof-theoretic semantics, and Gödel incompleteness; homotopytypetheory.org/book; five arXiv abstracts (1210.5658, 1610.04591, 1910.09336, 2602.04846, 2603.26996); an AMS Bulletin article; a Nature article. No dedicated arXiv/DOI citation for the Yoneda lemma or the Lambek calculus itself was found inside the matched files — the Lean modules cite authors (Lambek 1958, Galatos-Jipsen-Kowalski-Ono 2007, Wurm 2012, Pentus 1993, Lawvere 1969, Howard 1980) by name and year in prose, without embedded URLs or DOIs.

## What would falsify this inventory

A further search turning up a live Lean or code artifact that proves the language-cone coincidence theorem (`PPA-FR-040`), or a committed history for the pre-submodule `lib/proof-pathing` directory recoverable from a source outside this repo, would falsify the "still an open obligation" and "content unrecoverable" claims made above respectively.
