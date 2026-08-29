---
name: affine-increment-sequence
description: "The Collatz-like affine family (a,b,d) as a parameterized increment-sequence: even n → n/d (saturating-shadow), odd n → a·n+b (transferring-shadow). Standard Collatz is the single point (3,1,2). 'Affines are just a part of' the settling harness — one increment-generator with three parameters."
symbol: "U_{a,b,d}"
realizes: [evidence]
depends-on: [increment-sequence, collatz-increment-sequence]
derives-from: increment-sequence
---

# Affine increment-sequence

A parameterized [increment-sequence](../../increment-sequence.md): the Collatz-like affine
family

$$T_{a,b,d}(n) \;=\; \begin{cases} n/d & n \text{ even} \quad (\text{saturating-shadow, contraction})\\ a\,n+b & n \text{ odd} \quad (\text{transferring-shadow, expansion}).\end{cases}$$

`scripts/affine.mjs` default-exports the generator `affine({a,b,d}, seed)`. The
[[collatz-increment-sequence]] is **literally re-exported from this one at `(a,b,d)=(3,1,2)`** —
the reduction "Collatz is one affine" is code, not analogy.

## Why this is the right granularity

The settling-endofunctor takes *any* increment-generator. The affine family is the natural
one-parameter-family neighborhood of Collatz: sweeping `(a,b,d)` moves Collatz around inside a
space of settlings, all sharing the same two nucleus-shadows (expansion = transferring, contraction
= saturating). The empirical commutation result (`parity-shadows-commute-on-residues`) is a sweep
over this family; Collatz is one row of the confusion matrix, not a special case needing its own
code.

## Plugs into

`#settling-endofunctor` (orbit + κ + regime) and `#residue-commutation` (the Δ_m/τ_m residue
test). Position: `increment-sequence/library/affine-increment-sequence/` — a library child of
increment-sequence, an instance fixing the map shape and leaving `(a,b,d)` free.
