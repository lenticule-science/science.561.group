---
type: theorem
status: proved
depends-on: [step-n-substitution-rule, step-n-fixed-point, critical-exponents-at-step-n-fixed-point]
title: The $n$-bonacci Pisot accumulation point equals dominant image length
description: The Pisot-accumulation-toward-two question asked whether the limit $\limn \lambdan^{\text{nb}} = 2$ (the $n$-bonacci sequence converging to 2) is structural or numerology.
---

# The $n$-bonacci Pisot accumulation point equals dominant image length

The [Pisot-accumulation-toward-two question](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/step-n-fixed-point/docs/dev/questions/pisot-accumulation-toward-two.md) asked whether the limit $\lim_n \lambda_n^{\text{nb}} = 2$ (the $n$-bonacci sequence converging to 2) is structural or numerology. **It's structural**: a Perron-Frobenius weighted-average argument shows the limit equals the dominant per-letter image length, which for the $n$-bonacci family is 2.

## Statement

**Theorem (Pisot accumulation = dominant image length).** *Let $\{\sigma_n\}_{n \geq 2}$ be a sequence of primitive non-singular substitutions where $\sigma_n$ acts on an alphabet of size $n$ with image lengths $\ell_n(a_i) := |\sigma_n(a_i)|$ and Perron eigenvalue $\lambda_n$. If the proportion of letters with non-dominant image length tends to zero in the Perron-eigenvector weight, then $\lim_n \lambda_n = L$ (the dominant length).*

For the $n$-bonacci family: $\ell_n(a_i) = 2$ for $i < n$ and $\ell_n(a_n) = 1$. Dominant length $L = 2$. The Perron-eigenvector weight on $a_n$ tends to 0 as $n \to \infty$. Hence $\lim_n \lambda_n = 2$.

## Proof

The key fact: for a primitive non-singular substitution $\sigma$ on alphabet $\{a_1, \ldots, a_n\}$ with substitution matrix $M$, the Perron eigenvalue $\lambda$ satisfies the **weighted-average formula**

$$\lambda = \sum_{i=1}^n v_i \cdot \ell(a_i)$$

where $\ell(a_i) = |\sigma(a_i)| = \sum_j M_{ij}$ is the image length and $v = (v_1, \ldots, v_n)$ is the **normalised left-Perron eigenvector** of $M$ ($\sum_i v_i = 1$, $vM = \lambda v$).

*Derivation.* Left-eigenvector condition: $\sum_i v_i M_{ij} = \lambda v_j$ for each $j$. Sum over $j$:

$$\sum_j \lambda v_j = \sum_j \sum_i v_i M_{ij} = \sum_i v_i \sum_j M_{ij} = \sum_i v_i \ell(a_i).$$

LHS $= \lambda \sum_j v_j = \lambda \cdot 1 = \lambda$. Hence $\lambda = \sum_i v_i \ell(a_i)$. $\square$

This is the standard Perron-Frobenius weighted-average formula: $\lambda$ is the typical per-letter image length, weighted by asymptotic letter-frequencies (the left-Perron eigenvector).

**Convergence.** Define $v_{\neq L}^{(n)} := \sum_{i : \ell_n(a_i) \neq L} v_i^{(n)}$. Assume $v_{\neq L}^{(n)} \to 0$ as $n \to \infty$. Then

$$\lambda_n = L \cdot (1 - v_{\neq L}^{(n)}) + \sum_{i : \ell_n(a_i) \neq L} v_i^{(n)} \cdot \ell_n(a_i).$$

Bounded $\ell$ and $v_{\neq L}^{(n)} \to 0$ implies the second term goes to 0 and the first to $L$. Hence $\lambda_n \to L$. $\square$

## Verification on $n$-bonacci

**Tribonacci ($n = 3$).** $M_3 = \begin{pmatrix} 1 & 1 & 0 \\ 1 & 0 & 1 \\ 1 & 0 & 0 \end{pmatrix}$. Left-Perron eigenvector $v \propto (\tau^2, \tau, 1)$ where $\tau \approx 1.839$ (tribonacci constant: $\tau^3 = \tau^2 + \tau + 1$).

Numerical: $\tau^2 \approx 3.383$, sum $\tau^2 + \tau + 1 \approx 6.222$. Normalized $v \approx (0.544, 0.295, 0.161)$.

Weighted image length: $0.544 \cdot 2 + 0.295 \cdot 2 + 0.161 \cdot 1 = 1.088 + 0.590 + 0.161 = 1.839 \approx \tau$. ✓

The weight on $a_3$ (the only letter with image length 1) is 0.161; this tends to 0 as $n$ grows, with $v_n^{(n)} \sim \lambda_n^{-n}$. So $v_{\neq 2}^{(n)} \to 0$ and $\lambda_n \to 2$.

## Connection to other substitution families

The theorem applies to any primitive non-singular family where the Perron eigenvector concentrates on dominant-length letters. Variations:

- **Constant-length-$\ell$ substitutions**: $\ell(a_i) = \ell$ for all $i$. Then $\lambda = \ell$ exactly (not just asymptotically). Recovered as a degenerate case.
- **Padovan-style families**: Padovan has image lengths $(1, 1, 2)$ — most letters have length 1, but the eigenvector weight is concentrated on $c$ (length 2) by the matrix's specific structure. The weighted average is $\rho \approx 1.3247$ (plastic number), not 1 or 2. The theorem doesn't apply *directly* — there's no dominant length in the eigenvector-weighting sense — but the same Perron-Frobenius formula gives the correct $\rho$.
- **Non-Pisot families** (e.g., the choice-3 step-3 from [canonical-step-shift-resolution](canonical-step-shift-resolution.md)): the formula gives the correct Perron eigenvalue regardless of Pisot status.

## Implications

**1. The "$\lim \lambda_n = 2$" result is structural, not numerology.** The limit is the dominant image length of the $n$-bonacci family by construction.

**2. Different extension-data sequences give different limits.** Per [canonical-step-shift-resolution](canonical-step-shift-resolution.md), the step-shift's extension data isn't canonical. Different choices produce different image-length structures, hence different $\lambda$-limits. The "$\lim \lambda_n = 2$" is the limit *for the $n$-bonacci family specifically*.

**3. Image-length structure determines limit growth rate.** A clean structural prediction: tell me the dominant image length and the eigenvector concentration, I'll tell you the limit growth rate. For families without dominant length, the limit is a non-trivial weighted average.

**4. Two complementary proofs of the same fact.** The [critical-exponents-at-step-n-fixed-point theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/critical-exponents-at-step-n-fixed-point.md) proved $\lim \lambda_n^{\text{nb}} = 2$ via a polynomial identity $\lambda_n^n(\lambda_n - 2) = -1$; this theorem proves it via Perron-Frobenius weighted averaging. The polynomial proof gives exact rate of convergence; the eigenvector proof gives structural reason (dominant image length). Both proofs are correct; they illuminate different aspects.
