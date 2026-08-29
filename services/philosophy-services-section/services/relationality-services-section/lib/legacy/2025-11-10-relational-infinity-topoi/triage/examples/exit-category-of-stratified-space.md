---
name: exit-category-of-stratified-space
type: example
class: instantiation
status: verified-by-hand
instantiates: [exit-infinity-category, exit-infinity-category-object, stratified-directed-infinity-site]
depends-on:
  - exit-infinity-category-object
  - stratified-directed-infinity-site
---

For $X = [0, 1]$ stratified by $\{0\} \subset [0, 1]$ (the unit interval with the origin as a 0-stratum and the open interval $(0, 1]$ as a 1-stratum, indexed by the poset $\{0 < 1\}$), the [exit ∞-category](../teaching/explanations/exit-infinity-category.md) is the walking arrow:

$$\mathrm{Exit}([0, 1]) \;\simeq\; \{0 \to 1\}.$$

## SD ∞-site structure

Equipping the walking arrow with the degree function $\deg(0) = 0, \deg(1) = 1$ and the latching/matching neighborhoods (latching at $1$ is the colimit over forward arrows from $0$, hence equals $X(0)$; matching at $0$ is the limit over forward arrows to $1$, hence equals $X(1)$) gives the minimal SD ∞-site.

## Two coincidences

This example sits at the intersection of:

1. The minimal stratified space (a 2-stratum interval).
2. The minimal SD ∞-site (the walking arrow with its degree function).
3. The minimal cohesive presheaf model ([`minimal-presheaf-cell`](minimal-presheaf-cell.md)).

The three coincidences mean that any structure on the SD ∞-site of $[0, 1]$ pulls back to a structure on $\mathrm{PSh}(\{0 \to 1\})$ via the exit-category equivalence, giving a closed-form computability environment for testing every theorem in this subtheory.

## Generalizations

For $X$ a more interesting stratified space — e.g. a 2-sphere stratified by $\{N\} \subset S^2$ (north pole as a 0-stratum, the rest as a 1-stratum) — $\mathrm{Exit}(X)$ acquires non-trivial higher cells encoding the loop space $\Omega_N S^2$. SD ∞-sites of this more interesting form are where the differential-geometric content of the [presheaf-vs-CartSp question](../questions/presheaf-vs-cartsp-base.md) lives.
