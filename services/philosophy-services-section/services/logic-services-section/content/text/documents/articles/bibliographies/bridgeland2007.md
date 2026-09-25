---
type: reference
authors: [Bridgeland, Tom]
year: 2007
title: "Stability Conditions on Triangulated Categories"
venue: "Annals of Mathematics 166(2), 317–345"
description: T.
---

## Full citation

T. Bridgeland. "Stability conditions on triangulated categories." *Annals of Mathematics* 166(2), 317–345, 2007.

## Status

Training-knowledge plus standard formulation verified. Stability conditions and the local-homeomorphism deformation theorem of $\mathrm{Stab}(\mathcal{D})$ are textbook material in modern derived-algebraic-geometry exposition.

## Annotation

Bridgeland's 2007 paper introduced the notion of a **stability condition** on a triangulated category $\mathcal{D}$: a pair $(Z, \mathcal{P})$ where:

- $Z : K_0(\mathcal{D}) \to \mathbb{C}$ is a group homomorphism — the **central charge**.
- $\mathcal{P} = \{\mathcal{P}(\phi)\}_{\phi \in \mathbb{R}}$ is a family of full additive subcategories of $\mathcal{D}$ — the **slicing** — with $\mathcal{P}(\phi)$ the *semistable objects of phase $\phi$*.

The pair must satisfy compatibility axioms making each nonzero object of $\mathcal{D}$ uniquely decomposable into semistable pieces (Harder–Narasimhan filtration in the triangulated category).

**Main results:**

1. **Stability conditions form a manifold.** The set $\mathrm{Stab}(\mathcal{D})$ of locally finite stability conditions has a natural complex-manifold structure of dimension $\mathrm{rk}\, K_0(\mathcal{D})$. The forgetful map $\mathrm{Stab}(\mathcal{D}) \to \mathrm{Hom}(K_0(\mathcal{D}), \mathbb{C})$ taking $(Z, \mathcal{P}) \mapsto Z$ is a local homeomorphism — *the central charge determines a stability condition locally.*

2. **Walls and chambers.** $\mathrm{Stab}(\mathcal{D})$ stratifies into chambers separated by walls of real codimension one. In each chamber, the set of semistable objects of class $\alpha \in K_0(\mathcal{D})$ is locally constant. At walls, some objects' (semi)stability changes — a *wall-crossing*. Joyce-Song [@joyce-song2012] later extracted explicit invariant-jump formulae from this structure.

For the corpus's openness-defect direction, stability conditions are the structural prototype of the **openness-stratification** of the settling moduli stack:

- The stratification of $\mathrm{Stab}(\mathcal{D})$ by stability type ↔ the corpus's stratification of the settling moduli by categorical openness.
- The stable / semistable distinction at walls ↔ the cellular / non-cellular distinction at the openness boundary identified by the [frame-morphism openness characterization theorem](../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-1/theorems/frame-morphism-meet-preservation-openness.md).
- The wall-crossing of stability classes ↔ the corpus's cellular-leaving deformations producing openness-defect classes $\delta$ per the [openness-boundary deformation dichotomy](../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-1/theorems/openness-boundary-deformation-dichotomy.md).

**What transfers.** The structural template — stratified parameter space, deformations across walls produce specific cohomological invariants. The local-homeomorphism theorem (the central charge determines stability conditions locally) suggests an analog: a corpus-internal "central-charge function" determining cellular-sheaf structure locally, with walls being where cellularity is lost.

**What needs adaptation.** Bridgeland works in derived categories of coherent sheaves on smooth projective varieties with $\mathbb{C}$-valued central charge. The corpus works in d-frame-valued sheaves on bitopological settling sites; the analog of the central charge would be bilattice-valued (likely a $\mathrm{Bilattice}$-valued homomorphism on the corpus's analog of $K_0$, with truth-side and falsity-side components corresponding to the d-frame value category's bilattice structure). This central-charge analog is corpus development work, not standard.

## Where used

- [Openness-defect deformation theory question](../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-1/references/questions/openness-defect-deformation-theory.md)
- [Openness-defect deformation literature](../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-1/references/prose/teaching/explanations/openness-defect-deformation-literature.md)
- [Deformation-theory opener](../notes/undated/deformation-theory-opener.md)
