---
id: spectral-schwarzschild
name: SpectralSchwarzschild
description: "Spectral Schwarzschild Operator"
---

### Definition — Spectral Schwarzschild Operator {#spectral-schwarzschild}

**Motivation.** The defect operator $\delta_t : V_t \to V_t$ (§spectral-decomposition) has a
finite spectrum $\Lambda_t \subset K$. The zero-eigenspace $E_{t,0}$ is the stable layer. Modes
in $E_{t,\lambda}$ for $\lambda \neq 0$ are "unstable" — they have nonzero defect. A natural
question arises: is there a critical spectral scale below which modes can decay to $E_{t,0}$
through the available dynamics, and above which they are effectively **trapped**?

The **Schwarzschild operator** extracts this critical scale from the defect operator, by analogy
with the Schwarzschild radius $r_s = 2GM/c^2$ in general relativity — the critical length scale
set by a body's mass below which escape is impossible.

#### Definition — Spectral Mass and Schwarzschild Radius {#def-schwarzschild}

For each history $t$, define the **spectral mass** of the defect operator as:
$$
M_t(\delta) \;:=\; \mathrm{Tr}(\delta_t) \;=\; \sum_{\lambda \in \Lambda_t} \lambda \cdot \dim_K E_{t,\lambda}.
$$

The **Schwarzschild radius** of the defect operator at history $t$ is:
$$
r_s(\delta_t) \;:=\; 2 \cdot M_t(\delta).
$$

Equivalently, in normalized units: $r_s(\delta_t) = 2\,\mathrm{Tr}(\delta_t)$.

The Schwarzschild operator assembles these into a natural transformation:
$$
\mathrm{Sch} : \mathrm{End}_K(V) \longrightarrow \underline{K}_R,
\qquad
\mathrm{Sch}(\delta)_t \;:=\; r_s(\delta_t),
$$
where $\underline{K}_R$ is the constant sheaf of $K$-values on $R$.

#### Conjecture — Spectral Horizon {#spectral-horizon}

Modes with eigenvalue $\lambda > r_s(\delta_t)/2$ (i.e., $\lambda > M_t(\delta)$) lie in the
**spectral interior** — no finite composition of available dynamics can reduce their eigenvalue to
zero. Modes with $\lambda \leq r_s(\delta_t)/2$ lie in the **spectral exterior** and may decay to
$E_{t,0}$ through dynamics internal to the mode algebra.

**Status.** This is a conjecture. The Graded Mode Algebra (§spectral-decomposition, Derivation
Condition) allows $E_\lambda \cdot E_\mu \subseteq E_{\lambda+\mu}$; the question of whether
descent to $\lambda = 0$ is achievable depends on the joint spectrum of the full mode algebra.
The conjecture requires that the mode algebra contains elements of eigenvalue $-\lambda$ for all
$\lambda > 0$ in the exterior, and is nontrivial precisely when it does not.
