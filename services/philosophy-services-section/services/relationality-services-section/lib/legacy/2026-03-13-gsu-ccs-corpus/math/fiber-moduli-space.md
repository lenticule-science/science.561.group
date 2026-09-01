---
id: fiber-moduli-space
name: FiberModuliSpace
description: "The fiber moduli space M_n is the finite set of admissible nucleus families over T^(n); restriction maps assemble them into an inverse system."
---

### Definition — Fiber Moduli Space {#fiber-moduli-space}

A **nucleus family at depth $n$** is a collection
$$
\mathfrak{n} = \bigl\{(\sigma_t,\, \Delta_t)\bigr\}_{t \in T^{(n)}}
$$
of nucleus pairs in $\mathbf{HA_{nucl}}$ (§nuclear-heyting-algebra), compatible with the reindexing maps over
$T^{(n)}$ (§history-sublevel): for every prefix extension $i : t \to t'$ in $T^{(n)}$, the
restriction $\rho_{t} = H(i)$ satisfies
$$
\rho_{t} \circ \sigma_{t'} = \sigma_t \circ \rho_{t}, \qquad
\rho_{t} \circ \Delta_{t'} = \Delta_t \circ \rho_{t}.
$$

The **fiber moduli space at depth $n$** is the set of all admissible nucleus families:
$$
\mathcal{M}_n \;:=\; \bigl\{\; \mathfrak{n} \;\big|\; \mathfrak{n} \text{ is an admissible nucleus family over } T^{(n)} \;\bigr\}.
$$

**Finiteness.** Each $\mathcal{M}_n$ is finite: $T^{(n)}$ is finite (§history-sublevel), each fiber
$H_t$ is a finite Heyting algebra (§fiber-doctrine), and the nucleus pairs $(\sigma_t, \Delta_t)$
are drawn from the finite set of closure operators on $H_t$.

**Restriction maps.** The depth-inclusions $T^{(n)} \hookrightarrow T^{(n+1)}$ induce set maps
$$
\rho_n : \mathcal{M}_{n+1} \longrightarrow \mathcal{M}_n, \qquad
\rho_n(\mathfrak{n}) := \mathfrak{n}|_{T^{(n)}},
$$
assembling $(\mathcal{M}_n, \rho_n)_{n \in \mathbb{N}}$ into an inverse system of finite sets.

**What this is and is not.** The fiber moduli space is a *set* — it classifies the possible
nuclear structures over histories of depth $\leq n$. It has no morphisms between its elements,
no topology, and no site structure. For the enrichment to a site (with universe morphisms and
a Grothendieck topology), see §universe-moduli-space. The fiber moduli space is to
§universe-moduli-space as $|\mathcal{C}|$ is to a category $\mathcal{C}$: the objects without
the morphisms.

**Remark — Growth rate.** The cardinality $|\mathcal{M}_n|$ grows (at most exponentially) in $n$,
bounded by the number of monotone closure operators on the product of fiber algebras at depth $\leq n$.
For concrete history systems, $|\mathcal{M}_n|$ can be computed explicitly.
