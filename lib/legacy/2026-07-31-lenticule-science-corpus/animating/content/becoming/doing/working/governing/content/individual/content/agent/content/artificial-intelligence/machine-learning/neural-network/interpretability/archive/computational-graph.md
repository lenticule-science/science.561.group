---
type: object
class: contemporary
status: active
depends-on: []
see-also:
  - teaching/explanations/circuit.md
  - ../morphisms/circuit-tracing.md
  - ../morphisms/activation-patching.md
references:
  - references/conmy-acdc2023.md
---

# Computational graph

The **computational graph** of a neural network is the
directed graph of *nodes* (intermediate tensors, including
activations and weights) and *edges* (operations transforming
nodes into other nodes) constituting the network's forward
pass.

## Structure

For a transformer:

- **Nodes** include token embeddings, residual-stream
  vectors at each layer, attention-head outputs, MLP
  intermediate and output activations, layer-norm-normalized
  activations, and the final logits.
- **Edges** include linear projections, attention pattern
  computation, attention application, MLP computation,
  layer norm, and the residual additions.

The graph is *fixed by the architecture* and the same for
every input; only the *values* of intermediate nodes vary
with input.

## Granularity

The graph can be drawn at multiple granularities:

- **Operation-level.** Every matrix multiply, addition,
  nonlinearity is a separate edge. Most fine-grained.
- **Component-level.** Each attention head and MLP is a
  single edge. Standard for circuit analysis.
- **Layer-level.** Each transformer block is a single edge.
  Coarsest commonly used.

Mechanistic-interpretability work most often operates at the
component level: each head, each MLP, each layer-norm is an
addressable unit.

## Why the graph matters for interpretability

The graph is the substrate on which:

- **Causal interventions** are defined. *Patching* node $A$
  with a value from a different input means: replace $A$'s
  computed value with the patched value, propagate forward
  through downstream edges, observe the change in outputs.
- **Circuits** are subgraphs. A circuit specification names
  the nodes and edges participating in a behavior.
- **Path patching** isolates individual paths through the
  graph: which paths from input to output carry the
  causal signal.
- **Automated discovery** (ACDC) prunes the graph by
  iteratively removing edges that do not affect the studied
  behavior, leaving the minimal causal subgraph.

## Path-level analysis

A *path* through the graph is a sequence of edges from input
to output. Many interpretability questions are best phrased
at the path level:

- "Which paths from token T to logit L carry the signal for
  the IOI behavior?"
- "Which paths from feature F at layer 3 to feature G at
  layer 7 are necessary for the connection?"

Path-level analysis is more precise than node-level (which
component is involved?) but more expensive (many more paths
than nodes).

## In transformer-specific terms

The transformer's residual structure means many paths exist
between any input position and any output position:

- A direct path through the residual stream (no head or MLP
  intermediate).
- Paths through one or more heads or MLPs.
- Paths through compositions of components in different
  layers.

The path multiplicity is the substrate of *direct logit
attribution* (decompose the final logit into contributions
from each path) and of *path patching* (intervene on
specific paths).

## Limits

- **Combinatorial explosion.** Number of paths grows
  exponentially with depth; full path-level analysis is
  infeasible for deep networks.
- **Graph-level information loss.** The graph captures
  *structure*; the *content* of intermediate nodes (which
  features they encode) is needed for full interpretability.
- **Architecture-specific.** Different architectures have
  different graphs; methods that work on transformer graphs
  may need re-derivation for, e.g., diffusion models.
