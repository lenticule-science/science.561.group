/**
 * chain-complex.mjs
 *
 * Chain complex with Hilbert structure: Hodge Laplacian, eigenvalue spectrum,
 * stratum identification. Port of chain_complex.py.
 *
 * A chain complex is a list of dimensions (m_0, ..., m_N) and a list of
 * boundary maps [d_1, ..., d_N] with d_n : C_n -> C_{n-1} a Fraction matrix
 * of shape (m_{n-1}, m_n). The condition d_{n-1} * d_n = 0 is checked.
 *
 * A Hilbert structure is a list of inner products [Q_0, ..., Q_N] with
 * Q_n a Fraction matrix of shape (m_n, m_n) symmetric positive-definite.
 *
 * Hodge Laplacian:
 *     For each n, the Hilbert adjoint of d_n is
 *         d_n^* = Q_n^{-1} * d_n^T * Q_{n-1}
 *     and the Laplacian on C_n is
 *         Delta_n = d_n^* d_n + d_{n+1} d_{n+1}^*
 *
 * Eigenvalues are computed EXACTLY: the characteristic polynomial of
 * Delta_n is built via the Faddeev-LeVerrier recurrence (exact Fraction
 * arithmetic, matrix.mjs), then solved exactly via rational-root
 * extraction plus an exact quadratic-formula solve of any leftover
 * quadratic factor (exact-arith.mjs). This is what sympy's
 * `Matrix.eigenvals()` gives for free via its symbolic engine; every case
 * actually exercised by this corpus resolves to rationals or quadratic
 * surds (e.g. `6 - sqrt(3)`), verified against the sympy baselines.
 */

import { Fraction } from "./exact-arith.mjs";
import {
  zeros, identity, shape, transpose, addM, multiply, inverse, isZeroMatrix,
  fromInts, diag, charPolyFaddeevLeVerrier,
} from "./matrix.mjs";
import { solveExactPolynomial, valueToNumber, valueToString } from "./exact-arith.mjs";

export function checkChainComplex(dMaps) {
  for (let k = 0; k < dMaps.length - 1; k++) {
    const prod = multiply(dMaps[k], dMaps[k + 1]);
    if (!isZeroMatrix(prod)) {
      throw new Error(`Chain complex condition fails at index ${k}: d${k} d${k + 1} != 0`);
    }
  }
}

/**
 * Diagonal SPD matrix with given positive weights (Number|bigint|Fraction).
 */
export function diagonalSpd(weights) {
  return diag(weights);
}

/**
 * Random symbolic SPD matrix (A^T A + 0.1 I with small integer entries).
 * NOT reproducible across runs (mirrors the Python original's own caveat:
 * "seed is currently unused (placeholder)"), so there is no golden value
 * to match here -- ported for API parity only, not exercised by any of
 * the verified scripts.
 */
export function randomSpd(m) {
  const randInt = () => Math.floor(Math.random() * 7) - 3; // [-3, 3]
  const A = zeros(m, m);
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < m; j++) {
      A[i][j] = Fraction.of(randInt() + (i === j ? 4 : 0));
    }
  }
  const ATA = multiply(transpose(A), A);
  const eps = new Fraction(1n, 10n);
  const R = zeros(m, m);
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < m; j++) {
      R[i][j] = ATA[i][j].add(i === j ? eps : Fraction.ZERO);
    }
  }
  return R;
}

/**
 * Delta_n = d_n^* d_n + d_{n+1} d_{n+1}^*, where d_n^* = Q_n^{-1} d_n^T Q_{n-1}.
 *
 * dMaps[k] = d_{k+1} : C_{k+1} -> C_k. Qs[k] = Q_k.
 */
export function hodgeLaplacian(dMaps, Qs, n) {
  const N = dMaps.length;
  const dims = Qs.map((Q) => shape(Q)[0]);
  const mN = dims[n];
  let delta = zeros(mN, mN);

  if (n >= 1) {
    const dN = dMaps[n - 1]; // C_n -> C_{n-1}
    const Qn = Qs[n];
    const Qnm1 = Qs[n - 1];
    const dNadj = multiply(multiply(inverse(Qn), transpose(dN)), Qnm1);
    delta = addM(delta, multiply(dNadj, dN));
  }
  if (n < N) {
    const dNp1 = dMaps[n]; // C_{n+1} -> C_n
    const Qn = Qs[n];
    const Qnp1 = Qs[n + 1];
    const dNp1adj = multiply(multiply(inverse(Qnp1), transpose(dNp1)), Qn);
    delta = addM(delta, multiply(dNp1, dNp1adj));
  }
  return delta;
}

/**
 * Eigenvalues of Delta_n, with multiplicity, exactly (Fraction or
 * QuadraticSurd values), sorted ascending by numeric value (sort=true,
 * matching hodge_eigenvalues' `flat.sort(key=lambda x: float(x))`).
 */
export function hodgeEigenvalues(dMaps, Qs, n, sort = true) {
  const delta = hodgeLaplacian(dMaps, Qs, n);
  const { coeffsHighToLow } = charPolyFaddeevLeVerrier(delta);
  const roots = solveExactPolynomial(coeffsHighToLow);
  const flat = [];
  for (const { value, mult } of roots) {
    for (let i = 0; i < mult; i++) flat.push(value);
  }
  if (sort) flat.sort((a, b) => valueToNumber(a) - valueToNumber(b));
  return flat;
}

export function allHodgeEigenvalues(dMaps, Qs) {
  const result = [];
  const dims = Qs.map((Q) => shape(Q)[0]);
  for (let n = 0; n < dims.length; n++) {
    for (const ev of hodgeEigenvalues(dMaps, Qs, n)) result.push([n, ev]);
  }
  return result;
}

