---
type: object
class: contemporary
status: active
depends-on: []
see-also:
  - attention-head.md
  - teaching/explanations/feature.md
  - teaching/explanations/superposition.md
references: []
---

# Residual stream

The **residual stream** is the running sum of all
contributions written by a transformer's layers as input
flows through the network. It is the shared workspace
through which all components communicate; its state at each
layer is the activation each subsequent layer reads from.

## Structure

For a transformer with $L$ layers and hidden dimension $d$,
each token has a residual stream vector
$\mathbf{r}_l \in \mathbb{R}^d$ at each layer $l$. The
update rule is:

$$
\mathbf{r}_{l+1} = \mathbf{r}_l + \text{MLP}_l(\mathbf{r}_l) + \sum_{h} \text{Head}_{l,h}(\mathbf{r}_l, \ldots)
$$

Each MLP and each attention head *adds* to the residual
stream rather than overwriting it. The final residual stream
is $\mathbf{r}_L = \mathbf{r}_0 + \sum_l (\text{MLP}_l + \sum_h \text{Head}_{l,h})$.

## Why it's a "stream"

The residual structure means the input embedding flows
*through* the network, with each layer adding modifications.
A token's residual stream at the final layer is the input
embedding plus the sum of all layer contributions — "the
input flows past, getting written to."

This is the substrate of the *residual-stream-as-bus*
metaphor: components write to the residual stream by
*addition*, and downstream components read by attending to
the result. The residual stream is a shared bus, and
components communicate by writing to overlapping subspaces
of it.

## Subspace allocation

Different components write to different *subspaces* of the
residual stream. A head's $W_O$ matrix projects from its
$d_h$-dimensional output space into $\mathbb{R}^d$ — the
column space of $W_O$ is "where the head writes." Different
heads write to different (overlapping) subspaces.

The subspace allocation is a load-bearing fact for
[circuit](teaching/explanations/circuit.md) analysis: communication
between components is mediated by their writing to and
reading from compatible subspaces of the residual stream.

## In superposition

The residual stream is finite-dimensional ($d$, ranging from
hundreds to tens of thousands depending on model). The number
of features the network needs to store is much larger. By
[superposition](teaching/explanations/superposition.md), features are
stored as overlapping non-orthogonal directions in the
residual stream.

The implication: the residual stream is a *high-bandwidth
shared substrate* in which features are densely packed and
share dimensions. Decomposing the residual stream's content
at any layer is the central task of
[sparse-autoencoder](teaching/explanations/sparse-autoencoder.md)
analyses.

## Interpretability implications

- **Layer-by-layer feature emergence.** Studying the residual
  stream layer by layer shows when a feature first appears
  and how it propagates.
- **Attribution.** A target output can often be decomposed
  as a sum of contributions from specific (layer, component)
  pairs writing to the residual stream.
- **Steering.** Adding a vector to the residual stream at
  some layer is a clean intervention with predictable
  downstream effect (under linearity assumptions).
- **Communication patterns.** Inspecting which heads in
  later layers attend to specific residual-stream subspaces
  written by earlier components is the core of circuit-level
  analysis.

## What the residual stream is not

It is not memory in any persistent sense — it is recomputed
fresh from the input on every forward pass. It is not state
shared *across tokens* in the same generation — each token
has its own residual stream, with attention being the
mechanism for cross-token information sharing.
