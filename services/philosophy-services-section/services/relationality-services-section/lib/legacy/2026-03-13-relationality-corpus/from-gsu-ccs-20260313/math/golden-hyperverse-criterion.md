---

name: golden-hyperverse-criterion
description: "a relational universe lies on the fixed-point locus of U_H iff its moduli distributions follow a Fischer-Rao geodesic with asymptotic mode-count growth ratio φ."
---

### Conjecture — The Golden Ratio Criterion {#golden-hyperverse-criterion}

**Statement.** Let $R$ be a generic relational universe (see hypothesis below). Then $R$ lies
on the fixed-point locus of $U_\mathcal{H}$ — i.e., $U_\mathcal{H}(R) \cong R$ — if and only
if the sequence of moduli distributions $p_n \in \mathcal{P}(\mathcal{M}_n)$ follows a
Fischer-Rao geodesic (§fischer-rao-convergence) with asymptotic mode-count growth ratio $\varphi
= \tfrac{1+\sqrt{5}}{2}$.

**Genericity hypothesis.** $R$ is **generic** if no two distinct potential modes at any fiber
$H_t$ merge under restriction — formally, if the restriction maps $H(i_{s,t}) : H_{s \star t}
\to H_t$ are injective on active modes ($a \in H_t \setminus H_t^*$ with $\delta_t(e_a) \neq 0$).
The conjecture is not claimed for non-generic universes; mode merging can produce different
growth ratios.

**Motivation.** At a fixed-point universe $R \cong U_\mathcal{H}(R)$, the hyperverse tower is
self-similar: $R^{(n)} \cong R$ for all $n$. Count the **potential modes** at depth $n$ —
elements of $H_t \setminus H_t^*$, measuring directions not yet fully stabilized. In the
generic case, the self-similar structure suggests a Fibonacci-type recursion: each potential mode
at depth $n$ carries forward into depth $n+1$, and the one-step extension introduces one new
$\Delta$-constraint per existing active mode. If both of these hold exactly:
$$
a(n+1) \;=\; a(n) + a(n-1), \qquad a(0) = 1,\quad a(1) = 1,
$$
so $a(n+1)/a(n) \to \varphi$.

Under the Fischer-Rao metric on $\mathcal{P}(\mathcal{M}_n)$, the depth-restriction Markov
kernels implement natural-gradient descent (§fischer-rao-convergence). At a fixed-point
universe, this descent would follow a geodesic whose direction is determined by the dominant
eigenvalue of the restriction operator.

**What a proof requires.**

- Justification that the Fibonacci recurrence holds in the generic case: specifically, that
  restriction injectivity on active modes implies exactly one new active mode is introduced
  per existing active mode per extension step, with no cancellations.
- A matrix argument (e.g., Perron–Frobenius applied to the substitution matrix of the
  extension structure) connecting the scalar growth rate $\varphi$ to the dominant eigenvalue
  of the restriction operator as a linear map on $\widetilde{V}_t$. The §noether-fiber theorem
  establishes that symmetries preserve eigenspaces; the dominant eigenvalue claim is separate.
- Resolution of §fischer-rao-convergence, on which the geodesic direction claim depends.
- The converse direction — $\varphi$-growth implies the fixed-point condition — is the harder
  direction and depends on the full Fischer-Rao convergence conjecture remaining open.

**Depends on:** §noether-fiber, §spectral-decomposition, §fischer-rao-convergence,
§meta-universe-closure.
