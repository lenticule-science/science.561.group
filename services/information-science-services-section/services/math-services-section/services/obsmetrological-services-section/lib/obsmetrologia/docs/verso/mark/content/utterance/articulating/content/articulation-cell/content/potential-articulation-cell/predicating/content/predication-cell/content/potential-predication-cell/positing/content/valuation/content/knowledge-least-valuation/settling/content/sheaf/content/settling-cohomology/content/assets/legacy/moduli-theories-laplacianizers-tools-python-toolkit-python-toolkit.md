# laplacianizers Python toolkit

Computational tools for the laplacianizers program: bipartite multipartition lattices, Hodge Laplacian eigenvalue verification, Stratification II analysis, and bipartite Möbius computation.

Pure-Python, sympy-only — no numpy/scipy/networkx dependencies (small-VPS friendly).

## Modules (`src/`)

### `multipartition.py`
Bipartite multipartitions, codim/stab formulas, closure poset, Möbius function.

Key functions:
- `chain_index_set(dims)` — generate index set $\bigsqcup_n \{(n, i) : 1 \le i \le m_n\}$.
- `closure_poset(dims, hodge_constraints=None)` — enumerate all bipartite multipartitions and the cover relations of the closure poset.
- `codim_eigenvalue_moduli(Pi)` — $\sum_B(|B|-1)$, codim in eigenvalue moduli.
- `stab_dim(Pi)` — $\sum_B \sum_n \binom{k_n^B}{2}$, stab dim within ambient $\mathcal H$.
- `codim_in_ambient(Pi)` — codim in $\mathcal H$ (sum of the above).
- `mobius_function(parts, covers)` — Möbius function from coarsest stratum.

### `chain_complex.py`
Chain complexes with Hilbert structures, Hodge Laplacian eigenvalue computation, stratum identification.

Key functions:
- `hodge_laplacian(d_maps, Qs, n)` — compute $\Delta_n = d_n^* d_n + d_{n+1} d_{n+1}^*$ as a sympy matrix.
- `hodge_eigenvalues(d_maps, Qs, n)` — eigenvalues of $\Delta_n$.
- `spectrum_signature(d_maps, Qs)` — identify the bipartite multipartition.
- Canonical examples: `example_2_2_iso()`, `example_2_1_chain()`, `example_partial_delta_2()`, `example_partial_delta_3()`.

### `stratification_ii.py`
Pataki product stratification + chain-complex Schubert refinement of $\overline{\mathcal H}$.

Key functions:
- `pataki_codim(r_tuple, m_tuple)` — codim of rank-tuple Pataki stratum.
- `enumerate_full_stratification_ii(m_tuple, rho_tuple, max_codim)` — enumerate combined Pataki + Schubert strata up to a given codim.
- `schubert_codim(k, j, v, m)` — Grassmannian Schubert codim.

## Scripts (`scripts/`)

Run from `tools/python-toolkit/` directory.

### `verify_partial_delta_2.py`
Reproduces the moduli of Laplacianizations on the triangle boundary (`examples/moduli-of-triangle-boundary.md`).

Verified:
- Hodge identity (nonzero spectra of $\Delta_0$ and $\Delta_1$ coincide).
- Uniform weights $\to$ $S_3$-symmetric degenerate stratum (eigenvalues $0, 3, 3$).
- Asymmetric weights $\to$ split into distinct eigenvalues (recovers $\Pi_{\min}$).

### `verify_partial_delta_3.py`
Reproduces the cellular sheaf moduli on the tetrahedron boundary (`examples/cellular-sheaf-on-tetrahedron-boundary.md`).

Verified:
- Betti numbers $H_0 = H_2 = \mathbb R$, $H_1 = 0$ (matches $S^2$ topology).
- Uniform weights $\to$ $S_4$-symmetric stratum: all 12 nonzero eigenvalues collapse to a single value (block of size 12 in bipartite multipartition).
- Asymmetric vertex weights $\to$ 5 blocks (partial symmetry breaking).

### `verify_2_1_chain.py`
Reproduces the (2,1) chain results from `examples/edd-computation-on-2-1-chain.md`.

Verified:
- Stratification I: identity Hilbert gives $\Pi_{\max}$ (full supersymmetric merge); generic gives $\Pi_{\min}$.
- Stratification II: codim-1 boundary types $(1,3,1), (2,2,1), (2,3,0)$ corresponding to $Q_0, Q_1, Q_2$ rank drops; codim-3 stratum with Schubert $a_1=z_1=1$ matches Component 2 ($K_1 = \mathrm{im}\, d_2$).

### `mobius_and_vassiliev.py`
Möbius function on bipartite multipartition lattices and $E_1$-page rank profile for the bipartite Vassiliev spectral sequence.

