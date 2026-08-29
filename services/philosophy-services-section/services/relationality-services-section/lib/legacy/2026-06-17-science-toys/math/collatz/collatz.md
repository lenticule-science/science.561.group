# Collatz

The Collatz problem encoded as a relation on `Z/N`, then explored with
the project's modal/structural operators (`□`, `◇`, `C = □◇`, action
`S`, coherence `σ`). The collection ranges across a **stabilizer**
that finds when iterated `Y_{k+1} = σ(R, Y_k)` settles, an **explorer**
of the modal-spectrum signatures of the Collatz relation, an **affine**
generalization to `R(n) = a·n + b mod N`, and **predictions** that test
two framework-derived shape conjectures (shortcut counts ~ Fibonacci,
v_2(3n+1) distribution geometric with p=1/2).

## Toys

- [`stabilizer.py`](stabilizer.py) — Collatz stabilizer-0.1.4. Iterates
  `Y_{k+1} = σ(R, Y_k)` under the coherence operator and reports when
  the truth-set settles, including residue-class analysis and decay
  rates for diagnostics.
- [`explorer.py`](explorer.py) — Modal spectrum explorer for the
  Collatz relation. Sweeps modulus and reports the per-element modal
  values (`□`, `◇`, `C`) and their stabilization profile.
- [`affine.py`](affine.py) — Same scaffolding generalized to the affine
  family `R(n) = a·n + b mod N`. Recovers Collatz at `(a, b) = (3, 1)`
  but lets you sweep the parameter space.
- [`lab.py`](lab.py) — The actual lab: runs `evolve` on representative
  configurations and saves results as JSON for offline analysis.
- [`transition-sim.py`](transition-sim.py) — `evolve_no_break` driver
  with Noether-ish degree/symmetry projection, ASCII output via
  imageio. Self-contained explorer for transition dynamics on `(R, Y)`.
- [`predictions.py`](predictions.py) — Tests two framework predictions
  against actual Collatz data: shortcut-shape count grows like
  F_{k+1}, and v_2(3n+1) distribution is geometric with p=1/2.
- [`predictions-truncated.py`](predictions-truncated.py) — Modified
  Fibonacci prediction over depth-k truncation of the shape tree.

## Library files

- [`sim.py`](sim.py), [`events.py`](events.py) — RITM core engines
  (boolean-matrix `□`, `◇`, `C`, action, coherence). The toys above
  import via `from sim import *`. Not a toy themselves — keep
  alongside.
