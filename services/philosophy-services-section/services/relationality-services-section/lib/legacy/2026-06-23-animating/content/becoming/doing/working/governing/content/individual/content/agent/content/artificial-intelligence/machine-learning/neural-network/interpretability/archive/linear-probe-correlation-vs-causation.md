---
type: theorem
class: classical
status: informal
depends-on:
  - ../objects/probe.md
  - ../morphisms/probing.md
see-also:
  - teaching/explanations/linear-representation-hypothesis.md
references: []
---

# Linear probe correlation vs causation

## Statement (informal)

A successful linear probe on layer $l$ for property $P$
shows that information about $P$ is *available* in the
layer's activations — but does NOT show that the network
*uses* the information for any particular downstream
behavior. Probing accuracy measures *encoded availability*,
not *causal role*. Conflating the two is the central
methodological error of probe-based interpretability.

## The setup

Suppose a researcher trains a linear probe on layer $l$ to
predict property $P$ and obtains 95% accuracy. They conclude:
"the network encodes $P$ at layer $l$." This conclusion is
correct only in a weak sense (the information is decodable);
it is incorrect if interpreted as "the network uses $P$ in
its computation."

## Three confounds

**1. Spurious correlation.** Property $P$ may be correlated
with property $P'$ that the network *does* use. The probe
picks up the correlation; the probe accuracy on $P$ reflects
the network's use of $P'$.

**2. Information-without-use.** The information may be
*incidentally* present in activations as a side effect of
the network's encoding of related properties, without the
network's downstream layers consuming the information for
$P$-related behavior.

**3. Pre-network availability.** The information may have
been present in the input, persisted through the network's
residual stream, and remained in layer $l$ — the network
neither extracts nor uses it; the probe just decodes what
was already there.

## The remedy

To establish *causal role*, intervention is required:

- **Activation patching.** Patch the layer's activations to
  remove the property's encoding; check that the
  property-relevant behavior degrades.
- **Steering.** Add the probe direction to activations;
  check that the property-relevant behavior changes
  predictably.
- **Ablation.** Remove the components hypothesized to encode
  the property; check that downstream behavior changes.

Probing alone is *necessary but not sufficient* for causal
claims. Combining probing with intervention is the standard
methodological response.

## Why the confound is common

Probing is cheap and easy; intervention is expensive and
hard. The literature has historically reported probe
results as if they established the network's use of the
property, often with predictable downstream confusion when
intervention experiments fail to confirm.

The mechanistic-interpretability community has more recently
adopted the discipline of pairing probe results with
intervention results. Older results that rest on probing
alone are treated with appropriate skepticism.

## Examples of the error

- **Truthfulness probes.** Several papers reported linear
  probes for "truthfulness" in instruction-tuned LLMs.
  Subsequent work showed the probes pick up properties
  *correlated with* truthfulness in the training data
  (e.g., specific phrasing patterns), not truthfulness
  itself; intervening on the probe direction does not make
  the model more truthful.
- **Sentiment probes.** Strong sentiment-probe accuracy
  does not always predict that the network's downstream
  generation is sentiment-conditioned in the way the probe
  suggests.

## Status

Informal but widely accepted as a methodological
constraint. The "probe accuracy ≠ causal role" caveat is
standard in modern interpretability papers, with intervention
experiments increasingly required for claims about what a
network is "actually doing."
