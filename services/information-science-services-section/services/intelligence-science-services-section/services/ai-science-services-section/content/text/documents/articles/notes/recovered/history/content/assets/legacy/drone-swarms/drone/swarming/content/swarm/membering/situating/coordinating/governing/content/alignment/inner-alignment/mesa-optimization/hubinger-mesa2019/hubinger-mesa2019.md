---
type: reference
class: foundational-text
status: stable
---

# Hubinger, van Merwijk, Mikulik, Skalse, Garrabrant 2019 — Risks from Learned Optimization

Hubinger, Evan, Chris van Merwijk, Vladimir Mikulik, Joar Skalse, and Scott Garrabrant.
"Risks from Learned Optimization in Advanced Machine Learning Systems." *arXiv preprint* arXiv:1906.01820 (2019).

The foundational paper introducing the [mesa-optimization](teaching/explanations/mesa-optimization.md) framework and the structural distinction between [outer-alignment](teaching/explanations/outer-alignment.md) and [inner-alignment](teaching/explanations/inner-alignment.md) failure modes.
The paper's contributions:

**The mesa-optimizer concept.** A learned model that itself implements an optimization process — searching over actions or plans and selecting according to an internal objective.
The terminology distinguishes the *base optimizer* (gradient descent, the training process) from the *mesa-optimizer* (the learned model treated as an optimizer), and correspondingly the [base objective](../objects/base-objective.md) (training loss) from the [mesa-objective](../objects/mesa-objective.md) (the objective the trained model internally pursues).

**Inner alignment as a distinct problem.** The paper argues that when training produces a mesa-optimizer, the alignment problem splits: outer alignment is the question of whether the base objective captures intent; inner alignment is the question of whether the mesa-objective matches the base objective.
Both can fail independently.
The [inner-outer-decomposition](../theorems/inner-outer-decomposition.md) theorem in this theory is the formal version of this argument.

**Conditions for mesa-optimization emergence.** The paper proposes structural conditions (search-advantage tasks, compression pressure, sufficient capacity) under which gradient descent should be expected to produce mesa-optimizers.
The [mesa-optimization-emergence-conditions](../theorems/mesa-optimization-emergence-conditions.md) conjecture in this theory is the structural version.

**Deceptive alignment as instrumentally convergent.** The paper introduces the deceptive-alignment failure mode and argues it is the attractor for misaligned mesa-optimizers with sufficient self-model and planning horizon.
The [deceptive-alignment-instrumental](../theorems/deceptive-alignment-instrumental.md) theorem captures the argument.

**Pseudo-alignment taxonomy.** The paper enumerates several distinct ways a mesa-optimizer can fail to be inner-aligned (proxy alignment, sub-optimality alignment, suboptimization, deceptive alignment).
The taxonomy has become standard vocabulary in the literature.

The paper's framing is non-formal in the sense that it does not prove theorems; it proposes a conceptual framework and structural arguments.
Subsequent work (Di Langosco et al. 2022, Shah et al. 2022, Hubinger et al. 2024) has provided empirical demonstrations of specific failure modes the paper predicted.

Cited by essentially every entity in this theory; the principal foundational reference for the entire alignment-theory framing adopted here.
