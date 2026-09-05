---

name: "Drift"
  - "drift"
  - "drift operator"
date-created: 2025-12-26
introduces: term
tags: []
---

The drift operator Δ_t on a [recognition fiber](./recognition-fiber.md) H_t is a monotone endomorphism that moves recognitions along a temporal or dynamical axis: it models how semantic values shift or evolve at a given [trace](./trace.md). Unlike the [stabilizer](./stabilizer.md) σ_t, drift is not required to be idempotent — applying drift repeatedly may continue to shift recognitions.

Drift commutes with the stabilizer: Δ_t ∘ σ_t = σ_t ∘ Δ_t. This commutation is one of the central structural requirements of the [GFRTU](../generative-fibered-recognition-trace-universe.md), ensuring that the two dynamics (consolidation and evolution) are compatible. A recognition is dynamically stable when it is fixed by both operators: the [fixed fiber](./fixed-fiber.md) H_t* = {a : σ_t(a) = a = Δ_t(a)}.

Drift in the GFRTU plays a role analogous to the temporal [trace comonad](../../semiotic-universe/terms/trace-comonad.md) G in the [semiotic universe](../../semiotic-universe/terms/semiotic-structure.md): both model temporal or dynamical evolution of semantic values. The interaction axiom j(G(a)) ≤ G(j(a)) in the [semiotic](../../../../../linguistics/topics/semiotics/index.md) universe mirrors the commutation of stabilizer and drift in the GFRTU, ensuring that modal and temporal structure remain coherent.
