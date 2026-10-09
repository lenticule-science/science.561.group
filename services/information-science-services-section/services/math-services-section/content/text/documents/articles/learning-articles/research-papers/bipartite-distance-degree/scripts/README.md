# Macaulay2 scripts for bipartite-distance-degree

Symbolic computation of dimension, degree, EDD, and Hilbert series for varieties arising in the (2,1) chain complex referenced by [../bipartite-distance-degree.md](../bipartite-distance-degree.md).

Run via `M2 --no-readline -q < script.m2`. Each script declares its chain complex (dimensions and boundary matrices) at the top and targets one variety per run — single stratum, single invariant — to keep computations bounded. Generic-point inputs use distinct small primes (`{2, 3, 5, 7, 11, 13, ...}`) for reproducibility. Scripts using Lagrange-multiplier critical-point systems use the variable `mu` (or `mu1, mu2, ...`).

- `setup.m2`, `setup2.m2` — declare the (2,1) chain complex and its sigma/tau generalized eigenvalue pencils; shared groundwork for the `edd_PiA*`/`edd_PiT` scripts below.
- `edd_PiA_v3.m2` — EDD of $V(\Pi_A) \subset \mathbb A^9$ on the (2,1) chain complex of dims (2,3,1). **Result: EDD = 40.** `dim` took ~161s.
- `edd_PiA.m2`, `edd_PiA_v2.m2`, `edd_PiA_invariants.m2`, `edd_PiA_numerical.m2`, `edd_PiA_singloc_components.m2` — earlier/alternate approaches and follow-on invariants (singular-locus components) for the same variety.
- `edd_PiT.m2` — EDD of $V(\Pi_T) \subset \mathbb A^{10}$ on the same chain complex. Stuck: killed at ~21min wall time, 12% CPU utilization — suggests the Gröbner basis was thrashing. Needs a different approach (numerical homotopy, or simplification/elimination first).

## Open computations

The original list (from the bipartite distance-degree write-up):
1. EDD of $V(\Pi_T)$ — needs better tooling (see `edd_PiT.m2` above).
2. EDD of $V(\Pi_B)$ — single equation, codim 1, comparable to $\Pi_A$.
3. Same set on (3,1), (3,2), (3,3) chain complexes.

The saturated-EDD variant (SPD-interior only) is tracked separately in [../questions/saturated-edd/](../questions/saturated-edd/).
