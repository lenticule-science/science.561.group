---
name: "Conflation"
description: "The optional second unary involution on a bilattice — antitone in knowledge, monotone in truth, self-inverse. Together with negation, conflation generates the Klein four-group of bilattice symmetries. Conflation is the knowledge-axis dual of negation: where negation reverses the truth axis, conflation reverses the knowledge axis."
symbol: "-"
date-created: 2026-04-29
---

A **conflation** $-$ on a [bilattice](bilattice.md) is a unary operation satisfying three axioms — the duals of [negation](negation.md)'s axioms with the two parallel orders exchanged:

- **Antitone in the [knowledge order](knowledge-order.md):** $a \leq_k b \Rightarrow -b \leq_k -a$.
- **Monotone in the [truth order](truth-order.md):** $a \leq_t b \Rightarrow -a \leq_t -b$.
- **Involutive:** $-(-a) = a$.

Conflation is *optional* — a bilattice need not have a conflation. When present, it is the second involution alongside negation, and the two are typically required to commute:

$$\sim \, - = -\, \sim.$$

## The dual of negation

Negation reverses the truth axis and preserves the knowledge axis. Conflation does the opposite: it reverses the knowledge axis and preserves the truth axis. Where negation flips affirmation/denial direction without changing how much evidence is present, conflation flips evidence-amount without changing the direction of tilt.

This dual behavior is what makes conflation structurally interesting. On a [twist product](twist-product.md) $\mathbf{L}^\bowtie$, conflation is given by the *componentwise complement* of $\mathbf{L}$ (when $\mathbf{L}$ has one):

$$- \langle a, b \rangle = \langle \neg b, \neg a \rangle$$

— first complementing each component, then swapping. (Compare negation, which swaps without complementing.)

## On the four-element bilattice

In $\mathbf{FOUR}$ ([four-bilattice](four-bilattice.md)), conflation acts by:

| Original | Conflation |
|---|---|
| $\bot = \langle 0, 0 \rangle$ | $\top = \langle 1, 1 \rangle$ |
| $\mathbf{t} = \langle 1, 0 \rangle$ | $\mathbf{t} = \langle 1, 0 \rangle$ (fixed) |
| $\mathbf{f} = \langle 0, 1 \rangle$ | $\mathbf{f} = \langle 0, 1 \rangle$ (fixed) |
| $\top = \langle 1, 1 \rangle$ | $\bot = \langle 0, 0 \rangle$ |

Conflation fixes $\mathbf{t}$ and $\mathbf{f}$ (the corners with one-sided evidence) and swaps $\bot$ and $\top$ (the corners with symmetric evidence — none vs. both). This is the dual mirror of negation, which fixes $\bot, \top$ and swaps $\mathbf{t}, \mathbf{f}$.

## The Klein four-group of involutions

When both negation and conflation are present and commute, they generate a group of bilattice symmetries:

$$\{ \mathrm{id}, \;\sim, \;-, \;\sim \circ - \}$$

— each element of order 2, with $\sim$ and $-$ commuting, giving the Klein four-group $\mathbb{Z}_2 \times \mathbb{Z}_2$.

Geometrically, viewing the bilattice's four corners as the vertices of a square (with truth axis horizontal and knowledge axis vertical):

- Negation $\sim$ is the **horizontal reflection** — flips left-right (truth-axis flip, knowledge-axis preserved).
- Conflation $-$ is the **vertical reflection** — flips up-down (knowledge-axis flip, truth-axis preserved).
- $\sim \circ -$ is the **180° rotation** — combines both flips.
- Identity is the trivial symmetry.

These four are the only bilattice symmetries that respect both orders' structure (each is involutive and commutes with the meet and join operations on its respective axis). Together they form the symmetry group of the bilattice qua bilattice.

## See also

- [Bilattice](bilattice.md) — the algebraic structure on which conflation may act.
- [Negation](negation.md) — the dual involution on the truth axis.
- [Knowledge order](knowledge-order.md), [Truth order](truth-order.md) — the two axes.
- [Four-bilattice](four-bilattice.md) — the canonical example showing both involutions.
