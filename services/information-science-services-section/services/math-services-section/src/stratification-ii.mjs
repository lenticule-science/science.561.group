/**
 * stratification-ii.mjs
 *
 * Stratification II: Pataki rank stratification + chain-complex Schubert
 * refinement. Port of stratification_ii.py. Pure combinatorics over small
 * integers -- plain JS numbers are exact here.
 *
 * For a chain complex of dimensions (m_0, ..., m_N) with boundary ranks
 *     rho_n = rank(d_n)         (with d_n : C_n -> C_{n-1})
 *
 * the closed cone $\overline{\mathcal H} = \prod_n \overline{\mathrm{Sym}^+_{m_n}}$
 * stratifies by:
 *
 *   - Pataki rank tuple r = (r_0, ..., r_N) with 0 <= r_n <= m_n.
 *     Stratum has dim sum_n [r_n m_n - C(r_n, 2)] and codim sum_n C(m_n - r_n + 1, 2).
 *
 *   - Schubert refinement: for each n, kernel K_n = ker Q_n is a (m_n - r_n)-dim
 *     subspace of C_n. The chain filtration  0 subset im d_{n+1} subset ker d_n subset C_n
 *     defines Schubert invariants
 *         a_n = dim(K_n cap im d_{n+1})
 *         z_n = dim(K_n cap ker d_n)
 *         k_n = m_n - r_n.
 *
 *     Generic intersection (Schubert calculus):
 *         a_n^gen = max(0, k_n + rho_{n+1} - m_n)
 *         z_n^gen = max(0, k_n + (m_n - rho_n) - m_n) = max(0, k_n - rho_n)
 *
 * This module enumerates the Pataki+Schubert strata for a given chain
 * complex and prints their codims, validating against the EDD = 40
 * example's 4 boundary components on the (2,1) chain.
 *
 * NOTE ON APPROXIMATION (carried forward from the original docstring/code):
 * the combined Schubert codim per degree is computed as
 * `max(codim_a, codim_z_total)` -- the Python original itself calls this
 * "a rough upper bound" (see comment above `schubert_codim_n` in
 * `schubertSubrefinements` below), not a proven-exact combined codimension
 * formula. This port preserves that same approximation exactly (bug-for-bug),
 * since the goal here is byte-for-value parity with the existing research
 * code, not a fix to its math.
 */

function comb(n, k) {
  if (k < 0 || k > n) return 0;
  k = Math.min(k, n - k);
  let result = 1;
  for (let i = 0; i < k; i++) result = (result * (n - i)) / (i + 1);
  return Math.round(result);
}

/** dim of Pataki product stratum with rank tuple r in PSD cone of dims m. */
export function patakiDim(rTuple, mTuple) {
  let s = 0;
  for (let i = 0; i < rTuple.length; i++) s += rTuple[i] * mTuple[i] - comb(rTuple[i], 2);
  return s;
}

/** codim of Pataki product stratum in $\overline{\mathcal H}$. */
export function patakiCodim(rTuple, mTuple) {
  let s = 0;
  for (let i = 0; i < rTuple.length; i++) s += comb(mTuple[i] - rTuple[i] + 1, 2);
  return s;
}

/** Generic dim of K cap V where dim K = k, dim V = v, ambient dim = m. */
export function schubertIntersectDimGeneric(k, v, m) {
  return Math.max(0, k + v - m);
}

/**
 * Schubert codim of {K : dim(K cap V) = j} in Gr(k, m), given dim V = v.
 *
 * Using the standard formula: dim of Schubert variety is k(m-k) - j(m-v-k+j),
 * so codim of "dim K cap V >= j" in Gr(k, m) is j*(m - v - k + j) for
 * j >= max(0, k+v-m). Returns null if j < j_gen (impossible).
 */
export function schubertCodim(k, j, v, m) {
  const jGen = Math.max(0, k + v - m);
  if (j < jGen) return null;
  return j * (m - v - k + j) - jGen * (m - v - k + jGen);
}

/** Yield [rTuple, codim] for each Pataki stratum, optionally bounded by codim. */
export function* enumeratePatakiStrata(mTuple, maxCodim = null) {
  const ranges = mTuple.map((m) => Array.from({ length: m + 1 }, (_, i) => i));
  for (const rTuple of cartesianProduct(ranges)) {
    const c = patakiCodim(rTuple, mTuple);
    if (maxCodim !== null && c > maxCodim) continue;
    yield [rTuple, c];
  }
}

function* cartesianProduct(arrays) {
  if (arrays.length === 0) {
    yield [];
    return;
  }
  const [first, ...rest] = arrays;
  for (const x of first) {
    for (const combo of cartesianProduct(rest)) {
      yield [x, ...combo];
    }
  }
}

