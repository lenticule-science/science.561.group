---
name: theory-of-probabilistic-computation
type: theorem
status: proved
description: RT(K₁^r) — the realizability topos over a random-oracle extension of K₁ — is the theory of probabilistic computation. It is a sibling of Eff connected by a change-of-PCA geometric morphism; probabilistic computation can decide the halting problem with positive probability, which Eff cannot.
see-also: [theory-of-computability, what-are-the-subtheories-of-computing]
---

# The Theory of Probabilistic Computation

**Theorem.** $RT(\mathcal{K}_1^r)$ — the realizability topos over a random-oracle extension $\mathcal{K}_1^r$ of Kleene's first algebra — is the theory of probabilistic computation. There is a geometric morphism $\mathbf{Eff} \to RT(\mathcal{K}_1^r)$ induced by the inclusion $\mathcal{K}_1 \hookrightarrow \mathcal{K}_1^r$, but the geometric morphism is one-directional. $RT(\mathcal{K}_1^r)$ is a sibling of $\mathbf{Eff}$ (connected by a change-of-PCA morphism) and strictly extends it.

**Proof.**

*The random-oracle extension.* $\mathcal{K}_1^r = (\omega, \cdot^r)$ extends Kleene application by augmenting each computation with access to a uniformly random oracle $r: \omega \to \{0,1\}$ (equivalently, a halting-problem oracle drawn from a random ensemble). The inclusion $\iota: \mathcal{K}_1 \hookrightarrow \mathcal{K}_1^r$ (every $\mathcal{K}_1$-computation is a $\mathcal{K}_1^r$-computation that ignores the oracle) is an applicative morphism, inducing the geometric morphism $\mathbf{Eff} = RT(\mathcal{K}_1) \to RT(\mathcal{K}_1^r)$ (van Oosten 2008).

*No reverse geometric morphism.* A reverse morphism $RT(\mathcal{K}_1^r) \to \mathbf{Eff}$ would require an applicative morphism $\mathcal{K}_1^r \to \mathcal{K}_1$: every $\mathcal{K}_1^r$-computation tracked by a $\mathcal{K}_1$-realizer. But $\mathcal{K}_1^r$-computation can compute the halting predicate with probability $> 0$ (using the random oracle as a probabilistic decision procedure for a $\Sigma^0_1$ question), whereas $\mathcal{K}_1$-computation is bounded by the Church-Turing thesis. No $\mathcal{K}_1$-realizer can uniformly track $\mathcal{K}_1^r$-computations.

*The sibling relationship.* $\mathcal{K}_1$ and $\mathcal{K}_1^r$ are not comparable as PCAs: neither embeds into the other in both directions. They are related by a change-of-PCA morphism (the one-directional applicative morphism $\iota$), making $RT(\mathcal{K}_1^r)$ and $\mathbf{Eff}$ siblings in the 2-category $\mathbf{oPCA} \simeq \mathbf{ReaT}$ of ordered PCAs and realizability toposes (Hofstra-van Oosten 2003). The probabilistic theory strictly extends the computable theory: Sacks's theorem (every $\Delta^0_2$ function is computed by a random oracle with probability 1) shows $RT(\mathcal{K}_1^r)$ realizes statements independent of $\mathbf{Eff}$. $\square$
