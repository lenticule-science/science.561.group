---
id: hull-truncation-tower
name: HullTruncationTower
description: "the hull truncation tower — the sequence R^hull,(0) ↪ R^hull,(1) ↪ ⋯ of finite-fiber relational universes whose colimit is R^hull. Structural parallel: same shape as the hyperverse tower. Interplay conjecture: the two towers parametrize a grid R^(n),(r) = U_H^n(R^hull,(r)) whose commutativity or non-commutativity is open."
---

### Construction — Hull Truncation Tower {#hull-truncation-tower}

#### The Truncations {#htt-truncations}

The hull fiber $H^\mathrm{hull}_\mathcal{T} = \varinjlim_{r \to \infty} \mathrm{Patches}_r(\mathcal{T})$
is a directed colimit of finite Heyting algebras (§hull-fiber-structure). Each truncation

$$
H^{\mathrm{hull},(r)}_\mathcal{T} \;:=\; \mathrm{Patches}_r(\mathcal{T})
$$

is a finite Heyting algebra — the lattice of local patterns in $\mathcal{T}$ up to radius $r$.
The substitution nuclei $\sigma^\Sigma, \Delta^\Sigma$ restrict to each truncation level
(patterns at radius $r$ map to patterns at radius $r$ under $\Sigma$ and $\Sigma^{-1}$),
so each $H^{\mathrm{hull},(r)}_\mathcal{T}$ carries commuting nuclei.

**Key point.** Each $H^{\mathrm{hull},(r)}_\mathcal{T}$ is a **finite** Heyting algebra with
commuting nuclei — an object of $\mathbf{HA_{nucl}}$ satisfying the original Fiber Algebra
axiom, not the locally-finite extension. The locally-finite hull fiber is the colimit of a
directed system of objects that each lie inside the original doctrine.

#### The Tower {#htt-tower}

Define the **hull truncation tower**:
$$
R^{\mathrm{hull},(0)} \hookrightarrow R^{\mathrm{hull},(1)} \hookrightarrow R^{\mathrm{hull},(2)} \hookrightarrow \cdots
$$
where $R^{\mathrm{hull},(r)} = \mathbf{Sh}(\mathbb{N}^d, J^\mathrm{hull})$ with fibers truncated
at radius $r$: the fiber algebra at history $v$ is $H^{\mathrm{hull},(r)}_{\tau_v Q^\mathcal{H}}$.

Each $R^{\mathrm{hull},(r)}$ is a genuine relational universe in the original sense (finite
fibers, fully commutative history monoid $\mathbb{N}^d$, commuting nuclei). The inclusion
$R^{\mathrm{hull},(r)} \hookrightarrow R^{\mathrm{hull},(r+1)}$ is the natural map induced by
the inclusion of patch lattices at adjacent radii.

The colimit is the hull:
$$
R^\mathrm{hull} \;=\; \varinjlim_{r \to \infty} R^{\mathrm{hull},(r)}.
$$

#### Structural Parallel with the Hyperverse Tower {#htt-parallel}

The hull truncation tower has the same shape as the hyperverse tower (§hyperverse-tower):

| | Hyperverse tower | Hull truncation tower |
|---|---|---|
| **Objects** | Relational universes $R^{(n)}$ | Truncated hull universes $R^{\mathrm{hull},(r)}$ |
| **Step** | Universe closure $U_\mathcal{H}$ | Radius extension (add one layer of patches) |
| **Colimit** | $\mathcal{H}$ (outside original doctrine at universe level) | $R^\mathrm{hull}$ (outside original doctrine at fiber level) |
| **Why outside** | $\mathcal{H}$'s fibers are over all universes, not one fixed $T$ | Hull fibers are locally finite, not finite |
| **Fixed point** | $\mathcal{H} = U_\mathcal{H}(\mathcal{H})$ | $R^\mathrm{hull} \cong R^{\mathrm{hull},(r)}$ for all $r$ (same patches up to iso) |

Both towers reach a colimit that escapes the original finite axiom system — the hyperverse
tower escapes at the universe level, the hull truncation tower escapes at the fiber level.
Both colimits are fixed points of their respective step operations.

#### The Interplay Grid {#htt-interplay}

Since each $R^{\mathrm{hull},(r)}$ is a genuine relational universe, it is an object on which
the universe closure $U_\mathcal{H}$ can be applied. This yields a two-dimensional array:
$$
R^{(n),(r)} \;:=\; U_\mathcal{H}^n\!\bigl(R^{\mathrm{hull},(r)}\bigr)
$$
with the hyperverse tower running in the $n$-direction and the hull truncation tower running
in the $r$-direction.

The corners and axes:
- $R^{(0),(0)}$: the radius-0 hull universe (simplest concrete universe with full commutation)
- $R^{(\infty),(r)} = \mathcal{H}$ for each fixed $r$: the hyperverse tower on any hull truncation converges to $\mathcal{H}$ (if $\mathcal{H}$ is terminal, §hyperverse-terminality)
- $R^{(0),(\infty)} = R^\mathrm{hull}$: the hull
- $R^{(\infty),(\infty)}$: both towers taken to their colimits simultaneously — should again be $\mathcal{H}$ if the operations are compatible

**Conjecture (Interplay Commutativity).** The grid $R^{(n),(r)}$ commutes in the limit:
$$
\varinjlim_{n,r} R^{(n),(r)} \;\cong\; \mathcal{H}.
$$
The two directions of growth — adding universe levels and adding patch radii — are compatible
in the sense that taking both to their colimits converges to the same fixed point $\mathcal{H}$.

#### The Residue Interpretation {#htt-residue}

The hull is the "residue" after the hyperverse tower converges: it is the geometric trace that
the quasicrystalline fixed point $Q^\mathcal{H}$ leaves on the space of tiling patterns. The
hull truncation tower then says that this residue itself has an internal tower structure,
running in a direction orthogonal to the universe tower.

The two towers measure two distinct kinds of incompleteness:
- **Universe tower**: incompleteness at the type level — there are propositions about universes
  not yet expressible within $R^{(n)}$, generating the next level.
- **Hull truncation tower**: incompleteness at the fiber level — there are local patterns in
  $Q^\mathcal{H}$ not yet visible at radius $r$, generating the next truncation.

Whether these two kinds of incompleteness interact — whether adding a universe level also
reveals new patch patterns, or vice versa — is the open question the interplay grid poses.
