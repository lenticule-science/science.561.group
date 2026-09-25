# Guide: read the void cone

The void cone is the cells a descent leaves *open* — where the unit cone (least) and counit cone
(greatest) disagree. Here's how to get it and read what it carries.

## Get it

`vanish` runs both knowledge cones and returns their gap:

```js
import { articulate } from "@lenticule-science/metrologic/bilattice";
import { predicate } from "@lenticule-science/metrologic/bilattice";
import { posit } from "@lenticule-science/metrologic/bilattice";
import { vanish } from "@lenticule-science/metrologic/bilattice";
import mkUtterance from "./tests/_construct-utterance.mjs";

const cat = posit(predicate(articulate(mkUtterance())));
const v = vanish(cat);

console.log(v.apex.length);   // > 0 — the bare cell is open on its activity bit
console.log(v.evidence[0]);   // { cell, least: <settle charge>, greatest: <brim charge> }
```

- `v.apex` — the bare cells (`{subject, predicate, object}`), so they can be re-articulated.
- `v.evidence` — per void cell, the full interval `{ cell, least, greatest }`: what `settle` measured
  and what `brim` allowed. The slack is the difference between `least.value` and `greatest.value`.

## Read it on either axis

`vanish` is the knowledge void (`gap(settle, brim)`). For the truth void, call `gap` yourself:

```js
import { settle } from "@lenticule-science/metrologic/bilattice";
import { brim } from "@lenticule-science/metrologic/bilattice";
import { adjudicate } from "@lenticule-science/metrologic/bilattice";
import { presume } from "@lenticule-science/metrologic/bilattice";
import { gap } from "@lenticule-science/metrologic/bilattice";

const knowledgeVoid = gap({ least: settle(cat).sheaf.section, greatest: brim(cat).cone.section });
const truthVoid     = gap({ least: adjudicate(cat).verdict.section, greatest: presume(cat).presumption.section });
```

## What "void" means here

A cell is void when the cones **disagree** — genuine under-determination. A cell both cones pin to the
same value (e.g. a reconciled conflict that settles *and* brims to absurd) is **not** void: there's no
slack. That's why reading the gap is sharper than reading the LFP alone — the LFP can't tell
"determinately absurd" from "open."

## See also

- explanation: [the two cones and the void](../explanations/the-two-cones-and-the-void.md)
- guide: [split consistent from paraconsistent](split-consistent-from-paraconsistent.md) (the *other* void)
- reference: [morphisms](../references/morphisms.md) (`gap`, `vanish`)

## Earlier material

```js
import { articulate } from "@561-group/math/bilattice";
import { predicate } from "@561-group/math/bilattice";
import { posit } from "@561-group/math/bilattice";
import { vanish } from "@561-group/math/bilattice";
import mkUtterance from "./tests/_construct-utterance.mjs";

```js
import { settle } from "@561-group/math/bilattice";
import { brim } from "@561-group/math/bilattice";
import { adjudicate } from "@561-group/math/bilattice";
import { presume } from "@561-group/math/bilattice";
import { gap } from "@561-group/math/bilattice";
