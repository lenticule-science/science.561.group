# Macaulay2 calculator

Symbolic tools for computing concrete invariants (dimension, degree, EDD, and Hilbert series) of varieties arising in the bipartite multipartition stratification of moduli of Laplacianizers.

## Layout

- `scripts/` — Macaulay2 scripts. One `.m2` file per computation. Each is intended to be run via `M2 --no-readline -q < script.m2` and produce its result via `<<` output.
- `results/` — captured output from runs, with the chain complex / stratum / variety identified in the filename. Created as needed.

## Conventions

- Each script declares its chain complex (dimensions and boundary matrices) at the top.
- Each script targets one variety per run — single stratum, single invariant — to keep computations bounded.
- Generic-point inputs use distinct small primes (`{2, 3, 5, 7, 11, 13, ...}`) for reproducibility.
- Scripts that compute Lagrange-multiplier critical-point systems use the variable `mu` (or `mu1, mu2, ...`).

## Computed so far

- `edd_PiA_v3.m2`: EDD of $V(\Pi_A) \subset \mathbb A^9$ on the (2,1) chain complex of dims (2,3,1). **Result: EDD = 40.** dim took ~161s.

## Stuck or skipped

- `edd_PiT.m2`: EDD of $V(\Pi_T) \subset \mathbb A^{10}$ on the same chain complex. Killed at ~21min wall time, 12% CPU utilization — suggests Gröbner basis was thrashing. Needs a different approach (numerical homotopy, or simplification/elimination first).

## Open computations

The original list (from the bipartite distance-degree write-up):
1. EDD of $V(\Pi_T)$ — needs better tooling.
2. EDD of $V(\Pi_B)$ — single equation, codim 1, comparable to $\Pi_A$.
3. Same set on (3,1), (3,2), (3,3) chain complexes.

Defer these until we've decided whether EDD is the right invariant to compute (see `narratives/` for the strategic re-read).
