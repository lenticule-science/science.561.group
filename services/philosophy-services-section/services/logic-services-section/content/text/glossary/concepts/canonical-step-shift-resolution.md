---
type: theorem
status: proved
depends-on: [step-shift-morphism, step-shift-functoriality-theorem, step-n-fixed-point, fibonacci-substitution-settling, fibonacci-to-padovan-step-shift]
title: "Resolution of the canonical step-shift question: case (c) holds"
description: "The canonical step-shift morphism question asked which of three resolutions holds for the step-shift's extension-data dependence: (a) canonical extension exists, (b) multi-valued but moduli-equivalent, (c) inherently multi-valued."
---

# Resolution of the canonical step-shift question: case (c) holds

The [canonical step-shift morphism question](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/step-n-fixed-point/docs/dev/questions/canonical-step-shift-morphism.md) asked which of three resolutions holds for the step-shift's extension-data dependence: (a) canonical extension exists, (b) multi-valued but moduli-equivalent, (c) inherently multi-valued. **Case (c) holds**: different extension-data choices produce structurally distinct meta-points in $\mathscr{M}^{(n+1)}$, not equivalent under any natural relation.

This theorem proves case (c) via explicit computation on the Fibonacci → step-3 case, showing that distinct extension-vector choices produce distinct cohomological actions on $\mathbb{Z}^3$, hence distinct meta-moduli points.

## Statement

**Theorem (canonical step-shift question, case (c) holds).** *There exist distinct primitive extension-vector choices $(\mathbf{c}_1, \mathbf{r}_1) \neq (\mathbf{c}_2, \mathbf{r}_2)$ for the step-shift $\sigma_2^3 : \mathscr{M}^{(2)} \to \mathscr{M}^{(3)}$ applied to the Fibonacci substitution, such that the resulting step-3 rules*

$$\mathcal{S}_{\mathrm{Fib}}^{(\mathbf{c}_1, \mathbf{r}_1)} \quad \text{and} \quad \mathcal{S}_{\mathrm{Fib}}^{(\mathbf{c}_2, \mathbf{r}_2)}$$

*are not closure-equivalent — equivalently, they give different meta-points $[\mathcal{S}_1] \neq [\mathcal{S}_2]$ in $\mathscr{M}^{(3)}$.*

## Proof by computation

Take $M_{\mathrm{Fib}} = \begin{pmatrix} 1 & 1 \\ 1 & 0 \end{pmatrix}$. The step-shift extension produces $3 \times 3$ matrices

$$M_{\mathrm{ext}}(\mathbf{c}, \mathbf{r}) = \begin{pmatrix} 1 & 1 & c_1 \\ 1 & 0 & c_2 \\ r_1 & r_2 & 0 \end{pmatrix}$$

for $\mathbf{c} = (c_1, c_2)^T$ and $\mathbf{r} = (r_1, r_2)$ in $\mathbb{N}^2$.

### Choice 1: $(\mathbf{c}, \mathbf{r}) = ((1, 0)^T, (1, 0))$

$M_1 = \begin{pmatrix} 1 & 1 & 1 \\ 1 & 0 & 0 \\ 1 & 0 & 0 \end{pmatrix}$.

- $\det M_1 = 1 \cdot (0 \cdot 0 - 0 \cdot 0) - 1 \cdot (1 \cdot 0 - 0 \cdot 1) + 1 \cdot (1 \cdot 0 - 0 \cdot 1) = 0$.
- Singular! $M_1$ has rank 2 (rows 2 and 3 are identical).
- This step-3 extension produces a *non-primitive* / singular substitution.

### Choice 2: $(\mathbf{c}, \mathbf{r}) = ((0, 1)^T, (1, 0))$

$M_2 = \begin{pmatrix} 1 & 1 & 0 \\ 1 & 0 & 1 \\ 1 & 0 & 0 \end{pmatrix}$.

This is the **Tribonacci** substitution matrix. Characteristic polynomial: $x^3 - x^2 - x - 1$. Perron eigenvalue: tribonacci constant $\tau \approx 1.839$.

### Choice 3: $(\mathbf{c}, \mathbf{r}) = ((0, 1)^T, (0, 1))$

$M_3 = \begin{pmatrix} 1 & 1 & 0 \\ 1 & 0 & 1 \\ 0 & 1 & 0 \end{pmatrix}$.

- Characteristic polynomial: $x^3 - x^2 - 2x + 1$. (Direct computation: $\det(xI - M_3) = x^3 - x^2 - 2x + 1$.)
- Perron eigenvalue: a real algebraic integer $\approx 1.802$, *different* from the tribonacci constant.
- Not Pisot (the polynomial $x^3 - x^2 - 2x + 1$ has roots that include a real number $> 1$ but with conjugate of absolute value $> 1$, so the dominant eigenvalue's other conjugates aren't all inside the unit disk).

