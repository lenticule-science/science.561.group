---
type: concept
class: derived
status: active
depends-on:
  - stigmergy.md
see-also:
  - ../objects/pheromone-field.md
  - ../morphisms/trace-deposition.md
  - ../morphisms/trace-evaporation.md
  - ../theorems/aco-convergence.md
references:
  - references/dorigo1992.md
  - references/bonabeau-dorigo-theraulaz1999.md
---

# Pheromone trail

A pheromone trail is the canonical stigmergic channel: a scalar field over the environment that agents deposit to and read from, with the field decaying monotonically over time in the absence of new deposits.
The pheromone abstraction was introduced into computational swarm intelligence by Dorigo (1992) as the coordination substrate for Ant Colony Optimization, generalizing the chemical trails biological ants use.

The pheromone-trail concept makes stigmergy concrete and computationally tractable.
The full machinery of a pheromone-trail system has three components:

**The field.** A function τ : Locations → ℝ⁺ assigning a non-negative scalar value to each location.
See [pheromone-field](../objects/pheromone-field.md).

**Deposition.** When an agent traverses location ℓ at time t, it adds Δτ(ℓ, t) to the field, where Δτ is bounded above by a constant and depends only on the agent's local state (typically the quality of the solution component the traversal represents).
See [trace-deposition](../morphisms/trace-deposition.md).

**Evaporation.** Between time steps the field is multiplied by a decay factor (1−ρ) for some evaporation rate ρ ∈ (0, 1].
Evaporation is applied to all locations uniformly.
See [trace-evaporation](../morphisms/trace-evaporation.md).

The decay parameter ρ is the central control: small ρ produces long- memory trails (recent and distant past contribute equally to current state), large ρ produces short-memory trails (only recent activity shapes the field).
The classical convergence results ([aco-convergence](../theorems/aco-convergence.md)) place explicit hypotheses on ρ and on the deposition bound for convergence to hold.

## Why pheromones rather than messages

A pheromone trail is structurally distinct from a message in the sense of the [agents theory](../../agents/_index.md).
The structural differences:

| Property | Message | Pheromone trail |
|---|---|---|
| Sender named | yes | no |
| Recipient named | yes | no |
| Persists after delivery | optional | yes (until evaporation) |
| Decays over time | no | yes |
| Delivered to recipient | yes | no — recipient finds it |
| Multiple readers possible | possible | yes by default |
| Coordination cost grows with | recipient count | environment size |

The last row is the load-bearing distinction for the [stigmergy-decouples-coordination-cost](../theorems/stigmergy-decouples-coordination-cost.md) theorem.

## Generalizations

Beyond Dorigo's original pheromone scalar field, the pheromone-trail abstraction generalizes to:

- **Multi-channel pheromones**: parallel scalar fields with different semantics (alarm, food, recruitment), used in some biologically- motivated swarm models.
- **Vector-valued traces**: each location holds a vector in ℝᵏ rather than a scalar.
  Used in some PSO-stigmergy hybrids.
- **Categorical-trace fields**: each location holds an element of a finite alphabet.
  The discrete analog used in qualitative-stigmergic systems (cellular automata, termite-style construction).

The convergence proofs for non-scalar trace systems are typically reductions to the scalar case or independent re-derivations under appropriate adaptations of the deposition and evaporation rules.