Verified:
- Univariate $\mu(\text{coarsest}, \text{finest}) = (-1)^{n-1}(n-1)!$ for $n = 2, 3, 4$ — matches the classical formula.
- (2,2) chain partition lattice has 15 elements with Stirling-number profile $(1, 6, 7, 1)$ at codims $(0, 1, 2, 3)$.
- Hodge-constrained (2,2): binary lattice with 2 elements, $\mu(\Pi_{\max}, \Pi_{\min}) = -1$ (consistent with reduction to $\Pi_2$ on Hodge-pairs).

## Running examples

```bash
cd tools/python-toolkit/
python3 src/multipartition.py            # univariate Sym^+_n codim tables
python3 src/chain_complex.py             # (2,2) chain spectrum demo
python3 src/stratification_ii.py         # (2,1) chain Stratification II
python3 scripts/verify_partial_delta_2.py
python3 scripts/verify_partial_delta_3.py
python3 scripts/verify_2_1_chain.py
python3 scripts/mobius_and_vassiliev.py
```

## How the toolkit maps to corpus theorems

| Corpus item | Toolkit module/script | What it verifies |
|---|---|---|
| `theorems/stab-codim-formula.md` | `multipartition.codim_*`, `stab_dim` | Codim and stab formulas implemented and tested |
| `theorems/closure-poset-of-strata.md` | `multipartition.closure_poset` | Refinement-lattice closure poset enumerated for any chain shape |
| `theorems/bipartite-stratification-theorem.md` | `chain_complex.spectrum_signature` | Identifies stratum membership of a Hilbert structure empirically |
| `theorems/hilbert-degeneracy-stratification.md` | `stratification_ii.*` | Pataki + Schubert codim verified on (2,1) chain matching EDD components |
| `theorems/bipartite-vassiliev-shapiro-vainshtein.md` | `mobius_and_vassiliev.py` | Möbius function and $E_1$-codim profile for small lattices |
| `examples/moduli-of-triangle-boundary.md` | `verify_partial_delta_2.py` | $S_3$-symmetric stratum confirmed |
| `examples/cellular-sheaf-on-tetrahedron-boundary.md` | `verify_partial_delta_3.py` | $S_4$-symmetric stratum confirmed |
| `examples/edd-computation-on-2-1-chain.md` | `verify_2_1_chain.py` | Stratification II boundary components matched |

## Limitations

- Pure-sympy: eigenvalue computation is symbolic and slow for large chains (>4 in any chain dim). For larger cases, would need numpy/scipy.
- Schubert codim formula in `stratification_ii.py` is approximate: uses $\max(\text{codim}_a, \text{codim}_z)$ rather than exact nested-Schubert codim. Codim-1 strata are exact; higher codims may overcount.
- Möbius function computation is $O(n^2)$ in lattice size; tractable up to ~50 strata (e.g., partition lattice of 5 elements at most without Hodge constraints).

## IEP-G realizability checker (`src/cellular_sheaf.py`)

Cellular sheaves with stalkwise-diagonal Hilbert structure. Provides:

- `CellularSheaf` class — chain complex with cellular basis, symbolic per-cell weights.
- `pencil_polynomial` — generalized eigenvalue pencil $\det(d_n^T Q_{n-1} d_n - \lambda Q_n)$ as a polynomial in $\lambda$ with weight coefficients.
- `realize_any_multiplicity` — does the pencil discriminant vanish for some positive weights? (Tests for *any* within-degree multiplicity > 1.)
- `realize_full_degeneracy` — can all nonzero eigenvalues be made equal? (Tests for full $(d)$ multiplicity using $d-1$ algebraic relations.)
- Canonical examples: `path_P(n)`, `cycle_C(n)`, `star_K(n)`, `complete_K(n)`, `boundary_simplex(k)`.

Verified results in `scripts/iep_g_full_vs_any.py`:

- $P_3, P_4$ admit no spectral multiplicity (Sturm tridiagonal-simplicity confirmed).
- $C_3, K_3, \partial \Delta^2$ realize full nonzero degeneracy at uniform weights.
- $C_4, K_{1, 3}$ realize partial but not full degeneracy at uniform.
- $K_4, \partial \Delta^3$ realize full degeneracy at uniform.

These results are catalogued in `examples/iep-g-cellular-catalog.md`.

## Future additions

- Full numerical eigenvalue sampler with random Hilbert structures (numpy-backed, optional).
- Bipartite multipartition Möbius product-formula validation across non-trivial Hodge-constrained lattices.
- Bipartite Vassiliev $E_2$ page computation (requires real flag manifold cohomology; substantial extension).
- Larger cases via random sampling instead of symbolic discriminants ($K_4$ pencil discriminant times out symbolically; sampling at many random positive points would identify "always positive" empirically).
