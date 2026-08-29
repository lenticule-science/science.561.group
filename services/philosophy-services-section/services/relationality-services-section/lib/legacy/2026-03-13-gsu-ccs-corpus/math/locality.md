---
id: locality
name: Locality
description: "Locality — H is a sheaf on the canonical history site (T,J)."
defines: Locality
---

### Axiom — Locality {#locality}

*Relations aspect of geometry: when local data coheres globally.*

There exists a commutation topology $J$ on $T$ (§commutation-topology) such that
$H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ is a sheaf on $(T,J)$.

**Locality and Gluing.** For every $t$ and every covering family $\{u_i : t_i \to t\}
\in J(t)$:

1. **Locality.** If $a, b \in H_t$ satisfy $H(u_i)(a) = H(u_i)(b)$ for all $i$,
   then $a = b$.

2. **Gluing.** Suppose $(a_i)_{i \in I}$ is a compatible family with $a_i \in H_{t_i}$.
   Then there exists a unique $a \in H_t$ such that $H(u_i)(a) = a_i$ for all $i$.

Thus $H$ is a sheaf of Heyting-modal algebras on $(T,J)$.

> **Remark.** {#remark-locality-interpretation} The Axiom of Locality equips the
> fibers with a local-to-global structure: propositions can be specified locally on
> history covers and glued into global propositions, subject to compatibility on overlaps.
> This supports the internal geometric interpretation — the Grothendieck topos
> $R = \mathbf{Sh}(T,J)$ and the invariant locale $\mathsf{Phase}$ assembled from
> the fixed fibers.

#### Corollary — Fiber Product Decomposition {#thm-fiber-product-decomposition}

For any two commuting steps $h \mathrel{I} s$ with concatenation $t = [h \cdot s]$,
the Axiom of Locality gives a canonical isomorphism of Heyting algebras
$$
H_{h \cdot s} \;\cong\; H_h \times_{H_e} H_s,
$$
where the fiber product is taken over the restriction-to-empty-history maps
$H_h \to H_e$ and $H_s \to H_e$. A compatible pair $(a, b) \in H_h \times H_s$
is a pair satisfying $H(h \to e)(a) = H(s \to e)(b)$ in $H_e$; the sheaf
condition supplies a unique amalgamation in $H_t$ for every such pair.

This is the structural identity underlying the transfer nucleus $\Delta_t$
(§transfer-nucleus): the projection $H_{s \star t} \to H_t$ in the fiber
product has image exactly those elements of $H_t$ that are witnessed by some
proposition in $H_{s \star t}$. This image is a proper sub-algebra of $H_t$
when $H_e$ is non-trivial (i.e., when $H_e \not\cong \mathbf{1}$), and $\Delta_t$
reflects onto the intersection of all such images over all independent
one-step extensions.

The fiber product decomposition makes §nucleus-commutation geometrically natural:
the Diamond Lemma for history monoids is the statement that the two paths through
the fiber product square agree — the fiber-level reflection of commutation-cover
gluing.

#### Connection to the Commutation Topology {#locality-topology-connection}

The Axiom of Locality is the coherence statement between the algebraic and geometric
expressions of the independence relation $I \subseteq \Sigma \times \Sigma$:

- **Algebraic** ($\Delta_t$): uses $\{s \in \Sigma : s \perp t\}$ to define the
  transfer-stable sub-algebra via images of restriction maps from independent
  one-step extensions.
- **Geometric** ($J$): uses the same independence relation to form commutation
  covers — families of sub-histories with disjoint, mutually commuting step-sets.

$H$ being a sheaf for $J$ (this axiom) is what makes the fiber product
decomposition well-formed and the restriction maps in $\Delta_t$'s definition
coherent. That $J$ is canonically determined by the transfer nucleus structure is
an open theorem (§commutation-topology).

