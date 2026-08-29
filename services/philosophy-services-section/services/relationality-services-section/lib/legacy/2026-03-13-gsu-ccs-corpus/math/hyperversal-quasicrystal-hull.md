---
id: hyperversal-quasicrystal-hull
name: HyperversalQuasicrystalHull
description: "the hull Omega(Q^H) of the hyperversal quasicrystalline hypertensor — the orbit closure under Z^d-translation, a compact metrizable Z^d-space with a unique invariant measure."
defines: HyperversalQuasicrystalHull
---

### Definition — Hyperversal Quasicrystal Hull {#hyperversal-quasicrystal-hull}

The orbit of the hyperversal quasicrystalline hypertensor under lattice translation has
a canonical closure that captures the full local structure of the quasicrystalline pattern.

#### Definition — Hyperversal Quasicrystal Hull {#def-hyperversal-hull}

Equip $\mathrm{Hyp}^\mathcal{H}(d)$ (§hyperversal-hypertensor-algebra) with the **local
topology**: two hypertensors $\mathcal{T}, \mathcal{T}'$ are $\varepsilon$-close when they
agree on the ball of radius $\lfloor 1/\varepsilon \rfloor$ around the origin,
$$
\mathcal{T}(v) = \mathcal{T}'(v) \quad \text{for all } |v| \leq \lfloor 1/\varepsilon \rfloor.
$$
The **hyperversal quasicrystal hull** is the orbit closure
$$
\Omega(Q^\mathcal{H})
\;:=\;
\overline{\{\,\tau_w Q^\mathcal{H} : w \in \mathbb{Z}^d\,}}
\;\subseteq\;
\mathrm{Hyp}^\mathcal{H}(d)
$$
in the local topology, where $\tau_w Q^\mathcal{H}$ denotes the translate
$(\tau_w Q^\mathcal{H})(v) = Q^\mathcal{H}(v + w)$.

#### Properties of the Hull {#hull-properties}

1. **Compact.** Every sequence of translates has a convergent subsequence in the local topology,
   by the Delone/Meyer property of $Q^\mathcal{H}$ (§hyperversal-quasicrystal-conjecture): finite
   patches recur with bounded gaps, so the value at any fixed $v$ ranges over a finite set, and
   Tychonoff applies to the product $\prod_{v \in \mathbb{Z}^d}(\text{finite set})$.

2. **Metrizable.** The local topology is induced by the metric
   $d(\mathcal{T}, \mathcal{T}') = \inf\{\varepsilon > 0 : \mathcal{T}, \mathcal{T}' \text{ agree on } |v| \leq 1/\varepsilon\}$.

3. **Minimal $\mathbb{Z}^d$-space.** The translation action $\tau : \mathbb{Z}^d \curvearrowright \Omega(Q^\mathcal{H})$
   is **minimal**: every orbit is dense. This follows from unique ergodicity
   (§hyperversal-quasicrystal-conjecture) together with the fact that $Q^\mathcal{H}$ is
   relatively dense — every local patch recurs in every translate's neighborhood.

4. **Unique ergodic measure.** There is a unique $\mathbb{Z}^d$-invariant Borel probability
   measure $\mu_\Omega$ on $\Omega(Q^\mathcal{H})$, the **quasicrystal frequency measure**:
   $\mu_\Omega(U)$ equals the asymptotic frequency with which any patch in the local basis $U$
   appears in $Q^\mathcal{H}$.

#### The Hull as a Compact $\mathbb{Z}^d$-Space {#hull-dynamical-system}

The pair $(\Omega(Q^\mathcal{H}), \mathbb{Z}^d)$ is a **minimal uniquely ergodic topological
dynamical system** — the standard structure from which tiling cohomology and gap-labeling
are computed. In the relational setting, the hull is:

- The **space of all relational patterns locally indistinguishable from $Q^\mathcal{H}$**: each
  point $\mathcal{T} \in \Omega(Q^\mathcal{H})$ is a hyperversal hypertensor with the same
  local statistics as $Q^\mathcal{H}$.
- The **boundary of the orbit**: the points of $\Omega(Q^\mathcal{H}) \setminus \{\tau_w Q^\mathcal{H}\}$
  are genuine limit points — hypertensors that arise as limits of translates but are not themselves
  translates of $Q^\mathcal{H}$.
- The **base space for the hull topos** (§hyperversal-hull-topos): sheaves on $\Omega(Q^\mathcal{H})$
  form the Grothendieck topos that captures quasicrystalline cohomology.

#### Relation to the Depth Filtration {#hull-depth-filtration}

At each finite level $n$, the hull $\Omega(Q^{(n)})$ of the level-$n$ hypertensor (§level-n-hypertensor)
is a compact $\mathbb{Z}^d$-space in $\mathrm{Hyp}^{(n)}(d)$. The tower inclusions
$R^{(n)} \hookrightarrow R^{(n+1)}$ induce continuous equivariant maps
$\Omega(Q^{(n)}) \hookrightarrow \Omega(Q^{(n+1)})$, and
$$
\Omega(Q^\mathcal{H}) \;=\; \varinjlim_n \Omega(Q^{(n)}).
$$
The hyperversal hull is the colimit of the tower of level-$n$ hulls.

**Status.** The compactness and metrizability follow from standard tiling theory once the
ground-level quasicrystallinity (§quasicrystal-hypertensor) is established. Minimality and
unique ergodicity are conditional on §hyperversal-quasicrystal-conjecture.
