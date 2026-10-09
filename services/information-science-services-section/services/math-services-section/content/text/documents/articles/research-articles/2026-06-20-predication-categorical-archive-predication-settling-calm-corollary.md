---
type: theorem
status: proved
depends-on: [distributed-settling-system, predication-settling, crdt-convergence, knowledge-order]
title: predication settling CALM corollary
date-created: 2026-06-20
description: "settle-based computation is coordination-free: all queries computable as $\\leqk$-monotone functions of the predication settling state can be evaluated without cross-replica coordination."
---

# predication settling CALM corollary

settle-based computation is coordination-free: all queries computable as $\leq_k$-monotone functions of the [predication settling](../objects/predication-settling.md) state can be evaluated without cross-replica coordination.

## Proof

Direct instantiation of the CALM theorem ([@hellerstein-alvaro2020]: predication settling updates are monotone in the [knowledge order](teaching/explanations/knowledge-order.md) $\leq_k$ — by the [CRDT convergence theorem](../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/crdt-convergence.md) and the underlying [closure-driven settling monotonicity](../../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-monotonicity/references/closure-driven-settling-monotonicity.md) — and CALM says monotonicity is equivalent to coordination-freeness. $\square$
