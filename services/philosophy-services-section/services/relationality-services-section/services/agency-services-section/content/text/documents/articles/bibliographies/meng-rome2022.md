---
type: reference
class: foundational
status: active
authors: ["Kevin Meng", "David Bau", "Alex Andonian", "Yonatan Belinkov"]
year: 2022
venue: "NeurIPS 2022"
title: "Locating and Editing Factual Associations in GPT"
description: Meng, K., Bau, D., Andonian, A., & Belinkov, Y.
---

# Meng et al. 2022 — ROME

Meng, K., Bau, D., Andonian, A., & Belinkov, Y. (2022).
Locating and Editing Factual Associations in GPT. *Advances
in Neural Information Processing Systems* 35.

The ROME (Rank-One Model Editing) paper. Meng et al. use
*causal tracing* — a precursor of activation patching — to
localize where factual associations are stored in GPT-style
models, finding that specific factual associations are
disproportionately concentrated in mid-layer MLP
computations on the token of the subject.

Building on the localization, the paper introduces *rank-one
weight editing*: directly modifying the weights of identified
MLP layers to change a stored factual association
(e.g., changing "The Eiffel Tower is in Paris" to "The
Eiffel Tower is in Rome"). The edits succeed surgically —
the targeted association changes while related associations
remain intact, validating both the localization and the
editing method.

The paper provided strong evidence for:
- *Linear encoding* of factual associations (consistent with
  the [linear-representation-hypothesis](../../../glossary/concepts/linear-representation-hypothesis.md)).
- *Component-level localization* of specific knowledge in
  large models.
- The viability of *interpretability-driven editing* as a
  practical technique.

It is one of the most-cited mechanistic-interpretability
papers and established the *causal tracing* methodology
that activation patching generalized.

Cited by:
[activation-patching](../notes/undated/activation-patching.md),
[linear-representation-hypothesis](../../../glossary/concepts/linear-representation-hypothesis.md).
