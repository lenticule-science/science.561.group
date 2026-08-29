---
type: reference
class: foundational
status: active
authors: ["Chris Olah", "Nick Cammarata", "Ludwig Schubert", "Gabriel Goh", "Michael Petrov", "Shan Carter"]
year: 2020
venue: "Distill"
title: "Zoom In: An Introduction to Circuits"
---

# Olah et al. 2020 — Distill Circuits

Olah, C., Cammarata, N., Schubert, L., Goh, G., Petrov, M., &
Carter, S. (2020). Zoom In: An Introduction to Circuits.
*Distill*. https://distill.pub/2020/circuits/zoom-in/

The founding statement of the *features-and-circuits* program
of mechanistic interpretability. The Distill Circuits thread
established three commitments that shaped subsequent work:

1. **Features as the unit.** A *feature* is a direction in
   activation space corresponding to a human-interpretable
   concept; not necessarily a neuron.
2. **Circuits as explanations.** A *circuit* is a subgraph
   of components implementing a recognizable algorithm. The
   right level of explanation is algorithmic.
3. **Universality.** Similar features and circuits appear
   across different models trained on similar data —
   suggesting that what networks learn is more universal
   than network-specific.

The thread documents several circuits in InceptionV1 (curve
detectors, high-low frequency detectors, dog detectors) with
explicit feature identification, weight analysis, and
algorithmic descriptions. It became the methodological
template for the mechanistic interpretability program.

Cited by:
[feature](teaching/explanations/feature.md),
[circuit](teaching/explanations/circuit.md),
[mechanistic-interpretability](teaching/explanations/mechanistic-interpretability.md),
[polysemanticity](teaching/explanations/polysemanticity.md),
[from-saliency-to-circuits](teaching/explanations/from-saliency-to-circuits.md).
