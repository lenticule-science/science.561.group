---
type: definition
class: bitopological-algebra
depends-on: [bilattice, predication-fiber-algebra, paired-priestley-space]
realizes: [knowledge-order, truth-order]
---

# d-frame

A **d-frame** is the algebraic dual of a bitopological space, generalizing how a frame is the algebraic dual of a topological space (Jung–Moshier 2006; see [@jung-moshier2006], [@jakl2018]).

## Data

A d-frame is a quadruple

$$\mathbb{L} \;=\; (L_+,\, L_-,\, \mathrm{con},\, \mathrm{tot})$$

where:

- $L_+$ and $L_-$ are **frames** — complete lattices satisfying the infinite distributive law $a \wedge \bigvee S = \bigvee_{s \in S}(a \wedge s)$.
- $\mathrm{con} \subseteq L_+ \times L_-$ is the **consistency relation**: $(a, b) \in \mathrm{con}$ asserts that the positive datum $a$ and the negative datum $b$ are jointly consistent (their joint extension is non-empty).
- $\mathrm{tot} \subseteq L_+ \times L_-$ is the **totality relation**: $(a, b) \in \mathrm{tot}$ asserts that $a$ and $b$ together cover (their joint extension is the whole space).

## Axioms

The relations $\mathrm{con}$ and $\mathrm{tot}$ are required to be:

- **Downward-closed in $\mathrm{con}$:** if $(a, b) \in \mathrm{con}$ and $a' \leq a$, $b' \leq b$, then $(a', b') \in \mathrm{con}$.
- **Upward-closed in $\mathrm{tot}$:** if $(a, b) \in \mathrm{tot}$ and $a \leq a'$, $b \leq b'$, then $(a', b') \in \mathrm{tot}$.
- **Closed under directed joins on each side** (consistency) and **closed under finite meets on each side** (totality).
- **Compatibility:** specific structural axioms tying $\mathrm{con}$ and $\mathrm{tot}$ together — recorded in [@jung-moshier2006] §3 and [@jakl2018] Ch. 2 and not reproduced here.

The category of d-frames, with morphisms preserving the frame structure on each component and the two relations, is denoted $\mathbf{dFrm}$.

## Canonical example: bitopological space

For a bitopological space $(X, \tau_+, \tau_-)$, the d-frame of opens is

$$\mathbb{L}(X, \tau_+, \tau_-) \;=\; (\tau_+,\, \tau_-,\, \mathrm{con}_X,\, \mathrm{tot}_X)$$

with:

- $(U, V) \in \mathrm{con}_X$ iff $U \cap V = \emptyset$ — disjoint opens are consistent (no point is told both).
- $(U, V) \in \mathrm{tot}_X$ iff $U \cup V = X$ — together-covering opens are total (every point is told at least one).

This is the Belnap-flavored reading: positive evidence $U$ and negative evidence $V$ are *consistent* when they don't overlap, *total* when they cover.

## Relation to bilattices and paired Priestley spaces

[@jakl2025] §4.1 ("Bilattices versus d-frames") gives an explicit comparison: every distributive [bilattice](bilattice.md) determines a d-frame, with $L_+$ the truth-side lattice and $L_-$ the order-dual of the inconsistency-side lattice; the consistency and totality relations encode the bilattice's $\leq_t / \leq_k$ structure. In the other direction, every "spatial" d-frame arises this way.

Equivalently via Jung–Rivieccio duality: a d-frame is a [paired Priestley space](paired-priestley-space.md) viewed algebraically — the spatial side and the algebraic side of bitopological Stone duality are the same data.

The three frameworks — distributive bilattices, paired Priestley spaces, d-frames — are three coordinate charts on the same axis (the bigraded value-type axis of the [bilattice-valued-sheaves question](../questions/bilattice-valued-sheaves.md)). Each chart exposes different texture; d-frames are the chart with the most-developed off-the-shelf homological-algebra infrastructure.
