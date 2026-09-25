/**
 * cellular-sheaf.mjs
 *
 * Cellular sheaves with stalkwise-diagonal Hilbert structure. Port of
 * cellular_sheaf.py.
 *
 * A cellular sheaf here means a chain complex (C_bullet, d) with each C_n
 * equipped with a distinguished cellular basis. The stalkwise-diagonal
 * Hilbert cone is
 *
 *     H_diag = product over n of R^{m_n}_{>0}     (per-cell positive weights)
 *
 * This module provides:
 *     - CellularSheaf class
 *     - Symbolic generalized eigenvalue pencil computation (poly.mjs)
 *     - IEP-G realizability tests (univariate per-degree)
 *     - Canonical examples: P_n, C_n, K_{1,n}, K_n, partial Delta^k
 *
 * EXACTNESS NOTE: the pencil polynomial det(d_n^T Q_{n-1} d_n - lam*Q_n) is
 * built as an exact multivariate polynomial in the per-cell weight symbols
 * plus lam (poly.mjs), matching sympy's symbolic result term-for-term
 * (verified against `python3 src/cellular_sheaf.py`'s own P_3 demo).
 * `realize_any_multiplicity`'s "is the discriminant identically zero"
 * check uses a closed-form discriminant formula (quadratic: b^2-4ac; cubic:
 * the standard 18abcd-4b^3d+b^2c^2-4ac^3-27a^2d^2 identity) applied to
 * these exact polynomial coefficients -- these are the only two degrees
 * that actually occur where `realize_any_multiplicity` is called in this
 * corpus (verified empirically against every sympy baseline). A residual
 * factor of degree >= 3 with no closed-form handled here throws loudly
 * rather than approximating (see the `deg_red > 3` guard below) -- this
 * never triggers for the target scripts, but exists so a future case
 * cannot silently produce a wrong answer.
 *
 * `realize_full_degeneracy`'s relations (for reduced degree d >= 3) are
 * evaluated purely at concrete rational test points -- exactly as the
 * Python original does with `.subs(tp)` -- so they need no degree cap at
 * all; they use only Fraction arithmetic once weights are substituted.
 */

import { Fraction } from "./exact-arith.mjs";
import { Poly, determinantPoly } from "./poly.mjs";
import { fromInts, rank as matRank, shape as matShape } from "./matrix.mjs";
import { hodgeEigenvalues } from "./chain-complex.mjs";

export class CellularSheaf {
  /** @param {Fraction[][][]} dMaps - dMaps[k] = d_{k+1} : C_{k+1} -> C_k */
  constructor(dMaps) {
    this.dMaps = dMaps.slice();
    for (let k = 0; k < dMaps.length - 1; k++) {
      const prod = matMul(dMaps[k], dMaps[k + 1]);
      if (!prod.every((row) => row.every((x) => x.isZero()))) {
        throw new Error(`Chain complex condition fails: d_${k + 1} d_${k + 2} != 0`);
      }
    }
    if (dMaps.length === 0) {
      this.dims = [0];
    } else {
      const dims = [];
      dMaps.forEach((d, k) => {
        if (k === 0) dims.push(matShape(d)[0]);
        dims.push(matShape(d)[1]);
      });
      this.dims = dims;
    }
    this.N = dMaps.length;
  }

  numCells() {
    return this.dims.reduce((a, b) => a + b, 0);
  }

  /**
   * Symbolic positive weights per cell, one array of variable names per
   * chain degree. Mirrors the Python original's prefix list exactly
   * (note: "d" is deliberately skipped, same as upstream).
   */
  diagWeightSymbols(prefix = ["a", "b", "c", "e", "f", "g", "h"]) {
    return this.dims.map((m, n) => {
      const letter = n < prefix.length ? prefix[n] : `w${n}`;
      return Array.from({ length: m }, (_, i) => `${letter}${i + 1}`);
    });
  }

  /** Diagonal Q_n (Poly matrix) with the given weight-symbol names. */
  qDiag(weights, n) {
    const names = weights[n];
    const m = names.length;
    const Q = Array.from({ length: m }, () => Array.from({ length: m }, () => Poly.zero()));
    for (let i = 0; i < m; i++) Q[i][i] = Poly.variable(names[i]);
    return Q;
  }

