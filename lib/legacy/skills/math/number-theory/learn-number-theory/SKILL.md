---
name: learn-number-theory
description: Learn divisibility, primes, and modular arithmetic — sufficient to reason about integer properties beyond basic computation.
---

# Learn Number Theory

The structural properties of integers — divisibility, prime factorization, congruences mod $n$ — that underwrite cryptography, combinatorics, and much else.

## What you will be able to do

- Apply the Euclidean algorithm to compute gcd and find Bezout coefficients.
- State and use the fundamental theorem of arithmetic (unique prime factorization).
- Reason about congruences: solve linear congruences, apply the Chinese remainder theorem, compute orders modulo $n$.
- Recognize when number-theoretic properties (Fermat's little theorem, Euler's totient, primality testing) apply to a problem.

## Reference

- `library/theories/humanities/theories/math/theories/number-theory/` — the number-theory domain.

## Verification

Compute $\gcd(252, 198)$ via the Euclidean algorithm and write Bezout coefficients. Solve $7x \equiv 5 \pmod{12}$. Compute $3^{100} \bmod 7$ using Fermat's little theorem. Each computation should produce a specific number, with the reasoning shown.
