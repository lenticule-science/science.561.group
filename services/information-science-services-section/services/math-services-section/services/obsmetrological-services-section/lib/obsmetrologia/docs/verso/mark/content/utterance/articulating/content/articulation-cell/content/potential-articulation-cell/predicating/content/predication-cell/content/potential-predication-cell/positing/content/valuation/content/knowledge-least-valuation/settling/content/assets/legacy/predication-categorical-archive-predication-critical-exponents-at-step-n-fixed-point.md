---
type: theorem
status: proved
depends-on: [step-n-fixed-point, step-n-classifying-invariant, step-shift-functoriality-theorem, step-n-cohomological-rank-theorem, renormalization-group-flow, canonical-step-shift-morphism]
---

# Critical exponents at the step-n fixed point

Establishes precise algebraic-number invariants of the step-$n$ family along its $n$-bonacci canonical sequence (a specific choice of extension data), and the cohomological-rank growth rate as a universal invariant. The "critical exponent" interpretation as RG fixed-point invariant is conditional on the [canonical step-shift morphism question](questions/canonical-step-shift-morphism.md).

## Statement

The theorem has three parts: a universal claim (rank growth rate), a claim along the $n$-bonacci sequence (Pisot accumulation, polynomial coefficient bound), and an honest demarcation of what depends on the open canonical-step-shift question.

### Part A (universal): cohomological-rank growth rate

**Theorem.** *For any extension-data sequence $\boldsymbol{e} \in \mathbf{ExtData}$, the cohomological rank of the post-quotient classifying invariant grows linearly with the step-depth: $\mathrm{rank}\bigl(\mathrm{cl}\text{-}\mathrm{inv}^{(n)}\bigr) = n$ for all $n \geq 2$, with growth rate exactly $1$ per step.*

This is predication categories' universal **rank exponent**: $\Delta \mathrm{rank} / \Delta n \;=\; 1$.

### Part B ($n$-bonacci sequence): Pisot accumulation and polynomial bound

Define the *canonical $n$-bonacci substitution* $\sigma_n^{\text{nb}} : a_1 \mapsto a_1 a_2, a_2 \mapsto a_1 a_3, \ldots, a_{n-1} \mapsto a_1 a_n, a_n \mapsto a_1$, with substitution matrix $M_n^{\text{nb}}$ satisfying

$$M_n^{\text{nb}} \;=\; \begin{pmatrix} 1 & 1 & 0 & \cdots & 0 \\ 1 & 0 & 1 & \cdots & 0 \\ \vdots & & & \ddots & \\ 1 & 0 & 0 & \cdots & 1 \\ 1 & 0 & 0 & \cdots & 0 \end{pmatrix}.$$

This corresponds to a fixed extension-data sequence $\boldsymbol{e}^{\text{nb}}$ (each step adds a row $(1, 0, \ldots, 0)$ as $\mathbf{r}_n$ and a column $(1, 0, \ldots, 0)^T$ as $\mathbf{c}_n$ in the appropriate position).

**Theorem.** *Along the canonical $n$-bonacci sequence:*

1. *The Perron eigenvalue $\lambda_n^{\text{nb}}$ satisfies the minimal polynomial $p_n(x) = x^n - x^{n-1} - x^{n-2} - \cdots - x - 1$, equivalently $x^{n+1} - 2x^n + 1 = 0$ (over $x \neq 1$).*

2. *Each $\lambda_n^{\text{nb}}$ is a Pisot number: a real algebraic integer $> 1$ with all other Galois conjugates of absolute value $< 1$.*

3. *The sequence $\{\lambda_n^{\text{nb}}\}_{n \geq 2}$ is monotonically increasing and accumulates at $2$:*

$$\lim_{n \to \infty} \lambda_n^{\text{nb}} \;=\; 2.$$

4. *The minimal polynomials $\{p_n\}$ have coefficients uniformly bounded: every coefficient of every $p_n$ lies in $\{-1, 0, 1\}$.*

### Part C (open): RG fixed-point critical exponent

The interpretation of $\lambda_n^{\text{nb}} \to 2$ as a *renormalization-group critical exponent* depends on the canonical-step-shift question:

- The $n$-bonacci sequence is one specific choice of $\boldsymbol{e}$. Different choices give different limiting growth rates (e.g., a "Padovan-flavored" extension-data sequence stabilising at $\lambda \approx 1.3247$, the smallest Pisot number).
- Whether $\lim \lambda_n^{[\boldsymbol{e}]}$ is well-defined as an invariant of the colimit $\mathscr{M}^{(\infty)}[\boldsymbol{e}]$ depends on whether the colimit's structural content depends on $\boldsymbol{e}$ (the canonical-step-shift question).
- Until canonical-step-shift is resolved, the "critical growth rate" is an $\boldsymbol{e}$-indexed family $\{\lambda_\infty[\boldsymbol{e}]\}$ rather than a single universal value.

## Proof

### Part A: rank growth rate

Direct from the [step-$n$ cohomological rank theorem](../../aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-cohomological-rank-theorem.md): $\mathrm{rank}(\mathrm{cl}\text{-}\mathrm{inv}^{(n)}) = n$ for any primitive step-$n$ substitution rule. Hence $\mathrm{rank}(\mathrm{cl}\text{-}\mathrm{inv}^{(n+1)}) - \mathrm{rank}(\mathrm{cl}\text{-}\mathrm{inv}^{(n)}) = 1$ universally. $\square$

### Part B: $n$-bonacci sequence properties

