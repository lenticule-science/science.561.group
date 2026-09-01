# Predicated Software Refactoring

A subtheory of [predicated-software-development](../../_index.md). The leaf where the substrate-algebraic vocabulary inherited from [predication-categories](../../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md) earns its keep on a software-engineering activity.

The central claim — proved in [refactor-as-invisible-automorphism](theorems/refactor-as-invisible-automorphism.md) — is that *refactorings are precisely the elements of the invisible-automorphism subgroup of a codebase's predication settling*. Equivalently: a transformation of a codebase is a refactoring iff it acts trivially on the codebase's [settling-associated sheaf](../../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md). This is the dual of [restructure-as-visible-automorphism](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/theorems/restructure-as-visible-automorphism.md) for organizational restructuring: refactorings *are* the cosmetic restratum; rewrites and breaking changes are the substantive stratum.

This is not a metaphor. The classical refactoring catalog (rename, extract, inline, move, replace-conditional-with-polymorphism) populates the invisible subgroup directly: each refactoring is an automorphism of the codebase cell-system whose action on cell positions either fixes every newly-designated cell (cosmetic) or doesn't (substantive — and therefore not a refactoring under that witness language). The disciplinary literature (Fowler, Opdyke, Mens & Tourwé) is recovered as engineering content of a substrate-algebraic structure that already exists in the math program.

## Why a subtheory rather than a sibling theory

Three reasons.

1. **Library structure.** [Software-refactoring](../../../../../../../software-engineering/theories/software-development/theories/software-refactoring/_index.md) is treated as a sub-activity of software-development in the engineering tree; this subtheory mirrors that.
2. **Substrate inheritance.** Inherits codebase-cell-system, change-as-witness-increment, and the regime classification from the parent fusion. Does not re-derive.
3. **Co-content.** Refactoring presupposes development — without something to refactor, there is no refactor. The subtheory shape captures this.

## Convention

Following the [predication-categories convention](../../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md). Same frontmatter, same status markers, same relation set.

## Layout

- `concepts/` — semantic anchors: [refactor-as-invisible-automorphism](concepts/refactor-as-invisible-automorphism.md), [witness-language-relativity](concepts/witness-language-relativity.md), [refactor-graph](concepts/refactor-graph.md).
- `objects/` — formal structures: [codebase-cell-system](objects/codebase-cell-system.md), [refactor](objects/refactor.md), [structure-invariant](objects/structure-invariant.md).
- `morphisms/` — refactoring operations as substrate morphisms: [rename](morphisms/rename.md), [extract](morphisms/extract.md), [inline](morphisms/inline.md), [move](morphisms/move.md).
- `theorems/` — substrate-algebraic claims: [refactor-as-invisible-automorphism](theorems/refactor-as-invisible-automorphism.md), [refactoring-closed-under-composition](theorems/refactoring-closed-under-composition.md), [breaking-change-as-visible-automorphism](theorems/breaking-change-as-visible-automorphism.md), [public-api-rename-is-substantive](theorems/public-api-rename-is-substantive.md).
- `examples/` — both layers: math-side examples ([private-rename-as-cosmetic](examples/private-rename-as-cosmetic.md), [extract-method-as-substrate-automorphism](examples/extract-method-as-substrate-automorphism.md)) and code-side examples ([pyfars-rename-as-witness](examples/pyfars-rename-as-witness.md)).
- `narratives/` — synthesis: [structure-preservation-as-substrate-algebra](narratives/structure-preservation-as-substrate-algebra.md).
- `references/` — disciplinary precursors: [fowler-1999](references/fowler-1999.md), [opdyke-1992](references/opdyke-1992.md), [mens-tourwe-2004](references/mens-tourwe-2004.md).
- `questions/` — open questions; mostly forwarded from the [unpredicated questions](../../../../../../../software-engineering/theories/software-development/theories/software-refactoring/questions/_index.md).

## What this subtheory commits to

- **Refactorings are exactly the invisible-automorphism subgroup of the codebase settling.** Not "modeled by," not "analogous to" — *are*. The disciplinary intuition that a refactoring "leaves behavior unchanged" is the substrate-algebraic fact that the action fixes the settling-associated sheaf.
- **The witness language is a parameter, not a fact.** Whether a transformation is a refactoring depends on which cells of the codebase cell-system are designated witness-bearing — equivalently, on which sheaf is in scope. A rename of a private variable is invisible to the test-witness sheaf and visible to the source-text sheaf; both classifications are correct under their respective witness languages.
- **The refactoring catalog is a generating set for the invisible subgroup.** Fowler's catalog (rename, extract, inline, move, etc.) is not a list of conventions — it is a generating set, modulo composition, for $N(v^{\mathrm{code}})$ on a typical codebase settling. The classical theorems about safety and reversibility of catalog operations are theorems about the structure of $N(v^{\mathrm{code}})$.
- **Public-API renames are not refactorings under any honest witness language.** This is a *theorem*, not a convention. If callers of an API name `f` are downstream entities of the codebase cell-system, the predicate `references-f` is a designated cell whose existence is fixed by the settling. A rename to `g` permutes that cell to `references-g`; the rename's action does not fix the designated cell, hence is not in $N(v^{\mathrm{code}})$. This is [public-api-rename-is-substantive](theorems/public-api-rename-is-substantive.md), and it explains why language-server-driven "rename across the universe" tooling is required to be coordinated with consumer codebases — the operation is in the *visible* automorphism quotient.

## Status

Active — drafted as the first leaf of the predicated-software-engineering tree. Central theorem stated and sketched; catalog operations defined as substrate morphisms; two layers of examples (math-side and code-side, in line with the Stage 5 ME discipline); Fowler / Opdyke / Mens-Tourwé recovered as engineering content of the substrate's automorphism structure. The full classification of "what counts as a refactoring under witness-language $W$" is parameterized; specific witness languages — test-only, public-API-aware, source-text-fidelity — are studied as instances rather than re-defined.
