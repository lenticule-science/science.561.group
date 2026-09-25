---
type: definition
class: category
symbol: "\\mathcal{C}^\\beta"
depends-on:
  - predicate-category
  - predication-fiber-algebra
  - orbit-coloring-generator
  - bilattice-homomorphism
  - bilattice-homomorphism-naturality
  - relaxed-bilattice-homomorphism-classification
see-also:
  - predicate-specialization
  - predicate-converse
  - predicate-subject-projection
  - predicate-object-projection
  - orbit-coloring-generator-structural-integration
title: Boundary-extended predicate category
description: Fix a residuated lattice $\mathbf L$ and an entity set $E$.
---

# Boundary-extended predicate category

Fix a [residuated lattice](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/residuated-lattice.md) $\mathbf L$ and an [entity set](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/entity-set.md) $E$. The **boundary-extended predicate category** $\mathcal C^\beta$ is the category whose objects are predicates and whose morphisms are *all* natural — i.e. $\mathrm{Sym}(E)$-equivariant — [bilattice homomorphisms](../../documents/articles/research/2026/07/31/lenticule-import/morphisms/bilattice-homomorphism.md) between [predication fiber algebras](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/predication-fiber-algebra.md), with no [bottom-preservation](../../documents/articles/research/2026/07/31/lenticule-import/morphisms/bilattice-homomorphism.md) requirement. Composition is composition of bilattice homomorphisms.

The chapter's [predicate category](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/predicate-category.md) $\mathcal C$ embeds as the bottom-preserving sub-category $\mathcal C \hookrightarrow \mathcal C^\beta$. The complement $\mathcal C^\beta \setminus \mathcal C$ consists of the [orbit-coloring generators](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/klein-four-symmetry/content/orbit-coloring-generator/orbit-coloring-generator.md) — eight new morphism classes for $\mathbf L = \mathbf 2$ and $|E| \geq 3$, classified by the [relaxed bilattice homomorphism classification](../../documents/articles/research/2026/07/31/lenticule-import/theorems/relaxed-bilattice-homomorphism-classification.md).

The "boundary" in the name is a residual from a stronger conjecture that did not survive: the natural framing was originally that $\mathcal C^\beta$ would carry an infinite "boundary at infinity" of generators dual to non-principal $\mathrm{Sym}(E)$-equivariant ultrafilters on $E\times E$. By [no $\mathrm{Sym}(E)$-equivariant non-principal ultrafilter](../../documents/articles/research/2026/07/31/lenticule-import/theorems/sym-e-no-invariant-non-principal-ultrafilter.md), no such ultrafilters exist. The boundary algebra is therefore finite — eight new morphism classes, all of them concrete orbit-colorings. The name is kept for continuity with the framing question, with the understanding that the boundary is small.

## Hom-set inventory

For $\mathbf L = \mathbf 2$ and $|E| \geq 3$:

$$|\mathrm{Hom}_{\mathcal C^\beta}(q, p)| \;=\; 18 \;=\; \underbrace{10}_{\text{chapter sub-category}} \;+\; \underbrace{8}_{\text{orbit-coloring boundary}}.$$

The chapter sub-category breaks down as: 5 choices on the diagonal orbit ($\mathrm{ev}_\mathrm{diag}$ or $\mathrm{constant\text{-}}\bot$, 2 options) crossed with 5 choices on the off-diagonal orbit (4 chapter generators or $\mathrm{constant\text{-}}\bot$, 5 options) — 10 combinations. The orbit-coloring boundary is the 8 combinations with at least one $\mathrm{constant\text{-}}\top$ on either orbit.

For richer $\mathbf L$, the inventory size depends on the lattice homomorphism count $\mathbf L^{E\times E} \to \mathbf L$ that are $\mathrm{Stab}$-invariant on each orbit. The orbit-by-orbit decomposition of [relaxed bilattice homomorphism classification](../../documents/articles/research/2026/07/31/lenticule-import/theorems/relaxed-bilattice-homomorphism-classification.md) holds verbatim; only the per-orbit option count changes.

## Position relative to the chapter

$\mathcal C^\beta$ is the smallest enlargement of $\mathcal C$ that closes the chapter's morphism inventory under the natural-bilattice-homomorphism condition. The bottom-preservation hypothesis in [predicate-generator exhaustiveness](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/predication-fibration/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md) is precisely the condition that excludes the 8 orbit-coloring generators; relaxing it gives $\mathcal C^\beta$.

The structural questions raised by including orbit-coloring generators — whether the [predication fibration](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/predication-fibration.md) extends, whether the [predication hyperdoctrine](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/predication-hyperdoctrine.md)'s adjoint structure survives, what the [closure 2-monad](../../documents/articles/research/2026/07/31/lenticule-import/morphisms/closure-2-monad.md) does on orbit-colored fibers, whether the [four-regime dichotomy](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md) acquires new strata at the boundary — are open and concrete. They are collected in [orbit-coloring generator structural integration](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/questions/orbit-coloring-generator-structural-integration.md). None of them is conjecturally a continuum-sized restructuring; each is a finite, tractable structural check.

## Reading

The chapter's predicate category carries the morphisms that *transform* settling information; $\mathcal C^\beta$ adds morphisms that *introduce paraconsistent overdetermination at the orbit level*. Both sides of the chapter's two-internal-logics story are present in $\mathcal C$; what $\mathcal C^\beta$ adds is a syntactic handle, at the predicate-category level, for "make this orbit paraconsistent." Whether that handle is operationally useful in the engineering layer — where settling-driven systems may want explicit inconsistency-injection morphisms for fault-injection or paraconsistent-recovery testing — is a separate question from the math, and likely the place where the boundary-extended predicate category earns its keep if it does.
