---
id: directed-stratified-site
name: DirectedStratifiedSite
description: "the hyperverse tower is, at the meta-level, an instance of the same type of site as (T, J) — a directed stratified site — making the tower self-similar to its own base."
---

### Conjecture — The Hyperverse Tower as a Directed Stratified Site {#directed-stratified-site}

**The observation.** The relational universe $R = \mathbf{Sh}(T, J)$ is built as sheaves on a
site $(T, J)$ where $T$ carries two additional structures beyond a bare category:

- a **stratification**: the depth filtration $T^{(0)} \subseteq T^{(1)} \subseteq \cdots$ (§depth-filtration)
- a **directedness**: the prefix order $t \leq t'$ is irreversible — histories only grow

The hyperverse tower
$$
R^{(0)} \hookrightarrow R^{(1)} \hookrightarrow \cdots \hookrightarrow \mathcal{H}
$$
carries the same two structures at the meta-level:

- a **stratification**: $R^{(n)}$ is the $n$-th stratum, with $p(R^{(n)}) = n$
- a **directedness**: the tower inclusions are irreversible — $U_\mathcal{H}$ (§meta-universe-closure) is
  inflationary and non-invertible at every finite level

**Conjecture.** There exists a notion of **directed stratified site** — a site $(\mathcal{X}, \mathcal{J})$
equipped with a stratification poset $S$, a stratification functor $p : \mathcal{X} \to S$, and a
directedness structure — such that:

1. The history site $(T, J)$ is an instance (the 1-categorical case, with $S = \mathbb{N}$ ordered by depth).
2. The hyperverse tower, viewed as a site $(\mathcal{T}^{(1)}, \mathcal{J}^{(1)})$ with objects the
   relational universes and covers the density covers (§universe-category), is an instance (the meta-level
   case, with $S = \mathbb{N}$ ordered by tower level).
3. The operation $\mathbf{Sh}(-, -)$ carries directed stratified sites to directed stratified sites:
   $R = \mathbf{Sh}(T, J)$ is a directed stratified site, and $R^{(1)} = \mathbf{Sh}(\mathcal{T}^{(1)},
   \mathcal{J}^{(1)})$ is its meta-level counterpart.

If true, this makes the hyperverse tower **self-similar**: the passage from level $n$ to level $n+1$ is
the same type of construction as the passage from the history site to $R$.

**What a proof requires.**

- A precise definition of "directed stratified site" with correct axioms. The directedness structure
  must be stated as a property of the morphisms of $\mathcal{X}$ (irreversibility of the prefix order /
  tower inclusions), not as a modality on the topos $\mathbf{Sh}(\mathcal{X}, \mathcal{J})$ — the latter
  lives one level up and conflates the site with its sheaf topos.
- $(\infty, 1)$-categorical infrastructure for the meta-level case: the category $\mathcal{T}^{(1)}$ of
  relational universes is not a 1-category (geometric morphisms between toposes form an $(\infty, 1)$-category).
  The 1-categorical construction of $R$ does not invoke this; the meta-level claim does.
- A precise definition of $\mathcal{J}^{(1)}$: what it means for a family of geometric morphisms to cover
  a topos. The subtopos-join formulation (smallest subtopos containing all images) is a candidate but
  requires verification against the sheaf condition.

**Status.** Structural observation. The self-similarity is visible and motivates the conjecture; no proof
exists. Depends on: §hyperverse-tower, §meta-universe-closure, §universe-category, §depth-filtration.
