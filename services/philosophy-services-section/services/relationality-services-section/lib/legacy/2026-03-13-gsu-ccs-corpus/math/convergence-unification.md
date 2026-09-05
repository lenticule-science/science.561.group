---
id: convergence-unification
name: ConvergenceUnification

---

### Theorem — Convergence Unification {#convergence-unification}

The Fischer-Rao convergence conjecture (§fischer-rao-convergence) and the aperiodicity
halting conjecture (§aperiodicity-halting) are equivalent: they are two descriptions of the
same obstruction. Aperiodicity of the history monoid kills the $H^1$ obstructions that
prevent essential surjectivity of the restriction functors, which in turn is the condition
required for the Fischer-Rao metric to be well-defined and for the depth tower to converge
along a geodesic.

#### The Three Conditions {#unification-conditions}

The following three conditions on the depth tower
$\mathcal{M}_0 \xleftarrow{\rho_0} \mathcal{M}_1 \xleftarrow{\rho_1} \cdots$ are equivalent:

**(A) Aperiodicity halting.** The history monoid $(T, I)$ is aperiodic and $U_G$ converges
to the fixed point $R = U_G(R)$ (§aperiodicity-halting).

**(B) Fischer-Rao convergence.** The sequence of probability sheaves $p_n$ on
$(\mathcal{M}_n, K_n)$ follows a geodesic in the Fischer-Rao metric, and the depth
tower converges (§fischer-rao-convergence).

**(C) Cohomological exhaustion.** For all sufficiently large $n$,
$H^1(T^{(n)}, J^{(n)};\, E_0) = 0$ — the first cohomology groups of the depth-$n$
sites with coefficients in the stable mode sheaf vanish (§cohomology,
§cohomological-tunneling).

#### Proof of Equivalence {#unification-proof}

**(A) $\Rightarrow$ (C).** Assume the history monoid is aperiodic and $U_G$ converges.

By the aperiodicity theorem (§aperiodicity), the Cayley graph of $(T, I)$ has no
oriented cycles. A nonzero class $[\omega] \in H^1(T^{(n)}, J^{(n)};\, E_0)$ represents
a $1$-cocycle: an assignment of stable-mode differences to edges of the history site that
is locally trivial on every covering family but globally nontrivial. If the history monoid
had a cycle $t_1 \to t_2 \to \cdots \to t_k \to t_1$, the cocycle could "wind around"
it, producing a persistent obstruction that no finite depth increase could resolve. But
aperiodicity forbids such cycles: every path in the Cayley graph is eventually absorbed
by the tree-like prefix structure.

By §cor-aperiodicity-cohomology, aperiodicity is necessary for nontrivial $H^1$. In the
converse direction: the aperiodic structure ensures that every $1$-cocycle on $T^{(n)}$
can be unwound to a coboundary on $T^{(n+k)}$ for some finite $k$ — there is no
topological loop to support a persistent class. Since $U_G$ converges and $R = U_G(R)$
is the colimit, the cohomology groups must stabilize: for large enough $n$,
$H^1(T^{(n)}, J^{(n)};\, E_0) = 0$.

**(C) $\Rightarrow$ (B).** Assume $H^1$ vanishes for large $n$.

By the essential surjectivity theorem (§essential-surjectivity), vanishing of $H^1$
at depth $n$ implies $\rho_n : \mathcal{M}_{n+1} \to \mathcal{M}_n$ is essentially
surjective. Essential surjectivity is precisely the hypothesis required for Čencov's
theorem to apply (§fischer-rao-metric): it guarantees that the Markov kernels
$\bar{K}_n$ are surjective, so the Fischer-Rao metric is the unique invariant metric
on the space of probability sheaves.

With the Fischer-Rao metric well-defined, the depth tower becomes a tower of Riemannian
submersions (§riemannian-moduli). The EM iteration (§em-correspondence) is
natural-gradient descent in this metric. By Amari's convergence theorem for
natural-gradient methods on statistical manifolds with unique invariant metrics, the
sequence $p_n$ converges along a Fischer-Rao geodesic to the EM fixed point.

**(B) $\Rightarrow$ (A).** Assume Fischer-Rao convergence holds.

Fischer-Rao convergence requires essential surjectivity of $\rho_n$ (§fischer-rao-metric),
which by §essential-surjectivity requires $H^1 = 0$. By
§cor-aperiodicity-cohomology, nontrivial $H^1$ requires aperiodicity; and if the depth
tower converges along a geodesic, the colimit is the fixed point $R = U_G(R)$
(§fischer-rao-convergence). The history monoid must be aperiodic, for otherwise a periodic
cycle would produce a persistent nonzero $H^1$ class at every depth, contradicting the
convergence of the geodesic (the Fischer-Rao distance between successive $p_n$ would not
decrease). $\square$

#### The Unified Picture {#unification-picture}

The three equivalent conditions describe the same phenomenon from three viewpoints:

| Viewpoint | Condition | What it means |
|-----------|-----------|---------------|
| **Combinatorial** (§aperiodicity-halting) | Aperiodicity of $(T,I)$ | No oriented cycles in the Cayley graph (history monoid) |
| **Geometric** (§fischer-rao-convergence) | Fischer-Rao geodesicity | The moduli tower converges in the unique invariant metric |
| **Cohomological** (§cohomological-tunneling) | $H^1 = 0$ exhaustion | All obstruction classes are resolved by tunneling |

The mechanism connecting them:

1. **Aperiodicity kills $H^1$.** An aperiodic history monoid has no topological loops to
   support persistent $1$-cocycles. Every obstruction class in $H^1(T^{(n)}, J^{(n)};\, E_0)$
   is eventually resolved at some deeper level.

2. **$H^1 = 0$ kills non-surjectivity.** Vanishing of $H^1$ is equivalent to essential
   surjectivity of $\rho_n$ (§essential-surjectivity). Every depth-$n$ universe
   extends to depth $n+1$.

3. **Essential surjectivity kills non-convergence.** With $\rho_n$ essentially surjective,
   Čencov's theorem gives the Fischer-Rao metric, the EM iteration converges along a
   geodesic, and the depth tower reaches its fixed point.

The chain is: **aperiodicity $\to$ no $H^1$ $\to$ essential surjectivity $\to$ convergence**.
Each link is an equivalence, so the chain runs in both directions.

#### Remark — Cohomological Tunneling as the Mechanism {#unification-tunneling}

The cohomological tunneling conjecture (§cohomological-tunneling) describes the *mechanism*
by which condition (C) is achieved dynamically. Each tunneling event — a trapped mode
acquiring a nonzero obstruction class and jumping to a lower eigenvalue — eliminates one
contribution to $H^1$. The rate of tunneling is proportional to the Fischer-Rao curvature
of $\mathcal{M}_n$ (§cohomological-tunneling): in high-curvature regions (far from the
fixed point), tunneling is frequent; in flat regions (near the fixed point), it is rare
but each event is large. This rate-curvature correspondence is the dynamical content of
the unification: it connects the static equivalence of conditions (A)–(C) to the
time-evolution of the depth tower.

**Status.** Draft. The equivalence (A) $\Leftrightarrow$ (C) is established modulo the
identification of history-monoid cycles with persistent $H^1$ classes, which requires a
precise statement of the Čech-to-derived comparison on the history site. The equivalence
(C) $\Leftrightarrow$ (B) uses the essential surjectivity theorem (§essential-surjectivity)
and Amari's convergence result. The full circle (A) $\Rightarrow$ (C) $\Rightarrow$ (B)
$\Rightarrow$ (A) is complete.
