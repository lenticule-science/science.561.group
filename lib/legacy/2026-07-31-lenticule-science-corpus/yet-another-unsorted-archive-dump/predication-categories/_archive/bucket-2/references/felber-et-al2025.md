---
type: reference
authors: [Felber, Stephan, Hummes Flores, Bernardo, Rincon Galeana, Hugo]
year: 2025
title: "A Sheaf-Theoretic Characterization of Tasks in Distributed Systems"
venue: "arXiv:2503.02556"
---

## Full citation

S. Felber, B. Hummes Flores, H. Rincon Galeana. "A sheaf-theoretic characterization of tasks in distributed systems." arXiv:2503.02556, 2025.

## Status

Abstract and key claims verified.

## Annotation

A directly-relevant modern parallel to the cohomological layer. Felber et al. introduce a **task sheaf** on a simplicial input/output complex such that:
- The task sheaf's **global sections** are exactly the task's terminating solutions.
- Its **cohomology** encodes the obstructions to finding solutions.

For our program this is the closest parallel to the cohomological-layer's CRDT Mayer–Vietoris bridge. Per the [Felber task sheaf — d-frame translation question](../questions/felber-task-sheaf-d-frame-translation.md):

**Shared value-category structure (Pass 1, settled).** Felber's task-sheaf stalks $\mathcal F_{S, T}(g) = \Delta(I(g)) \subseteq O$ are subsets of an output set, equipped with the powerset frame structure. Restriction maps $\pi_p$ are $\vee$-preserving frame morphisms (left-adjoint-style). The lift to $\mathbf{Ab}$ via the free-abelian-group functor $\mathbb Z[-]$ that Felber et al use for cohomology computation is a *technical move*, not a structural feature of the task sheaf. The natural value category is $\mathbf{Frm}_\vee$ — frames with $\vee$-preserving morphisms. The corpus's settling-associated sheaf is also $\mathbf{Frm}_\vee$-valued (powerset frames on cell sets). **Both sides share a common value category at the frame level.**

**D-frame extension (Pass 2, partially done).** A d-frame-valued task sheaf $\mathbb F_{S, T}(g) = (\Delta^+(I(g)), \Delta^-(I(g)), \mathrm{con}_g, \mathrm{tot}_g)$ refines Felber's classical setting by distinguishing $\mathbf t$ (positive validity), $\mathbf f$ (positive invalidity), $\top$ (paraconsistent over-evidence), $\bot$ (no evidence). The proposed d-frame analog of Felber's Theorem 20 is constructed but not yet proved.

**Remaining structural differences (after the d-frame translation):**

1. **Temporal structure.** Felber et al use finite 1-categorical execution models; the corpus uses the transfinite 2-categorical settling. The d-frame translation in Pass 2 preserves Felber's finite-slice setting.
2. **Primary question.** Felber et al target task solvability; the corpus targets settling convergence and classification. These are structurally distinct properties of the cohomology, both expressible in the shared frame / d-frame value category.
3. **Site base.** Felber et al use the cellular category of a system slice (an undirected graph); the corpus uses the bitopological site $(\mathbf T^*, J)$. The [unified distributed-systems cohomology question](../questions/unified-distributed-systems-cohomology.md) Sub-question 3 (open) explores whether a product-site framework combining both is well-behaved.

The two frameworks are complementary; the d-frame translation question's findings sharpen the relationship from "complementary parallel constructions" to "shared frame-valued value category, with d-frame extension on each side, and orthogonal cohomological signatures (settling-convergence vs task-solvability)."
