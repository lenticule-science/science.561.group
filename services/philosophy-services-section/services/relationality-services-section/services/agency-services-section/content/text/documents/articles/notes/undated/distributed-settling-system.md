---
kind: definition
realizes: [replica-cover]
type: system
lean: SpatiotemporalKnowledgeSystem.Homebrew.Settling.CRDT.DistributedSKPSystem
depends-on: [spatiotemporal-knowledge-presheaf, closure-drivenness, knowledge-order, predication-fiber-algebra]
title: Distributed settling system
description: A distributed settling system over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ is a finite family $\{v^{(i)}\}{i \in I}$ of spatiotemporal knowledge presheaves, each evolving independently via its own closure-driven settling.
---

# Distributed settling system

A **distributed settling system** over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ is a finite family $\{v^{(i)}\}_{i \in I}$ of [spatiotemporal knowledge presheaves](../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/spatiotemporal-knowledge-presheaf.md), each evolving independently via its own [closure-driven](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/concepts/closure-drivenness.md) settling.
Replicas exchange state via the **merge operation** — the pointwise [knowledge-order](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/concepts/knowledge-order.md) join of their valuations:

$$(v^{(i)} \vee_k v^{(j)})_\tau(p)(s, o) := v^{(i)}_\tau(p)(s, o) \vee_k v^{(j)}_\tau(p)(s, o),$$

applied cellwise across the [predication fiber algebras](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/distributed-settling-system/predication-fiber-algebra.md).
