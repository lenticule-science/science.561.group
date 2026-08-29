---
title: "Informational Malfunction"
date-created: 2026-03-02T00:00:00
type: term
keywords:
  - Relationality
defines:
  - "Informational Malfunction"
date-updated: 2026-03-09
part-of: sociology/schools/cybernetic-postliberalism/terms
---

Informational malfunction is a pathological mode of information-processing in which a system maximizes internal coherence at the cost of correspondence with its environment.

The defining signature is asymmetric optimization.
The system's reward function penalizes internal divergence — changes in its own belief state — but does not penalize divergence from the environment.
Formally: the system minimizes D_KL(b_{t+δ} ‖ b_t) (internal stability) while D_KL(b_t ‖ E_t) (environmental divergence) remains unpenalized and grows.

The result is that the system accumulates more mutual information within its own belief structure than between its beliefs and the external world: ∂_t I(b; b') > ∂_t I(b; E).
Internal entropy collapses (H(p_t) → 0) while the system's predictions increasingly fail to track the environment.

This produces [epistemic overclosure](./epistemic-overclosure.md): the system reaches a locally stable equilibrium that is globally misaligned.
It feels coherent from the inside — beliefs are consistent, predictions are stable — but external surprise steadily increases.

Informational malfunction provides a formal account of how [ideological](./ideology.md) self-maintenance operates as an information-processing pathology rather than a failure of rationality or intelligence.
The malfunction is structural: the reward architecture is wrong, not the inferential capacity.

See [Describing Liberal Subjectivity as Informational Malfunction](../texts/describing-liberal-subjectivity-as-informational-malfunction.md).
