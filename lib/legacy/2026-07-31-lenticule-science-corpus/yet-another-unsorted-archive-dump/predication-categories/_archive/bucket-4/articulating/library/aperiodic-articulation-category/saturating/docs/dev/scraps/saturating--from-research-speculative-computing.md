---

name: Saturating
description: "The saturating operation Sat(M) in FiberNuclearLanguage — applying the saturation nucleus σ_t to a proposition, expanding it to the largest element with the same restriction profile."
---

### Definition — Saturating {#saturating}

**Saturating** a proposition $M : \mathsf{Prop}$ applies the saturation
nucleus $\sigma_t$ (§saturation-nucleus) to it:
$$
\mathsf{Saturate}(M) \;:\; \mathsf{Prop},
\qquad
\llbracket \mathsf{Saturate}(M) \rrbracket_t \;:=\; \sigma_t\!\bigl(\llbracket M \rrbracket_t\bigr).
$$
$\mathsf{Saturate}$ is what $\sigma_t$ does to a proposition in FiberNuclearLanguage.
The nucleus $\sigma_t$ itself is named in §saturation-nucleus.

#### What Saturating Does {#saturating-action}

Saturating expands $M$ to the **largest proposition with the same restriction profile**:
the result $\mathsf{Saturate}(M)$ has the same value at every proper sub-history $t_0 < t$ as
$M$ itself, but is as large as possible within $H_t$ subject to that constraint.

If $\rho_{t_0} = H(i_{t_0,t}) : H_t \to H_{t_0}$ is the restriction to $t_0$, then
$$
\rho_{t_0}(\mathsf{Saturate}(M)) \;=\; \rho_{t_0}(M)
\quad\text{for all } t_0 < t,
$$
and $\mathsf{Saturate}(M)$ is the greatest element of $H_t$ with this property.

#### Reduction Rules {#saturating-reductions}

| Rule | Reduction | What it expresses |
|------|-----------|-------------------|
| R1 | $\mathsf{Saturate}(\mathsf{Saturate}(M)) \to \mathsf{Saturate}(M)$ | Saturating is idempotent |
| R3 | $\mathsf{Saturate}(M \wedge N) \to \mathsf{Saturate}(M) \wedge \mathsf{Saturate}(N)$ | Saturating distributes over $\wedge$ |
| R5 | $\mathsf{Saturate}(\mathsf{True}) \to \mathsf{True}$ | $\top_t$ is already saturated |
| R7 | $\mathsf{Saturate}(\mathsf{Transfer}(M)) \to \mathsf{Transfer}(\mathsf{Saturate}(M))$ | Saturating commutes with transferring |

The full reduction system is §reduction-system. Strict decrease of $\mathsf{fmlW}$ under
R1, R3, R5 and of $\mathsf{ent}$ under R7 is the content of [nuclear-reduction-measure](nuclear-reduction-measure.md).

#### Restriction-Neutrality {#saturating-neutral}

Saturating is $\Delta$-neutral: $\mathsf{Saturate}(M)$ and $M$ have the same
transfer profile.