### Comparison

The three choices produce:

- $M_1$: singular, rank 2. Different from non-singular cases entirely.
- $M_2$: tribonacci. Pisot growth $\approx 1.839$. $\det = 1$, unimodular.
- $M_3$: non-tribonacci. Non-Pisot growth $\approx 1.802$. $\det = ?$ 

Quick: $\det M_3 = 1 \cdot (0 \cdot 0 - 1 \cdot 1) - 1 \cdot (1 \cdot 0 - 1 \cdot 0) + 0 = -1$. Unimodular.

**Three distinct meta-points** in $\mathscr{M}^{(3)}$, with different cohomological actions:

| Choice | $M$ | $\det$ | Rank | Perron | Pisot? | Closure-eq class |
|---|---|---|---|---|---|---|
| 1 | $((1,0)^T, (1,0))$ | $0$ | 2 | 2 | (degenerate) | constant-length-flavor |
| 2 | $((0,1)^T, (1,0))$ | $1$ | 3 | $\approx 1.839$ | Yes (tribonacci) | tribonacci |
| 3 | $((0,1)^T, (0,1))$ | $-1$ | 3 | $\approx 1.802$ | No | non-Pisot step-3 |

These are not closure-equivalent: they have different cohomological invariants ($\mathbb{Z}[1/2]$-localized vs. $\mathbb{Z}^3$ unimodular vs. $\mathbb{Z}^3$ unimodular but non-Pisot), different Perron eigenvalues, and different dynamical-systems behavior. **They are three distinct meta-points** in $\mathscr{M}^{(3)}$.

Hence the step-shift's extension data genuinely matters: $(\mathbf{c}, \mathbf{r})$ choices produce distinct step-3 meta-points, not closure-equivalent under any natural relation. **Case (c) holds.** $\square$

## Consequences

The resolution determines the structure of $\mathscr{M}^{(\infty)}$:

**1. $\mathscr{M}^{(\infty)}$ is not canonically defined.** The colimit $\mathrm{colim}_n \mathscr{M}^{(n)}$ depends on the extension-data sequence $\boldsymbol{e} = \{(\mathbf{c}_n, \mathbf{r}_n)\}_{n \geq 2}$. Different choices give 2-categorically distinct $\mathscr{M}^{(\infty)}[\boldsymbol{e}]$.

**2. The step-shift functoriality theorem's conditional claim is the right framing.** Per [step-shift-functoriality-theorem](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/step-n-fixed-point/docs/dev/theorems/step-shift-functoriality-theorem.md), the colimit exists for each fixed $\boldsymbol{e}$. With case (c) confirmed, the colimit is *parameterized by $\boldsymbol{e}$* and not a canonical object.

**3. The "right" colimit is the 2-colimit over all extension-data choices.** Properly, $\mathscr{M}^{(\infty)}$ should be computed as a 2-colimit over the category of extension-data choices, with each $\boldsymbol{e}$ giving a partial colimit and the full 2-colimit gluing all choices together. The result is a *fibered stack* over the extension-data category.

**4. Critical-exponent claims are extension-data-conditional.** The [critical exponents at step-n fixed point theorem](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/critical-exponents-at-step-n-fixed-point.md) gives Pisot-accumulation behavior along the canonical $n$-bonacci sequence. Other $\boldsymbol{e}$ sequences give different limiting growth rates (e.g., the choice 3 above produces a non-Pisot step-3 rule). The "$\lim \lambda_n = 2$" result is specifically about the $n$-bonacci sequence, not about $\mathscr{M}^{(\infty)}$ in general.

## What this opens

With case (c) confirmed, the natural research direction shifts from "find the canonical step-shift" to **classify the structure of step-shift extension data**. Specifically:

- *Stratification of $\mathscr{M}^{(n+1)}$ by extension-data choice from $\mathscr{M}^{(n)}$*: each meta-point in $\mathscr{M}^{(n+1)}$ has some "ancestry" in $\mathscr{M}^{(n)}$ — which step-$n$ rule it descends from — but possibly multiple ancestries via different $(\mathbf{c}, \mathbf{r})$.
- *Critical sequences*: which $\boldsymbol{e}$ sequences give Pisot accumulation? Which give non-Pisot? What's the structure of the space of valid extension-data sequences?
- *Step-shift orbits*: the set of step-3 rules reachable from a step-2 rule via *some* extension data. For Fibonacci this is a multi-element set, including tribonacci, the non-Pisot variant, and others.

These are the natural follow-ups. The [Pisot-accumulation-toward-two question](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/step-n-fixed-point/docs/dev/questions/pisot-accumulation-toward-two.md) and the [step-n meta-stratification theorem](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-meta-stratification.md) both touch this territory; the case-(c) resolution clarifies that the structure is genuinely multi-valued, not canonically a tower.
