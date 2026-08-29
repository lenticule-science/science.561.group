---
type: question
status: open
explores: [infinite-spectral-triple-laplacianizability, closed-range-obstruction, resolvent-intertwiner]
---

# Self-contained closed-range proof for regular spectral triples

The [infinite-dim spectral triple Laplacianizability theorem](../theorems/infinite-spectral-triple-laplacianizability.md) requires the Hochschild differential $b$ on the Hilbert completion of $C_\bullet(\mathcal A)$ (under the resolvent inner product $\langle \cdot, \cdot \rangle_D$) to have **closed range**.

For *regular* spectral triples in Connes' sense ($\mathcal A$ closed under $\delta = [|D|, \cdot]$), closed range follows from the noncommutative pseudo-differential calculus (Connes–Moscovici machinery): the Hochschild Laplacian $\Delta_n^{(D)}$ becomes "elliptic" and has compact resolvent, hence discrete spectrum and closed range.

## Question

Can closed range be proved within the laplacianizers framework, without invoking the full Connes–Moscovici nc-pseudo-DO machinery?

## Why this matters

The cross-category framework's smooth Riemannian case ([proved](../theorems/cross-category-smooth.md)) uses elliptic regularity of the Laplacian on compact manifolds — a self-contained statement involving Sobolev spaces and Garding's inequality. The spectral-triple case currently delegates to Connes-style arguments. A self-contained proof would:

1. Make the spectral-triple Laplacianizability theorem standalone.
2. Identify the *minimal* hypotheses on $(\mathcal A, \mathcal H, D)$ for closed range — possibly weaker than regularity.
3. Connect the spectral-triple framework more directly to the smooth Riemannian one.

## What's needed

Closed range of $b$ on the resolvent-Hilbert completion $\hat C_n(\mathcal A; D)$ is equivalent to:
$$\text{There exists } c > 0 \text{ such that } \|b u\|_D \ge c \cdot d(u, \ker b)_D \text{ for all } u \in \mathrm{dom}\, b.$$

This is a Poincaré-type inequality — finite spectral gap of $\Delta_n$ above zero in the orthogonal complement of $\ker \Delta_n$.

**Equivalent formulation**: $\Delta_n^{(D)}$ has *discrete spectrum* on $\hat C_n$ — eigenvalues $0 \le \mu_0 \le \mu_1 \le \cdots \to \infty$, finite multiplicities, no accumulation point except $\infty$.

For this, sufficient conditions:
- **Compact resolvent of $\Delta_n^{(D)}$**: needs the operator $(1 + \Delta_n^{(D)})^{-1}$ to be compact. Equivalently, the imbedding $\mathrm{dom}(\Delta^{1/2}_n) \hookrightarrow \hat C_n$ is compact.

## Approaches

**Approach 1: Trace-class summability of $R_D^N$.** The resolvent $R_D = (1 + D^2)^{-1}$ has $R_D^N$ trace class for $N > p/2$ ($p$ summability). Maybe a similar estimate gives compactness of $(1 + \Delta_n^{(D)})^{-1}$ on Hochschild chains directly.

**Approach 2: Explicit decomposition for finite-dim $\mathcal A$, then scale up.** For $\mathcal A$ finite-dim with $\mathcal H$ infinite-dim ($\mathcal A \otimes K$ for some Hilbert space $K$): the Hochschild complex is finite-dim over $\mathcal A$ but the inner product depends on the infinite-dim trace. Closed range should follow from finite-dimensionality.

**Approach 3: Sobolev-style estimates.** Define a Sobolev hierarchy $\mathcal A^s = \mathcal A \cap \mathrm{dom}(\delta^s)$ in Connes' sense. The Hochschild operators $b, b^*$ are bounded between Sobolev levels. Compactness of inclusion gives closed range.

**Approach 4: Reduction to Hodge–de Rham via HKR.** For commutative $\mathcal A = C^\infty(M)$ on compact $M$, closed range reduces to compact-manifold de Rham theory ([proved](../theorems/cross-category-smooth.md)). The HKR quasi-iso transfers this to Hochschild. For noncommutative $\mathcal A$, no obvious reduction; but maybe a "noncommutative HKR" gives partial reduction.

## Specific cases to test

- **Almost-commutative** spectral triples $(\mathcal A_F \otimes C^\infty(M), \mathcal H_F \otimes L^2(M, S), D_F + \not\!\!\!D_M)$: closed range factors as product of finite (for $\mathcal A_F$) + smooth-Riemannian (for $C^\infty(M)$). Should be tractable.

- **Quantum tori** $A_\theta$ (irrational rotation algebras): well-studied, has a natural smooth subalgebra. Closed range likely tractable via specific resolvent estimates.

- **Discrete groups with property RD** (rapid decay): Hochschild chains decay rapidly, giving closed range directly.

## Connection to RD condition

Connes' regularity condition is closely related to property RD (rapid decay) for discrete groups. Many regular spectral triples satisfy a Schwartz-class-like decay property. A self-contained closed-range proof using only this decay property would bypass the heavy Connes–Moscovici calculus.