  /**
   * Generalized eigenvalue pencil for the squared singular values of the
   * weighted boundary d_n : C_n -> C_{n-1}.
   * Computes det(d_n^T Q_{n-1} d_n - lam*Q_n) as a Poly in the weight
   * symbols and "lam". Returns null if n==0 or n>N (trivial, no boundary).
   */
  pencilPolynomial(weights, n, lamName = "lam") {
    if (n === 0 || n > this.N) return null;
    const dN = this.dMaps[n - 1]; // d_n : C_n -> C_{n-1}
    const dNPoly = dN.map((row) => row.map((x) => Poly.constant(x)));
    const dNTPoly = transposePoly(dNPoly);
    const Qbelow = this.qDiag(weights, n - 1);
    const Qabove = this.qDiag(weights, n);
    const M = mulPoly(mulPoly(dNTPoly, Qbelow), dNPoly);
    const lam = Poly.variable(lamName);
    const lamQabove = Qabove.map((row) => row.map((q) => Poly.mul(lam, q)));
    const pencil = subPoly(M, lamQabove);
    return determinantPoly(pencil);
  }

  /**
   * Eigenvalues of Delta_n with all weights = `value` (a Number|bigint|Fraction).
   */
  allEigenvaluesAtUniform(n, value = 1) {
    const weights = this.diagWeightSymbols();
    const val = Fraction.from(value);
    const bindings = new Map();
    for (const ws of weights) for (const w of ws) bindings.set(w, val);
    const Qs = weights.map((_, k) => {
      const Qpoly = this.qDiag(weights, k);
      return Qpoly.map((row) => row.map((q) => q.evalFull(bindings)));
    });
    return hodgeEigenvalues(this.dMaps, Qs, n);
  }
}

function matMul(A, B) {
  const [ra, ca] = matShape(A);
  const [, cb] = matShape(B);
  const R = Array.from({ length: ra }, () => Array.from({ length: cb }, () => Fraction.ZERO));
  for (let i = 0; i < ra; i++) {
    for (let k = 0; k < ca; k++) {
      if (A[i][k].isZero()) continue;
      for (let j = 0; j < cb; j++) R[i][j] = R[i][j].add(A[i][k].mul(B[k][j]));
    }
  }
  return R;
}

function transposePoly(M) {
  const rows = M.length;
  const cols = rows ? M[0].length : 0;
  const T = Array.from({ length: cols }, () => Array.from({ length: rows }, () => Poly.zero()));
  for (let i = 0; i < rows; i++) for (let j = 0; j < cols; j++) T[j][i] = M[i][j];
  return T;
}
function mulPoly(A, B) {
  const ra = A.length, ca = A[0].length, cb = B[0].length;
  const R = Array.from({ length: ra }, () => Array.from({ length: cb }, () => Poly.zero()));
  for (let i = 0; i < ra; i++) {
    for (let k = 0; k < ca; k++) {
      if (A[i][k].isZero()) continue;
      for (let j = 0; j < cb; j++) R[i][j] = Poly.add(R[i][j], Poly.mul(A[i][k], B[k][j]));
    }
  }
  return R;
}
function subPoly(A, B) {
  return A.map((row, i) => row.map((x, j) => Poly.sub(x, B[i][j])));
}

// ---------------------------------------------------------------------------
// IEP-G realizability tests
// ---------------------------------------------------------------------------

/** Quadratic discriminant b^2 - 4ac, for coeffs=[a,b,c] (Poly, high-to-low). */
function discriminantQuadratic([a, b, c]) {
  return Poly.sub(Poly.mul(b, b), Poly.scale(Poly.mul(a, c), 4));
}

/** Cubic discriminant 18abcd - 4b^3d + b^2c^2 - 4ac^3 - 27a^2d^2, coeffs=[a,b,c,d]. */
function discriminantCubic([a, b, c, d]) {
  const t1 = Poly.scale(Poly.mul(Poly.mul(a, b), Poly.mul(c, d)), 18);
  const t2 = Poly.scale(Poly.mul(Poly.pow(b, 3), d), 4);
  const t3 = Poly.mul(Poly.pow(b, 2), Poly.pow(c, 2));
  const t4 = Poly.scale(Poly.mul(a, Poly.pow(c, 3)), 4);
  const t5 = Poly.scale(Poly.mul(Poly.pow(a, 2), Poly.pow(d, 2)), 27);
  return Poly.sub(Poly.sub(Poly.add(Poly.sub(t1, t2), t3), t4), t5);
}

