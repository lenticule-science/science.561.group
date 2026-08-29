# Tutorial: the two cones by hand

You've measured a cell to **potential** ([your first descent](your-first-descent.md)). Now you'll
bracket it between its two cones and read the slack between them as the void. Work from the package
root.

## 1. Build the carrier

```js
import { articulate } from "@lenticule-science/metrologic/bilattice";
import { predicate } from "@lenticule-science/metrologic/bilattice";
import { posit } from "@lenticule-science/metrologic/bilattice";
import mkUtterance from "./tests/_construct-utterance.mjs";

const cat = posit(predicate(articulate(mkUtterance())));
const value = (s) => s["fiber-algebras"][0].assignments[0].charge.value;
```

## 2. The knowledge cones — least and greatest

```js
import { settle } from "@lenticule-science/metrologic/bilattice";
import { brim } from "@lenticule-science/metrologic/bilattice";

console.log("settle (LFP):", value(settle(cat).sheaf.section));   // [ true, false ]  potential
console.log("brim   (GFP):", value(brim(cat).cone.section));      // [ true, true  ]  stable
```

`settle` leaves the free bit **low**; `brim` raises it **high**. Same cell, bracketed
`potential ↑ stable`: the token is settled (positive bit fixed), the claim's activity is open (the
free bit ranges).

## 3. The void is the slack

```js
import { vanish } from "@lenticule-science/metrologic/bilattice";

const v = vanish(cat);
console.log("void cells:", v.apex.length);                                           // 1
console.log("interval:", v.evidence[0].least.value, "..", v.evidence[0].greatest.value); // [true,false] .. [true,true]
```

`vanish` keeps the cells where the cones **disagree** and carries the `[least, greatest]` interval.
Here the whole cell is void on its activity bit — exactly the slack you saw in step 2.

## 4. The truth cones

The truth order has its own pair, reading the *same* carrier:

```js
import { adjudicate } from "@lenticule-science/metrologic/bilattice";
import { presume } from "@lenticule-science/metrologic/bilattice";

console.log("adjudicate (truth-LFP):", value(adjudicate(cat).verdict.section));     // [ true, false ]
console.log("presume    (truth-GFP):", value(presume(cat).presumption.section));    // [ true, false ]
```

On a bare cell the truth cones **agree** (both potential): the slack lives only on the knowledge axis.
That's expected — truth is one-sided on a fresh, token-given cell.

## What you saw

Two cones bracketing one measured cell, the gap between them as the void, and the truth order's cones
collapsing where the knowledge order's spread. The cones are *evidence*-driven — they read which bit is
free — which is why no value-level trick (`conflate`) can produce them.

Next: [watching absurd get reached](watching-absurd-get-reached.md).
