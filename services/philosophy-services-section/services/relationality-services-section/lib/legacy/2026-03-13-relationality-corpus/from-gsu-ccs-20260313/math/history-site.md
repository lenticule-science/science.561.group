---

name: history-site
description: "Object: the canonical history site (T,J) — the history category T equipped with the Grothendieck topology J of commutation covers, the base site for all sheaf-theoretic constructions."

---

### Definition — The History Site {#history-site}

The **history site** is the pair
$$
(T, J),
$$
where $T$ is the history category (§history) and $J$ is the Grothendieck topology of
commutation covers (§commutation-topology). It is the canonical site over which all
sheaf-theoretic objects in this paper are constructed.

#### Constituents {#history-site-constituents}

- **$T$**: the thin poset-category whose objects are histories $[w] \in \mathbb{M}(\Sigma,I)$
  and whose morphisms are given by the prefix order $t \leq t'$ (§order). $T$ is small.

- **$J$**: the commutation topology (§commutation-topology) — the unique Grothendieck
  topology on $T$ whose covering sieves are exactly those containing a commutation cover:
  a family $\{t^{(i)} \to t\}$ covers $t$ whenever the $t^{(i)}$ form a commutation
  partition of $t$ — pairwise commuting pieces whose concatenation is $t$.

#### Role in This Theory {#history-site-role}

Every sheaf-theoretic construction in this paper lives over $(T,J)$:

| Construction | How $(T,J)$ is used |
|---|---|
| Propositional presheaf $H$ | Contravariant functor $T^\mathrm{op} \to \mathbf{HA_{nucl}}$ |
| Relational universe $R$ | $R = \mathbf{Sh}(T,J)$ — the Grothendieck topos |
| Day convolution $\circledast$ | Built from the monoidal structure of $T$ |
| Sheaf condition on $H$ | $H$ satisfies gluing for every $J$-covering family |

The site $(T,J)$ is **subcanonical**: every representable presheaf $y(t) = \mathrm{Hom}_T(-,t)$
is a sheaf (§commutation-topology). This follows from the compatibility condition:
over a commutation cover, compatible families are automatically compatible because
the pieces have disjoint step-sets, forcing $H_e$ (the fiber over the empty history)
to be the terminal algebra.
