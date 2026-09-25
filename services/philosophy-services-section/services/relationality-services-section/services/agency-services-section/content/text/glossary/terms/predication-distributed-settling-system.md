---
type: definition
realizes: [replica-cover]
class: system
lean: PredicationCategories.Homebrew.Settling.CRDT.DistributedSKPSystem
depends-on: [predication-settling, closure-drivenness, knowledge-order, predication-fiber-algebra]
title: Distributed settling system
description: A distributed settling system over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ is a finite family $\{v^{(i)}\}{i \in I}$ of predication settlings, each evolving independently via its own closure-driven settling.
---

# Distributed settling system

A **distributed settling system** over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ is a finite family $\{v^{(i)}\}_{i \in I}$ of [predication settlings](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/distributed-settling-system/_archive/predication-settling.md), each evolving independently via its own [closure-driven](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/distributed-settling-system/_archive/teaching/explanations/closure-drivenness.md) settling. Replicas exchange state via the **merge operation** — the pointwise [knowledge-order](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/distributed-settling-system/_archive/teaching/explanations/knowledge-order.md) join of their valuations:

$$(v^{(i)} \vee_k v^{(j)})_\tau(p)(s, o) := v^{(i)}_\tau(p)(s, o) \vee_k v^{(j)}_\tau(p)(s, o),$$

applied cellwise across the [predication fiber algebras](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/distributed-settling-system/_archive/predication-fiber-algebra.md).
