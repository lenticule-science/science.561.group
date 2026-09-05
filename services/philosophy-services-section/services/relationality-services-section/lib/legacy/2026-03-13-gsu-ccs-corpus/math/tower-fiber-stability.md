---
id: tower-fiber-stability
name: TowerFiberStability
description: "the descending chain of level-n stable fibers H^(n)* stabilizes exactly when the universe is a hyperverse-fixed universe — the nuclei converge at fixed points of the hyperverse tower, not before."
---

### Theorem — Tower Fiber Stability {#tower-fiber-stability}

Let $\mathbf{U}$ be a universe embedded in the hyperverse tower (§hyperverse-tower).
By Tower Fiber Seeding (§tower-fiber-seeding), the fiber of $R^{(n+1)}$ over
$\mathbf{U}$ is the level-$n$ stable sub-algebra $H_\mathbf{U}^{(n)*}$, which then
acquires a new nuclear square $(\sigma_\mathbf{U}^{(n+1)}, \Delta_\mathbf{U}^{(n+1)})$
from the level-$(n+1)$ ambient structure. The level-$(n+1)$ stable fiber is

$$
H_\mathbf{U}^{(n+1)*}
\;:=\;
\mathrm{Fix}\!\bigl(\sigma_\mathbf{U}^{(n+1)}\bigr)
\;\cap\;
\mathrm{Fix}\!\bigl(\Delta_\mathbf{U}^{(n+1)}\bigr)
\;\subseteq\;
H_\mathbf{U}^{(n)*}.
$$

These inclusions assemble into a descending chain of sub-Heyting-algebras:

$$
H_\mathbf{U}^{(0)*}
\;\supseteq\;
H_\mathbf{U}^{(1)*}
\;\supseteq\;
H_\mathbf{U}^{(2)*}
\;\supseteq\;
\cdots
$$

#### Theorem {#tower-fiber-stability-theorem}

The descent stabilizes — $H_\mathbf{U}^{(n+1)*} = H_\mathbf{U}^{(n)*}$ for all $n \geq 0$
— if and only if $\mathbf{U}$ is a hyperverse-fixed universe (§hyperverse-fixed-universe): a fixed point $\mathbf{U} = U_\mathcal{H}(\mathbf{U})$.

#### Proof Sketch {#tower-fiber-stability-proof}

**Fixed points stabilize.** Suppose $\mathbf{U} = U_\mathcal{H}(\mathbf{U})$. The fixed-point
equation means that applying $U_\mathcal{H}$ to $\mathbf{U}$ returns $\mathbf{U}$ unchanged.
The nuclei induced at the next level are therefore the same nuclei:
$(\sigma_\mathbf{U}^{(n+1)}, \Delta_\mathbf{U}^{(n+1)}) = (\sigma_\mathbf{U}^{(n)}, \Delta_\mathbf{U}^{(n)})$
for every $n$. Every $a \in H_\mathbf{U}^{(n)*}$ is already fixed by the level-$(n+1)$
nuclei, so $H_\mathbf{U}^{(n+1)*} = H_\mathbf{U}^{(n)*}$. The chain is constant.

**Non-fixed-points descend strictly (conjectural).** If $\mathbf{U}$ is not a hyperverse-fixed universe,
it lies strictly below the fixed point at every finite level. The tower is strictly
increasing (§hyperverse-tower), so each step adds universes with genuinely new relational
structure. This new structure is encoded in the topology $J^{(n+1)}$, inducing nuclei
$(\sigma_\mathbf{U}^{(n+1)}, \Delta_\mathbf{U}^{(n+1)})$ strictly larger than
$(\sigma_\mathbf{U}^{(n)}, \Delta_\mathbf{U}^{(n)})$: there exist propositions stable at
level $n$ that are identified (pushed further) at level $n+1$. Hence
$H_\mathbf{U}^{(n+1)*} \subsetneq H_\mathbf{U}^{(n)*}$. The precise verification that
non-fixed-point nuclei always increase strictly is not carried out here. $\square$

#### Universal vs. Local Stability {#tower-fiber-stability-universal-local}

An element $a \in H_\mathbf{U}^{(0)*}$ is **universally stable** if
$a \in \bigcap_n H_\mathbf{U}^{(n)*}$. It is **locally stable at level $n$** if
$a \in H_\mathbf{U}^{(n)*}$ but $a \notin H_\mathbf{U}^{(n+1)*}$.

For a hyperverse-fixed universe $T$: every element of $H_T^*$ is universally stable. The nuclei
$(\sigma_T, \Delta_T)$ are the fixed-point nuclei — the form the tower's nuclear
data has converged to. There is no further level at which they become stricter.
Local and universal stability coincide in $H_T^*$.

For a non-fixed universe $\mathbf{U}$: no element of $H_\mathbf{U}^{(n)*}$ at finite $n$
is universally stable. The level-$n$ nuclei are provisional; finer data from above
will always refine the stable layer. Every local stability claim is overturnable
from a higher vantage.

The universally stable sub-algebra is the colimit of the descent:
$$
H_\mathbf{U}^{(\infty)*} \;=\; \bigcap_{n \geq 0} H_\mathbf{U}^{(n)*}.
$$
For a hyperverse-fixed universe, $H_\mathbf{U}^{(\infty)*} = H_\mathbf{U}^*$. For a non-fixed universe, it is a
proper sub-algebra — the residue that survives every level of refinement, but which
can only be identified at the colimit $\mathcal{H}$, not from within any $R^{(n)}$.
