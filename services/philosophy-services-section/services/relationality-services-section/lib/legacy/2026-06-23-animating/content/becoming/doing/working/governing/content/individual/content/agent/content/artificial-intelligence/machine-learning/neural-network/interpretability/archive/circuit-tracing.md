---
type: morphism
class: contemporary
status: active
depends-on:
  - teaching/explanations/circuit.md
  - activation-patching.md
  - ablation.md
see-also:
  - ../objects/computational-graph.md
references:
  - references/wang-ioi2022.md
  - references/conmy-acdc2023.md
---

# Circuit tracing

**Circuit tracing** is the procedure of identifying the
subgraph of a trained network's components causally
responsible for a specific behavior — locating *the
circuit* implementing that behavior.

## Manual circuit tracing

The classical procedure (used in IOI, factual recall, and
similar case studies):

1. **Define the behavior.** Specify a task class and a
   metric: e.g., "in IOI examples, predict the indirect
   object correctly."
2. **Identify candidate components.** Layer-level ablation
   to find which layers matter; head-level ablation within
   those layers.
3. **Patch to confirm.** Use
   [activation-patching](activation-patching.md) to verify
   each candidate component's causal role.
4. **Reverse-engineer roles.** For each component, examine
   what features it reads and writes; assign a function
   ("name-mover head," "S-inhibition head").
5. **Compose into algorithm.** State the circuit as an
   algorithm: "head A detects X; head B suppresses Y; head
   C amplifies Z; result: behavior B."
6. **Validate.** Test the circuit on out-of-distribution
   inputs; check that ablating non-circuit components doesn't
   break the behavior.

The procedure is labor-intensive; published circuits typically
take person-months of work.

## Automated circuit tracing

Automated alternatives:

- **ACDC** (Conmy et al. 2023). Iteratively prune edges from
  the computational graph; keep edges whose pruning most
  damages behavior. Yields a minimal subgraph.
- **Edge attribution patching.** Approximate edge importance
  with linear gradients; faster than exact patching.
- **Subnetwork probing.** Train a mask over network
  components to maximize behavior preservation under
  sparsity penalty.
- **Feature-level circuit identification.** Use SAE
  features as the unit; trace feature dependencies
  (Marks et al. 2024).

Automated methods are faster but produce graphs that may
include spurious components. Manual review of automated
results is standard practice.

## Granularity choices

A circuit can be specified at multiple granularities:

- **Layers.** Coarsest; says "layers $l_1, \ldots, l_k$
  matter."
- **Components** (heads, MLPs). Standard for published
  circuits.
- **Neurons.** Fine-grained; rarely used because individual
  neurons are polysemantic.
- **Sparse features** (post-SAE). Most fine-grained
  recently used; benefits from monosemanticity of features.
- **Paths.** Specific paths through the graph rather than
  components.

The right granularity depends on the question: behavioral
attribution may want layers; algorithmic explanation wants
features or components.

## Faithfulness

A central concern: does the identified circuit *actually*
implement the behavior, or does it merely *correlate* with it?

The strongest faithfulness test is *causal scrubbing*
(Chan, Garrabrant et al. 2022): replace all activations *not*
in the hypothesized circuit with random activations from
unrelated inputs; check whether the behavior survives. If it
does, the circuit is faithful in a strong sense; if it
doesn't, the circuit is incomplete or incorrect.

Most published circuit identifications fall short of full
causal scrubbing; they are best regarded as *approximate*
mechanistic explanations.

## Limits

- **Distributed behaviors.** Some behaviors don't admit
  small-circuit explanations; they're spread across most of
  the network.
- **Polysemantic components.** A component may participate
  in multiple circuits; identifying its role on the
  studied input distribution may not generalize.
- **Combinatorial explosion.** The number of candidate
  subgraphs is exponential; even automated methods explore
  only a small fraction.
- **Model-specific.** A circuit identified in one model may
  not transfer to another (different architecture, different
  training run).

## In contemporary practice

Circuit tracing is the *capstone* technique of mechanistic
interpretability: combining patching, ablation, probing, and
SAE features into algorithmic explanations of behaviors.
Major published circuits (IOI in GPT-2 small, modular
arithmetic grokking in toy networks, factual recall via ROME)
demonstrate the technique. Whether the same approach scales
to frontier models with thousands of components per layer is
open; see [can-mechanistic-interp-scale](questions/can-mechanistic-interp-scale.md).
