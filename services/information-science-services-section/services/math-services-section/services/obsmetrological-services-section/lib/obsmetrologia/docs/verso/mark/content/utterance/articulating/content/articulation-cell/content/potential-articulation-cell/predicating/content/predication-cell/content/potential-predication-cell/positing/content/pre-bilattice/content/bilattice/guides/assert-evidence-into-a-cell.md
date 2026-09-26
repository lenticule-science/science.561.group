# Guide: assert evidence into a cell

The bare descent only *measures* (token given → potential). To bring a real **telling** onto a cell —
"this claim is potential," with a witness — you add it as another assignment in the cell's fiber-algebra
and re-run the cone. (The kernel has no built-in assertion source; that's the holography layer's job.
This is how an assertion looks once it's there.)

## Steps

1. Build the descent up to `posit` so you have the measured carrier.
2. Add a second assignment to the same cell — same `cell`, a witnessed charge for the side you're
   asserting. A "told potential" charge is `{ value: [false, true], evidence: [[], [witness]] }`.
3. Run `settle` (or `brim`) — the closure combines the assignments.

```js
import { articulate } from "@red-cup-engineering/metrologic/bilattice";
import { predicate } from "@red-cup-engineering/metrologic/bilattice";
import { posit } from "@red-cup-engineering/metrologic/bilattice";
import { settle } from "@red-cup-engineering/metrologic/bilattice";
import mkUtterance, { witness } from "./tests/_construct-utterance.mjs";

const cat = posit(predicate(articulate(mkUtterance())));
const fa = cat.traces[0].valuations[0]["fiber-algebras"][0];
const cell = fa.assignments[0].cell;

// assert "active" on that cell, witnessed:
fa.assignments.push({ cell, charge: { value: [false, true], evidence: [[], [witness()]] } });

console.log(settle(cat).sheaf.section["fiber-algebras"][0].assignments[0].charge.value);
// [false, false] = absurd — the meet of the measured potential and the asserted potential
```

## What you get

The closure's `□` (meet) combines the assignments. The measured **potential** `[T,F]` met with the
asserted **active** `[F,T]` is **absurd** `[F,F]` — the two assert opposite sides, so they reconcile to
nothing. Assert "active" *consistently* with the givens (e.g. a charge that shares the positive side)
and it raises rather than cancels.

## Notes

- This is the multi-source case: a cell carrying more than one assignment. The closure reads them by
  meet-then-join; see `TODO.md` for the open contract question (whether sources should be joined
  upstream first).
- To assert without the measured potential interfering, replace `fa.assignments[0]` rather than
  pushing alongside it.

## See also

- guide: [build a richer category](build-a-richer-category.md)
- reference: [the charge](../references/the-charge.md) · [morphisms](../references/morphisms.md)

## Earlier material

```js
import { articulate } from "@561-group/math/bilattice";
import { predicate } from "@561-group/math/bilattice";
import { posit } from "@561-group/math/bilattice";
import { settle } from "@561-group/math/bilattice";
import mkUtterance, { witness } from "./tests/_construct-utterance.mjs";
