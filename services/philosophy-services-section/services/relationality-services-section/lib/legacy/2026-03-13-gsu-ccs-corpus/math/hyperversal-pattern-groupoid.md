---
id: hyperversal-pattern-groupoid
name: HyperversalPatternGroupoid
description: "the pattern groupoid G_{Q^H} of the hyperversal quasicrystalline hypertensor — the transformation groupoid Omega(Q^H) x| Z^d whose classifying topos is the hull topos."
---

### Definition — Hyperversal Pattern Groupoid {#hyperversal-pattern-groupoid}

The $\mathbb{Z}^d$-action on the hull $\Omega(Q^\mathcal{H})$ (§hyperversal-quasicrystal-hull)
organizes into a groupoid whose classifying topos carries the full cohomological content of
the quasicrystalline pattern.

#### Definition — Hyperversal Pattern Groupoid {#def-hyperversal-pattern-groupoid}

The **hyperversal pattern groupoid** is the transformation groupoid
$$
\mathcal{G}_{Q^\mathcal{H}}
\;:=\;
\Omega(Q^\mathcal{H}) \rtimes \mathbb{Z}^d,
$$
defined by:

- **Objects:** elements $\mathcal{T} \in \Omega(Q^\mathcal{H})$.
- **Morphisms:** triples $(\mathcal{T},\, v,\, \tau_v \mathcal{T})$ for $\mathcal{T} \in \Omega(Q^\mathcal{H})$
  and $v \in \mathbb{Z}^d$, representing the lattice translation by $v$ at the point $\mathcal{T}$.
- **Composition:** $(\tau_v \mathcal{T},\, w,\, \tau_{v+w}\mathcal{T}) \circ (\mathcal{T},\, v,\, \tau_v \mathcal{T})
  = (\mathcal{T},\, v+w,\, \tau_{v+w}\mathcal{T})$.
- **Identity:** $(\mathcal{T},\, 0,\, \mathcal{T})$.
- **Inverse:** $(\mathcal{T},\, v,\, \tau_v \mathcal{T})^{-1} = (\tau_v \mathcal{T},\, -v,\, \mathcal{T})$.

$\mathcal{G}_{Q^\mathcal{H}}$ is an **étale groupoid**: the source and target maps are local
homeomorphisms, since each translation $\tau_v : \Omega \to \Omega$ is a homeomorphism.

#### Local Indistinguishability {#pattern-groupoid-local}

Two hypertensors $\mathcal{T}, \mathcal{T}' \in \Omega(Q^\mathcal{H})$ are **locally
indistinguishable** when every finite patch appearing in $\mathcal{T}$ appears in $\mathcal{T}'$
and vice versa. By minimality of the hull (§hyperversal-quasicrystal-hull), every two elements of
$\Omega(Q^\mathcal{H})$ are locally indistinguishable — the hull consists precisely of those
hypertensors that share all local patches with $Q^\mathcal{H}$.

The groupoid $\mathcal{G}_{Q^\mathcal{H}}$ is therefore a transitive groupoid: there is a
morphism between any two objects (possibly via multiple translation steps). This
transitivity is the categorical statement of minimality.

#### The Gap-Labeling Structure {#pattern-groupoid-gap-labeling}

The groupoid $C^*$-algebra $C^*(\mathcal{G}_{Q^\mathcal{H}}) \cong C(\Omega(Q^\mathcal{H})) \rtimes \mathbb{Z}^d$
is the crossed product of the continuous functions on the hull by the $\mathbb{Z}^d$-action.
Its K-theory groups
$$
K_0(C^*(\mathcal{G}_{Q^\mathcal{H}})), \quad K_1(C^*(\mathcal{G}_{Q^\mathcal{H}}))
$$
classify the **gap labels** of the hyperversal quasicrystal: the values taken by the
frequency measure $\mu_\Omega$ on the clopen subsets of $\Omega(Q^\mathcal{H})$, which
index the possible spectral gaps in the corresponding spectral decomposition (§spectral-decomposition).

By the gap-labeling theorem (Bellissard–Kellendonk–Putnam), the image of $\mu_\Omega$ on
$K_0$ is the **quasicrystal gap group**, a dense subgroup of $\mathbb{R}$ determined by
the Fibonacci substitution matrix eigenvalue $\phi$.

#### The Classifying Topos {#pattern-groupoid-topos}

The classifying topos of $\mathcal{G}_{Q^\mathcal{H}}$ is the hull topos
(§hyperversal-hull-topos):
$$
B\mathcal{G}_{Q^\mathcal{H}} \;\simeq\; \mathbf{Sh}(\Omega(Q^\mathcal{H})),
$$
by the standard equivalence between sheaves on a locally compact Hausdorff space and
sheaves on the transformation groupoid of a minimal action on that space. The groupoid
and the hull topos carry the same cohomological data through different presentations.

**Status.** The groupoid construction is standard once the hull is established
(§hyperversal-quasicrystal-hull). The gap-labeling statement requires the K-theory
computation, which depends on the Fibonacci substitution structure established in
§quasicrystal-hypertensor.