/**
 * For each Pataki stratum (rTuple), yield the Schubert sub-strata indexed
 * by tuples (a_n, z_n) per chain degree n.
 *
 * rhoTuple[n] = rank of d_{n+1} : C_{n+1} -> C_n (rho has length len(mTuple),
 * rhoTuple[n] = rank of d_{n+1}, or 0 at the top).
 *
 * Uses chain filtration im d_{n+1} subset ker d_n subset C_n with dims
 *     v_im = rho_{n+1}                # incoming boundary
 *     v_ker = m_n - rho_n              # cycles
 * where rho_n = rank of d_n : C_n -> C_{n-1}.
 */
export function schubertSubrefinements(rTuple, mTuple, rhoTuple) {
  const yields = [];
  const schubertCodimsPerDegree = [];
  for (let n = 0; n < mTuple.length; n++) {
    const rN = rTuple[n];
    const mN = mTuple[n];
    const kN = mN - rN;
    const rhoNValue = n >= 1 ? rhoTuple[n - 1] : 0;
    const rhoNPlus1Value = n < rhoTuple.length ? rhoTuple[n] : 0;

    const vIm = rhoNPlus1Value;
    const vKer = mN - rhoNValue;
    const perDegOptions = [];
    for (let aN = 0; aN <= Math.min(kN, vIm); aN++) {
      for (let zN = aN; zN <= Math.min(kN, vKer); zN++) {
        const codimA = schubertCodim(kN, aN, vIm, mN);
        const codimZTotal = schubertCodim(kN, zN, vKer, mN);
        if (codimA === null || codimZTotal === null) continue;
        // Combined Schubert codim per degree (rough upper bound) -- carried
        // forward verbatim from the Python original.
        const schubertCodimN = Math.max(codimA, codimZTotal);
        perDegOptions.push([aN, zN, schubertCodimN]);
      }
    }
    schubertCodimsPerDegree.push(perDegOptions);
  }

  for (const combo of cartesianProduct(schubertCodimsPerDegree)) {
    const aZ = combo.map(([a, z]) => [a, z]);
    const schCodim = combo.reduce((acc, c) => acc + c[2], 0);
    yields.push([aZ, schCodim]);
  }
  return yields;
}

/**
 * Enumerate combined Pataki + Schubert strata.
 * Returns array of [rTuple, aZ, totalCodim] triples.
 */
export function enumerateFullStratificationIi(mTuple, rhoTuple, maxCodim = null) {
  const strata = [];
  for (const [rTuple, pCodim] of enumeratePatakiStrata(mTuple, maxCodim)) {
    for (const [aZ, schCodim] of schubertSubrefinements(rTuple, mTuple, rhoTuple)) {
      const total = pCodim + schCodim;
      if (maxCodim !== null && total > maxCodim) continue;
      strata.push([rTuple, aZ, total]);
    }
  }
  return strata;
}

/** Print the low-codim strata of Stratification II for given chain complex shape. */
export function printLowCodimStrata(mTuple, rhoTuple, maxCodim = 4) {
  console.log(`Chain dims:    m = (${mTuple.join(", ")}${mTuple.length === 1 ? "," : ""})`);
  console.log(`Boundary ranks: rho = (${rhoTuple.join(", ")}${rhoTuple.length === 1 ? "," : ""})    (rho[k] = rank of d_{k+1})`);
  const totalDim = mTuple.reduce((acc, m) => acc + comb(m + 1, 2), 0);
  console.log(`Total dim of $\\overline{\\mathcal H}$: ${totalDim}`);
  console.log();
  console.log(`${"r_tuple".padEnd(14)}${"a,z per deg".padEnd(28)}${"total_codim".padEnd(12)}`);
  console.log("-".repeat(60));
  const strata = enumerateFullStratificationIi(mTuple, rhoTuple, maxCodim);
  strata.sort((x, y) => x[2] - y[2] || cmpTuple(x[0], y[0]));
  for (const [rTuple, aZ, total] of strata) {
    let label = "";
    if (total === 0) label = "(open SPD interior)";
    const aZStr = aZ.map(([a, z]) => `a=${a},z=${z}`).join(" | ");
    console.log(`${`(${rTuple.join(", ")})`.padEnd(14)}${aZStr.padEnd(28)}${String(total).padEnd(12)}${label}`);
  }
}

function cmpTuple(a, b) {
  for (let i = 0; i < Math.min(a.length, b.length); i++) {
    if (a[i] !== b[i]) return a[i] - b[i];
  }
  return a.length - b.length;
}

function main() {
  console.log("=== Stratification II for (2, 1) chain complex ===");
  printLowCodimStrata([2, 3, 1], [2, 1, 0], 4);
}

const isMain = import.meta.url === `file://${process.argv[1]}`;
if (isMain) {
  main();
}
