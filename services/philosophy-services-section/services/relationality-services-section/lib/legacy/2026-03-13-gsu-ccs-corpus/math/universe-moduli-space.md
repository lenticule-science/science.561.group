---
id: universe-moduli-space
name: UniverseModuliSpace
description: "The category of depth-n relational universes forms a Grothendieck site whose sheaf topos is the H-geometry ambient topos at level n."
defines: UniverseModuliSpace
---

### Construction — The Moduli Space of Relational Universes {#universe-moduli-space}

The **moduli space at depth $n$** is the category $\mathcal{M}_n$ of relational universes of
depth $\leq n$, equipped with a Grothendieck topology that turns it into a site. Its sheaf
topos $\mathbf{Sh}(\mathcal{M}_n, K_n)$ is the ambient geometric setting for H-algebra at
level $n$ — the universe-level analogue of the ambient topos $R = \mathbf{Sh}(T, J)$.

#### Objects: The Depth-$n$ Nucleus Families {#moduli-objects}

The **objects** of $\mathcal{M}_n$ are the admissible nucleus families at depth $n$ defined
in §depth-filtration:
$$
|\mathcal{M}_n| \;:=\; \bigl\{\; \mathbf{U} = (T_\mathbf{U},\, J_\mathbf{U},\, H_\mathbf{U}) \;\big|\; T_\mathbf{U} = T^{(n)},\; \text{axioms §history-and-fiber-algebra–§closure-and-self-generation satisfied at depth } n \;\bigr\}.
$$
This is a finite set (§depth-filtration: each $\mathcal{M}_n$ is finite). The canonical universe
$R$ is the object with $T_\mathbf{U} = T$, corresponding to the colimit $n = \omega$.

#### Morphisms: Universe Morphisms Between Levels {#moduli-morphisms}

The **morphisms** $\mathcal{M}_n(\mathbf{U}, \mathbf{V})$ are the universe morphisms
$(\phi, \alpha) : \mathbf{U} \to \mathbf{V}$ of §universe-morphism — pairs of a
history-site morphism and a presheaf isomorphism preserving the nuclear structure.

This enriches the discrete set $|\mathcal{M}_n|$ from §depth-filtration with horizontal
morphisms between universes at the same depth. The depth-filtration's restriction maps
$\rho_n : \mathcal{M}_{n+1} \to \mathcal{M}_n$ become functors between these categories,
not just set maps.

Together with the universe category construction §universe-category, this gives:
$$
\mathcal{M}_0 \xleftarrow{\rho_0} \mathcal{M}_1 \xleftarrow{\rho_1} \mathcal{M}_2 \xleftarrow{\rho_2} \cdots
$$
as a tower of categories (not just sets) with restriction functors.

#### The Moduli Topology $K_n$ {#moduli-topology}

A **coverage sieve** on $\mathbf{U} \in \mathcal{M}_n$ is a set $S$ of morphisms with codomain
$\mathbf{U}$. Define $S \in K_n(\mathbf{U})$ if and only if: for every history $t \in T^{(n)}$,
the collection of fiber maps
$$
\bigl\{\; \alpha_t : H_{\mathbf{V}, \phi(t)} \xrightarrow{\;\sim\;} H_{\mathbf{U}, t} \;\big|\; (\phi, \alpha) \in S \;\bigr\}
$$
constitutes a $J$-covering family for the fiber $H_{\mathbf{U}, t}$ in the sense of §locality.

**Proposition** (Grothendieck topology). $K_n$ satisfies the axioms:
1. *Maximality*: the maximal sieve (all morphisms into $\mathbf{U}$) covers $\mathbf{U}$ — at every history $t$, the identity $H_{\mathbf{U},t} \xrightarrow{\sim} H_{\mathbf{U},t}$ provides a $J$-cover.
2. *Stability*: if $S \in K_n(\mathbf{U})$ and $(\psi, \beta) : \mathbf{W} \to \mathbf{U}$, then $\psi^* S := \{(\phi,\alpha) \circ (\psi,\beta) : (\phi,\alpha) \in S\} \in K_n(\mathbf{W})$ — pullback of a $J$-cover along a morphism of history sites is a $J$-cover (by the same pullback-stability that holds for $J$ in §locality).
3. *Transitivity*: follows from transitivity of $J$ applied fiberwise.

The site $(\mathcal{M}_n, K_n)$ is a Grothendieck site. $\square$

#### The H-Geometry Topos at Level $n$ {#h-geometry-topos-n}

The **H-geometry topos at level $n$** is the sheaf topos
$$
\mathcal{H}\text{-}\mathbf{Geom}_n \;:=\; \mathbf{Sh}(\mathcal{M}_n, K_n).
$$
Its objects are sheaves on the site of relational universes — contravariant functors
$\mathcal{M}_n^{\mathrm{op}} \to \mathbf{Set}$ satisfying the gluing condition for $K_n$.

This is a Grothendieck topos by the standard construction (§ambient-topos), one level up:
the role of histories is played by universes, the role of the fiber topology $J$ is played by
$K_n$.

**Remark — The analogy with $R$.** The ambient topos $R = \mathbf{Sh}(T, J)$ is
$\mathcal{H}\text{-}\mathbf{Geom}$ at the proto-level: replace "histories" by "relational universes",
replace "fiber algebras over histories" by "sheaf toposes over universes", replace $J$ by $K_n$.
The nuclear quartet construction applied to $(\mathcal{M}_n, K_n)$ produces the next turn of the
hyperverse tower.

#### The Colimit Site $\mathcal{M}_\omega$ {#moduli-colimit}

The tower of restriction functors
$$
\cdots \to \mathcal{M}_2 \to \mathcal{M}_1 \to \mathcal{M}_0
$$
has a colimit $\mathcal{M}_\omega$ in the 2-category of Grothendieck sites. Its objects are
relational universes of all finite depths; its morphisms are universe morphisms; its topology
$K_\omega$ is the colimit topology.

The sheaf topos
$$
\mathcal{H}\text{-}\mathbf{Geom} \;:=\; \mathbf{Sh}(\mathcal{M}_\omega, K_\omega)
$$
is the **H-geometry topos** — the ambient geometric setting for the full hyperverse $\mathcal{H}$.
The Beck–Chevalley tower (§beck-chevalley-tower) is the sheafification sequence over $\mathcal{M}_\omega$:
at each finite stage, $\Delta$-BC fails at frontier universes; the colimit $\mathcal{H}$ is where
both BC conditions hold globally, by the same defect-mobility argument as §beck-chevalley-tower applied
one level up.

#### Two Moduli Notions Distinguished {#two-moduli}

**Fiber-level** (§depth-filtration): $\mathcal{M}_n = \{\text{admissible nucleus families at depth } n\}$
is a finite *set* with restriction maps. It measures: how many distinct fiber algebras
can exist over histories of depth $\leq n$.

**Universe-level** (this unit): $\mathcal{M}_n$ is a *category* — the same finite set of objects
equipped with universe morphisms and the topology $K_n$. The discrete set is the $0$-skeleton;
the category is the full site.

The two are compatible: $|\mathcal{M}_n|$ (objects of this unit) equals the finite set of §depth-filtration.
The notation $\mathcal{M}_n$ is shared deliberately: the depth-filtration constructs the objects;
this unit constructs the morphisms and topology needed to form the site.
