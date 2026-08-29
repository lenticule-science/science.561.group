---
kind: reference
authors: [Lopez, Miguel]
year: 2024
title: "Enriched Categories, Quantales, and Applications"
venue: "PhD dissertation, University of Pennsylvania"
---

## Full citation

M. Lopez. *Enriched Categories, Quantales, and Applications*. PhD dissertation, University of Pennsylvania, 2025 (defended 2024). Supervisor: Robert Ghrist.

## Status

PDF read locally. Verified against actual content.

## Annotation

**Note: this annotation has been corrected after careful reading of the dissertation. Earlier corpus claims about what Lopez establishes were inaccurate; see "What Lopez does NOT establish" below.**

The dissertation develops applied enriched category theory via quantale-enriched categories, with three substantive parts:

- **Chapters 1–3 (foundations).** Quantale-enriched category theory, with attention to weighted lattices (complete $\mathsf{Q}$-categories) as the value-category of interest. Develops fuzzy adjoint functors $F \dashv_q G$ — pairs of $\mathsf{Q}$-functors satisfying a quantale-graded adjunction condition (with $q = 1$ recovering the strict adjunction).

- **Chapters 4–5 (network sheaves and Lawvere Laplacian).** Network sheaves $F: G \to \mathbf{QCCat}$ AND network cosheaves $\mathcal{F}: G^{\mathrm{op}} \to \mathbf{QCCat}$ on the incidence poset of a graph $G$, with the Lawvere Laplacian defined as

$$(L_W \vec{x})_v := \bigwedge^{W(v, -)}_{w \in N_v,\, \partial e = \{v, w\}} \mathcal{F}_{e \rhd v} F_{w \lhd e} x_w.$$

The Laplacian uses **both** sheaf and cosheaf data — sheaf restrictions $F_{v \lhd e}$ and cosheaf extensions $\mathcal{F}_{e \rhd v}$ — that "agree on objects" (i.e., $F_\sigma = \mathcal{F}_\sigma$) but have independent functoriality. The fuzziness parameter $\varepsilon$ tracks how close the sheaf/cosheaf pair is to being a strict adjoint pair: $F_{v \lhd e} \dashv_\varepsilon \mathcal{F}_{e \rhd v}$.

- **Chapters 7–8 (conic programs and duality).** Develops a duality theory for *conic programs* (linear programming generalizations) via the Chu construction. This is a different duality from Verdier duality of sheaves — it's a Chu-style $*$-autonomous-category duality applied to conic optimization.

## What Lopez does NOT establish

Three things one might hope for from this dissertation that are **not** in it:

1. **A Q-enriched analogue of Curry's cellular sheaf-cosheaf derived equivalence.** Lopez has sheaves and cosheaves but treats them as *paired structures* (used together for the Laplacian), not as derived-equivalent objects. There is no theorem of the form "$\mathrm{Sh}_{\mathsf{Q}}(G) \simeq \mathrm{coSh}_{\mathsf{Q}}(G)$" or similar.
2. **Verdier duality for Q-enriched sheaves.** Not addressed. The "duality" in the dissertation is Chu / conic-program duality (chapters 7–8), structurally distinct from Verdier duality.
3. **Extension beyond network/graph base.** Lopez explicitly focuses on graph-based network sheaves; he notes the framework "generalizes naturally to arbitrary regular cell complexes" (§4.1) but does not develop this generalization, and does not consider Grothendieck sites.

## What's actually useful for our work

- The **fuzzy adjoint framework** ($F \dashv_q G$ for quantale-graded adjunctions) is the right notion for Q-enriched sheaf-cosheaf pairing in our setting.
- The **Lawvere Laplacian formula** is the explicit operator using sheaf-restriction + cosheaf-extension, providing the model for our Q-enriched setting.
- The **Tarski–Lawvere Fixed Point Theorem** (proved in Lopez's dissertation chapter 5 / Ghrist-Lopez-North-Riess 2025) gives convergence of the Laplacian to fuzzy global sections.

These pieces support the [bilattice-valued cohomology chapter](../narratives/bilattice-cohomology-opener.md)'s Layer 1 work but do **not** support the [Verdier duality chapter](../narratives/verdier-duality-opener.md)'s central theorem in the way the corpus initially claimed. The Q-enriched analogue of Curry's derived equivalence remains genuinely open.

## Position in the program

Foundational reference for Q-enriched sheaves and cosheaves on graphs. Used in the bilattice-valued cohomology chapter for the Lawvere Laplacian framework (which it shares with [@ghrist-et-al2025]). For the Verdier duality chapter, used as a *partial* foundation: Lopez supplies sheaves-and-cosheaves machinery but not a derived equivalence; the equivalence has to be developed independently.
