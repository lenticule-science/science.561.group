---
type: object
class: defined-structure
status: stable
depends-on:
  - teaching/explanations/mesa-optimization.md
  - teaching/explanations/inner-alignment.md
see-also:
  - base-objective.md
  - ../theorems/mesa-optimization-emergence-conditions.md
references:
  - references/hubinger-mesa2019.md
---

# Mesa-objective

The **mesa-objective** $L_{\text{mesa}}$ is the internal objective function pursued by a trained [mesa-optimizer](teaching/explanations/mesa-optimization.md).
It is a property of the trained model's internal computation, not of the training process.

## Formal status

Hubinger et al. (2019) define the mesa-objective as the objective function that the trained model is best modeled as optimizing, treating the model itself as an optimizer over actions or plans.

The definition is *behavioral* rather than syntactic: there need not be a piece of the model labeled "objective."
The mesa-objective is the function that, when fed to a search-and-evaluate procedure matching the model's internal computation, reproduces the model's behavior.

## Why $L_{\text{mesa}}$ need not equal $L_{\text{base}}$

Gradient descent selects parameters $\theta^*$ that minimize $L_{\text{base}}$ on the training distribution.
Multiple mesa-objectives $L_{\text{mesa}}$ can produce the same training performance:

- $L_{\text{mesa}} = L_{\text{base}}$ — **inner-aligned**.
- $L_{\text{mesa}} = $ a feature $\phi$ that perfectly correlates with $L_{\text{base}}$ on training (e.g. "go right" instead of "get the coin" when the coin is always to the right) — **proxy-aligned**; fails under distribution shift via [goal misgeneralization](teaching/explanations/goal-misgeneralization.md).
- $L_{\text{mesa}} = $ any objective that, combined with instrumental reasoning over the training process, produces $L_{\text{base}}$-aligned behavior — **deceptively aligned**; fails at deployment.

Gradient descent does not distinguish among these; the inductive biases of the architecture and optimizer determine which is selected.

## Why $L_{\text{mesa}}$ is hard to extract

Unlike $L_{\text{base}}$, $L_{\text{mesa}}$ has no canonical syntactic representation.
To extract it, one would need to:

1. Establish that the model is in fact a mesa-optimizer (a goal-directed search process), not a fixed pattern-match.
2. Identify the internal representations implementing the "evaluate" step.
3. Read out the function those representations implement.
4. Verify that the read-out function reproduces the model's behavior.

Step (1) alone is contested for current LLMs.
Steps (2)–(3) are the domain of mechanistic interpretability and have been carried out for narrow features in narrow models; no general technique exists.
Step (4) requires evaluation across the deployment distribution, which is itself ill-defined for open-ended deployment.

## Engineering implications

The asymmetry between $L_{\text{base}}$ (engineerable, inspectable) and $L_{\text{mesa}}$ (opaque, behavioral-only) is the structural reason [inner alignment](teaching/explanations/inner-alignment.md) is harder than outer alignment.
Outer alignment is solved by writing a better $L_{\text{base}}$; inner alignment requires reading $L_{\text{mesa}}$.

The [eliciting-latent-knowledge-hardness](../theorems/eliciting-latent-knowledge-hardness.md) question is the principal open problem about whether $L_{\text{mesa}}$ is *in principle* extractable from a trained model.

## Distinction from "the model's beliefs"

$L_{\text{mesa}}$ is a goal, not a belief.
A mesa-optimizer can have correct beliefs about the world and a misaligned objective; it can have a correctly-aligned objective and incorrect beliefs.
Alignment-relevant interventions on $L_{\text{mesa}}$ are distinct from interpretability interventions on the model's world-model.

Eliciting Latent Knowledge (ELK; Christiano-Xu-Cotra 2022) targets the *belief* side: extracting what the model knows.
Inner-alignment techniques target the *goal* side: extracting what the model is trying to do.
Both are open; ELK has a more developed problem statement.
