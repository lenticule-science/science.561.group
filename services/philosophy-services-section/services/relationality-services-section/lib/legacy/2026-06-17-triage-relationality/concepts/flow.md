---
title: "Flow"
kind: term
---
Directed dynamics with comonadic structure. Flow is the operator that formalizes how coherence propagates through the relational field. It has a counit (projection to identity), a comultiplication (decomposition into iterated flow), and KZ-laxity (contraction under iteration).

Flow is the mathematical articulation of [relating](relating.md) at the dynamics level — the continuous act that maintains the interplay between including and excluding, expressed as a single operator.

## Key structures

- **Counit** $\varepsilon$ — projection from flow to identity.
- **Comultiplication** $\delta$ — decomposition into iterated flow.
- **KZ-laxity** — Flow contracts under iteration, preserving algebraic structure.
- **PreservesCore** — Flow preserves the modal core (fixed points of [Close](close.md)).
- **CoKleisli category** — morphisms $X \to CY$ encoding propagation through reflected states.
- **Coalgebras** — configurations stable under flow (stabilization = idempotence under CoKleisli composition).

In modal terms: $C = \Box\Diamond$, the comonad formed from the middle adjunction of the cohesive quadruple. The comonad formalizes reflexive propagation — every morphism carries an internal dynamic through which coherence circulates.

## What it produces

- The CoKleisli category — dynamics.
- Coalgebras — stable configurations; topology.
- Defect and residual — measures of deviation from stability.
- The ground for geometry: coalgebras as spaces.

## Dynamic Residuation

Flow extends [Induces](induces.md) to the dynamic setting via [Dynamic Residuation](dynamic-residuation.md): static implication becomes "what must be added now for $b$ to be recognized later." Logic moves with the system.

## Position within RITM

Flow sits inside the [RITM](ritm.md) quadruple adjunction $\Pi^\to \dashv \Box_r \dashv \Diamond_l \dashv \nabla^\leftarrow$. RITM internally decomposes into RD ($\Box$-stable endofunctors, *Relational Dynamics*) and RT ($\Diamond$-stable endofunctors, *Relational Topology*). The minimal constructive model is $\text{PSh}(\{0 \to 1\})$ — the "relational cell." RITM is self-stabilizing: every RITM contains the structure to reconstruct itself.
