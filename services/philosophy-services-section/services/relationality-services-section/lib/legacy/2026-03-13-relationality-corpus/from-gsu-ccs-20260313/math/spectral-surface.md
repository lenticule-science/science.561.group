---

name: spectral-surface
description: "Conjectures that cohomological tunneling events concentrate on the spectral surface, yielding a tunneling energy density scaling as M_t(delta)^{-1/d} per tower step."
---

### Conjecture — Spectral Surface and Tunneling Density {#spectral-surface}

#### Setup {#spectral-surface-setup}

The spectral mass $M_t(\delta) = \mathrm{Tr}(\delta_t) = \sum_{\lambda > 0} \lambda \cdot \dim_K E_{t,\lambda}$
(§spectral-schwarzschild) is the total weight of trapped modes. Cohomological tunneling
(§cohomological-tunneling) is the mechanism by which individual trapped modes exit the
spectral interior. The present conjecture concerns the **distribution** of tunneling
events across the mode space, and the resulting scaling of the energy released per unit
volume.

**Definition — Spectral ball.** The **spectral ball** at history $t$ is the subset of
mode space
$$
B_t \;:=\; \bigl\{ e \in \bigoplus_{\lambda > 0} E_{t,\lambda} \;\big|\; |e| \leq 1 \bigr\},
$$
with "radius" set by the norm induced by the eigenvalue weighting. Its "spectral volume"
is $M_t(\delta)$ (the total weight). In a $d$-dimensional mode space, the spectral
ball has **spectral surface area** scaling as
$$
|\partial B_t| \;\propto\; M_t(\delta)^{(d-1)/d}.
$$

#### The Conjecture {#spectral-surface-conjecture}

**Conjecture — Spectral Surface Hypothesis.** Cohomological tunneling events are
concentrated on the spectral surface $\partial B_t$. That is: the modes $e \in E_{t,\lambda}$
that are eligible for tunneling at any given depth step $n$ are precisely those closest
to the boundary between the spectral interior ($\lambda > M_t(\delta)$) and the spectral
exterior ($\lambda \leq M_t(\delta)$). The density of tunneling events per unit tower step
is therefore:
$$
\frac{d N_{\mathrm{tunnel}}}{dn} \;\propto\; |\partial B_t|
\;\propto\; M_t(\delta)^{(d-1)/d}.
$$

This is the spectral analogue of evaporation from a surface: only modes at the boundary
of the mode distribution can tunnel in a single step.

#### Corollary — Tunneling Energy Density {#spectral-surface-corollary}

Under the Spectral Surface Hypothesis, each tunneling event releases a spectral drop
$\varepsilon(e) = \lambda_i - \mu_i$ where $\mu_i < \lambda_i$ is the post-tunneling
eigenvalue. For modes near the spectral horizon $\lambda \approx M_t(\delta)$, the
expected drop per event is:
$$
\bar\varepsilon \;\propto\; \frac{1}{N_{\mathrm{modes}}} \;\propto\; \frac{1}{M_t(\delta)},
$$
since each individual mode's eigenvalue is a small fraction of the total spectral mass
when there are $\sim M_t(\delta)$ modes (heuristically).

The **tunneling energy density** — the spectral energy released per tower step per unit
spectral volume — is:
$$
\frac{d\mathcal{E}_{\mathrm{tunnel}}}{dn} \;\propto\;
\frac{dN_{\mathrm{tunnel}}}{dn} \cdot \bar\varepsilon
\;\propto\; M_t(\delta)^{(d-1)/d} \cdot M_t(\delta)^{-1}
\;=\; M_t(\delta)^{-1/d}.
$$

In $d = 3$ spatial dimensions:
$$
\frac{d\mathcal{E}_{\mathrm{tunnel}}}{dn} \;\propto\; M_t(\delta)^{-1/3}.
$$

#### Remark — Energy Density vs Energy Rate {#spectral-surface-rate}

The formula $d\mathcal{E}_{\mathrm{tunnel}}/dn \propto M_t(\delta)^{-1/d}$ is an
**instantaneous equation of state**, not a rate whose integral must equal $M_t^{(0)}$.
These are different quantities and the two should not be conflated.

The correct conservation check uses the rate of decrease of $M_t$ itself. From
§golden-stability, $M_t^{(n)} = M_t^{(0)} \cdot \varphi^{-n}$, so:
$$
-\frac{dM_t}{dn} \;=\; M_t^{(n)} \log\varphi.
$$
Integrating from $n = 0$ to $\infty$:
$$
\int_0^\infty M_t^{(n)} \log\varphi \, dn
\;=\; M_t^{(0)} \log\varphi \int_0^\infty \varphi^{-n} \, dn
\;=\; M_t^{(0)} \log\varphi \cdot \frac{1}{\log\varphi}
\;=\; M_t^{(0)}.
$$
Total dissipated energy equals initial spectral mass — consistent with §spectral-heat.

The tunneling density $M_t^{-1/d}$ governs the **shape** of energy release across the
tower (concentrated at small-$M_t$ epochs), not its total. In particular, $\rho_\Lambda
\propto M_t^{-1/d}$ is an equation of state giving instantaneous dark energy density at
depth $n$; its growth as $M_t \to 0$ is consistent with the standard observation that
comoving dark energy density grows over cosmological time.

**Status.** Stub. Requires: (a) a precise definition of "spectral ball" and its dimension
$d$ (the $d$ in $M_t^{(d-1)/d}$ must be identified with or derived from the spatial
dimension; currently asserted by analogy); (b) a proof or counterexample showing that
tunneling events concentrate on the spectral boundary rather than the interior;
(c) explicit computation in a concrete history model.

*See §dark-energy-conversion and §hubble-tension for
physical applications. Numerical check against Planck 2020 in
`src/scripts/compute-dm-de-conversion.py`.*
