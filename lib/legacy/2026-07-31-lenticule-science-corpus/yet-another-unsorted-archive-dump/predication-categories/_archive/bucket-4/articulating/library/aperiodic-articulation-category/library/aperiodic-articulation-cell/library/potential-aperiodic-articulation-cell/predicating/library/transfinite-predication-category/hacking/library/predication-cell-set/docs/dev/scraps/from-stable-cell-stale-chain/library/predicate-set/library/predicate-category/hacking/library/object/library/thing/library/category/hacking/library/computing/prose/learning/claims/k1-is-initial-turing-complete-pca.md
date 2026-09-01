---
type: claim
status: proved
depends-on:
  - ../code/structures/pca.md
  - ../code/structures/k1.md
  - ../code/structures/eff.md
see-also:
  - ../questions/what-is-the-theory-of-computing.md
  - eff-is-minimum-level.md
references:
  - Kleene 1945
  - van Oosten 2008
---

# K₁ is the initial Turing-complete PCA

## Statement

Kleene's first algebra $\mathcal{K}_1 = (\omega, \cdot)$ with $a \cdot b = \varphi_a(b)$ (partial recursive function with code $a$ applied to $b$) is the initial Turing-complete PCA: every Turing-complete PCA $A$ admits an applicative morphism $\mathcal{K}_1 \to A$.

The Church-Turing thesis is precisely the claim that $\mathcal{K}_1$ is the unique (up to PCA isomorphism) minimal Turing-complete PCA.

## Proof

**Minimality.** The total functions $\mathbb{N} \to \mathbb{N}$ realizable in $\mathcal{K}_1$ are exactly the partial recursive functions — not more. This is by definition: $\mathcal{K}_1$-computation is Kleene application, and Kleene's characterization theorem states that a function is Kleene-computable if and only if it is partial recursive.

**Universality.** A Turing-complete PCA $A$ is one whose term model is Turing-complete: every partial recursive function has a code in $A$ from which it can be computed. Any such system can simulate Kleene application — to compute $\varphi_a(b)$, simulate the universal Turing machine on input $(a, b)$. The simulation is itself a computable (hence $A$-realizable) function of $(a, b)$. This defines an applicative morphism $\gamma: \mathcal{K}_1 \to A$: the function $\gamma$ sends each Kleene code $a$ to its $A$-code for the same partial function, and is tracked by the realizer that implements the simulation.

**Initiality.** Combining minimality and universality: $\mathcal{K}_1$ computes exactly the partial recursive functions (no more), and every Turing-complete PCA can simulate $\mathcal{K}_1$-computation. $\mathcal{K}_1$ is therefore initial among Turing-complete PCAs — every such PCA is a $\mathcal{K}_1$-algebra.

## Significance

The Church-Turing thesis is a mathematical fact about $\mathcal{K}_1$, not an axiom: under the thesis, $\mathcal{K}_1$ is canonical because it is the unique minimal Turing-complete PCA, not because it was chosen. Different PCAs ($\mathcal{K}_2$, oracle extensions) give genuinely different toposes modeling genuinely different computational paradigms — they are not alternative codings of the same computation.

This resolves the base question for the theory of computing: the canonical PCA for discrete deterministic computation is $\mathcal{K}_1$, making $\mathbf{Eff} = RT(\mathcal{K}_1)$ the canonical topos.
