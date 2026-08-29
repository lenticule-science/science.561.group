---
type: morphism
class: classical
status: active
depends-on:
  - ../objects/computational-graph.md
see-also:
  - activation-patching.md
  - ../theorems/attribution-faithfulness-bound.md
references: []
---

# Ablation

**Ablation** is the intervention of *removing* a network
component — by zeroing its output, by replacing its output
with the dataset mean, or by detaching it from the
computational graph — and measuring how much the network's
behavior degrades. Ablation establishes a component's
*necessity* for the behavior.

## The protocol

Given a network, a behavior $B$, and a target component $c$
(neuron, head, layer, or larger):

1. Measure $B$ on the unmodified network: baseline
   performance.
2. Modify the network to *ablate* $c$ — typically by
   zeroing its output or replacing with mean activation.
3. Re-measure $B$: ablated performance.
4. The drop $B_\text{baseline} - B_\text{ablated}$ is the
   *ablation effect* of $c$.

A large ablation effect means the component is necessary;
a small effect means the component contributes little (or
the network compensates through redundancy).

## Variants

- **Zero ablation.** Set the component's output to zero.
  Simple but produces out-of-distribution activations
  downstream.
- **Mean ablation.** Replace with the mean output across
  the dataset. Closer to in-distribution.
- **Resample ablation.** Replace with the output from a
  random other input. Same as mean in expectation but adds
  noise.
- **Causal mean ablation.** Replace with the mean
  *conditioned on the clean input class*. Most controlled.

The choice matters: zero ablation may overstate ablation
effects by introducing distribution shift; mean ablation
underestimates effects by leaving information in the layer's
typical baseline.

## Necessity vs sufficiency

Ablation tests *necessity*: removing the component degrades
behavior. [Activation-patching](activation-patching.md)
tests *sufficiency*: providing the component restores
behavior on inputs where it was missing. Both are needed
for full causal characterization:

- A component can be necessary but not sufficient (multiple
  components together produce the behavior).
- A component can be sufficient but not unique-necessary
  (multiple redundant components each suffice).

## Limits

- **Distribution shift.** Ablating a component disrupts the
  input distribution to downstream components, possibly
  causing out-of-distribution behavior unrelated to the
  studied behavior.
- **Compensation.** The network may have redundant pathways;
  ablating one alone shows little effect even if the
  pathway is important.
- **Granularity.** Ablating a whole layer measures
  layer-level contribution; ablating a neuron measures
  neuron-level contribution. Neither directly identifies
  the right granularity.
- **Faithfulness.** Ablation effects depend on the studied
  task and input distribution; conclusions don't
  automatically generalize.

## In interpretability practice

Ablation is the most common first-pass attribution method:
"how important is component $c$ for behavior $B$?" is
typically answered by ablating $c$ and measuring the drop in
$B$.

Whole-component ablation studies (often plotted as ablation
heatmaps over (layer, head) pairs) are standard companion
artifacts in mechanistic-interpretability papers, even when
deeper [activation-patching](activation-patching.md) or
[circuit-tracing](circuit-tracing.md) analyses follow.