/**
 * Reduce the pencil polynomial (full poly in weights+lam) to its
 * coefficients-in-lam list (high-to-low, as Poly-in-weights), with the
 * structural lam^k_ker factor divided out. Verifies the low-order
 * coefficients that should vanish (by the linear-algebra fact that
 * ker(d_n^T Q_{n-1} d_n) = ker(d_n) at generic positive weights) actually
 * do -- if that assumption were ever wrong for some future example, this
 * throws instead of silently returning a wrong reduced polynomial.
 */
function reducedCoeffs(polyLam, kKer, lamName = "lam") {
  const ascending = polyLam.coeffsInVar(lamName); // index i = coeff of lam^i
  const fullDeg = ascending.length - 1;
  for (let i = 0; i < kKer; i++) {
    if (!ascending[i].isZero()) {
      throw new Error(
        `reducedCoeffs: expected lam^${i} coefficient to vanish (k_ker=${kKer}) but it did not -- ` +
        `the structural-kernel assumption from cellular_sheaf.py does not hold here.`
      );
    }
  }
  const reducedAscending = ascending.slice(kKer);
  const highToLow = reducedAscending.slice().reverse();
  return { highToLow, fullDeg, degRed: highToLow.length - 1 };
}

const TEST_POINT_ALL_ONES = (allSyms) => {
  const b = new Map();
  for (const s of allSyms) b.set(s, Fraction.ONE);
  return b;
};
const TEST_POINT_INDEXED = (allSyms) => {
  const b = new Map();
  allSyms.forEach((s, i) => b.set(s, Fraction.of(i + 1)));
  return b;
};

function fmtBindings(b) {
  const parts = Array.from(b.entries()).map(([k, v]) => `${k}: ${v.toString()}`);
  return `{${parts.join(", ")}}`;
}

/**
 * Test whether ANY within-degree multiplicity > 1 is achievable for the
 * nonzero eigenvalues of d_n by choosing positive stalkwise weights.
 * Returns ["realizable"|"unrealizable"|"inconclusive", info].
 */
export function realizeAnyMultiplicity(sheaf, n) {
  const weights = sheaf.diagWeightSymbols();
  const polyLam = sheaf.pencilPolynomial(weights, n);
  if (polyLam === null) return ["realizable", "trivial: no boundary at this degree"];

  const dN = sheaf.dMaps[n - 1];
  const kKer = matShape(dN)[1] - matRank(dN);
  const { degRed, highToLow } = reducedCoeffs(polyLam, kKer);

  if (degRed <= 1) return ["realizable", `reduced polynomial degree ${degRed} - trivial`];

  let disc;
  if (degRed === 2) disc = discriminantQuadratic(highToLow);
  else if (degRed === 3) disc = discriminantCubic(highToLow);
  else {
    throw new Error(
      `realizeAnyMultiplicity: reduced polynomial degree ${degRed} has no closed-form ` +
      `discriminant implemented (only quadratic/cubic are) -- this case does not occur ` +
      `in the math-services-section corpus's actual invocations (verified empirically).`
    );
  }

  if (disc.isZero()) return ["realizable", "discriminant identically zero (full-degenerate by construction)"];

  const allSyms = weights.flat();
  const testPoints = [TEST_POINT_ALL_ONES(allSyms), TEST_POINT_INDEXED(allSyms)];
  const signs = testPoints.map((tp) => {
    const v = disc.evalFull(tp);
    const sign = v.isZero() ? "zero" : v.sign() > 0 ? "pos" : "neg";
    return { sign, tp, v };
  });

  const zeroWitness = signs.find((s) => s.sign === "zero");
  if (zeroWitness) return ["realizable", `discriminant = 0 at ${fmtBindings(zeroWitness.tp)}`];

  if (signs.every((s) => s.sign === "pos")) {
    return [
      "unrealizable",
      `discriminant > 0 at all tested positive points (samples: [${signs.map((s) => s.v.toNumber().toFixed(1)).join(", ")}])`,
    ];
  }

  return ["inconclusive", `sign observations: ${JSON.stringify(signs.map((s) => [s.sign, s.v.toNumber()]))}`];
}

