---
type: concept
class: contemporary
status: active
depends-on:
  - feature.md
see-also:
  - mechanistic-interpretability.md
  - ../morphisms/circuit-tracing.md
  - ../objects/computational-graph.md
references:
  - references/olah-circuits2020.md
  - references/wang-ioi2022.md
  - references/conmy-acdc2023.md
---

# Circuit

A **circuit** is a subgraph of a trained neural network that
implements a recognizable algorithm — a sequence of
computations that takes one or more upstream
[features](feature.md) as inputs and produces one or more
downstream features as outputs, with documented intermediate
steps.

## What a circuit looks like

A typical circuit specification names:

- **The features at each layer** the circuit operates on
  (input features, intermediate features, output features).
- **The components** ([attention-heads](../objects/attention-head.md),
  MLP neurons, residual-stream subspaces) implementing each
  step.
- **The information flow** between components — which
  components write to which subspaces of the
  [residual-stream](../objects/residual-stream.md).
- **The algorithm** the circuit implements, stated in human-
  readable terms.

Example: the *indirect object identification* (IOI) circuit
in GPT-2 small (Wang et al. 2022) is documented as a network
of attention heads that detect mentioned entities, suppress
duplicates, and amplify the non-duplicated entity's name —
each head's role identified and tested.

## Why circuits matter

Circuits are the *explanatory* unit of mechanistic
interpretability: a circuit identification answers "*how* does
the network compute this?" rather than "*what features* does
the network represent?" A pure feature inventory tells us
what the network *knows*; a circuit inventory tells us what
the network *does*.

## How circuits are found

Two complementary approaches:

- **Manual circuit-tracing.** Researchers pick a behavior
  (e.g. IOI), use [activation-patching](../morphisms/activation-patching.md)
  and [ablation](../morphisms/ablation.md) to identify the
  components most causally responsible, and reverse-engineer
  the algorithm by inspection. Slow but produces high-
  confidence results.
- **Automated circuit-discovery.** Methods like ACDC (Conmy
  et al. 2023) iteratively prune the computational graph to
  the smallest subgraph that recovers the behavior. Faster
  but produces graphs that may include spurious components.

## What counts as "the circuit"

A loose convention: the circuit for behavior $B$ is the
smallest subgraph $C$ such that:

- Running the model with only $C$'s components reproduces $B$.
- Removing $C$ from the model breaks $B$.
- The roles of $C$'s components can be stated algorithmically.

Each criterion is operationalized differently across papers;
no canonical definition exists. The looseness reflects the
field's youth.

## Limits of the circuit picture

- **Distributed circuits** may not have a small subgraph
  identifiable as "the circuit"; the behavior may be spread
  across most of the network.
- **Polysemantic circuits** — components participate in
  multiple circuits simultaneously, complicating
  decomposition.
- **Faithfulness** — even when a circuit is identified, it
  may not faithfully describe the algorithm under all inputs;
  see [attribution-faithfulness-bound](../theorems/attribution-faithfulness-bound.md).

The circuit picture is the operating framework of mechanistic
interpretability, but it is contested whether all neural
behaviors admit clean circuit descriptions, or whether some
require distributed-system vocabulary that does not factor
into discrete circuits at all.
