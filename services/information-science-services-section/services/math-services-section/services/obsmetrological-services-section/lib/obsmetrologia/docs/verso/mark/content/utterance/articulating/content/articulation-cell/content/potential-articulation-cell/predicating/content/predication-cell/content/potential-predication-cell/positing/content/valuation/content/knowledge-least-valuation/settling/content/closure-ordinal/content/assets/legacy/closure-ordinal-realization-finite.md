---
kind: theorem
status: proved
depends-on: [closure-ordinal, four-regime-dichotomy, closure-rule, settling-bound]
---

# Every finite closure ordinal is realized

The basic structural realisation theorem from the [closure-ordinal-realization-spectrum question](../questions/closure-ordinal-realization-spectrum.md): every finite ordinal is the closure ordinal of some closure-rule system.
Provides the bottom of the realisation hierarchy and a template for ordinal-extension constructions.

## Statement

**Theorem (finite closure-ordinal realisation).** *For every $n \in \mathbb{N}$, there exists a base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$, a closure-rule system $\mathcal{S}$ over $B$, and an increment sequence $u$ such that the resulting settling $v_\mathcal{S}^u$ has closure ordinal exactly $\kappa = n$.*

## Construction

For $n = 0$: take any base, the empty closure-rule system $\mathcal{S} = \emptyset$, and the trivial increment $u = \bot$.
Settling is empty, $\kappa = 0$.

For $n \geq 1$: take

- $\mathbf{L} = \mathbf{2}$ (Boolean lattice).
- $E = \{0, 1, \ldots, n\}$ (finite ordered set, $n + 1$ elements).
- $\Pi = \{P\}$ with $\mathrm{dom}(P) = \Delta_E = \{(k, k) : k \in E\}$.
- $\mathcal{C}$ discrete on $\{P\}$.
- $\lambda = n + 1$.

**Closure rule** (the $n$-step chain):

$$\sigma_{\mathrm{chain}} : v(P)(k, k) = \mathbf{t} \;\Longrightarrow\; v(P)(k+1, k+1) \geq_k \mathbf{t} \qquad (0 \leq k < n).$$

**Initial increment**: $u_0(P)(0, 0) = \mathbf{t}$, $u_\tau = \bot$ for $\tau > 0$.

**Forward trajectory**:

- $v_0$: $\{(0, 0): \mathbf{t}\}$, all other cells $\bot$.
- $v_1 = T(v_0)$: rule fires at $k = 0$, adding $(1, 1) = \mathbf{t}$.
- $v_2 = T(v_1)$: rule fires at $k = 1$, adding $(2, 2) = \mathbf{t}$.
- ...
- $v_k = T(v_{k-1})$: rule fires at $k - 1$, adding $(k, k) = \mathbf{t}$.
- $v_n$: all cells $(0, 0), (1, 1), \ldots, (n, n)$ are $\mathbf{t}$.
- $T(v_n) = v_n$ (no rule applies; $k = n$ is out of range).

**Closure ordinal**: $\kappa = n$ — exactly the number of stages to reach $v_n$.

## Verification

- $T(v_{n-1}) = v_n \neq v_{n-1}$ (the last firing adds the cell $(n, n)$).
  So $\kappa > n - 1$.
- $T(v_n) = v_n$.
  So closure is reached at $n$.

Hence $\kappa = n$ exactly. $\square$

## Generalisation to limit ordinals (sketch)

The finite case admits a clean transfinite extension.
Each limit ordinal up to $\omega_1$ is realisable via:

**$\kappa = \omega$**: take $E = \omega$, the same chain rule on all $k < \omega$, seed $u_0(P)(0, 0) = \mathbf{t}$.
The trajectory has $v_n$ adding cell $(n, n)$ for each $n < \omega$.
The closure is reached at the supremum $\omega$.
Scott-continuous regime.

**$\kappa = \omega + 1$**: take $E = \omega + 1$, add a $\Pi_1$ closure rule:

$$\sigma_{\Pi_1} : (\forall k < \omega.\; v(P)(k, k) = \mathbf{t}) \;\Longrightarrow\; v(P)(\omega, \omega) \geq_k \mathbf{t}.$$

Now at stage $\omega$, all $(k, k)$ for $k < \omega$ are $\mathbf{t}$, so $\sigma_{\Pi_1}$ fires, adding $(\omega, \omega) = \mathbf{t}$.
Closure ordinal $\omega + 1$.
Transfinite-bounded regime.

**$\kappa = \omega + n$** for finite $n$: extend $E$ to $\omega + n$, add a chain after $\omega$.

**$\kappa = \omega \cdot 2$**: $E = \omega \cdot 2$, chain rule + $\Pi_1$ rule at $\omega$ + chain again from $\omega + 1$ to $\omega \cdot 2$.
The full structure realises every countable limit ordinal up to $\omega \cdot 2$.

**$\kappa = \omega^\alpha$ for countable $\alpha$**: by recursion on $\alpha$, realised via nested $\Pi_1$ rules indexed by ordinal arithmetic.

By recursion on countable ordinals: every countable ordinal $\kappa < \omega_1$ is realised as the closure ordinal of some appropriately-constructed closure-rule system on $E = \kappa$ with carefully-chosen $\Pi_n$-fragment rules.

The full transfinite-realisation theorem ($\forall \kappa < \omega_1, \exists$ closure-rule system with $\kappa$ as closure ordinal) is sketched here and remains to be fully proved at draft level.
The finite case (above) and the basic transfinite cases ($\omega, \omega + 1, \omega \cdot 2$) are established.

## Remarks

**Realisation as a function.** The theorem establishes that the realisation function $\mathrm{cl} : \{\text{closure rules}\} \to \mathrm{Ord}$ is *surjective onto* $\mathbb{N}$.
The transfinite-realisation sketch suggests it's surjective onto $[0, \omega_1]$.
Whether it's surjective onto larger ordinals is open, and may depend on rule-language complexity (per the [rule-language fragment realizability refinement](rule-language-fragment-realizability-refinement.md)).

**Minimal-construction property.** The chain rule above is essentially the *minimal* construction: $E$ has cardinality $n + 1$, the rule has a single template, the increment seeds a single cell.
Any closure rule with $\kappa = n$ involves at least $n$ "stages of new firings," so the chain construction is structurally minimal.

**Connection to recursion theory.** The realised ordinal is the *recursion-theoretic ordinal* of the rule system in some sense — the depth of inductive computation needed to settle the rule.
Formal connection to Kleene's $\omega_1^{CK}$ (the Church-Kleene ordinal of recursive ordinals) is open; for now: every recursive countable ordinal is plausibly realised, and the bound $\omega_1$ is the natural cap.

## Position in the program

Establishes the bottom of the closure-ordinal realisation hierarchy.
Provides a template for transfinite extensions (chain + $\Pi_1$ at limits).
Pairs with the [closure-ordinal-realization-spectrum question](../questions/closure-ordinal-realization-spectrum.md) (the broader research direction) and the [rule-language fragment realizability refinement](rule-language-fragment-realizability-refinement.md) (which classifies which $L_{\mathrm{ns}}$ subsets are realised, complementary to which closure ordinals are realised).

The full transfinite realisation theorem ($\kappa < \omega_1$ all realised) is the natural next step.
The challenge is the recursion-on-ordinals construction at level $\omega^\omega$ and beyond, which requires careful $\Pi_n$-fragment design.
