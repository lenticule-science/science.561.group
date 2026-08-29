# Guide: split consistent from paraconsistent

`compare` separates a settled section into its **consistent** part (cells valued absurd / potential /
active) and its **paraconsistent** part (cells valued **stable**/⊤ — "told both," the inconsistency
locus). This is the `F^(k) ≅ F^(t) ⊕ F^(⊤)` decomposition.

## Do it

```js
import { compare } from "@561-group/math/bilattice";
import { settle } from "@561-group/math/bilattice";
// ... build `cat` via articulate→predicate→posit ...

const { consistent, paraconsistent } = compare(settle(cat).sheaf.section);

console.log(consistent["fiber-algebras"][0].assignments.length);     // the ⊥/t/f cells
console.log(paraconsistent["fiber-algebras"][0].assignments.length); // the ⊤ (stable) cells
```

`compare` keeps the section shape; it just filters each fiber-algebra's assignments by `is-top`. The
two parts partition the section: disjoint, and together they're the whole.

## When the paraconsistent part is empty

On a *consistent* settling — one that never produced a stable/⊤ cell — `paraconsistent` is empty, and
there the knowledge and truth readings coincide (the cohomologies agree). A bare descent is like this:
every cell is potential, none is ⊤, so `compare` puts everything in `consistent`. You only get a
paraconsistent locus once conflicting tellings drive a cell to stable.

## The two voids

This is the **over**-determined void (told-both / inconsistency) — the dual of `vanish`'s
**under**-determined void (slack). `conflate` (absurd↔stable) is the bridge between them. See
[the two cones and the void](../explanations/the-two-cones-and-the-void.md).

## See also

- guide: [read the void cone](read-the-void-cone.md)
- reference: [morphisms](../references/morphisms.md) (`compare`, `is-top`)
- explanation: [evidence — the carrier](../explanations/evidence-the-carrier.md) (why ⊤ is reachable)
