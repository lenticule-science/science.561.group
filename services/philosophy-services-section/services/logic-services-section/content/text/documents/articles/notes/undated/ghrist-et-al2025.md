---
kind: reference
authors: [Ghrist, Robert, Lopez, Miguel, North, Paige Randall, Riess, Hans]
year: 2025
title: "Categorical Diffusion of Weighted Lattices"
venue: "arXiv:2501.03890"
description: R.
type: reference
---

## Full citation

R. Ghrist, M. Lopez, P. R. North, H. Riess. "Categorical Diffusion of Weighted Lattices." arXiv:2501.03890, January 2025.

## Status

Preprint at arXiv:2501.03890; PDF in `sources/` is **v1** (Jan 2025). Corpus theorem-number references (e.g. Theorem 2.17 for the Tarski–Lawvere FPT) match v1; v2 (Jan 2026) renumbers — Tarski–Lawvere FPT becomes Theorem 3.4, Lawvere Laplacian becomes Definition 6.2, Hodge–Lawvere becomes Theorem 6.7. Follow-up to [@ghrist-riess2022].

## Annotation

The quantale-enriched generalization of the Tarski Laplacian framework. Where [@ghrist-riess2022] developed cohomology for cellular sheaves valued in the category of lattices and Galois connections, this paper extends to **cellular sheaves enriched in commutative unital quantales** via the **Lawvere Laplacian** — an endofunctor on the category of cochains with the same fixed-point semantics as the Tarski Laplacian, but operating in a richer enriched-categorical setting.

The technical heart is the **Tarski–Lawvere Fixed Point Theorem**: suffix and prefix points of a quantale-enriched endofunctor form complete weighted lattices. This generalizes Tarski's classical fixed-point theorem to the weighted/enriched setting, providing both existence and structural properties of the cohomology.

Key technical points:

- The framework operates on **undirected graphs**, with cellular sheaves modeled as pseudofunctors from a category encoding incidences.
- A **commutative unital quantale** is a complete lattice with commutative associative multiplication distributing over arbitrary suprema. This is general enough to include the Boolean quantale, the Lawvere/cost quantale ($[0, \infty]$ with addition), tropical semirings, and frames (with multiplication = meet).
- The paper does not explicitly discuss Heyting algebras or frames, but they fit as enrichment bases since they are quantales.
- **Future directions** identified in the conclusion: extension to *quantaloid*-enriched categories (multi-object generalization of quantales) and to enriched categories modeling arbitrary base spaces, including simplicial sets.

## Position in the program

Crucial reference for the [bilattice-valued cohomology framework choice](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/narratives/d-frame-cohomology-framework.md). Frames are quantales, so the corpus's [d-frame-valued sheaves](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/d-frame-valued-sheaf/d-frame-valued-sheaf.md) plausibly fit the Lawvere Laplacian framework directly (modulo the d-frame's two-frame structure with consistency / totality, which adds structure beyond a single quantale).

The paper's identified future direction — extension to "arbitrary base spaces including simplicial sets" — is precisely the cellular extension question the corpus needs answered for transfinite-regime settlings. Engaging with this potential research direction is the substantive entry point for the chapter's open work.

The structural resonance with the corpus is strong: the corpus's [closure 2-monad](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/morphisms/closure-2-monad.md) is KZ lax-idempotent — Tarski-style and Tarski–Lawvere-style fixed points are the same machinery the Lawvere Laplacian uses. The cellular extension is plausibly a natural step that respects the corpus's existing fixed-point infrastructure.

The structural resonance with the corpus is strong: predication categories' [closure 2-monad](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/morphisms/closure-2-monad.md) is KZ lax-idempotent — Tarski-style and Tarski–Lawvere-style fixed points are the same machinery the Lawvere Laplacian uses. The cellular extension is plausibly a natural step that respects predication categories' existing fixed-point infrastructure.
