---
id: spectral-remanence
name: SpectralRemanence
description: "Spectral Remanence"
---

### Conjecture — Spectral Remanence {#spectral-remanence}

#### The Mathematical Claim {#spectral-remanence-math}

The spectral mass $M_t(\delta) = \mathrm{Tr}(\delta_t) = \sum_{\lambda > 0} \lambda \cdot \dim_K E_{t,\lambda}$
(§spectral-schwarzschild) is a sum over all **unsettled modes**: modes that have not yet
reached $E_{t,0}$, weighted by their defect eigenvalue. The weight $\lambda$ measures how
far mode $e \in E_{t,\lambda}$ sits from the stable layer. The total, $M_t(\delta)$, is the
**relational latency** of the fiber at $t$: the accumulated spectral weight of all history
not yet settled into the invariant locale $\mathsf{Phase}$.

Define the **settled mass** and **unsettled mass** of a fiber:
$$
M_t^{\mathrm{settled}}(\delta) := 0
\quad (\text{all stable modes have eigenvalue } 0),
\qquad
M_t^{\mathrm{unsettled}}(\delta) := M_t(\delta) = \mathrm{Tr}(\delta_t).
$$
The Schwarzschild radius $r_s(\delta_t) = 2 M_t(\delta)$ is determined entirely by the
unsettled mass.

**Conjecture.** For any two fibers $t, t'$ with the same $K$-module dimension
$\dim_K V_t = \dim_K V_{t'}$ but different spectral masses $M_t(\delta) \neq M_{t'}(\delta)$,
there is no natural transformation of mode sheaves carrying $E_{t,\lambda}$ to $E_{t',\lambda}$
for all $\lambda > 0$. The unsettled mass is an intrinsic invariant of the fiber that
is **not** observable from within $E_{t,0}$ alone. It is invisible to any measurement
that probes only the stable layer but manifests in the full spectral structure via
$\mathrm{Tr}(\delta_t)$.

Equivalently: $M_t(\delta)$ behaves like a mass that is **present** (it contributes to
$r_s$) but **opaque** (it does not participate in the observable stable algebra $H_t^*$).

**Status.** Stub. Requires: (a) a proof that $M_t(\delta)$ is not computable from $E_{t,0}$
data alone (that the "opacity" holds at the level of the sheaf, not just fiber-by-fiber);
(b) a precise statement of "intrinsic invariant" in terms of natural transformations;
(c) connection to §cohomological-tunneling: the tunneling mechanism is one way the
invisible mass becomes visible as the mode settles.

*See §dark-matter for physical interpretation.*
