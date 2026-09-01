---
id: entropy
name: Entropy
description: "Fiber Entropy"
---

### Definition — Fiber Entropy {#entropy}

**Setting.** Let $V_t = K^{H_t^*}$ be the sheaf of invariant modes at history $t$,
with spectral decomposition $V_t = \bigoplus_{\lambda \in \Lambda_t} E_{t,\lambda}$
(§spectral-decomposition). The spectral mass is $M_t(\delta) = \mathrm{Tr}(\delta_t)$.

#### Definition — Entropy Functional {#def-entropy}

Define the **fiber entropy** at history $t$ as the Shannon entropy of the spectral
weight distribution:
$$
\mathcal{H}_t(\delta) \;:=\; -\sum_{\lambda \in \Lambda_t \setminus \{0\}} p_{t,\lambda} \cdot \log p_{t,\lambda},
$$
where $p_{t,\lambda} = \lambda \cdot \dim_K E_{t,\lambda} / M_t(\delta)$ is the
normalized spectral weight of the $\lambda$-mode (defined when $M_t(\delta) > 0$;
set $\mathcal{H}_t = 0$ when $M_t(\delta) = 0$). The logarithm is in any fixed
base; the formula makes sense in a numeric model where $K \subseteq \mathbb{R}_{>0}$.
This is a Shannon entropy — not a von Neumann entropy — because $\{p_{t,\lambda}\}$
is a discrete probability distribution over eigenvalues, not a density matrix.

#### Lemma — Monotonicity Under Flow {#entropy-monotone}

Under the depth-filtration tower $R_0 \hookrightarrow R_1 \hookrightarrow \cdots$,
the fiber entropy $\mathcal{H}_t(\delta)$ is **monotonically non-increasing** as
depth increases: modes either evaporate (their spectral mass decreases) or remain,
so the distribution $\{p_{t,\lambda}\}$ becomes more concentrated.

#### Lemma — Stationary Minimality {#entropy-minimum}

Entropy attains its minimum $\mathcal{H}_t = 0$ exactly at the stable layer: when
$\delta_t = 0$, all modes lie in $E_{t,0}$ and there is nothing to measure.
This is the fixed-fiber state $H_t^*$ (§detailed-balance).

#### Conjecture — Spectral Scaling {#entropy-scaling}

Near convergence, as $R_n \to R$ along the tower, the entropy satisfies the
asymptotic recurrence:
$$
\mathcal{H}_{n+1} \;\approx\; \lambda_{\max} \cdot \mathcal{H}_n
\quad \text{(until } \mathcal{H}_n = 0\text{)},
$$
where $\lambda_{\max} < 1$ is the dominant eigenvalue of the flow restricted to
defect modes (the leading contraction factor of the directed comonad,
§directed-comonad). This is a conjecture: it requires that the depth-filtration
consistently reduces spectral mass by the same factor per level, which depends on
the spectral gap of $\delta_t$.

**Relation to Hawking evaporation.** The entropy decrease mirrors the Hawking
temperature increase (§spectral-hawking): as $M_t$ decreases and entropy falls,
the Hawking temperature $T_H = 1/(2M_t)$ rises, and in the limit both quantities
reflect the complete evaporation of defect modes.

**Relation to Fischer–Rao.** The entropy functional $\mathcal{H}_t$ is
conjectured to be the Lyapunov function for the Fischer–Rao geodesic convergence
(§fischer-rao-convergence): the geodesic along which $U_G$ iterates converges is
precisely the gradient flow of $\mathcal{H}_t$.

**Status.** Stub. Requires: (a) a categorical definition of the spectral weight
distribution $\{p_{t,\lambda}\}$ independent of numeric semantics, (b) proof of
monotonicity from the directed comonad's contractive properties, and (c) a
comparison with Fischer–Rao geometry.
