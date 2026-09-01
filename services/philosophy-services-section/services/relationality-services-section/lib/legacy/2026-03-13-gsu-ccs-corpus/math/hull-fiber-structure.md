---
id: hull-fiber-structure
name: HullFiberStructure
description: "the fiber algebra H^hull_T at T in Omega(Q^H) is the patch lattice — the directed colimit of finite patch posets ordered by subpatch inclusion — a locally finite Heyting algebra with restriction maps induced by subpatch projection."
---

### Construction — Hull Fiber Structure {#hull-fiber-structure}

#### The Patch Lattice {#hfs-patch-lattice}

Fix $\mathcal{T} \in \Omega(Q^\mathcal{H})$. For each radius $r \geq 0$, the **radius-$r$
patch** of $\mathcal{T}$ at position $v \in \mathbb{N}^d$ is the finite restriction
$$
P_r^\mathcal{T}(v) \;:=\; \mathcal{T}|_{B(v,r)} \;:\; B(v,r) \;\to\; \mathcal{H},
$$
where $B(v,r) = \{w \in \mathbb{N}^d : |w - v| \leq r\}$. The set of all patches of
$\mathcal{T}$ of radius at most $r$ is denoted $\mathrm{Patches}_r(\mathcal{T})$.

The **patch poset** $\mathrm{Patches}_r(\mathcal{T})$ has the **subpatch order**: $P \leq P'$
if $P$ occurs as a sub-restriction of $P'$ — that is, $P = P'|_{B(v', r')}$ for some
center $v'$ and radius $r' \leq r$.

This poset is:
- **Finite**: the number of distinct patches of radius $r$ is bounded by $|\mathcal{H}|^{|B(0,r)|}$,
  which is finite at each level since $\mathcal{H}$-values are discrete.
- **A finite distributive lattice**: meets and joins are given by the lattice of patches under
  subpatch containment. Distributivity follows from the fact that patch containment distributes
  over union and intersection of sub-restrictions.

The **fiber algebra** at $\mathcal{T}$ is the directed colimit:
$$
H^{\mathrm{hull}}_\mathcal{T} \;:=\; \varinjlim_{r \geq 0}\, \mathrm{Patches}_r(\mathcal{T}),
$$
where the colimit maps are the inclusions $\mathrm{Patches}_r(\mathcal{T}) \hookrightarrow
\mathrm{Patches}_{r+1}(\mathcal{T})$ (every smaller patch is also a larger one).

#### Properties of $H^{\mathrm{hull}}_\mathcal{T}$ {#hfs-properties}

1. **Heyting algebra.** A directed colimit of finite distributive lattices (= finite Heyting
   algebras) in the category of Heyting algebras is a Heyting algebra. ✓

2. **Locally finite.** Every element has only finitely many elements below it: a patch $P$ of
   radius $r$ has only finitely many sub-patches (bounded by the number of sub-restrictions of
   $P$). ✓

3. **Not finite.** As $r \to \infty$, new patches appear (the quasicrystal is aperiodic, so no
   finite-radius patch characterizes the full structure). The colimit is countably infinite. ✓

4. **Not Boolean.** Excluded middle fails for patches: a patch $P$ satisfies $P \vee \neg P = \top$
   iff $P$ is clopen in the patch topology. The Fibonacci quasicrystal has patches that are neither
   forced to appear nor forced to be absent in any given region — these give non-Boolean elements.

#### Restriction Maps {#hfs-restriction}

The functor $H^{\mathrm{hull}} : (\mathbb{N}^d)^{\mathrm{op}} \to \mathbf{HA}$ requires
restriction maps
$$
\rho_{v \leq v+e_i} : H^{\mathrm{hull}}_{v+e_i} \;\longrightarrow\; H^{\mathrm{hull}}_v
$$
for each basis vector $e_i$ and each $v \in \mathbb{N}^d$.

**Definition.** The restriction $\rho_{v \leq v+e_i}$ sends a patch $P$ at position $v+e_i$
to the **restricted patch**: the image of $P$ under the map
$$
\rho_{v \leq v+e_i}(P) \;:=\; P \cap \mathcal{T}|_{B(v,r)} \quad (\text{at each radius } r),
$$
which discards the contribution of the $e_i$-step to the center and retains only the part of
$P$ relevant to the patch at $v$. Concretely: moving the center from $v+e_i$ back to $v$
restricts the visible neighborhood.

These restriction maps are:
- **Well-defined**: the restricted patch is a valid patch of $\mathcal{T}$ at $v$. ✓
- **Heyting algebra homomorphisms**: subpatch order is preserved by restriction, and the Heyting
  operations (meet, join, implication) are computed locally and hence commute with restriction. ✓
- **Functorial**: $\rho_{v \leq v+e_j} \circ \rho_{v+e_i \leq v+e_i+e_j} = \rho_{v \leq v+e_i} \circ \rho_{v+e_j \leq v+e_i+e_j}$,
  since both composites restrict to the patch at $v$ from the patch at $v+e_i+e_j$, and there
  is only one way to do this (the center shifts commute). ✓

The functoriality holds precisely because the history category $T^{\mathrm{hull}} = \mathbb{N}^d$
is fully commutative: moving from $v+e_i+e_j$ to $v$ by two restriction steps, in either order,
gives the same result.

#### Comparison with the Ground-Level Fiber Doctrine {#hfs-comparison}

| Property | Ground-level $H_t$ | Hull-level $H^\mathrm{hull}_\mathcal{T}$ |
|----------|-------------------|------------------------------------------|
| Size | Finite | Locally finite, countably infinite |
| Logic | Intuitionistic | Intuitionistic (not Boolean) |
| Source of nuclei | Independence relation $I$ on $\mathbb{M}(\Sigma,I)$ | Fibonacci substitution $\Sigma$ |
| Restriction maps | Contravariantly functorial on $T$ | Contravariantly functorial on $\mathbb{N}^d$ |
| Fiber doctrine saturation | Non-trivial $\sigma_t$ | Trivial $\sigma^\mathrm{hull} = \mathrm{id}$ (§trivial-saturation-theorem) |

The hull fiber doctrine is the **locally finite** generalization of the ground-level fiber
doctrine: it relaxes finiteness to local finiteness while retaining the Heyting and nuclear
structure. The nuclear structure shifts from commutation-based to substitution-based
(§hull-nucleus-pair).
