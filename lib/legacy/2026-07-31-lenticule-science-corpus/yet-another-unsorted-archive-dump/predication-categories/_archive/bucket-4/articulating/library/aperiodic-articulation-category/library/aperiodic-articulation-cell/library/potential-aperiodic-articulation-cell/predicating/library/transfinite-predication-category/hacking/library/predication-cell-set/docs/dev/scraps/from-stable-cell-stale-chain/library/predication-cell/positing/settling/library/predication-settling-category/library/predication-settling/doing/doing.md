---
name: doing
description: The doing morphism on a predication-settling — one settling-step that advances v_τ → v_{τ+1} by applying either nucleus (σ or Δ) and emitting one higher-stratum atom. Source object is the parent predication-settling; the morphism returns the cell-record-emission witnessing the step. Math class at doing.schema.json; function at scripts/doing.mjs.
specializing: settling-morphism
---

A **doing-act** is one settling-step in the trajectory $v = (v_\tau)_{\tau < \lambda}$ of the parent [predication-settling](../predication-settling.md). Settling monotonicity requires $v_\tau(p) \leq_k v_{\tau+1}(p)$ pointwise in the [predication-fiber-algebra](../../../../predication-fibration/library/predication-fiber-algebra/) at each predicate $p$; a doing-act is the operationally-realized event that produces $v_{\tau+1}$ from $v_\tau$ at one specific cell, with one specific atom added to the [stratified-predication-fiber](../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/stratified-predication-fiber.md) and one deps-chain attached.

Per the [agentive-triad question](../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/questions/agentive-triad-speaking-doing-learning.md), doing is the closure-face of the triad — parallel to the positing-face realized by [predicating](../../../../predication-cell-set/library/predication-cell/predicating/) at stratum-0. Doing-acts emit at stratum-1 (σ-firings via the [closure-operator](../../../../lattice/library/closure-operator/) nucleus) or stratum-2 (Δ-stabilizations via the bilattice-stabilization-nucleus). The within-theory symmetry is $K_4 = \langle \sim, - \rangle$ on the by-produced-value Belnap quartet, shared with predicating.

## Source and target

- **Source.** A predication-settling $v$ at step $\tau$, plus the operational parameters of the step:
  - For σ-doing-acts: a closure-rule from $\mathcal{S}$ and the premise atoms (cell-ids at strata $\leq 1$) it consumes.
  - For Δ-doing-acts: a target cell $\phi$ and the cell's prior atom chain (cell-ids at strata $\leq 2$).
- **Target.** The successor valuation $v_{\tau+1}$ realized by appending one new atom at the affected cell. The atom is a cell-record at stratum 'saturated' (σ) or 'settled' (Δ), with the produced value, the deps-chain, and a `derived-via` slug naming the rule or operator.

The morphism is knowledge-monotone by construction: the atom is added; nothing is overwritten. Persistence-under-promotion holds.

## API

```js
import doing, { sigmaDoing, deltaDoing, closureStatus } from "./scripts/doing.mjs";

const step = doing({
  cell: { subject, predicate, object },
  "value-before": { bilattice, value },   // v_τ at the affected cell
  "value-after":  { bilattice, value },   // v_{τ+1}; must be ≥_k value-before (Belnap quartet)
  kind: "sigma" | "delta",                // pins stratum to 'saturated' | 'settled'
  "derived-from": [cellId, ...],          // non-empty SHA-256 premise cell-ids
  "derived-via": "closure-rule-slug"      // δ default: 'bilattice-stabilization'
});
```

The function validates input shape, checks knowledge-monotonicity against the FOUR bilattice's $\leq_k$ order, derives `stratum` from `kind`, derives `belnap-class` from `value-after`, stamps `t`, and validates the assembled record against [doing.schema.json](doing.schema.json). Mirrors the discipline of the kernel [predicating morphism](../../../../predication-cell-set/library/predication-cell/predicating/) but at the settling-step layer.

## Sub-morphism

[`working/`](working/) is doing restricted to operational target cells — the subset of doing-acts whose target cell is in the runtime sub-presheaf of the host fiber.
