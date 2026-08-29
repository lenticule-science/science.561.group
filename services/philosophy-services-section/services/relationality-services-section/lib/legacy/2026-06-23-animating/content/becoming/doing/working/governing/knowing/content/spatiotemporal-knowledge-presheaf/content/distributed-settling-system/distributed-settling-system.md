---
kind: definition
realizes: [replica-cover]
type: system
lean: SpatiotemporalKnowledgeSystem.Homebrew.Settling.CRDT.DistributedSKPSystem
depends-on: [spatiotemporal-knowledge-presheaf, closure-drivenness, knowledge-order, predication-fiber-algebra]
---

# Distributed settling system

A **distributed settling system** over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ is a finite family $\{v^{(i)}\}_{i \in I}$ of [spatiotemporal knowledge presheaves](spatiotemporal-knowledge-presheaf.md), each evolving independently via its own [closure-driven](../concepts/closure-drivenness.md) settling.
Replicas exchange state via the **merge operation** — the pointwise [knowledge-order](../concepts/knowledge-order.md) join of their valuations:

$$(v^{(i)} \vee_k v^{(j)})_\tau(p)(s, o) := v^{(i)}_\tau(p)(s, o) \vee_k v^{(j)}_\tau(p)(s, o),$$

applied cellwise across the [predication fiber algebras](predication-fiber-algebra.md).
