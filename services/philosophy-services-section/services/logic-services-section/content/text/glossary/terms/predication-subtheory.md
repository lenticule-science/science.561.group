---
type: definition
status: draft
class: theory
symbol: "(S, \\pi)"
depends-on: [predication-theory, closure-restriction, closure-restriction-is-closure, subtheory-settled-state, subtheory-inclusion]
see-also: [resource, researching, idealization-morphism, theory-relative-ideal]
title: Subtheory
description: "A subtheory of a predication theory $T = (\\mathbf{L}, \\mathcal{C}^T, E, \\mathrm{Cl}^T)$ is a pair $(\\mathcal{C}^S, \\pi)$ where $\\mathcal{C}^S$ is a predicate category and $\\pi : \\mathcal{C}^S \\hookrightarrow \\mathcal{C}^T$ is a type…"
---

# Subtheory

A **subtheory** of a [predication theory](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/predication-theory.md) $T = (\mathbf{L}, \mathcal{C}^T, E, \mathrm{Cl}^T)$ is a pair $(\mathcal{C}^S, \pi)$ where $\mathcal{C}^S$ is a [predicate category](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/predicate-category.md) and $\pi : \mathcal{C}^S \hookrightarrow \mathcal{C}^T$ is a type embedding — a functor faithful and generator-class-preserving — together with the induced predication theory

$$S \;:=\; \bigl(\mathbf{L},\; \mathcal{C}^S,\; E,\; \pi^*(\mathrm{Cl}^T)\bigr),$$

where $\pi^*(\mathrm{Cl}^T)$ is the [closure restriction](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/closure-operator/content/closure-restriction/closure-restriction.md): $(\pi^*(\mathrm{Cl}^T))_p := \mathrm{Cl}^T_{\pi(p)}$ for each $p \in \mathcal{C}^S$. By [closure restriction is a closure](../../documents/articles/research/2026/07/31/lenticule-import/theorems/closure-restriction-is-closure.md), $\pi^*(\mathrm{Cl}^T)$ is a well-formed closure operator on $(\mathbf{L}, \mathcal{C}^S, E)$, so $S$ is a predication theory. By [subtheory settled state](../../documents/articles/research/2026/07/31/lenticule-import/theorems/subtheory-settled-state.md), its settled state is $v^S_\infty = \pi^*(v^T_\infty)$. The embedding of $S$ into $T$ is the [subtheory inclusion](../../documents/articles/research/2026/07/31/lenticule-import/morphisms/subtheory-inclusion.md) $\iota_{S,T}$.

## Uniqueness given $\pi$

The subtheory induced by a type embedding $\pi$ is unique: $\mathbf{L}$, $E$, and the closure $\pi^*(\mathrm{Cl}^T)$ are all determined by $T$ and $\pi$; the settled state follows. The subtheory is the pair $(\mathcal{C}^S, \pi)$, not $\mathcal{C}^S$ alone — two embeddings $\pi \neq \pi' : \mathcal{C}^S \hookrightarrow \mathcal{C}^T$ generally induce different subtheories because they restrict different closure components.

## Subtheory vs. resource

Every subtheory $(S, \pi)$ induces a [resource](../../../../../../../information-science-services-section/content/text/glossary/terms/resource.md) $(v^S_\infty, \pi, T)$. The subtheory settled-state theorem guarantees that this resource is theory-ideal: $\mathrm{De} = \mathrm{Ex} = \mathrm{Co} = \emptyset$. The converse fails: a resource $(v^R, \pi, T)$ that is theory-ideal — whose settled state coincides with $\pi^*(v^T_\infty)$ — need not be a subtheory, because its closure operator $\mathrm{Cl}^R$ may differ from $\pi^*(\mathrm{Cl}^T)$. Theory-ideality is a condition on settled values; the subtheory condition is a condition on inference structure. The closure restriction is the additional content.

## Restriction to shared $\mathbf{L}$ and $E$

The definition holds $\mathbf{L}$ and $E$ fixed. This makes $A^S_p = A^T_{\pi(p)}$ as algebras, so closure restriction is literal equality of operators on the same object, not a homomorphism between different algebras. A generalized subtheory allowing entity embeddings $e : E^S \hookrightarrow E^T$ or lattice maps $\ell : \mathbf{L}^S \to \mathbf{L}^T$ would require the full cross-base predication-settling base-morphism and constitutes a separate construction.
