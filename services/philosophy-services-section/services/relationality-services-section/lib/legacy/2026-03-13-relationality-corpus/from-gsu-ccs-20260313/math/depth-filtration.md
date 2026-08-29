---

name: depth-filtration
description: "The depth tower assembles the depth-n relational universes R_n into a filtered diagram R_0 to R_1 to R with geometric morphisms at each stage."
defines: DepthFiltration
---

### Construction — Depth Tower {#depth-filtration}

For each $n \in \mathbb{N}$, the **depth-$n$ relational universe** is the sheaf topos
$$
R_n \;:=\; \mathbf{Sh}\!\bigl(T^{(n)},\; J|_{T^{(n)}}\bigr)
$$
built over the depth-$n$ sublevel (§history-sublevel) with the restricted commutation topology.
Each $R_n$ is a complete relational universe in its own right, satisfying all axioms at depth $n$.

The depth inclusions $T^{(n)} \hookrightarrow T^{(n+1)}$ induce geometric morphisms
$$
f_n : R_n \longrightarrow R_{n+1},
$$
and the full tower assembles as:
$$
R_0 \xrightarrow{f_0} R_1 \xrightarrow{f_1} R_2 \xrightarrow{f_2} \cdots \longrightarrow R \;=\; \mathbf{Sh}(T,J),
$$
with $R = \varinjlim_n R_n$ as the colimit.

**Each level is a full relational universe.** $R_n$ has its own history category $T^{(n)}$,
fiber algebras, topology, nuclei, and universe closure $U_{G_n}$. The inclusion $f_n : R_n \to R_{n+1}$
is a morphism of relational universes — not scaffolding, but a proper embedding.

**The fiber moduli at each level.** The admissible nucleus families over $T^{(n)}$ form the
fiber moduli space $\mathcal{M}_n$ (§fiber-moduli-space). The restriction maps
$\rho_n : \mathcal{M}_{n+1} \to \mathcal{M}_n$ are set maps. For the categorical enrichment
with universe morphisms and a site topology, see §universe-moduli-space.

**Connection to self-generation.** The colimit $R = \varinjlim_n R_n$ is the fixed point
in the Theorem of Least Fixed Point (§self-generation): $R = U_G(R)$. The depth tower is
the explicit filtered presentation of that fixed point.
