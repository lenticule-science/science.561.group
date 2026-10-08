---
name: working
description: The working morphism — a doing-act whose target cell is in the operational sub-presheaf of the host fiber. Categorically the restriction of doing to the operational slice of the cell-set. Math class at working.schema.json; function at scripts/working.mjs.
specializing: doing
title: working
---

A **working-act** is a [doing-act](doing.md) whose target cell is in the operational sub-presheaf of the host [predication-settling](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predication-cell/positing/settling/library/predication-settling-category/library/predication-settling/predication-settling.md). Operationality is the cell-class partition the OS imposes on its cell-set: operational cells carry the runtime state being moved; normative cells (target of `governing/`) carry the rules under which the agent operates; plan-document cells (target of `planning/`) carry missions, projects, tasks, expeditions.

Categorically, working is the pullback of doing along the inclusion `Φ_op ↪ Φ` of the operational sub-presheaf into the full cell-set. Every working-act is a doing-act; not every doing-act is a working-act. The σ/Δ-nucleus distinction, the L/I/P factorization, the $K_4$ symmetry, the Belnap classification, and the closure-status taxonomy all transfer directly from doing.

## API

```js
import working, { sigmaWorking, deltaWorking } from "./scripts/working.mjs";

const step = working({
  cell: { subject, predicate, object },   // subject must mark an operational entity
  "value-before": { bilattice, value },
  "value-after":  { bilattice, value },
  kind: "sigma" | "delta",
  "derived-from": [cellId, ...],
  "derived-via": "rule-slug"
});
```

The function delegates to [doing](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predication-cell/positing/settling/library/predication-settling-category/library/predication-settling/doing/scripts/doing.mjs) for monotonicity, stratum-from-kind derivation, Belnap classification, and core validation, then attaches `target-class: 'operational'` and revalidates against [working.schema.json](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predication-cell/positing/settling/library/predication-settling-category/library/predication-settling/doing/working/working.schema.json). Passing any other `target-class` value throws.
