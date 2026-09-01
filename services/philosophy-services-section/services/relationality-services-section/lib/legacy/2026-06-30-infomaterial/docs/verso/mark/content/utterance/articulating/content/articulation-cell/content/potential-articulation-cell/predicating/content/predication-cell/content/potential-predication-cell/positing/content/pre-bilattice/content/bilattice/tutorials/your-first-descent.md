# Tutorial: your first descent

You'll mint an utterance, run it through the four-stage descent, and read the state the kernel
measures for it. By the end you'll have seen what each stage does and why a fresh cell comes out
**potential**.

No setup — there are no dependencies. Work from the package root (`development/experimental/math-kernel`)
and put this in a file, say `first-descent.mjs`, running it with `node first-descent.mjs` as you go.

## 1. Mint an utterance

An utterance is a pair `[token, claim]`. The mint helper makes random ones from real hashed ids:

```js
import mkUtterance from "./tests/_construct-utterance.mjs";

const u = mkUtterance();
console.log(u);            // e.g. [ '3af9c1', 'd02e77' ]  — a token (left), a claim (right)
```

## 2. Articulate — witness it into a cell

```js
import { articulate } from "@561-group/math/bilattice";

const c0 = articulate(u);
console.log(c0);           // { potential: [ '3af9c1', 'd02e77' ] }
```

`articulate` asserts *no* semantics about the parts — it just puts the two sides into a `potential`
cell. (Hand it `[]` or `[token]` and it throws: an utterance must give both sides.)

## 3. Predicate — spread into the relational cells

```js
import { predicate } from "@561-group/math/bilattice";

const c1 = predicate(c0);
console.log(c1["cell-set"]["entity-set"]);     // { entities: [ '3af9c1' ] }   — left read as the object
console.log(c1["cell-set"]["predicate-set"]);  // { predicates: [ 'd02e77' ] } — right read as the concept
```

`predicate` reads the left as the entity dimension and the right as the predicate dimension, and forms
the cell-set `Φ = E × Π × E`. For one utterance that's a single cell `(token, claim, token)` — no
charge yet, just the site.

## 4. Posit — *measure* the cell

```js
import { posit } from "@561-group/math/bilattice";

const c2 = posit(c1);
console.log(c2.traces[0].valuations[0]["fiber-algebras"][0].assignments[0].charge);
// { value: [ true, false ], evidence: [ [ '3af9c1' ], [] ] }
```

This is the key step. `posit` **measures** the cell from its givens: the token is given, so the
positive (knowledge) bit is set and witnessed by the token; the claim is only *claimed*, not yet
realized, so the negative bit is left **free** (no witness). The value `[true, false]` is **potential**.
Nothing was seeded — the state was read off what's there.

## 5. Settle — reach the fixed point

```js
import { settle } from "@561-group/math/bilattice";

const { sheaf } = settle(c2);
console.log(sheaf.section["fiber-algebras"][0].assignments[0].charge.value);  // [ true, false ]
```

`settle` iterates the knowledge closure to its least fixed point. With nothing telling, the measured
**potential** is already a fixed point — so it stays potential. "Settledness" isn't a flag; it *is*
the fact that `section` is the fixed point the loop reached.

## What you saw

A real utterance, articulated into a cell, **measured** to potential, settling to potential — token
given, claim still open. Nothing was stamped or fabricated.

Next: [the two cones by hand](the-two-cones-by-hand.md) — bracket that potential between its floor and
ceiling, and read the slack as the void.