/**
 * Test whether the *nonzero* within-degree-n eigenvalues can ALL be made
 * equal by choosing positive stalkwise weights.
 */
export function realizeFullDegeneracy(sheaf, n) {
  const weights = sheaf.diagWeightSymbols();
  const polyLam = sheaf.pencilPolynomial(weights, n);
  if (polyLam === null) return ["realizable", "trivial: no boundary at this degree"];

  const dN = sheaf.dMaps[n - 1];
  const kKer = matShape(dN)[1] - matRank(dN);
  const { degRed, highToLow } = reducedCoeffs(polyLam, kKer);
  const d = degRed;

  if (d <= 1) return ["realizable", `reduced polynomial degree ${d} - trivial`];
  if (d === 2) return realizeAnyMultiplicity(sheaf, n);

  // Degree d >= 3: evaluate the monic-coefficient relations at concrete
  // rational test points (exact Fraction arithmetic throughout -- no
  // symbolic rational-function construction needed, since we only ever
  // need `.subs(tp) == 0`, matching the Python original's own logic).
  const allSyms = weights.flat();
  const testPoints = [TEST_POINT_ALL_ONES(allSyms), TEST_POINT_INDEXED(allSyms)];

  for (const tp of testPoints) {
    const c = highToLow.map((p) => p.evalFull(tp)); // Fraction[], high-to-low, length d+1
    const leading = c[0];
    const monic = c.map((ci) => ci.div(leading)); // monic[0] = 1
    const cDm1 = monic[1];
    const mu = cDm1.neg().div(Fraction.of(d));
    let allZero = true;
    for (let k = 0; k <= d - 2 && allZero; k++) {
      const idx = d - k;
      const ck = monic[idx];
      const target = Fraction.of(comb(d, d - k)).mul(mu.neg().pow(d - k));
      if (!ck.sub(target).isZero()) allZero = false;
    }
    if (allZero) return ["realizable", `witness at ${fmtBindings(tp)}`];
  }

  // Diagnostic count: how many of the (symbolic, weight-dependent) relations
  // are NOT identically zero as rational functions of the weights -- this
  // mirrors the Python original's `sp.simplify(r) != 0` structural check,
  // which is independent of any test point.
  //
  // relation_k = c_k/leading - comb(d,M)*(-mu)^M  (M = d-k, mu = -c_{d-1}/(d*leading))
  // is identically zero (as a rational function) iff, clearing denominators
  // (leading is a nonzero polynomial, so this is a valid iff over the
  // fraction field, and the resulting equation is a genuine POLYNOMIAL
  // identity -- no division needed to test it):
  //     c_k * d^M * leading^(M-1)  ==  comb(d,M) * c_{d-1}^M          (as polynomials)
  const leadingPoly = highToLow[0];
  const cDm1Poly = highToLow[1];
  let nonzeroCount = 0;
  const relCount = d - 1;
  for (let k = 0; k <= d - 2; k++) {
    const idx = d - k; // M
    const M = idx;
    const ckPoly = highToLow[idx];
    const lhs = Poly.scale(Poly.mul(ckPoly, Poly.pow(leadingPoly, M - 1)), d ** M);
    const rhs = Poly.scale(Poly.pow(cDm1Poly, M), comb(d, M));
    if (!Poly.equal(lhs, rhs)) nonzeroCount++;
  }
  return [
    "unrealizable",
    `none of ${relCount} full-degen relations vanish at tested points; ${nonzeroCount} nonzero`,
  ];
}

function comb(n, k) {
  if (k < 0 || k > n) return 0;
  k = Math.min(k, n - k);
  let result = 1;
  for (let i = 0; i < k; i++) result = (result * (n - i)) / (i + 1);
  return Math.round(result);
}

// ---------------------------------------------------------------------------
// Canonical cellular complexes
// ---------------------------------------------------------------------------

