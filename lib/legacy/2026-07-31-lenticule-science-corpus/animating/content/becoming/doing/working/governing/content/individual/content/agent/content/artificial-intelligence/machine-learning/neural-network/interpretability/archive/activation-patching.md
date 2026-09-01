---
type: morphism
class: contemporary
status: active
depends-on:
  - ../objects/computational-graph.md
see-also:
  - ablation.md
  - circuit-tracing.md
  - ../theorems/attribution-faithfulness-bound.md
references:
  - references/meng-rome2022.md
  - references/conmy-acdc2023.md
---

# Activation patching

**Activation patching** is the intervention of replacing a
chosen activation in the network's
[computational-graph](../objects/computational-graph.md)
with the activation that the same node would have on a
*different* input, to measure that activation's causal
contribution to a specific behavior.

## The protocol

Given a network, a *clean input* $x$ on which the network
exhibits behavior $B$, and a *corrupted input* $x'$ on which
it does not:

1. Run a forward pass on $x$, save the activation
   $\mathbf{a}(x)$ at every node of interest.
2. Run a forward pass on $x'$, but at chosen node $n$,
   *replace* the value with $\mathbf{a}_n(x)$ — the value
   that node had on the clean input.
3. Observe whether the behavior $B$ is restored.

If patching node $n$ alone restores $B$ on the corrupted
input, $n$ is causally sufficient (in the patching protocol's
sense) for $B$.

## Variants

- **Resample ablation.** Replace with activation from a
  *random other input* rather than a specific corrupted
  input. Measures necessity rather than sufficiency.
- **Path patching.** Patch only along chosen *paths* through
  the graph rather than at a node, to isolate which paths
  carry the signal.
- **Causal scrubbing.** A formalization that tests entire
  hypothesized circuits by patching all non-circuit nodes
  with random inputs.
- **Mean ablation.** Replace with the mean activation over
  the dataset; reduces noise.

## What it shows

A successful patch is *evidence of causal role*: the patched
node carries information necessary to produce the behavior.
This is stronger than a probe (which shows information is
*decodable*) but weaker than a full mechanistic account
(which would explain *how* the node carries the information).

## What it doesn't show

- **Faithfulness.** The patched circuit may produce the
  behavior on the studied (clean, corrupted) pair but not
  generalize.
- **Sufficiency outside the protocol.** Patching restores
  behavior in the patching protocol; the node may not be
  sufficient for the behavior under different conditions.
- **The mechanism.** Patching identifies which nodes carry
  the signal; it does not explain how those nodes compute
  the signal.

See [attribution-faithfulness-bound](../theorems/attribution-faithfulness-bound.md).

## Methodological subtleties

- **Choice of clean and corrupted inputs.** The protocol's
  conclusions are conditional on this choice. Different
  pairs identify different parts of the circuit.
- **Distribution shift.** Patched activations may be
  out-of-distribution for downstream layers, producing
  artifacts.
- **Granularity.** Patching at coarse granularity (whole
  layer) finds something; patching at fine granularity
  (single neuron) is harder to interpret.

## In contemporary use

Activation patching is the workhorse of mechanistic-
interpretability case studies. Most published circuit
identifications include patching evidence: "patching head
$h$ at layer $l$ recovers the behavior to within $X\%$."
The IOI circuit (Wang et al. 2022), the ROME factual-recall
work (Meng et al. 2022), and most subsequent circuit work
relies on patching as the central evidence.

Automated circuit-discovery (ACDC, Conmy et al. 2023) is
essentially patching at scale: iteratively patch every edge,
keep the edges whose patching matters most, and report the
remaining subgraph as the circuit.
