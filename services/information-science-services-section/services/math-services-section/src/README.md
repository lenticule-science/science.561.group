# Math Services Section — shared computation modules

Shared, exact-value JavaScript (ESM) modules used by the verification
scripts that live next to the research articles they verify (e.g.
`content/text/documents/articles/teaching-articles/examples/*/scripts/`,
`content/text/documents/articles/learning-articles/research-papers/*/scripts/`).

These are a from-scratch port of what used to be a Python + sympy toolkit
(`multipartition.py`, `chain_complex.py`, `stratification_ii.py`,
`cellular_sheaf.py`). There is no JS equivalent of sympy available here
(no network/npm dependency was used — see Limitations), so the pieces of
symbolic/exact algebra those scripts actually needed (exact rational
arithmetic, exact eigenvalues with quadratic-surd roots, exact multivariate
polynomials over per-cell weight symbols) are hand-rolled in
`exact-arith.mjs`, `matrix.mjs`, and `poly.mjs`, and consumed by
`chain-complex.mjs` and `cellular-sheaf.mjs`. Every module below has been
checked against the original sympy scripts' output value-for-value (not
just "looks similar") — see each consuming script's own file header for
which article it verifies, and the parent task's verification log for the
exact commands used.

## Modules

### `exact-arith.mjs`
Exact number types with no floating point anywhere in the computation path.
- `Fraction` — BigInt-backed exact rational number (add/sub/mul/div/pow/compare/toNumber).
- `QuadraticSurd` — exact value `a + b*sqrt(d)` (d a squarefree positive
  integer), for eigenvalues that aren't rational (e.g. `6 - sqrt(3)`).
- `exactSqrtFraction(fraction)` — exact square root of a nonnegative
  Fraction, returning either a rational result or a squarefree-reduced surd.
- `solveExactPolynomial(coeffsHighToLow)` — exact solver for a univariate
  polynomial with Fraction coefficients: full rational-root extraction
  (with multiplicity, via the rational root theorem) followed by an exact
  quadratic-formula solve of any leftover quadratic factor. Throws (does
  not approximate) if a residual factor of degree >= 3 remains — this
  never happens for the eigenvalue problems in this corpus (every case was
  checked against sympy), but exists so a future case can't silently
  produce a plausible-looking wrong number.

### `matrix.mjs`
Exact linear algebra over `Fraction`: `multiply`, `transpose`, `rank`
(Gaussian elimination), `inverse` and `charPolyFaddeevLeVerrier` (the
Faddeev-LeVerrier recurrence, giving the exact characteristic polynomial
and, as a byproduct, the adjugate-style matrix used for exact matrix
inversion — both computed without ever leaving exact rational arithmetic).

### `poly.mjs`
Exact sparse multivariate polynomials with `Fraction` coefficients
(`Poly`), supporting `+ - * pow(nonneg int)`, `determinantPoly` (cofactor
expansion, fine for the <= 6x6 matrices this corpus uses), coefficient
extraction in one named variable (`coeffsInVar`), and full/partial
evaluation at rational points. This is deliberately not a general computer
algebra system — it is exactly, and only, what `cellular-sheaf.mjs` needs
to build the generalized-eigenvalue "pencil" polynomial
`det(d_n^T Q_{n-1} d_n - lam*Q_n)` as an exact polynomial in the per-cell
weight symbols and `lam`.

### `chain-complex.mjs`
Chain complex with Hilbert structure: Hodge Laplacian, exact eigenvalue
spectrum, stratum identification. Port of `chain_complex.py`.
- `hodgeLaplacian(dMaps, Qs, n)` — builds `Delta_n = d_n^* d_n + d_{n+1} d_{n+1}^*`.
- `hodgeEigenvalues(dMaps, Qs, n)` — exact eigenvalues (Fraction or
  QuadraticSurd), with multiplicity, via the exact characteristic
  polynomial (`matrix.mjs`) and `solveExactPolynomial` (`exact-arith.mjs`).
- `allHodgeEigenvalues`, `spectrumSignature` (bipartite multipartition of
  the joint spectrum, grouped by numeric tolerance exactly as the Python
  original did), `checkChainComplex`, `diagonalSpd`, `randomSpd`.
- Canonical examples: `example2_2Iso`, `example2_1Chain`,
  `examplePartialDelta2`, `examplePartialDelta3`.

### `cellular-sheaf.mjs`
Cellular sheaves with stalkwise-diagonal Hilbert structure; IEP-G
realizability tests. Port of `cellular_sheaf.py`.
- `CellularSheaf` — chain complex plus per-cell symbolic weight symbols
  (`diagWeightSymbols`), `pencilPolynomial` (exact symbolic pencil, via
  `poly.mjs`), `allEigenvaluesAtUniform` (delegates to `chain-complex.mjs`
  with all weights substituted to one numeric value).
- `realizeAnyMultiplicity(sheaf, n)` — is *any* nonzero-spectrum
  multiplicity > 1 achievable by positive stalkwise weights? Uses a
  closed-form discriminant (quadratic: `b^2-4ac`; cubic: the standard
  `18abcd-4b^3d+b^2c^2-4ac^3-27a^2d^2` identity) on the exact pencil
  coefficients to test whether the discriminant is identically zero, and
  exact-rational sign evaluation at the same two test points the Python
  original used (`weights=1`, `weights=1..n`).