/** Path graph P_n: n vertices, n-1 edges. */
export function pathP(n) {
  if (n < 2) throw new Error("P_n requires n >= 2");
  const d1 = zerosF(n, n - 1);
  for (let i = 0; i < n - 1; i++) {
    d1[i][i] = Fraction.of(-1);
    d1[i + 1][i] = Fraction.of(1);
  }
  return new CellularSheaf([d1]);
}

/** Cycle graph C_n: n vertices, n edges (closes back to vertex 0). */
export function cycleC(n) {
  if (n < 3) throw new Error("C_n requires n >= 3");
  const d1 = zerosF(n, n);
  for (let i = 0; i < n; i++) {
    d1[i][i] = Fraction.of(-1);
    d1[(i + 1) % n][i] = Fraction.of(1);
  }
  return new CellularSheaf([d1]);
}

/** Star K_{1,n}: 1 center + n leaves. */
export function starK(n) {
  if (n < 1) throw new Error("K_{1,n} requires n >= 1");
  const d1 = zerosF(n + 1, n);
  for (let i = 0; i < n; i++) {
    d1[0][i] = Fraction.of(-1);
    d1[i + 1][i] = Fraction.of(1);
  }
  return new CellularSheaf([d1]);
}

/** Complete graph K_n: n vertices, C(n,2) edges. */
export function completeK(n) {
  if (n < 2) throw new Error("K_n requires n >= 2");
  const edges = [];
  for (let i = 0; i < n; i++) for (let j = i + 1; j < n; j++) edges.push([i, j]);
  const d1 = zerosF(n, edges.length);
  edges.forEach(([i, j], col) => {
    d1[i][col] = Fraction.of(-1);
    d1[j][col] = Fraction.of(1);
  });
  return new CellularSheaf([d1]);
}

/** Cellular chain complex of the boundary of the k-simplex (= S^{k-1}). */
export function boundarySimplex(k) {
  if (k < 1) throw new Error("k >= 1");
  const vertexCount = k + 1;
  const facesByDim = Array.from({ length: k }, (_, d) => combinations(range(vertexCount), d + 1));

  const dMaps = [];
  for (let d = 1; d < k; d++) {
    const cellsLower = facesByDim[d - 1];
    const cellsUpper = facesByDim[d];
    const idxLower = new Map(cellsLower.map((c, i) => [c.join(","), i]));
    const dOp = zerosF(cellsLower.length, cellsUpper.length);
    cellsUpper.forEach((cell, col) => {
      for (let i = 0; i < cell.length; i++) {
        const face = cell.slice(0, i).concat(cell.slice(i + 1));
        const row = idxLower.get(face.join(","));
        dOp[row][col] = Fraction.of((-1) ** i);
      }
    });
    dMaps.push(dOp);
  }
  return new CellularSheaf(dMaps);
}

function zerosF(rows, cols) {
  return Array.from({ length: rows }, () => Array.from({ length: cols }, () => Fraction.ZERO));
}
function range(n) {
  return Array.from({ length: n }, (_, i) => i);
}
function combinations(arr, k) {
  const results = [];
  const combo = [];
  function go(start) {
    if (combo.length === k) {
      results.push(combo.slice());
      return;
    }
    for (let i = start; i < arr.length; i++) {
      combo.push(arr[i]);
      go(i + 1);
      combo.pop();
    }
  }
  go(0);
  return results;
}

function main() {
  console.log("=== P_3 chain complex ===");
  const p3 = pathP(3);
  console.log(`  dims: (${p3.dims.join(", ")})`);
  const weights = p3.diagWeightSymbols();
  const poly = p3.pencilPolynomial(weights, 1);
  console.log(`  Pencil polynomial: ${poly.toString()}`);
  const ascending = poly.coeffsInVar("lam");
  const [c, b, a] = ascending;
  const disc = discriminantQuadratic([a, b, c]);
  console.log(`  Discriminant: ${disc.toString()}`);
  // This port does not implement general polynomial factoring (sympy's
  // sp.factor()). For this specific P_3 discriminant that's not a loss:
  // the sympy baseline shows factor(disc) == expand(disc) (it's already
  // irreducible), so printing the same exact polynomial is not a fudge --
  // verified against `python3 src/cellular_sheaf.py`'s own output.
  console.log(`  Factored:    ${disc.toString()}`);
}

const isMain = import.meta.url === `file://${process.argv[1]}`;
if (isMain) {
  main();
}
