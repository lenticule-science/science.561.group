---
type: definition
realizes: [replica-cover]
class: system
lean: PredicationCategories.Homebrew.Settling.CRDT.DistributedSKPSystem
depends-on: [predication-settling, closure-drivenness, knowledge-order, predication-fiber-algebra]
---

# Distributed settling system

A **distributed settling system** over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ is a finite family $\{v^{(i)}\}_{i \in I}$ of [predication settlings](predication-settling.md), each evolving independently via its own [closure-driven](teaching/explanations/closure-drivenness.md) settling. Replicas exchange state via the **merge operation** — the pointwise [knowledge-order](teaching/explanations/knowledge-order.md) join of their valuations:

$$(v^{(i)} \vee_k v^{(j)})_\tau(p)(s, o) := v^{(i)}_\tau(p)(s, o) \vee_k v^{(j)}_\tau(p)(s, o),$$

applied cellwise across the [predication fiber algebras](predication-fiber-algebra.md).
