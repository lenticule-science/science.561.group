---

name: fischer-rao-convergence
description: "Fischer-Rao Convergence"
---

### Conjecture — Fischer-Rao Convergence {#fischer-rao-convergence}

The depth tower of nucleus families converges (the sequence $(\sigma_t, \Delta_t)_{t \in T}$
stabilizes in a suitable limit topology) *if and only if* the sequence of lifted probability
sheaves $p_n \in \mathcal{P}(\mathbf{Sh}(\mathcal{M}_n, K_n))$ follows a geodesic in the
Fischer-Rao metric (§fischer-rao-metric). Equivalently, iteration of the restriction functors
$\rho_n$ is natural-gradient descent on the space of probability sheaves over the moduli site.

*Remark.* The "if" direction (geodesicity implies convergence) follows from the Fischer-Rao metric
being a Lyapunov function for the restriction functors when $\rho_n$ is essentially surjective
(§fischer-rao-metric). The "only if" direction (non-geodesic sequences cannot converge) depends on
the geometry of $\mathbf{Sh}(\mathcal{M}_n, K_n)$ and has not been established in general. This
remains an open problem.

*Connection to essential surjectivity.* When $\rho_n$ fails to be essentially surjective, the
Fischer-Rao metric is not uniquely determined (Čencov's theorem requires surjectivity). The failure
of essential surjectivity is detected by $H^1(\mathcal{M}_n, K_n;\, E_0) \neq 0$: cohomological
obstructions prevent extending all depth-$n$ universes to depth $n+1$. Thus convergence of the
Fischer-Rao geodesic requires the exhaustion of $H^1$ obstructions — the same condition that
drives convergence via cohomological tunneling (§cohomological-tunneling) and that is equivalent to
the aperiodicity halting condition (§convergence-unification).

*References.* N. N. Čencov, *Statistical Decision Rules and Optimal Inference*, AMS, 1982;
L. L. Campbell, *Proc. Amer. Math. Soc.* 98 (1986) 135–141; S. Amari, *Neural Computation* 10
(1998) 251–276; N. Ay, J. Jost, H. V. Lê, L. Schwachhöfer, *Information Geometry*, Springer, 2017.
