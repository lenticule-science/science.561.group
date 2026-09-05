---
name: cosmic-scott-skeleton
kind: object
symbol: "M_w (Fibonacci, n=2)"
description: "The Fibonacci (step-2) substitution skeleton of the cosmic-scott thermalization — the object H₀ is read on. Cosmic-scott is λ_2 on the proved n-bonacci RG flow, i.e. the Fibonacci skeleton (a→ab, b→a), whose unweighted Perron eigenvalue is the golden φ. Because the cosmos is continuous-valued, the skeleton carries per-letter weights w_a, w_b, and the growth rate is the WEIGHTED dominant eigenvalue λ_w of M_w — bare φ is only its uniform-weight shadow."
member-of: weighted-tropical-reading
kind-of: substitution-skeleton
status: hacking
---

**The cosmic-scott skeleton** is the substitution skeleton on which $H_0$ is read.

By the n-bonacci grounding ([`cosmic-regimes-as-nbonacci-rg-flow`](../../../../../../../../../../../../docs/dev/cosmic-regimes-as-nbonacci-rg-flow.md)), cosmic-scott is $\lambda_2$ on the proved RG flow — the **Fibonacci skeleton** $a \mapsto ab,\ b \mapsto a$, matrix $M = \begin{pmatrix}1&1\\1&0\end{pmatrix}$, unweighted Perron eigenvalue the golden ratio $\varphi$.

## Weighted, because the cosmos is continuous-valued

The corpus's continuous-valued step-$n$ theorem replaces $M$ by the **weighted matrix** $M_w$ with per-letter weights $w_a, w_b$ carrying the continuous scale-factor data.
The growth rate is then the **weighted dominant eigenvalue** $\lambda_w$, *not* bare $\varphi$.
Benchmark §2D confirms: at uniform weights $w=1$, $\lambda_w$ recovers $\varphi$ exactly — so **bare φ is the uniform-weight shadow of this object.** The verified closed forms (benchmark §2E) are

$$\lambda_w^{\max} = \max\!\big(w_a,\tfrac{w_a+w_b}{2}\big), \qquad \lambda_w^{\min} = \min\!\big(w_a,\tfrac{w_a+w_b}{2}\big).$$

## What it generates

The two duals of $\lambda_w$ are read by the two pipelines; their gap is the [`duality-gap`](../duality-gap/duality-gap.md).
That the two duals are forced (not an ad-hoc choice) is the [`conflating`](../conflating/conflating.md) morphism.
The identification of $H_0$ with $\lambda_w$ at a stage refines the cell's [hubble-constant](../../../../../../observable/library/hubble-constant/hubble-constant.md); the weights themselves are the open [`scale-factor-calibration`](../../hacking/library/scale-factor-calibration/scale-factor-calibration.md).
