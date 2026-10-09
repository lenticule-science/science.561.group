---
type: reference
class: foundational-paper
status: active
cites:
  - teaching/explanations/emergence.md
  - teaching/explanations/local-rule-coordination.md
  - ../objects/neighborhood.md
  - teaching/explanations/from-classical-to-llm-swarms.md
---

# Reynolds (1987) — Flocks, Herds and Schools

**Full citation:** Reynolds, C.W. (1987).
"Flocks, herds and schools: A distributed behavioral model." *ACM SIGGRAPH Computer Graphics*, 21(4), 25–34.

## Summary

The boids paper.
Reynolds presented a computational model of flocking in which each simulated bird ("boid") follows three local rules:

1. **Separation**: avoid crowding nearby flockmates.
2. **Alignment**: steer toward the average heading of nearby flockmates.
3. **Cohesion**: steer toward the average position of nearby flockmates.

Each rule operates on the boid's bounded neighborhood (a perception radius) and contributes a velocity adjustment.
The boid's next velocity is a weighted sum of the three contributions.

Despite the simplicity of the rules, the resulting flock behavior is visually realistic: coherent group motion, polarized alignment, density waves, response to obstacles.
No boid contains a representation of "the flock"; the flock is an emergent property of the local rules.

## Contribution to the swarm-intelligence theory

The boids model is the canonical demonstration of [emergence](teaching/explanations/emergence.md) in a swarm-coordinated system without stigmergic traces.
Reynolds established that emergence is constructive: simple, identifiable local rules produce specific, characterizable global behaviors.

The [emergence-requires-local-determinism](../theorems/emergence-requires-local-determinism.md) theorem in this theory makes precise the condition the boids model satisfies (each boid's local rule is deterministic given its bounded local input) and uses it to identify the structural reason that emergence is reproducible.

## Methodological influence

The boids model influenced the entire swarm-intelligence field by demonstrating that:

- **Local rules suffice.** Complex global behavior does not require complex local rules.
- **Identical agents work.** [Homogeneity](teaching/explanations/homogeneity.md) is not a limitation but a design principle.
- **Bounded perception is enough.** Each boid sees only its [neighborhood](../objects/neighborhood.md), not the full flock.

These principles became the structural commitments of the field and are inherited by the [swarm-coordinated-system](teaching/explanations/swarm-coordinated-system.md) concept.

## Subsequent extensions

The boids model has been extended in many directions: obstacle avoidance, predator-prey dynamics, terrain following, multi-species flocks, hybrid biological-and-artificial flocks.
Each extension preserves the basic structure: simple local rules on bounded neighborhoods, with global behavior emerging from the joint application.
