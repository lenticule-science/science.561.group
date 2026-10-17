# Reference: the test suite

```sh
node --test        # or: pnpm test
```

Runs the package's [`test/*.test.mjs`](../../../test) files through Node's built-in test runner. Every
check asserts a **property** over inputs run through the **real morphisms** — never a hand-built section
engineered to return a chosen answer. Because the value alphabet is finite (four states), the property
checks are run **exhaustively** over the small domain rather than sampled, so "for all inputs" is literal.

## Layout

| file | what it covers |
|---|---|
| [`test/charge.test.mjs`](../../../test/charge.test.mjs) | the bilattice [laws](the-laws.md) over the four charges — the lattice axioms (commutativity, associativity, idempotency, identities) for both orders, the two involutions, de Morgan, lossless evidence accumulation, `leqKnowledge`/`compareKnowledge`, `aggregate = joinKnowledge` |
| [`test/descent.test.mjs`](../../../test/descent.test.mjs) | the pipeline end-to-end — `posit` measures potential, `settle`/`brim` bracket the free bit, the truth cones (`adjudicate`/`presume`), the void is the slack (`vanish`), the malformed-input contract, the consistent/paraconsistent split (`compare`), `estrange`'s complement, `precipitate`'s composition |

## The method — property over example

Each check states the property and runs it over the whole alphabet, passing only if it holds on **all**
of them:

```js
const ALL = [ABSURD, POTENTIAL, ACTIVE, STABLE];
const pairs = ALL.flatMap((a) => ALL.map((b) => [a, b]));
test("joinKnowledge: commutative (on value)", () => {
  for (const [a, b] of pairs) assert.deepEqual(value(jk(a, b)), value(jk(b, a)));
});
```

Nothing in a check fixes the expected output by hand — the property is the spec, the input is the probe.
The handful of *exact* checks (e.g. `meetKnowledge(potential, active) = absurd`,
`precipitate(composable) = [[p,q]]`) assert a specific algebraic identity on the canonical small case;
the output is forced by the math, not by the test.

## Parity with the kernel

This package is a recreation of [`@561/development.active.math-kernel`](../../../../../development/active/math-kernel).
Its faithfulness was verified by running identical inputs through both implementations and asserting
deep-strict equality across the charge algebra, the full descent, both cone pairs, the void reads, and
the aperiodic monad. That parity check couples to the old kernel and so is run on demand, not shipped as
part of this zero-dependency package's suite.

## Adding a check

1. Add a `test(name, () => { … })` to the relevant `test/*.test.mjs` file.
2. Prefer a **property** quantified over the alphabet (`for (const … of ALL)`); reach for an exact case
   only for a named algebraic identity.
3. Never construct the section/charge whose value you then assert — that's the trap.

## See also

- [the laws](the-laws.md) (what each check guarantees) · [morphisms](morphisms.md)
- tutorial: [the laws are real](../tutorials/the-laws-are-real.md)
