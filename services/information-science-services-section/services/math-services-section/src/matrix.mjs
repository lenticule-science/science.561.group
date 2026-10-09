/**
 * matrix.mjs
 *
 * Exact linear algebra over Fraction (BigInt rationals): matrix multiply,
 * transpose, rank, inverse, and the characteristic polynomial via the
 * Faddeev-LeVerrier recurrence. This replaces the (numeric, non-symbolic)
 * sympy.Matrix operations used by chain_complex.py and cellular_sheaf.py.
 *
 * Matrices are plain arrays-of-arrays of Fraction: A[row][col].
 */

import { Fraction } from "./exact-arith.mjs";

export function zeros(rows, cols) {
  return Array.from({ length: rows }, () => Array.from({ length: cols }, () => Fraction.ZERO));
}

export function identity(n) {
  const M = zeros(n, n);
  for (let i = 0; i < n; i++) M[i][i] = Fraction.ONE;
  return M;
}

export function shape(A) {
  return [A.length, A.length ? A[0].length : 0];
}

export function transpose(A) {
  const [r, c] = shape(A);
  const T = zeros(c, r);
  for (let i = 0; i < r; i++) for (let j = 0; j < c; j++) T[j][i] = A[i][j];
  return T;
}

export function addM(A, B) {
  const [r, c] = shape(A);
  const R = zeros(r, c);
  for (let i = 0; i < r; i++) for (let j = 0; j < c; j++) R[i][j] = A[i][j].add(B[i][j]);
  return R;
}

export function subM(A, B) {
  const [r, c] = shape(A);
  const R = zeros(r, c);
  for (let i = 0; i < r; i++) for (let j = 0; j < c; j++) R[i][j] = A[i][j].sub(B[i][j]);
  return R;
}

export function scaleM(A, s) {
  s = Fraction.from(s);
  const [r, c] = shape(A);
  const R = zeros(r, c);
  for (let i = 0; i < r; i++) for (let j = 0; j < c; j++) R[i][j] = A[i][j].mul(s);
  return R;
}

export function multiply(A, B) {
  const [ra, ca] = shape(A);
  const [rb, cb] = shape(B);
  if (ca !== rb) throw new RangeError(`matrix multiply: shape mismatch (${ra}x${ca}) * (${rb}x${cb})`);
  const R = zeros(ra, cb);
  for (let i = 0; i < ra; i++) {
    for (let k = 0; k < ca; k++) {
      const aik = A[i][k];
      if (aik.isZero()) continue;
      for (let j = 0; j < cb; j++) {
        R[i][j] = R[i][j].add(aik.mul(B[k][j]));
      }
    }
  }
  return R;
}

export function trace(A) {
  const [r] = shape(A);
  let t = Fraction.ZERO;
  for (let i = 0; i < r; i++) t = t.add(A[i][i]);
  return t;
}

export function isZeroMatrix(A) {
  return A.every((row) => row.every((x) => x.isZero()));
}

export function cloneM(A) {
  return A.map((row) => row.map((x) => x));
}

/** Convert a plain-integer 2D array into a Fraction matrix. */
export function fromInts(rows) {
  return rows.map((row) => row.map((x) => Fraction.of(x)));
}

/** diag(...values) as a Fraction matrix, values may be Number|bigint|Fraction. */
export function diag(values) {
  const n = values.length;
  const D = zeros(n, n);
  for (let i = 0; i < n; i++) D[i][i] = Fraction.from(values[i]);
  return D;
}

/**
 * Exact rank via fraction-pivoted Gaussian elimination (row echelon form).
 */
export function rank(A) {
  const M = cloneM(A);
  const [rows, cols] = shape(M);
  let pivotRow = 0;
  for (let col = 0; col < cols && pivotRow < rows; col++) {
    let sel = -1;
    for (let r = pivotRow; r < rows; r++) {
      if (!M[r][col].isZero()) {
        sel = r;
        break;
      }
    }
    if (sel === -1) continue;
    [M[pivotRow], M[sel]] = [M[sel], M[pivotRow]];
    const pivot = M[pivotRow][col];
    for (let r = 0; r < rows; r++) {
      if (r === pivotRow) continue;
      if (M[r][col].isZero()) continue;
      const factor = M[r][col].div(pivot);
      for (let c = col; c < cols; c++) {
        M[r][c] = M[r][c].sub(factor.mul(M[pivotRow][c]));
      }
    }
    pivotRow++;
  }
  return pivotRow;
}

/**
 * Characteristic polynomial p(x) = det(xI - A) via the Faddeev-LeVerrier
 * recurrence, computed with exact Fraction arithmetic throughout.
 *
 * Returns { coeffsHighToLow: Fraction[], Mn: Fraction[][] } where
 * coeffsHighToLow = [1, c1, c2, ..., cn] (p(x) = x^n + c1 x^{n-1} + ... + cn),
 * and Mn = A^{n-1} + c1 A^{n-2} + ... + c_{n-1} I, which satisfies
 * A * Mn = -cn * I (Cayley-Hamilton), so A^{-1} = -(1/cn) * Mn when cn != 0.
 */
export function charPolyFaddeevLeVerrier(A) {
  const [n] = shape(A);
  if (n === 0) return { coeffsHighToLow: [Fraction.ONE], Mn: zeros(0, 0) };
  // M_0 = I; for k = 1..n: M_k = A*M_{k-1} + c_k*I, c_k = -trace(A*M_{k-1})/k.
  // Invariant: M_k = A^k + c_1 A^{k-1} + ... + c_k I.
  // In particular M_{n-1} = A^{n-1} + c_1 A^{n-2} + ... + c_{n-1} I, which by
  // Cayley-Hamilton satisfies A*M_{n-1} = -c_n*I, i.e. A^{-1} = -(1/c_n)*M_{n-1}.
  const coeffs = [Fraction.ONE]; // c_0 = 1
  let Mcur = identity(n); // M_0
  let MnMinus1 = Mcur;
  for (let k = 1; k <= n; k++) {
    MnMinus1 = Mcur; // M_{k-1}, captured just before this iteration's update
    const AMcur = multiply(A, Mcur);
    const ck = trace(AMcur).neg().div(Fraction.of(k));
    coeffs.push(ck);
    Mcur = addM(AMcur, scaleM(identity(n), ck));
  }
  // After the final (k=n) iteration, MnMinus1 holds M_{n-1}.
  return { coeffsHighToLow: coeffs, Mn: MnMinus1 };
}

/**
 * Exact matrix inverse via the Faddeev-LeVerrier-derived adjugate relation
 * A^{-1} = -(1/cn) * Mn. Throws if A is singular (cn == 0).
 */
export function inverse(A) {
  const [n] = shape(A);
  const { coeffsHighToLow, Mn } = charPolyFaddeevLeVerrier(A);
  const cn = coeffsHighToLow[n];
  if (cn.isZero()) throw new RangeError("matrix.inverse: singular matrix (det == 0)");
  return scaleM(Mn, cn.neg().inv());
}

/** det(A) = (-1)^n * cn, where p(x) = det(xI-A) = x^n + c1 x^{n-1} + ... + cn. */
export function determinant(A) {
  const [n] = shape(A);
  const { coeffsHighToLow } = charPolyFaddeevLeVerrier(A);
  const cn = coeffsHighToLow[n];
  return n % 2 === 0 ? cn : cn.neg();
}
