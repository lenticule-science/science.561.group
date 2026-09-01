---
type: reference
authors: [Joyce, Dominic, Song, Yinan]
year: 2012
title: "A Theory of Generalized Donaldson–Thomas Invariants"
venue: "Memoirs of the American Mathematical Society 217(1020)"
---

## Full citation

D. Joyce, Y. Song. *A Theory of Generalized Donaldson–Thomas Invariants.* Memoirs of the American Mathematical Society 217(1020), 2012.

## Status

Training-knowledge plus standard formulation verified. Generalized DT invariants and their wall-crossing formulae are established literature in modern enumerative geometry. Cross-checked against [@kontsevich-soibelman2008]'s parallel motivic-DT framework, which gives an alternative formulation of the same wall-crossing structure.

## Annotation

Joyce and Song developed the **generalized Donaldson–Thomas invariant** $\overline{\mathrm{DT}}^\alpha(\tau) \in \mathbb{Q}$ for a Calabi–Yau 3-fold $X$, a class $\alpha \in K_0^{\mathrm{num}}(\mathrm{Coh}\, X)$, and a stability condition $\tau$ (in the sense of [@bridgeland2007]). These extend the classical Thomas–Donaldson invariants (defined for active objects only) to **strictly semistable** objects via a weighted sum encoded in the stack structure of the moduli of semistable sheaves.

**Main results:**

1. **Definition of $\overline{\mathrm{DT}}^\alpha(\tau)$.** A motivic-Hall-algebra construction giving a $\mathbb{Q}$-valued count of semistable sheaves of class $\alpha$, well-defined and finite under standard hypotheses (Calabi–Yau 3-fold, suitable boundedness conditions).

2. **Wall-crossing formula.** For two stability conditions $\tau_+$ and $\tau_-$ on opposite sides of a wall in $\mathrm{Stab}(\mathcal{D})$, the difference

$$\overline{\mathrm{DT}}^\alpha(\tau_+) \;-\; \overline{\mathrm{DT}}^\alpha(\tau_-) \;=\; \sum_{\alpha = \alpha_1 + \cdots + \alpha_n} U(\alpha_1, \ldots, \alpha_n; \tau_+, \tau_-) \cdot \prod_i \overline{\mathrm{DT}}^{\alpha_i}(\tau_0)$$

with explicit combinatorial coefficients $U$ depending on the wall geometry. The sum is over decompositions of $\alpha$ into pieces destabilized at the wall.

For the corpus's openness-defect direction, sub-question 6 of the [openness-defect deformation theory question](questions/openness-defect-deformation-theory.md) asks for the analog of a wall-crossing formula: a precise expression relating the openness-defect class on the cellular side to the obstruction structure at the openness boundary. Joyce–Song's framework supplies the structural template — wall-crossing as a sum over decompositions weighted by combinatorial geometric data — but the corpus's setting is technically distinct enough that direct transfer is not available:

- Joyce–Song works in derived categories of coherent sheaves on Calabi–Yau 3-folds; the corpus works in Q-enriched sheaves on bitopological settling sites.
- Joyce–Song's invariants are $\mathbb{Q}$-valued; the corpus's analog would be bilattice-valued, with the trichotomy $\delta = \delta^+ + \delta^- + \delta^\top$ from the [openness-boundary deformation dichotomy](../theorems/openness-boundary-deformation-dichotomy.md) giving three coupled wall-crossing formulae rather than one. The truth-side and falsity-side components might satisfy parallel formulae; the consistency-relation component $\delta^\top$ is structurally novel and may have no direct $\mathbb{Q}$-valued analog.
- The wall geometry differs: Joyce–Song's walls live in $\mathrm{Stab}(\mathcal{D})$ (stability-condition space, a complex manifold of dimension $\mathrm{rk}\, K_0$); the corpus's walls live in the bitopological-site sheaf-space, with categorical openness as the stratifying invariant rather than stability of objects.

**What is genuinely new for the corpus.** No published wall-crossing formula uses categorical openness as the stratifying invariant or has bilattice-valued multiplicities. The corpus's analog is genuinely novel mathematics; Joyce–Song supplies the structural template for what such a formula should look like, but the actual formula and its coefficient combinatorics are corpus development work.

## Where used

- [Openness-defect deformation theory question](questions/openness-defect-deformation-theory.md)
- [Openness-defect deformation literature](prose/teaching/explanations/openness-defect-deformation-literature.md)
- [Deformation-theory opener](prose/teaching/explanations/deformation-theory-opener.md)
