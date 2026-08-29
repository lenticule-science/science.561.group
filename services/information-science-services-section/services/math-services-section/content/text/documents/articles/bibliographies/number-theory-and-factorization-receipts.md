---
title: "Reference on Number Theory and Factorization Receipts"
description: "Documents analysis.numberTheory, the finite executable shadow of RelMath.Order.NumberTheoryCombinatorics and Factorization — structure-shaped receipts computable over bounded Nat: factorial/permutation/choose, Pascal recurrence, the Nat-semiring binomial theorem, gcd as divisibility meet, primality and Euclid's lemma, unique prime factorization, and the image factorization A -> Image(f) -> B."
date-created: 2026-06-18
keywords:
  - number-theory
  - witness
  - structure
type: bibliography

---

# Reference on Number Theory and Factorization Receipts

`analysis.numberTheory` is the finite executable shadow of:

- `RelMath.Order.NumberTheoryCombinatorics`
- `RelMath.Order.Factorization`

It exposes structure-shaped receipts for the parts that can be computed over bounded Node `Nat` values and finite function tables:

- `factorial`, `permutationCount`, and `choose`;
- `pascal(n,k)` for the Pascal recurrence;
- `binomial(x,y,n)` for the Nat-semiring binomial theorem;
- `divides(a,b)`, `gcd(a,b)`, `gcdMeet(a,b,d)`;
- `isPrime`, `euclidLemma(p,a,b)`;
- `primeFactorization(n)` and `primeFactorizationUnique(n,left,right)`;
- `imageFactorization(outputs)` for the finite table form of the image factorization `A -> Image(f) -> B`.

The root `numberTheory` RMN catalog normalizes the proof-reading receipts:

```js
import { evaluateRunTerm, numberTheory } from "@emsenn/metroplat";
import * as analysis from "@emsenn/metroplat/cohomology";

const fta = analysis.numberTheory.primeFactorization(360);
fta.kind; // "numberTheory.primeFactorization:witness"

evaluateRunTerm(numberTheory.primeFactorization, fta).kind;
// "numberTheory.primeFactorization:witness"
```

This does not claim a general executable category of arbitrary functions or an unbounded proof searcher for FTA.
Runtime parity is the finite table/Nat surface: the exact computations and witness/obstruction structures that can be normalized as RMN data.
