---
kind: example
status: draft
depends-on: [step-n-cohomological-rank-theorem, padovan-substitution-settling, fibonacci-classifying-invariant]
instantiates: [step-n-cohomological-rank-theorem, aperiodic-regime-classification]
lineage: 5
type: example
---

# Padovan classifying invariant

The L5d instance of the [step-n cohomological rank theorem](../../aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-cohomological-rank-theorem.md) at $n = 3$.

## Pre-quotient invariant

For the Padovan settling $v_{\text{Padovan}}$ at $E = \omega_1$:

$$\mathrm{cl}\text{-}\mathrm{inv}(v_{\text{Padovan}}) \;\in\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\omega_1)} \mathbb{Z}$$

— uncountable rank.

## Post-quotient invariant

By the step-n cohomological rank theorem at $n = 3$:

$$\mathrm{cl}\text{-}\mathrm{inv}^{(3)}(v_{\text{Padovan}}) \;:=\; \mathrm{cl}\text{-}\mathrm{inv}(v_{\text{Padovan}}) \big/ \sim_{\mathrm{settling-shift}} \;=\; \mathbb{Z}^3.$$

The 3 generators correspond to the 3 substitution letters $\{a, b, c\}$.

## Action by substitution matrix

The Padovan substitution matrix $M = \begin{pmatrix} 0 & 1 & 0 \\ 0 & 0 & 1 \\ 1 & 1 & 0 \end{pmatrix}$ acts on $\mathbb{Z}^3$. The substitution-shift orbit structure is determined by $M$'s action — distinguishes Padovan from other step-3 substitutions (e.g., Tribonacci with a different matrix).

## Position in Lineage 5d

The L5d post-quotient invariant. Compare with [fibonacci-classifying-invariant](fibonacci-classifying-invariant.md) ($\mathbb{Z}^2$) and [tribonacci-classifying-invariant](tribonacci-classifying-invariant.md) (forthcoming, also $\mathbb{Z}^3$ but with different matrix action). The corpus's first instance at $n = 3$.