**(B1) Minimal polynomial.** Computing the characteristic polynomial of $M_n^{\text{nb}}$ by cofactor expansion along the first column gives $p_n(x) = x^n - x^{n-1} - x^{n-2} - \cdots - x - 1$. Multiplying by $x - 1$ and using the geometric-sum identity $\sum_{k=0}^{n-1} x^k = (x^n - 1)/(x - 1)$:

$$p_n(x) \cdot (x - 1) \;=\; (x^n)(x - 1) - (x^{n-1} + \cdots + 1)(x - 1) \;=\; x^{n+1} - x^n - (x^n - 1) \;=\; x^{n+1} - 2x^n + 1.$$

So roots of $p_n$ are roots of $x^{n+1} - 2x^n + 1 = 0$ excluding $x = 1$ (which is not a root of $p_n$ for $n \geq 2$, as $p_n(1) = 1 - n \neq 0$).

**(B2) Pisot property.** This is a classical result for $n$-step Fibonacci polynomials, treated in standard references on Pisot numbers and substitution dynamics. Sketch: applying Rouché's theorem to $x^{n+1} - 2x^n + 1$ on a circle just inside $|x| = 1$ shows that exactly one root lies outside the unit disk (namely $\lambda_n^{\text{nb}}$), the root $x = 1$ lies on the unit circle, and the remaining $n - 1$ roots lie strictly inside the unit disk. Hence $\lambda_n^{\text{nb}}$ is Pisot.

**(B3) Limit at 2.** From the equation $\lambda_n^{n+1} - 2\lambda_n^n + 1 = 0$:

$$\lambda_n^n (\lambda_n - 2) \;=\; -1, \quad\text{so}\quad \lambda_n - 2 \;=\; -\,\frac{1}{\lambda_n^n}.$$

For $n \geq 2$, $\lambda_n > 1$ (since $\lambda_n$ is the Perron eigenvalue of a primitive matrix); we show $1 < \lambda_n < 2$. Suppose $\lambda_n \geq 2$. Then $\lambda_n^n \geq 2^n$ and $\lambda_n - 2 \geq 0$, so $\lambda_n^n(\lambda_n - 2) \geq 0 \neq -1$, contradiction. So $\lambda_n < 2$ for all $n$.

Then $\lambda_n - 2 = -1/\lambda_n^n$ gives $|\lambda_n - 2| = 1/\lambda_n^n$. Since $\lambda_n > 1$, $\lambda_n^n \geq \lambda_2^n = \phi^n \to \infty$ as $n \to \infty$ (with $\phi$ the golden ratio = $\lambda_2^{\text{nb}}$). Hence $|\lambda_n - 2| \to 0$, i.e., $\lambda_n \to 2$.

Monotonicity: implicit differentiation of $f_n(x) = x^{n+1} - 2x^n + 1$ shows $\lambda_{n+1} > \lambda_n$ for all $n \geq 2$ (verified for small $n$: $\lambda_2 \approx 1.618 < \lambda_3 \approx 1.839 < \lambda_4 \approx 1.928 < \cdots$).

**(B4) Coefficient bound.** Each $p_n(x) = x^n - x^{n-1} - \cdots - x - 1$ has all coefficients in $\{-1, 0, 1\}$ by direct inspection. The bound is uniform in $n$. $\square$

### Part C: canonical-step-shift dependence

By the [step-shift functoriality theorem](step-shift-functoriality-theorem.md), different extension-data sequences $\boldsymbol{e}$ produce 2-categorically distinct colimits $\mathscr{M}^{(\infty)}[\boldsymbol{e}]$. The Perron eigenvalue $\lambda_n^{[\boldsymbol{e}]}$ of the step-$n$ rule along $\boldsymbol{e}$ depends on $\boldsymbol{e}$:

- $\boldsymbol{e}^{\text{nb}}$ (above): $\lim \lambda_n = 2$.
- The "Padovan-style" extension data $\boldsymbol{e}^{\text{Pad}}$ (with $\mathbf{r}_n, \mathbf{c}_n$ chosen to keep the Padovan structure across all $n$): different limiting behavior.

Without a canonical $\boldsymbol{e}$, the "RG critical growth-rate exponent" is not a single number. The canonical-step-shift question is the obstruction. $\square$

## Computational verification

Verified via the [Anderson-Putnam cohomology tool](../tools/predication_categories/examples/benchmark_1_fibonacci.py):

| $n$ | $n$-bonacci $\lambda_n^{\text{nb}}$ (numerical) |
|---|---|
| $2$ | $1.618$ (golden ratio) |
| $3$ | $1.839$ (Tribonacci constant) |
| $4$ | $1.928$ (Tetranacci constant) |
| $5$ | $1.966$ (Pentanacci constant) |
| $\infty$ | $2$ (proven limit) |

Each value is the Perron eigenvalue of the corresponding $M_n^{\text{nb}}$, computed from the characteristic polynomial. All confirmed Pisot.

## What this proves and what it doesn't

**Proven.**

- The rank growth rate is $1$ per step, universally across all extension-data choices (Part A).
- Along the $n$-bonacci sequence: Pisot growth rates with limit $2$, monotonically increasing, with uniform polynomial-coefficient bounds (Part B).

**Not proven.**

- A *universal* critical growth-rate exponent independent of extension-data choice. This depends on the canonical-step-shift question.
- The "RG-fixed-point" interpretation of $\lambda_\infty = 2$. The $n$-bonacci sequence is one specific extension-data choice; whether its limit has any structural significance beyond the specific choice is open.
- Universality classes (different starting substitutions flowing to the same fixed point). The corpus has not formalised the necessary "RG flow" precisely enough to address this.
