---
type: example
status: draft
depends-on: [step-n-substitution-rule, step-n-cohomological-rank-theorem, step-n-meta-stratification, fibonacci-substitution-settling, padovan-substitution-settling, tetranacci-substitution-settling]
instantiates: [step-n-substitution-rule, step-n-cohomological-rank-theorem, step-n-meta-stratification]
lineage: 5
---

# Step-n generic substitution template

A parameterized example demonstrating the [step-$n$ substitution rule](../objects/step-n-substitution-rule.md) framework at arbitrary $n \geq 2$. **L5g**: the template instance, providing a concrete recipe for instantiating predication categories' framework at any step-depth.

## The generic step-$n$ substitution

Given $n \geq 2$, define a step-$n$ substitution $\sigma_n$ on alphabet $\{a_1, a_2, \ldots, a_n\}$ by:

$$\sigma_n(a_i) \;=\; \begin{cases} a_1 a_{i+1} & i < n \\ a_1 & i = n \end{cases}.$$

Substitution matrix:

$$M_n \;=\; \begin{pmatrix} 1 & 1 & 1 & \cdots & 1 \\ 1 & 0 & 0 & \cdots & 0 \\ 0 & 1 & 0 & \cdots & 0 \\ \vdots & \ddots & \ddots & \ddots & \vdots \\ 0 & \cdots & 0 & 1 & 0 \end{pmatrix} \in \mathrm{Mat}_{n \times n}(\mathbb{N}).$$

This is the canonical step-$n$ substitution (one of several possible choices).

## Properties at general $n$

Following the step-$n$ family's structural theorems:

| $n$ | Growth rate | Cohomological rank | Bilattice correspondence |
|---|---|---|---|
| 2 | $\phi \approx 1.618$ | 2 | 2 axes (Fibonacci-like) |
| 3 | $\rho \approx 1.3247$ (Padovan) or other Pisot | 3 | 3 non-bottom values |
| 4 | tetranacci constant $\approx 1.9276$ | 4 | 4 full values |
| 5 | pentanacci constant $\approx 1.965$ | 5 | (no bilattice correspondence) |
| ... | ... | ... | ... |

The growth rates form a sequence of Pisot numbers; cohomological ranks grow linearly with $n$; bilattice correspondences exist only at $n = 2, 3, 4$.

## Settling at $E = \omega_1$

For each $n$, the step-$n$ generic substitution at $E = \omega_1$ produces an aperiodic settling with closure ordinal $\kappa = \omega_1$, classifying invariant $\mathbb{Z}^n$ (post-shift-quotient), and meta-classification in $\mathscr{M}^{(n)}$.

## RG flow on the template

The step-shift morphism $\sigma_n^{n+1}$ acts on the generic step-$n$ substitution by extending the matrix:

$$M_{n+1} \;=\; \begin{pmatrix} M_n & \mathbf{c}_n \\ \mathbf{r}_n & 0 \end{pmatrix}$$

with specific extension vectors $\mathbf{c}_n, \mathbf{r}_n$ chosen for primitivity. The successive applications of $\sigma$ produce a coherent ascending chain of step-$n$ rules, all in the canonical-step-$n$ family.

## What this exhibits

The corpus's step-$n$ framework operates *uniformly* across all $n \geq 2$. The framework's structural theorems (rank, stratification, functoriality, RG flow) apply to every step-$n$ rule, not just specific known cases (Fibonacci, Padovan, Tetranacci). The template demonstrates the framework's *parameterized* nature.

## Position in Lineage 5g

The L5g template instance. Demonstrates the step-$n$ family's universal structure beyond the specific named cases of Fibonacci, Padovan, Tribonacci, Tetranacci.
