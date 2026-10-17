---
title: "Substructural Logics and What They Drop"
description: "A comparison of the structural rules removed by substructural logics and the algebraic consequences."
date-created: 2026-03-30
type: explanation
article-kind: comparison
source-snapshot: 2026-08-17-windows-561-group
source-variants:
  - substructural-logic/flowif-substructural-logics-and-what-they-drop.md
  - substructural-logic/research-substructural-logics-and-what-they-drop.md
---

Classical reasoning usually hides three structural permissions: duplicate a hypothesis (contraction), discard an unused hypothesis (weakening), and reorder hypotheses (exchange). Substructural logics make these permissions explicit.

Linear logic drops contraction and weakening, so hypotheses are resources used exactly once. The Lambek calculus drops all three, making order part of meaning. Relevance logic drops contraction while retaining the requirement that assumptions matter. Residuated lattices model these choices algebraically: idempotence corresponds to contraction, integrality to weakening, and commutativity to exchange.
