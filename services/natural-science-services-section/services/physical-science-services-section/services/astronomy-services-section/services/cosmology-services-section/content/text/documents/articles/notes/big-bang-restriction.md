---
name: big-bang-restriction
kind: morphism
symbol: "ψ: n-bonacci(3) ↠ n-bonacci(2)"
description: "The Big Bang IS the delete-last-letter restriction of the canonical n-bonacci tower at n=3→n=2 (Tribonacci ↠ Fibonacci). Deleting the highest letter c from the Tribonacci substitution (a→ab, b→ac, c→a) yields exactly the Fibonacci substitution (a→ab, b→a) — verified, and general: delete-last(n-bonacci) = (n−1)-bonacci for all n. So the whole cosmic descent (aperiodic n→∞ → … → transfinite 3 → scott 2) is one tower linked by these restrictions, and the Big Bang is its 3→2 instance. The deleted letter c is what makes the surviving Fibonacci weights unequal (w_a ≠ w_b) — so the weight asymmetry of scale-factor-calibration is sourced by the restriction, a step-shift of the corpus's own canonical family."
member-of: scale-factor-calibration
kind-of: step-restriction
domain: cosmic-transfinite-predication
codomain: cosmic-scott-posit
status: hacking
title: big-bang-restriction
---

**The big-bang-restriction** identifies the Big Bang as a *named corpus morphism*: the **delete-last-letter restriction** of the canonical n-bonacci substitution family at the $3 \to 2$ step.
The placement question is not "what foreign cosmology map calibrates the weights," it was **"what category is this, and what restriction of the canonical family produces it."**

## The restriction (verified, exact)

The canonical n-bonacci substitution (from the critical-exponents theorem) is $a_1 \mapsto a_1 a_2,\ \dots,\ a_{n-1}\mapsto a_1 a_n,\ a_n \mapsto a_1$.
The restriction **deletes the highest letter** (strikes it from the alphabet and from every image):

- **Tribonacci** ($n=3$, cosmic-transfinite, $\lambda_3 \approx 1.839$): $a\mapsto ab,\ b\mapsto ac,\ c\mapsto a$.
- delete $c$ → $a\mapsto ab,\ b\mapsto a$ = **Fibonacci** ($n=2$, cosmic-scott, $\lambda_2 = \varphi$). **Exact.**

At the matrix level this is literal row/column deletion (delete row $c$ and column $c$ from $M_{\text{trib}}=\begin{pmatrix}1&1&1\\1&0&0\\0&1&0\end{pmatrix}$ gives $\begin{pmatrix}1&1\\1&0\end{pmatrix}=M_{\text{fib}}$) — i.e. the corpus's **step-shift functoriality** run *downward* (a restriction, not an extension).

## General: the whole cosmic tower is this one morphism iterated

Verified for $n=3,\dots,7$: $\text{delete-last}(n\text{-bonacci}) = (n-1)\text{-bonacci}$.
So the cosmic descent is **one tower linked by delete-last restrictions**:

$$\text{aperiodic } (n\to\infty) \;\to\; \cdots \;\to\; \text{transfinite } (3) \;\xrightarrow{\ \psi\ }\; \text{scott } (2).$$

The **Big Bang is the $3\to2$ instance** (quantum → classical = Tribonacci ↠ Fibonacci).
And [`cosmic-finite`](../../../../../../../../physics-services-section/content/text/documents/articles/notes/cosmic-finite-thermalization-algebra.md) (plastic ρ) is **off** the n-bonacci sequence — it is *leaving the tower entirely*, which is exactly heat death (the tower's restrictions never reach it; ρ is a different family's IR endpoint).

## It sources the weight asymmetry (the calibration link)

The deleted letter $c$ couples asymmetrically to the survivors: in Tribonacci $a\leftarrow c$ ($a$ is fed by $c$) and $c\leftarrow b$ ($c$ is fed by $b$), so deleting $c$ cuts the $b\to c\to a$ relay — it **de-weights $b$ but not $a$**.
So $w_a \neq w_b$ on the Fibonacci skeleton is *sourced by which letter the restriction deleted*.
This is why [`scale-factor-calibration`](scale-factor-calibration.md) is **not** a foreign cosmology map: the asymmetry is internal to the corpus restriction.

## General form

This is the canonical pattern: a placement question in this math is "what category is this, and what extension/restriction of a known family reaches it"; the formulas (eigenvalues, weights, tensions) are cellular fibers over that categorical answer.
Here: the Big Bang is a restriction of the n-bonacci family, and the Hubble numbers are fibers over it.
