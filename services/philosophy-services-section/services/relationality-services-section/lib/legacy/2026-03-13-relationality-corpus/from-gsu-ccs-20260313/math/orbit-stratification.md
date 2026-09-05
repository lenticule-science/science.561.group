---

name: orbit-stratification
description: "fiber elements ascend monotonically through the depth-filtration tower and stabilize in H_t* — the orbit stratification of U_G; requires categorical definition of U_G action on elements, monotonicity proof, and finite stabilization proof."
---

### Conjecture — Orbit Stratification {#orbit-stratification}

**Setting.** Let $\iota_n : R_n \hookrightarrow R_{n+1}$ be the depth-tower
inclusions (§depth-filtration). Each inclusion induces a fiberwise map
$\iota_n^* : H_t^{R_n} \to H_t^{R_{n+1}}$ on fiber algebras at history $t$. The
**orbit** of a fiber element $x \in H_t^{R_0}$ is the sequence of its images
under successive inclusions followed by the joint projection $\pi_t$
(§joint-projection):
$$
x^{(0)} := x, \qquad x^{(n+1)} := \mathrm{Stab}\bigl(\iota_n^*(x^{(n)})\bigr)
\;=\; \sigma_{n+1}\bigl(\Delta_{n+1}(\iota_n^*(x^{(n)}))\bigr) \;\in\; H_t^{*(R_{n+1})},
$$
where $\sigma_{n+1}, \Delta_{n+1}$ are the fiber nuclei of $R_{n+1}$.

#### Conjecture — Orbit Stratification {#thm-orbit-stratification}

For every fiber element $x \in H_t^{R_0}$:

1. **Inflation.** Each inclusion $\iota_n^*$ is inflationary in the lattice
   order: $x^{(n)} \leq \iota_n^*(x^{(n)})$ in $H_t^{R_{n+1}}$. After
   stabilization, $x^{(n+1)} = \mathrm{Stab}(\iota_n^*(x^{(n)})) \geq x^{(n)}$
   in the induced order on $H_t^{*(R_{n+1})}$. The orbit is ascending: each step
   moves $x$ toward a larger, more settled element.

2. **Fixed layer.** The sequence stabilizes: there exists $N$ such that
   $x^{(n)} = x^{(N)}$ for all $n \geq N$. The stabilized value $x^{(\infty)}$
   lies in the fixed fiber $H_t^*$.

3. **Minimality.** Among all sublattices of $H_t$ that are stable under $U_G$
   and contain $x^{(\infty)}$, the fixed fiber $H_t^*$ is the smallest: any
   orbit-stable sublattice lies above $H_t^*$ in the lattice of closed subsets.

#### Corollary — Reachability Structure {#orbit-reachability}

The orbit stratification induces a **reachability order** on $H_t$: write
$x \rightsquigarrow y$ if $y = x^{(n)}$ for some $n$, i.e., $y$ is reachable
from $x$ by iterated application of $U_G$. This order satisfies:
$$
x \rightsquigarrow x^{(\infty)} \in H_t^* \quad \text{for every } x \in H_t,
$$
and $H_t^*$ consists of exactly those elements $x$ satisfying $x = x^{(\infty)}$.

**Relation to directed comonad.** The orbit stratification is the fiberwise
shadow of the directed comonad structure (§directed-comonad). Note: $U_G$ is a
closure operator / monad on the category of relational universes, not a comonad
on $R$; the name "directed comonad" in §directed-comonad refers to its comonadic
behavior on histories, not on the relational universe itself.

**Relation to depth filtration.** The depth filtration of §depth-filtration
stratifies the entire topos $R$ by depth; orbit stratification is the fiberwise
version, tracking individual elements' descent to stability.

**Status.** Stub. Requires: (a) a categorical definition of the induced
action of $U_G$ on individual fiber elements (not just on the entire topos),
(b) proof of monotonicity from the depth-filtration order, and (c) proof of
finite stabilization (which may require finiteness of $H_t$).