- `realizeFullDegeneracy(sheaf, n)` — can *all* nonzero eigenvalues be made
  equal? For reduced degree >= 3 this evaluates the monic-coefficient
  relations directly at concrete rational test points (pure `Fraction`
  arithmetic once weights are substituted — no symbolic rational-function
  class needed, and no degree cap), and additionally reports how many of
  those relations are identically zero *as polynomials* (not just at the
  tested points) via an exact polynomial-identity reformulation, matching
  the diagnostic count the Python original computed with `sp.simplify`.
- Canonical examples: `pathP`, `cycleC`, `starK`, `completeK`,
  `boundarySimplex`.

### `multipartition.mjs`
Bipartite multipartitions: enumeration, codim/stab formulas, closure
poset, Möbius function. Port of `multipartition.py`. Pure combinatorics
over small integers (plain JS `Number`, exact — the index sets here are
tiny). `chainIndexSet`, `allPartitions`, `codimEigenvalueModuli`,
`stabDim`, `codimInAmbient`, `isRefinement`, `closurePoset`, `codimTable`,
`mobiusFunction`.

### `stratification-ii.mjs`
Pataki rank stratification + chain-complex Schubert refinement. Port of
`stratification_ii.py`. Pure combinatorics over small integers.
`patakiDim`, `patakiCodim`, `schubertCodim`, `enumeratePatakiStrata`,
`schubertSubrefinements`, `enumerateFullStratificationIi`,
`printLowCodimStrata`.

**Carried-forward caveat (not fixed by this port):** the combined
per-degree Schubert codimension in `schubertSubrefinements` is computed as
`max(codim_a, codim_z_total)`. The Python original's own comment calls
this "a rough upper bound," not a proven-exact combined-codimension
formula. This port reproduces that exact approximation bug-for-bug — the
goal here was byte-for-value parity with the existing research code, not a
math fix, and that decision belongs to the repo owner.

## Limitations

- **No general CAS.** This is not a port of sympy; it hand-rolls only the
  exact operations the target scripts actually exercise (rational
  arithmetic, quadratic surds, small exact matrix eigenvalues, small
  multivariate polynomials, quadratic/cubic discriminants). If a future
  script needs, e.g., an eigenvalue that is a root of an irreducible
  cubic/quartic/higher polynomial with no rational root, or a discriminant
  of a quintic-or-higher reduced pencil polynomial,
  `solveExactPolynomial`/`realizeAnyMultiplicity` will throw a loud error
  rather than silently approximating or guessing. Extending them (Cardano/
  Ferrari for cubic/quartic radicals, a general resultant-based
  discriminant) is possible but was out of scope here since no case in
  this corpus needs it (verified against every sympy baseline).
- **Performance is a non-issue in practice, but the exact-symbolic
  approach can blow up in principle.** `poly.mjs`'s multivariate
  polynomials and `determinantPoly`'s cofactor expansion are fine for the
  matrices in this corpus (<= 6x6, <= ~10 weight symbols) — in practice
  every port here runs in well under a second, against the Python
  originals' tens of seconds (sympy's general symbolic engine has much
  higher constant-factor overhead). Cofactor expansion is `O(n!)`, so a
  much larger chain complex would need Bareiss/fraction-free elimination
  instead.
- **Möbius function / closure poset complexity.** `closurePoset` in
  `multipartition.mjs` enumerates *all* set-partitions of the chain index
  set (Bell-number growth) and then does an `O(n^2)`–`O(n^3)` refinement
  comparison and covers computation — carried over unchanged from the
  Python original, which has the same asymptotic behavior. Fine for the
  small chain shapes in this corpus (index sets of size <= 4); would need
  a smarter algorithm for larger ones.
- **Display formatting is not byte-identical to the sympy output**, by
  design (only the underlying values were required to match). Two
  specific, verified-benign differences show up throughout: (1) sympy's
  `Add` printer and this port's `Poly`/`QuadraticSurd` printers order terms
  differently (e.g. `sqrt(3) + 6` vs. `6 + sqrt(3)`); (2) Python's `set`/
  `frozenset` iteration order (used for the closure-poset partition table
  and the bipartite-multipartition printouts) depends on CPython's
  internal hashing and isn't a meaningful sort key to begin with, so rows
  with identical `(codim_eig, stab, codim_H)` (or identical Möbius value)
  can print in a different order here than in the original. In every case
  checked, the *set* of printed lines is identical between the Python and
  JS outputs; only intra-tie ordering differs.
- **`randomSpd` is not reproducible**, in JS exactly as it wasn't in the
  Python original (its own docstring calls the `seed` parameter "currently
  unused (placeholder)"). Ported for API parity only; no script in this
  corpus depends on its output being deterministic.
- **No npm dependency was used or needed.** `npm` itself was confirmed
  working in this environment (`npm view lodash version` succeeded), so a
  CAS package could be installed if the repo owner ever wants one instead
  of this hand-rolled exact arithmetic — but every case in this corpus
  verified exactly without one.
