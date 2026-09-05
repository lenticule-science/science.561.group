---

name: cohomological-dimension-bound
description: "the cohomological dimension of R is finite and bounded by the maximum history depth of the generating basis."
---

### Conjecture — Cohomological Dimension Bound {#cohomological-dimension-bound}

**Statement.** Let $R = \mathbf{Sh}(T, J)$ be a relational universe and let $d$ be the maximum history depth of the generative basis $B$ (§generative-basis). Then the sheaf cohomology of $R$ satisfies:
$$
H^n(T, J;\; V) = 0 \quad \text{for all } n > d \text{ and all sheaves } V.
$$
Equivalently, the cohomological dimension of the history site $(T, J)$ is at most $d$.

**Motivation.** In standard geometry, the dimension of a space bounds the complexity of its holes. The history site $(T, J)$ has a combinatorial depth structure: Čech covers of a history $t$ at depth $k$ require at most $k$ nesting levels. If the generative basis has maximum depth $d$, then any $J$-cover can be refined to a cover of depth at most $d$, and the Čech complex truncates at level $d$.

This would imply that $R$ is cohomologically flat at depths greater than $d$ — the universe looks topologically trivial above its generating depth. This is why the universe can support a coherent sheaf structure despite being built from discrete atoms.

**What a proof requires.**

1. A Čech cohomology computation for the diamond cover at depth $d$: verify that $H^{d+1}$ vanishes.

2. A dimensional induction: if $H^n = 0$ for all $J$-covers of depth $< k$, then $H^n = 0$ for covers of depth $k$ when $n > d$.

3. Connection to the depth-filtration tower: the filtration $E_0^{(k)}$ should show that higher differentials in the spectral sequence vanish above the depth bound.

**Depends on:** §cohomology, §history-site, §generative-basis, §depth-filtration.
