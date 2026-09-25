# Tutorial: watching absurd get reached

The kernel never *seeds* absurd — it's only ever *reached*, by combining incompatible tellings. In
this short run you'll make it happen and see it, so "measured, not seeded" is something you watched
rather than read.

## 1. Two opposite tellings

A charge "told **potential**" asserts the positive side; "told **potential**" asserts the negative. The
mint helper builds both with real witnesses:

```js
import { charge } from "./tests/_construct-utterance.mjs";

const potential = charge("t");   // { value: [true, false],  evidence: [[w], []]  }
const active    = charge("f");   // { value: [false, true],  evidence: [[], [w]]  }
console.log(potential.value, active.value);   // [ true, false ] [ false, true ]
```

## 2. Meet them — and watch absurd appear

```js
import { meetKnowledge as meetK } from "@lenticule-science/metrologic/bilattice";

const reconciled = meetK({ left: potential, right: active });
console.log(reconciled.value);          // [ false, false ]  ← absurd, REACHED
```

The knowledge meet ANDs the value bits: `[true∧false, false∧true] = [false, false]`. The two tellings
assert opposite sides, so what they *agree on* is nothing — **absurd**. You didn't stamp it anywhere;
it fell out of the meet.

## 3. The evidence is still there

```js
console.log(reconciled.evidence.map((side) => side.length));   // [ 1, 1 ]
```

This is what the lossless carrier is for: the value reconciled to absurd, but **both witnesses
are kept**. The kernel can tell this "absurd, two conflicting tellings" apart from "absurd, told
nothing at all" — the value is the same, the evidence is not.

## 4. Contrast: nothing seeds absurd

```js
import { articulate } from "@lenticule-science/metrologic/bilattice";
import { predicate } from "@lenticule-science/metrologic/bilattice";
import { posit } from "@lenticule-science/metrologic/bilattice";
import mkUtterance from "./tests/_construct-utterance.mjs";

const measured = posit(predicate(articulate(mkUtterance())))
  .traces[0].valuations[0]["fiber-algebras"][0].assignments[0].charge;
console.log(measured.value);            // [ true, false ]  ← potential, never absurd
```

A freshly measured cell is **potential**, not absurd — because absurd is a *reached* value, not a
floor anyone starts at.

## What you saw

Absurd produced by the meet of incompatibles, with the conflicting evidence retained, and a measured
cell that never touches absurd. That's the whole of "measured, not seeded," in five lines.

Next: [the laws are real](the-laws-are-real.md).

## Earlier material

A charge "told **potential**" asserts the positive side; "told **active**" asserts the negative. The
mint helper builds both with real witnesses:

```js
import { meetKnowledge as meetK } from "@561-group/math/bilattice";

This is the lossless carrier earning its keep: the value reconciled to absurd, but **both witnesses
are kept**. The kernel can tell this "absurd, two conflicting tellings" apart from "absurd, told
nothing at all" — the value is the same, the evidence is not.

```js
import { articulate } from "@561-group/math/bilattice";
import { predicate } from "@561-group/math/bilattice";
import { posit } from "@561-group/math/bilattice";
import mkUtterance from "./tests/_construct-utterance.mjs";
