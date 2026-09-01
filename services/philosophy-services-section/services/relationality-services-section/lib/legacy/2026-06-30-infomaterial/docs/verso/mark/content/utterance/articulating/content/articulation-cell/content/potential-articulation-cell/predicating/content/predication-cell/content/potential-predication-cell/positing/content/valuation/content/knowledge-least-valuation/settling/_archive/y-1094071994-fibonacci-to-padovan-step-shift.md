---
kind: example
status: verified
depends-on: [step-shift-morphism, padovan-substitution-settling, fibonacci-substitution-settling, step-n-moduli-substack]
instantiates: [step-shift-morphism]
lineage: 5
---

# Fibonacci → Padovan-style via step-shift

Concrete instance of the [step-shift morphism](../morphisms/step-shift-morphism.md) $\sigma_2^3 : \mathscr{M}^{(2)} \to \mathscr{M}^{(3)}$ applied to Fibonacci.

## Setup

Start with the Fibonacci substitution rule: $M_{\text{Fib}} = \begin{pmatrix} 1 & 1 \\ 1 & 0 \end{pmatrix}$ in $\mathscr{M}^{(2)}$.

Apply the step-shift extension with $\mathbf{c} = (1, 0)^T, \mathbf{r} = (1, 0)$:

$$\sigma_2^3(M_{\text{Fib}}) \;=\; \begin{pmatrix} 1 & 1 & 1 \\ 1 & 0 & 0 \\ 1 & 0 & 0 \end{pmatrix}.$$

This is the matrix of a step-3 substitution rule. **It's not Padovan's matrix** — Padovan's is $\begin{pmatrix} 0 & 1 & 0 \\ 0 & 0 & 1 \\ 1 & 1 & 0 \end{pmatrix}$, structurally different.

## Comparison with Padovan

The step-shifted Fibonacci and the Padovan substitution are *both* step-3 rules in $\mathscr{M}^{(3)}$ — distinct meta-points. Their classifying invariants are both $\mathbb{Z}^3$ (by the rank theorem), but with different matrix actions.

## What this exhibits

**The step-shift morphism doesn't take Fibonacci to Padovan as a specific substitution.** Different choices of step-shift extension vectors $(\mathbf{c}, \mathbf{r})$ produce different step-3 rules. The step-shift's "specific output" depends on the extension-vector choice; the Fibonacci → Padovan trajectory requires a specific (non-canonical) choice that's structurally meaningful.

This raises the open question: **is there a *canonical* step-shift morphism**, or is the step-shift inherently a multi-valued operation depending on extension-vector choice?

## Position in Lineage 5

Cross-step example exhibiting the step-shift morphism on a concrete case. Demonstrates the morphism's nature: it produces *some* step-$(n+1)$ rule from a step-$n$ rule, but not a canonical one in general.
