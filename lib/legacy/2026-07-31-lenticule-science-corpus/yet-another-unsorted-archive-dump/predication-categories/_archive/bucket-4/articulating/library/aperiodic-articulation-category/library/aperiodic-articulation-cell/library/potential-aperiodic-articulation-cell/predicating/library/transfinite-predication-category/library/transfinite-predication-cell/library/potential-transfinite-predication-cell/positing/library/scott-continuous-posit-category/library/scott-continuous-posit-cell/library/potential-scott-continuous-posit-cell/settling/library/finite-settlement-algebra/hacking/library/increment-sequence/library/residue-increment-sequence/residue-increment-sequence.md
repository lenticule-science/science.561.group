---
name: residue-increment-sequence
description: "An endo-map on Z/m as an increment-sequence. Because the carrier is finite the orbit must close at κ ≤ m — modular arithmetic is a strict-finite residue-settlement; the reached cells are the congruence classes it settles. Collatz-mod-6 is one instance."
symbol: "U_{Z/m}"
realizes: [evidence]
depends-on: [increment-sequence]
derives-from: increment-sequence
---

# Residue increment-sequence

An increment-sequence on the finite carrier `Z/m`: `scripts/residue.mjs` exports
`residue(m, {map, seed})` (default `map` is the cyclic successor `v ↦ v+1 (mod m)`).

## Modular arithmetic is a strict-finite settlement

Because `Z/m` is finite, any endo-map's orbit **must revisit a class within `m` steps** — so the
settling closes at closure ordinal `κ ≤ m` and modular arithmetic lands squarely in the
**strict-finite** regime (`modular-arithmetic-is-finite-residue-settlement.test.mjs`). The cyclic
successor reaches all `m` classes then closes (`κ = m-1`); a general endo-map closes sooner onto the
class-cycle it falls into. The reached cells ARE the congruence classes the orbit settles — a settled
fiber over `Z/m`.

This is why finite-regime phenomena are *robust* under "reduce mod m": the reduction lands you in the
regime where settlings always quiesce. The prior Collatz **mod-6 instant-settling** result is one
instance of this object (pass the Collatz residue relation as `map` on `Z/6`); the residue structure
is the finite shadow in which the `commutating` square's closure survives (see
`parity-shadows-commute-on-residues`).

Position: `increment-sequence/library/residue-increment-sequence/`.
