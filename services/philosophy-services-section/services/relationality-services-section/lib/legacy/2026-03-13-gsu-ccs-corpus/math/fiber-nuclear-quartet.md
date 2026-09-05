---
id: fiber-nuclear-quartet
name: FiberNuclearQuartet
description: "the fiber nuclear quartet — the four sub-algebras (H_t, saturation-stable fiber, transfer-stable fiber, fixed fiber) constituting the four corners of the fiber nuclear square at each history t."
---

### Construction — The Fiber Nuclear Quartet {#fiber-nuclear-quartet}

The **fiber nuclear quartet** at a history $t$ is the nuclear quartet ([NuclearQuartetSubalgebra](nuclear-quartet-subalgebra.md))
of the fiber nuclear square $(H_t, \sigma_t, \Delta_t)$ ([CommutativeNuclearSquare](commutative-nuclear-square.md)):
$$
\bigl(\,H_t,\;\mathrm{Fix}(\sigma_t),\;\mathrm{Fix}(\Delta_t),\;H_t^*\,\bigr).
$$

The four sub-algebras are:

| Sub-algebra | English name | File |
|-------------|------------|------|
| $H_t$ | The proposition fiber: the free carrier | §fiber |
| $\mathrm{Fix}(\sigma_t)$ | The saturation-stable fiber: propositions already at their saturation value | §saturation-stable-fiber |
| $\mathrm{Fix}(\Delta_t)$ | The transfer-stable fiber: propositions already witnessed by all one-step extensions | §transfer-stable-fiber |
| $H_t^*$ | The fixed fiber: propositions fixed by both nuclei | §fixed-fiber |

Each inclusion is strict when the fiber is non-trivial:
$H_t^* \subsetneq \mathrm{Fix}(\sigma_t) \subsetneq H_t$ and
$H_t^* \subsetneq \mathrm{Fix}(\Delta_t) \subsetneq H_t$ in general.

#### The Fiber Nuclear Square {#fiber-nuclear-quartet-square}

The four sub-algebras are the four corners of the commuting square of inclusions
and nucleus maps:
$$
\begin{array}{ccc}
H_t & \xrightarrow{\sigma_t} & \mathrm{Fix}(\sigma_t) \\
\Delta_t \downarrow & & \downarrow \Delta_t|_{\mathrm{Fix}(\sigma_t)} \\
\mathrm{Fix}(\Delta_t) & \xrightarrow{\sigma_t|_{\mathrm{Fix}(\Delta_t)}} & H_t^*
\end{array}
$$
The square commutes because $\sigma_t$ and $\Delta_t$ commute ([CommutativeNuclearSquare](commutative-nuclear-square.md)):
$\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t = \pi_t$, the joint projection.

#### Tower Role {#fiber-nuclear-quartet-tower}

By the Tower Fiber Seeding theorem (§tower-fiber-seeding), the joint fixed-point
sub-algebra $H_t^*$ at level $n$ is the free carrier fiber $H_t^{(n+1)}$ at
level $n+1$. The fiber nuclear quartet at level $n$ therefore determines the
free carrier for the fiber nuclear quartet at level $n+1$: the tower advances
by promoting the fixed fiber of each level to the free carrier of the next.
