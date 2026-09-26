# Guide: build a richer category

A single utterance gives a single cell `(token, claim, token)`. To exercise the descent on a
*relational* structure — several entities, several predicates, a specialization order — build the
post-`posit` category by hand in the shape `posit` produces, then run the cones on it.

## The shape

A category the cones consume is `{ presheaf, traces: [{ valuations: [valuation] }] }`, where a
valuation is `{ base, "fiber-algebras": [ { "entity-set", predicate, assignments } ] }` and each
assignment is `{ cell: {subject, predicate, object}, charge }`.

## A 2-entity, 1-predicate category (4 cells, all potential)

```js
import { settle } from "@red-cup-engineering/metrologic/bilattice";
import { brim } from "@red-cup-engineering/metrologic/bilattice";
import { vanish } from "@red-cup-engineering/metrologic/bilattice";
import { id } from "./tests/_construct-utterance.mjs";

const p = id(), e = [id(), id()];                       // one predicate, two entities
const pot = (subject) => ({ value: [true, false], evidence: [[subject], []] }); // measured potential
const cells = e.flatMap((s) => e.map((o) => ({ subject: s, predicate: p, object: o })));

const base = { objects: { predicates: [p] }, specialization: [], converse: [],
  "subject-projection": [], "object-projection": [] };
const cat = { presheaf: {}, traces: [{ valuations: [{ base,
  "fiber-algebras": [{ "entity-set": { entities: e }, predicate: p,
    assignments: cells.map((c) => ({ cell: c, charge: pot(c.subject) })) }] }] }] };

console.log(settle(cat).sheaf.section["fiber-algebras"][0].assignments.map((a) => a.charge.value));
// 4 × [true, false]  — all potential
console.log(brim(cat).cone.section["fiber-algebras"][0].assignments.map((a) => a.charge.value));
// 4 × [true, true]   — all stable
console.log(vanish(cat).apex.length); // 4 — every cell is open on its activity bit
```

## Adding a specialization order

Put edges in `base.specialization` (e.g. `[{ source: p1, target: p2 }]`) to give `cohere`/`estrange`
something to close and complement. `estrange(category)` then returns the predicate pairs never
related by the closure.

## Notes

- This is the same construction the audit and `tests/structure.mjs` use; it's the honest way to get
  multi-cell behavior without an upstream evidence source.
- Coherence holds on multi-cell — `settle ≤ₖ brim` cell-by-cell — but whether `brim`'s free-bit-raise
  equals the genuine closure GFP across the base relation is still asserted, not proved (`TODO.md`).

## See also

- guide: [assert evidence into a cell](assert-evidence-into-a-cell.md)
- reference: [morphisms](../references/morphisms.md) · [the charge](../references/the-charge.md)
