---
type: object
class: foundational
status: active
depends-on:
  - teaching/explanations/stigmergy.md
see-also:
  - pheromone-field.md
  - ../morphisms/trace-deposition.md
  - ../morphisms/trace-evaporation.md
references:
  - references/grasse1959.md
  - references/bonabeau-dorigo-theraulaz1999.md
---

# Environment trace field

An environment trace field is the spatially distributed persistent state that agents in a swarm-coordinated system read from and write to.
It is the abstract object that underlies the [stigmergy](teaching/explanations/stigmergy.md) coordination mechanism.

Formally, a trace field is a map

$$ E_t : L \to V $$

from a *location space* $L$ (the spatial domain agents move through) to a *value space* $V$ (the kind of trace each location can hold).
The field is indexed by time $t$.

## Specializations

The value space $V$ determines the kind of stigmergic system:

- **Scalar non-negative real values** ($V = \mathbb{R}^+$): the [pheromone-field](pheromone-field.md) of Ant Colony Optimization; values evaporate continuously.
- **Vector values** ($V = \mathbb{R}^k$): used in some hybrid systems where the trace carries direction or multi-dimensional information.
- **Categorical values** ($V$ a finite alphabet): the qualitative- stigmergy regime; values change discretely (e.g., empty, brick-placed, brick-mortared).
- **Structured values** ($V$ a record type): used in biologically- motivated multi-channel pheromone systems.

The mathematical machinery for analyzing the system depends on the choice of $V$.
The classical convergence theorems ([aco-convergence](../theorems/aco-convergence.md)) are stated for the scalar non-negative case.

## Properties of well-behaved trace fields

For the [aco-convergence](../theorems/aco-convergence.md) theorem and its analogs to apply, the trace field and its dynamics must satisfy several properties:

- **Boundedness from below.** Trace values cannot decrease arbitrarily; there is a positive minimum value (often introduced explicitly as $\tau_{\min}$).
  This prevents the field from completely losing information about regions agents stop visiting.
- **Boundedness from above.** Trace values cannot increase without bound.
  In ACO, an upper bound $\tau_{\max}$ is enforced explicitly in the MAX-MIN Ant System variant; in others, the boundedness arises from the interaction of bounded deposition with positive evaporation.
- **Monotone evaporation.** Between deposition events, the field decays monotonically.
  See [trace-evaporation](../morphisms/trace-evaporation.md).
- **Bounded deposition.** Each agent's contribution to the field at a single step is bounded above by a constant.
  See [trace-deposition](../morphisms/trace-deposition.md).

The classical convergence theorems require all four properties.

## Reading the field

Agents read the field through [neighbor-sensing](../morphisms/neighbor-sensing.md): an agent at location $\ell$ accesses $E_t|_{N(\ell)}$, the restriction of the field to a bounded neighborhood of $\ell$.
By [local-rule coordination](teaching/explanations/local-rule-coordination.md), the agent does not see the full field.

## Writing to the field

Agents write to the field through [trace-deposition](../morphisms/trace-deposition.md).
The deposition is local: an agent at location $\ell$ modifies $E_t$ only in a bounded neighborhood of $\ell$ (typically only at $\ell$ itself).
Field-wide modifications by individual agents are not permitted; this would violate the bounded-cost property of the [scalability premise](teaching/explanations/scalability-premise.md).
