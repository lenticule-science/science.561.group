---
name: "Reflexive Calibration"
date-created: 2026-03-02
keywords:
  - Relationality
date-updated: 2026-03-09
part-of: mathematics/concepts/reflexive-calibration/terms
introduces: term
---

Reflexive calibration treats measurement consistency as the restoration of [residuated sufficiency](../../slop/relationality/ai-generated-relationality/relationality-slop-2026-03-03/terms/index.md) between recognitions sharing a relational order.

Two measurement systems E₁ and E₂ are calibrated when their joint recognition satisfies the residuation law: Includes(Together(E₁, E₂), E_r) if and only if Includes(E₁, Induces(E₂, E_r)). When this holds, neither system makes demands on the shared reference E_r that the other cannot mediate.

The reflexive calibration index is the [residuated sufficiency](../../slop/relationality/ai-generated-relationality/relationality-slop-2026-03-03/terms/index.md) gap applied to measurement:

g = 1 − V(Together(E₁, E₂)) / V(Either(E₁, E₂))

g = 0 indicates full calibration. 0 < g < 1 indicates partial calibration — the systems agree on some observations but diverge on others. g = 1 indicates disjoint recognition: the systems share no calibrated common ground.

Calibration equilibrium is reached when the closure and openness nuclei commute: Close(Open(E)) = Open(Close(E)) = E. Close expands a recognition to its stable hull; Open contracts it to its coherent data subset. Their commutation means that expanding then contracting yields the same result as contracting then expanding — the recognition is stable under both operations.

This framework unifies three modes of consistency — logical (residuation), geometric (overlap measure), and probabilistic (posterior overlap) — under a single categorical structure.

See the full treatment in [Reflexive Calibration](reflexive-calibration.md).
