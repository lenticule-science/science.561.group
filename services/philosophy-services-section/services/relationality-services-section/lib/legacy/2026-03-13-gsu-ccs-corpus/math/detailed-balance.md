---
id: detailed-balance
name: DetailedBalance
description: "Detailed Balance — stationary states in H_t* are observationally symmetric under forward and reverse transitions; requires categorical definition of the observation kernel K_t, which has not been given."
---

### Conjecture — Detailed Balance {#detailed-balance}

**Setting.** Fix a history $t \in T$. The fiber $H_t$ carries two dynamics:
the saturation nucleus $\sigma_t$ (forward settling) and the transfer nucleus
$\Delta_t$ (reverse settling). The **observation kernel** at $t$ is the composite
$$
K_t : H_t \xrightarrow{\,\text{flow}\,} H_{t'} \xrightarrow{\,\sigma_{t'}\,} H_{t'}^*
$$
for an extension $t' \geq t$ — one directed step followed by saturation. A
**stationary state** is an element $x \in H_t^* = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$
fixed by $K_t$ in the sense that $K_t(x) = x$ (up to reindexing back along the
restriction map $\rho_{tt'}: H_{t'} \to H_t$).

#### Conjecture — Detailed Balance {#thm-detailed-balance}

For any stationary state $x \in H_t^*$, the forward and reverse transitions are
**observationally symmetric**: the contribution of $x$ to any observable is
identical under forward evolution (flow then saturate) and reverse evolution
(transfer-settle then flow). That is:
$$
\sigma_t(x \wedge K_t(y)) \;=\; \sigma_t(K_t(x) \wedge y)
\quad \text{for all } y \in H_t.
$$

**Matrix interpretation.** In any numeric model (assigning a probability
$p_\lambda > 0$ to each mode $E_{t,\lambda}$), this becomes the classical
condition $\pi \cdot P = \pi$ and $P^\top \pi = \pi$, where $P$ is the
transition matrix of the kernel and $\pi$ is the stationary distribution vector.

#### Conjecture — Fixed Fiber as Stationary Layer {#corollary-fixed-stationarity}

The doubly-stable layer $H_t^*$ is the unique (up to isomorphism) stationary
sublattice of $H_t$ for the kernel $K_t$: every element of $H_t^*$ is stationary,
and no proper sublattice of $H_t^*$ has this property. (Conditional on the definition
of $K_t$ and the proof of the detailed balance equation.)

**Relation to spectral evaporation.** The detailed balance condition connects
to the Hawking evaporation conjecture (§spectral-hawking): in the stationary
regime, the spectral mass $M_t(\delta)$ has reached its minimum (zero, if
convergence is complete), and the Hawking temperature diverges — the "Planck
regime" in which all defect modes have evaporated.

**Status.** Stub. Requires: (a) a precise definition of the observation kernel
$K_t$ in the categorical setting (as a natural transformation between fiber
sheaves), (b) a proof of the symmetry equation above from the Galois connection
of §dynamic-residuation, and (c) identification of the stationary condition with
membership in $H_t^*$.
