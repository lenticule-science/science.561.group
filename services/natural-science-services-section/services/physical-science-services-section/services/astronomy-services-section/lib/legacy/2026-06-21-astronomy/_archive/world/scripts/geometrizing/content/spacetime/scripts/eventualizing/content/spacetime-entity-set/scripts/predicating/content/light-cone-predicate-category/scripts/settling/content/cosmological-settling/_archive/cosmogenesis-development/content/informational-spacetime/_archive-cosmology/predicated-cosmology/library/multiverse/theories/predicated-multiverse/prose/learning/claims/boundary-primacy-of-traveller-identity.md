---
type: theorem
class: traveller
status: sketch
depends-on: [portal-jump, portal-morphism, traveller-fibration]
---

# Boundary primacy of traveller identity

**Statement.** Let $(\mathrm{Wd}, \{P_i\}, \{\phi_i\})$ be a Wood, $\mathrm{Trav}$ a [traveller fibration](../objects/traveller-fibration.md), and $\tau, \tau' \in \mathrm{Trav}(\mathrm{Wd})$ two traveller-states each supported in the same pool $P_i$.
If $\tau$ and $\tau'$ have identical germs at the pool boundary $\partial P_i$, then their [portal jumps](../morphisms/portal-jump.md) coincide in $\mathrm{Trav}(W_i)$:

$$\tau\restriction\partial P_i = \tau'\restriction\partial P_i \quad \implies \quad J_i(\tau) = J_i(\tau').$$

## Argument (sketch)

The portal jump is $J_i = (\phi_i)_* \circ \restriction P_i$.
The portal morphism $\phi_i$ satisfies the [boundary-determination axiom](../morphisms/portal-morphism.md) (PM1): $\phi_i(p)$ depends only on the germ of $p$ at $\partial P_i$.
Pushforward along $\phi_i$ inherits this dependence — two traveller-states with identical boundary behaviour have, after pushforward, identical destination images. ∎

## What this theorem is doing

This is the "Boundary Primacy" structural consequence (§7.3 of the source): *the identity of a traveller after jumping is determined by boundary behaviour*.
In multiverse-cosmology terms: whatever crosses a portal arrives in the destination world as a function only of what was happening at the portal's edge at the moment of crossing — not of what happened deep in the portal's interior.

## What this theorem is and is not

- **It is** the categorical statement that portals do not preserve interior information beyond what is registered at the boundary.
  This is what makes the framework's portals *coherent* as inter-world connections rather than as arbitrary leaks.
- **It is not** a claim about whether *two* traveller-states with *different* boundary behaviour produce different destination images — they may or may not, depending on $(\phi_i)_*$.
- **It is not** a no-information-loss claim — quite the opposite: information about the deep interior is by construction *not* passed through the portal.

## Status

Sketch.
Argument is direct from (PM1) plus the standard fibration pushforward; full rigour requires fixing the precise definition of "germ" in the ambient category, which depends on the chosen $\mathsf{R}$.

## Provenance

§7.3 ("Boundary Primacy") of [`wood-between-worlds.md`](../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relating/triage/provenance/math-from-relationality-bucket/wood-between-worlds.md).
