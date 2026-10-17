---
kind: example
status: draft
depends-on: [step-n-cohomological-rank-theorem, tribonacci-substitution-settling, padovan-classifying-invariant]
instantiates: [step-n-cohomological-rank-theorem]
lineage: 5
---

# Tribonacci classifying invariant

The L5e instance — same rank as Padovan ($\mathbb{Z}^3$) but distinct as a classifying-invariant.

## Post-quotient invariant

By the step-n cohomological rank theorem at $n = 3$:

$$\mathrm{cl}\text{-}\mathrm{inv}^{(3)}(v_{\text{Tribonacci}}) \;=\; \mathbb{Z}^3.$$

Same group as Padovan's. **The invariants are isomorphic-as-groups but distinct under the substitution-matrix action.**

## Distinguishing from Padovan

The substitution matrices act differently on $\mathbb{Z}^3$:

- $M_{\text{Padovan}} = \begin{pmatrix} 0 & 1 & 0 \\ 0 & 0 & 1 \\ 1 & 1 & 0 \end{pmatrix}$, eigenvalue $\rho$.
- $M_{\text{Tribonacci}} = \begin{pmatrix} 1 & 1 & 1 \\ 1 & 0 & 0 \\ 0 & 1 & 0 \end{pmatrix}$, eigenvalue $\tau$.

These matrices are not conjugate over $\mathbb{Z}$ (different traces, different determinants, different characteristic polynomials). So the *full* classifying invariant — group plus matrix-action — distinguishes Tribonacci and Padovan.

## What this exhibits

**The rank-$n$ theorem is necessary but not sufficient for MLD-equivalence within step-$n$.** Two step-3 substitutions can have isomorphic-as-groups classifying invariants ($\mathbb{Z}^3$ both) but be MLD-distinct due to different matrix actions. The full classification within $\mathscr{M}^{(3)}$ requires substitution-matrix conjugacy or Bratteli-Vershik diagram invariants.

## Position in Lineage 5e

Demonstrates the corpus's framework on a step-3 substitution distinct from Padovan. Confirms the rank-3 prediction; surfaces the open question of intra-rank classification. Pairs forward with [tribonacci-anderson-putnam-comparison](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/tribonacci-anderson-putnam-comparison.md) for the literature comparison and full Tribonacci-vs-Padovan AP-distinguishment.
