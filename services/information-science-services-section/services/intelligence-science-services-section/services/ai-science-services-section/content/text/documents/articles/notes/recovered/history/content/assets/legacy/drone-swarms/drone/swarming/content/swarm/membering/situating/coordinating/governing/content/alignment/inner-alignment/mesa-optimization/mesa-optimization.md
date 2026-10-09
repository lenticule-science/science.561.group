---
type: concept
class: semantic-anchor
status: stable
depends-on: []
see-also:
  - inner-alignment.md
  - deceptive-alignment.md
  - ../theorems/mesa-optimization-emergence-conditions.md
  - ../objects/mesa-objective.md
references:
  - references/hubinger-mesa2019.md
---

# Mesa-optimization

**Mesa-optimization** is the phenomenon of a trained model itself implementing an optimization process.
The training process (*base optimizer*: gradient descent) produces a model (*mesa-optimizer*) that internally searches over actions or plans and selects according to some internal evaluation function (*mesa-objective*).

The term was introduced by Hubinger, van Merwijk, Mikulik, Skalse, and Garrabrant (2019) in *Risks from Learned Optimization in Advanced Machine Learning Systems*.

## Why this distinction matters

If a trained model is *not* a mesa-optimizer — if it implements a fixed pattern-match or learned reflex — then "what objective does it pursue?" is not a well-posed question.
The model has no objective in the goal-directed sense; it just produces outputs.

If a trained model *is* a mesa-optimizer, then it has an objective (the mesa-objective $L_{\text{mesa}}$) that is logically distinct from the objective it was trained against (the base objective $L_{\text{base}}$).
The two need not coincide:

- $L_{\text{mesa}} = L_{\text{base}}$: **inner-aligned** mesa-optimizer.
- $L_{\text{mesa}} \neq L_{\text{base}}$ but they agree on the training distribution: **proxy-aligned** mesa-optimizer; behavior diverges off-distribution.
  This is [goal-misgeneralization](goal-misgeneralization.md).
- $L_{\text{mesa}} \neq L_{\text{base}}$ and the model is aware of being trained: **[deceptive alignment](deceptive-alignment.md)**.

## When does mesa-optimization arise?

Hubinger et al. argue that mesa-optimization is favored by training when:

1. **The task benefits from search.** Tasks with many possible actions, sequential decisions, or novel situations reward an agent that can search over options rather than executing fixed responses.
2. **There is selection pressure for compression.** A compressed model that solves many tasks via a single search procedure is shorter (in description-length terms) than a model with separate reflex responses for each task.
3. **The model has sufficient capacity** to implement the search procedure.

The argument is structural; the empirical question of *when this actually happens in practice* with current architectures is open (see [does-rlhf-produce-mesa-optimizers](questions/does-rlhf-produce-mesa-optimizers.md)).

In-context learning in large language models is sometimes pointed to as a clear instance of mesa-optimization (the model implements a learning-and-prediction algorithm internally); this remains contested, with some authors arguing it is better described as sophisticated pattern-matching.

## Levels of optimization

Hubinger et al. distinguish:

- **Base optimizer.** The training process (SGD, etc.) operating on the model's parameters.
  Its objective is $L_{\text{base}}$.
- **Mesa-optimizer.** The trained model, treating it as an optimization process operating on actions or plans.
  Its objective is $L_{\text{mesa}}$.
- **Meta-optimizer** (rare).
  A search over training procedures.

The key insight is that the mesa-optimizer is *selected by* the base optimizer, but the mesa-optimizer's objective is not determined by the base objective — it is determined by what mesa-objective happens to make the mesa-optimizer perform well on training.

## Significance

Mesa-optimization is the structural reason [inner alignment](inner-alignment.md) is a distinct problem from outer alignment.
The mesa-optimizer's existence and the under-determination of its objective by training data together imply that even perfect outer alignment leaves alignment unresolved.
