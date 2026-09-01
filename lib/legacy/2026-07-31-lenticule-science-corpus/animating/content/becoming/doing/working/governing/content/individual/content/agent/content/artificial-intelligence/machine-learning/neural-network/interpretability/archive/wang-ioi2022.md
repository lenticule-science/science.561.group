---
type: reference
class: foundational
status: active
authors: ["Kevin Wang", "Alexandre Variengien", "Arthur Conmy", "Buck Shlegeris", "Jacob Steinhardt"]
year: 2022
venue: "ICLR 2023; arXiv:2211.00593"
title: "Interpretability in the Wild: A Circuit for Indirect Object Identification in GPT-2 Small"
---

# Wang et al. 2022 — IOI Circuit

Wang, K., Variengien, A., Conmy, A., Shlegeris, B., &
Steinhardt, J. (2022). Interpretability in the Wild: A
Circuit for Indirect Object Identification in GPT-2 Small.
*arXiv:2211.00593*. (Also presented at ICLR 2023.)

The canonical mechanistic-interpretability case study.
Wang et al. identify and reverse-engineer the circuit in
GPT-2 small that solves *indirect object identification* —
predicting the indirect object in sentences like "When Mary
and John went to the store, John gave a drink to ___."

The paper documents a circuit of approximately 26 attention
heads with specific roles:

- **Duplicate-token heads** identify which entities have been
  mentioned twice.
- **Previous-token heads** track recent entity references.
- **S-inhibition heads** suppress the duplicated entity
  ("John" in the example).
- **Name-mover heads** copy the surviving entity ("Mary")
  to the prediction position.

Each head's role is identified by activation patching,
ablation, and direct attention-pattern inspection.

The paper established several methodological norms:
- Circuit identification requires triangulation across
  multiple intervention methods.
- Circuit descriptions should be faithful to the algorithm
  the network actually implements.
- Even small models implement non-trivial multi-step
  algorithms decomposable into specialized components.

It became the reference template for subsequent circuit
identifications and is widely cited as the demonstration
that mechanistic interpretability can produce complete
algorithmic explanations of network behavior.

Cited by:
[circuit](teaching/explanations/circuit.md),
[attention-head](../objects/attention-head.md),
[circuit-tracing](../morphisms/circuit-tracing.md),
[from-saliency-to-circuits](teaching/explanations/from-saliency-to-circuits.md).
