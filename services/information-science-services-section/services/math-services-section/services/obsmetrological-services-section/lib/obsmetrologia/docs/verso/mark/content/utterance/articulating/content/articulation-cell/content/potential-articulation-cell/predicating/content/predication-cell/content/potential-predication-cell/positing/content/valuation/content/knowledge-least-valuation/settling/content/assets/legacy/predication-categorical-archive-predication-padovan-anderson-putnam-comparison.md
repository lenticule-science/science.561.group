---
type: example
status: draft
depends-on: [padovan-classifying-invariant, padovan-substitution-settling, anderson-putnam-direct-limit, fibonacci-anderson-putnam-comparison]
instantiates: [aperiodic-regime-classification]
lineage: 5
---

# Padovan: corpus vs Anderson-Putnam

Side-by-side comparison of predication categories' Padovan classifying invariant with literature Anderson-Putnam computations for the Padovan substitution tiling.

## Anderson-Putnam Padovan computation

For the Padovan substitution acting on tilings of $\mathbb{R}$ with three tile-types corresponding to $\{a, b, c\}$, the Anderson-Putnam complex has:

- 3 vertices (one per tile-type).
- Edges encoding tile-tile adjacency in valid substituted tilings.

The Čech cohomology of the inverse-limit Padovan tiling space:

$$\check{H}^1(\Omega_{\text{Padovan}}) \;\cong\; \mathbb{Z}^3.$$

## Corpus computation

[padovan-classifying-invariant](padovan-classifying-invariant.md) gives the post-quotient corpus invariant: $\mathrm{cl}\text{-}\mathrm{inv}^{(3)} = \mathbb{Z}^3$. **Matches Anderson-Putnam.**

## Plastic number connection

The Padovan substitution's growth rate is $\rho \approx 1.3247$ — the **smallest Pisot number**, the real root of $x^3 - x - 1 = 0$. This is predication categories' first concrete instance where the growth rate equals a Pisot number (Fibonacci's $\phi$ is also Pisot but doesn't sit at the bottom of the Pisot hierarchy).

The plastic number's degree-3 minimal polynomial pairs with $n = 3$ in predication categories' step-$n$ family — confirming the [step-n cohomological rank theorem](../theorems/step-n-cohomological-rank-theorem.md)'s correspondence between $n$ and the algebraic-number-degree.

## What this exhibits

Two observations:

**1. Corpus reproduces Padovan Anderson-Putnam.** Like Fibonacci, predication categories' framework correctly produces the literature's known invariant after appropriate quotient. The framework's correctness is confirmed at $n = 3$ as well as $n = 2$.

**2. The plastic-number / Padovan / step-3 alignment is exact.** Plastic number = Padovan growth rate = $\rho$ = smallest Pisot. Substitution alphabet size = $n = 3$. Cohomological rank = $n = 3$. Minimal polynomial degree = $n = 3$. **All four quantities equal 3 simultaneously**, exemplifying the step-$n$ correspondence's multi-level co-incrementing.

## Position in Lineage 5d

The L5d literature comparison instance. Demonstrates predication categories' framework on the canonical step-3 substitution.
