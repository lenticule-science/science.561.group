# Guide: add a morphism

The conventions for adding to the bilattice without breaking its shape or its laws.

## The conventions

1. **A named export, in the module for its layer.** Value-ops go in [`src/charge.mjs`](../../../src/charge.mjs);
   pipeline/modal stages in [`src/descent.mjs`](../../../src/descent.mjs); cone duals in
   [`src/cone.mjs`](../../../src/cone.mjs); void reads and the monad in [`src/void.mjs`](../../../src/void.mjs).
   Re-export it from [`src/index.mjs`](../../../src/index.mjs) so it reaches the package root, and (if it
   warrants a subpath) note it in the `exports` map of `package.json`.
2. **Plain functions on plain data.** Take and return ordinary objects; no classes, no side effects,
   no filesystem, no validation. Malformed input may simply error like any normal program.
3. **Respect the charge shape.** A charge is `{ value: [bool, bool], evidence: [list, list] }`. If you
   touch the value, keep the [invariant](../references/the-charge.md): a value bit may exceed
   evidence-presence only as a deliberate *presumption* (the cone ceilings / `conflate`).
4. **Accumulate evidence, never discard it.** Any op that combines charges must `union` each side's
   evidence (the carrier is lossless). The value moves by the order; the evidence only grows.
5. **Plumbing lives in [`src/internal.mjs`](../../../src/internal.mjs)** (`stringify`, `union`) — helpers
   that do no math, only compare/key or accumulate. They are not re-exported.

## A value-op skeleton (in `src/charge.mjs`)

```js
import { union } from "./internal.mjs";

export function myJoin({ left, right }) {
  return {
    value: [ /* L-op on the positive sides */, /* L-op on the negative sides */ ],
    evidence: [union(left.evidence[0], right.evidence[0]), union(left.evidence[1], right.evidence[1])],
  };
}
```

## Test it as a property, not an example

Add `test(...)` checks to the relevant [`test/*.test.mjs`](../../../test) file as **properties** quantified
over the four-state alphabet — the laws your op should satisfy (commutative? involutive? σ-dual?
accumulates?). Never construct the charge whose value you then assert; that's the trap. See
[the test suite](../references/the-test-suite.md).

## If it's a reading, not a carrier op

Cones and structural morphisms (`settle`, `gap`, `estrange`, …) read sections rather than combine two
charges — follow the existing ones in `src/cone.mjs` / `src/void.mjs`: take a category/section, return a
`{ named: { base, section } }` or a `{ apex }`, and add a property check (e.g. `your-cone ≤ₖ` the GFP,
or a partition).

## See also

- reference: [morphisms](../references/morphisms.md) · [the charge](../references/the-charge.md) · [the laws](../references/the-laws.md)
- explanation: [evidence — the carrier](../explanations/evidence-the-carrier.md)