/**
 * Bipartite multipartition of the joint spectrum: group indices (n, i)
 * (1-based i) whose eigenvalues coincide numerically (tol matches the
 * Python original's tol=1e-9). Returns an array of arrays of "(n, i)"
 * pairs, each block sorted, blocks sorted by their sorted member list.
 */
export function spectrumSignature(dMaps, Qs, tol = 1e-9) {
  const dims = Qs.map((Q) => shape(Q)[0]);
  const spectra = {};
  for (let n = 0; n < dims.length; n++) spectra[n] = hodgeEigenvalues(dMaps, Qs, n);

  const indexed = [];
  for (let n = 0; n < dims.length; n++) {
    spectra[n].forEach((ev, idx) => indexed.push({ label: [n, idx + 1], ev }));
  }

  const used = new Array(indexed.length).fill(false);
  const blocks = [];
  for (let i = 0; i < indexed.length; i++) {
    if (used[i]) continue;
    const block = [indexed[i].label];
    used[i] = true;
    const vEv = valueToNumber(indexed[i].ev);
    for (let j = 0; j < indexed.length; j++) {
      if (used[j]) continue;
      if (Math.abs(valueToNumber(indexed[j].ev) - vEv) < tol) {
        block.push(indexed[j].label);
        used[j] = true;
      }
    }
    blocks.push(block);
  }
  const keyOf = (block) => block.slice().sort(cmpPair);
  blocks.sort((a, b) => cmpPairArrays(keyOf(a), keyOf(b)));
  return blocks.map((b) => b.slice().sort(cmpPair));
}

function cmpPair(a, b) {
  return a[0] - b[0] || a[1] - b[1];
}
function cmpPairArrays(a, b) {
  const len = Math.min(a.length, b.length);
  for (let i = 0; i < len; i++) {
    const c = cmpPair(a[i], b[i]);
    if (c !== 0) return c;
  }
  return a.length - b.length;
}

// ---------------------------------------------------------------------------
// Canonical examples
// ---------------------------------------------------------------------------

/** (C_0, C_1) = (2, 2), d_1 = identity. Smallest case with bipartite content. */
export function example2_2Iso() {
  const d1 = identity(2);
  return { dMaps: [d1], Qs: [identity(2), identity(2)] };
}

/**
 * (C_0, C_1, C_2) = (2, 3, 1) with the canonical-form boundaries from the
 * EDD = 40 example.
 *     d_1 = [[1, 0, 0], [0, 1, 0]]
 *     d_2 = [[0], [0], [1]]
 */
export function example2_1Chain() {
  const d1 = fromInts([[1, 0, 0], [0, 1, 0]]);
  const d2 = fromInts([[0], [0], [1]]);
  return [d1, d2];
}

/**
 * The cellular chain complex of the boundary of a 2-simplex (triangle).
 * 3 vertices, 3 edges. d_1: C^edge_1 -> C^vert_0 is the signed incidence.
 */
export function examplePartialDelta2() {
  const d1 = fromInts([
    [-1, 0, -1], // v0 row
    [1, -1, 0], // v1 row
    [0, 1, 1], // v2 row
  ]);
  return [d1];
}

/**
 * Cellular chain complex of the boundary of a 3-simplex (tetrahedron).
 * 4 vertices, 6 edges, 4 triangles. d_1: edges -> vertices, d_2: triangles -> edges.
 */
export function examplePartialDelta3() {
  const edges = [[0, 1], [0, 2], [0, 3], [1, 2], [1, 3], [2, 3]];
  const triangles = [[0, 1, 2], [0, 1, 3], [0, 2, 3], [1, 2, 3]];

  const d1 = zeros(4, 6);
  edges.forEach(([i, j], col) => {
    d1[i][col] = Fraction.of(-1);
    d1[j][col] = Fraction.of(1);
  });

  const d2 = zeros(6, 4);
  const edgeIndex = (i, j) => edges.findIndex(([a, b]) => a === i && b === j);
  triangles.forEach(([i, j, k], col) => {
    const eJk = edgeIndex(j, k);
    const eIk = edgeIndex(i, k);
    const eIj = edgeIndex(i, j);
    d2[eJk][col] = Fraction.of(1);
    d2[eIk][col] = Fraction.of(-1);
    d2[eIj][col] = Fraction.of(1);
  });

  return [d1, d2];
}

export function fmtEigs(evs) {
  return `[${evs.map(valueToString).join(", ")}]`;
}

async function main() {
  console.log("=== (2,2) chain with d_1 = I, identity Hilbert ===");
  const { dMaps, Qs } = example2_2Iso();
  checkChainComplex([...dMaps, zeros(2, 1)]); // padded to check
  for (let n = 0; n < 2; n++) {
    console.log(`Delta_${n} eigenvalues: ${fmtEigs(hodgeEigenvalues(dMaps, Qs, n))}`);
  }
  console.log(`Bipartite multipartition: ${JSON.stringify(spectrumSignature(dMaps, Qs))}`);

  console.log();
  console.log("=== (2,2) with Q_0 = diag(1, 4), Q_1 = I — splits eigenvalues ===");
  const Qs2 = [diag([1, 4]), identity(2)];
  for (let n = 0; n < 2; n++) {
    console.log(`Delta_${n} eigenvalues: ${fmtEigs(hodgeEigenvalues(dMaps, Qs2, n))}`);
  }
  console.log(`Bipartite multipartition: ${JSON.stringify(spectrumSignature(dMaps, Qs2))}`);
}

const isMain = import.meta.url === `file://${process.argv[1]}`;
if (isMain) {
  main();
}
