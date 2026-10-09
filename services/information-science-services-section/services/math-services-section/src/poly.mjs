/**
 * poly.mjs
 *
 * Exact sparse multivariate polynomials with Fraction coefficients. This is
 * the hand-rolled replacement for the slice of sympy's symbolic engine that
 * cellular-sheaf.mjs actually needs: building the generalized-eigenvalue
 * "pencil" polynomial det(d_n^T Q_{n-1} d_n - lam*Q_n) as an exact
 * polynomial in the per-cell weight symbols AND lam (lam is just another
 * variable in the same polynomial ring), extracting its coefficients as a
 * polynomial in lam (whose coefficients are themselves polynomials in the
 * weights), and evaluating/partially-evaluating at rational weight values.
 *
 * This is NOT a general CAS: it supports +, -, *, small nonnegative integer
 * powers, determinant (cofactor expansion, fine for the <= 6x6 matrices in
 * this corpus), coefficient-extraction in one named variable, and full/
 * partial evaluation at rational points. That is exactly, and only, what
 * cellular_sheaf.py's pencil_polynomial/realize_any_multiplicity/
 * realize_full_degeneracy need.
 */

import { Fraction } from "./exact-arith.mjs";

function monomialKey(exps) {
  // exps: Map<string, number> with all values > 0
  const names = Array.from(exps.keys()).sort();
  return names.map((n) => `${n}^${exps.get(n)}`).join("*");
}

export class Poly {
  /** @param {Map<string, {exps: Map<string,number>, coeff: Fraction}>} terms */
  constructor(terms) {
    this.terms = terms; // key -> {exps, coeff}
  }

  static zero() {
    return new Poly(new Map());
  }

  static constant(c) {
    const fr = c instanceof Fraction ? c : Fraction.of(c);
    if (fr.isZero()) return Poly.zero();
    const m = new Map();
    m.set("", { exps: new Map(), coeff: fr });
    return new Poly(m);
  }

  static variable(name, power = 1) {
    const exps = new Map([[name, power]]);
    const m = new Map();
    m.set(monomialKey(exps), { exps, coeff: Fraction.ONE });
    return new Poly(m);
  }

  isZero() {
    return this.terms.size === 0;
  }

  clone() {
    const m = new Map();
    for (const [k, v] of this.terms) m.set(k, { exps: new Map(v.exps), coeff: v.coeff });
    return new Poly(m);
  }

  static add(p, q) {
    const m = new Map();
    for (const [k, v] of p.terms) m.set(k, { exps: new Map(v.exps), coeff: v.coeff });
    for (const [k, v] of q.terms) {
      if (m.has(k)) {
        const combined = m.get(k).coeff.add(v.coeff);
        if (combined.isZero()) m.delete(k);
        else m.set(k, { exps: m.get(k).exps, coeff: combined });
      } else {
        m.set(k, { exps: new Map(v.exps), coeff: v.coeff });
      }
    }
    return new Poly(m);
  }

  static neg(p) {
    const m = new Map();
    for (const [k, v] of p.terms) m.set(k, { exps: new Map(v.exps), coeff: v.coeff.neg() });
    return new Poly(m);
  }

  static sub(p, q) {
    return Poly.add(p, Poly.neg(q));
  }

  static mul(p, q) {
    const m = new Map();
    for (const [, tp] of p.terms) {
      for (const [, tq] of q.terms) {
        const exps = new Map(tp.exps);
        for (const [name, e] of tq.exps) exps.set(name, (exps.get(name) ?? 0) + e);
        const key = monomialKey(exps);
        const coeff = tp.coeff.mul(tq.coeff);
        if (m.has(key)) {
          const combined = m.get(key).coeff.add(coeff);
          if (combined.isZero()) m.delete(key);
          else m.set(key, { exps, coeff: combined });
        } else if (!coeff.isZero()) {
          m.set(key, { exps, coeff });
        }
      }
    }
    return new Poly(m);
  }

  static scale(p, s) {
    const fr = s instanceof Fraction ? s : Fraction.of(s);
    if (fr.isZero()) return Poly.zero();
    const m = new Map();
    for (const [k, v] of p.terms) m.set(k, { exps: new Map(v.exps), coeff: v.coeff.mul(fr) });
    return new Poly(m);
  }

  static pow(p, n) {
    if (!Number.isInteger(n) || n < 0) throw new TypeError("Poly.pow: nonnegative integer exponent required");
    let result = Poly.constant(Fraction.ONE);
    let base = p;
    let e = n;
    while (e > 0) {
      if (e & 1) result = Poly.mul(result, base);
      base = Poly.mul(base, base);
      e >>= 1;
    }
    return result;
  }

  static equal(p, q) {
    return Poly.sub(p, q).isZero();
  }

  /** Degree of `varName` in this polynomial (0 if absent, -Infinity if p is the zero poly). */
  degreeIn(varName) {
    if (this.isZero()) return -Infinity;
    let deg = 0;
    for (const [, v] of this.terms) deg = Math.max(deg, v.exps.get(varName) ?? 0);
    return deg;
  }

  /**
   * Coefficients of this polynomial as a univariate polynomial in `varName`,
   * with coefficients themselves being Poly objects in the remaining
   * variables. Returns an array indexed by power ascending:
   * result[i] = coefficient of varName^i (a Poly, possibly zero-length map).
   */
  coeffsInVar(varName) {
    const maxDeg = this.degreeIn(varName);
    const deg = maxDeg === -Infinity ? 0 : maxDeg;
    const buckets = Array.from({ length: deg + 1 }, () => new Map());
    for (const [, v] of this.terms) {
      const power = v.exps.get(varName) ?? 0;
      const restExps = new Map(v.exps);
      restExps.delete(varName);
      const key = monomialKey(restExps);
      const bucket = buckets[power];
      if (bucket.has(key)) {
        const combined = bucket.get(key).coeff.add(v.coeff);
        if (combined.isZero()) bucket.delete(key);
        else bucket.set(key, { exps: restExps, coeff: combined });
      } else {
        bucket.set(key, { exps: restExps, coeff: v.coeff });
      }
    }
    return buckets.map((b) => new Poly(b));
  }

  /**
   * Substitute `bindings` (Map<varName, Fraction>) for a subset of the
   * variables, returning a new Poly in the remaining variables.
   */
  evalPartial(bindings) {
    const m = new Map();
    for (const [, v] of this.terms) {
      let coeff = v.coeff;
      const restExps = new Map();
      for (const [name, e] of v.exps) {
        if (bindings.has(name)) {
          coeff = coeff.mul(bindings.get(name).pow(e));
        } else {
          restExps.set(name, e);
        }
      }
      if (coeff.isZero()) continue;
      const key = monomialKey(restExps);
      if (m.has(key)) {
        const combined = m.get(key).coeff.add(coeff);
        if (combined.isZero()) m.delete(key);
        else m.set(key, { exps: restExps, coeff: combined });
      } else {
        m.set(key, { exps: restExps, coeff });
      }
    }
    return new Poly(m);
  }

  /** Full evaluation: all variables must be bound. Returns a Fraction. */
  evalFull(bindings) {
    const result = this.evalPartial(bindings);
    if (result.isZero()) return Fraction.ZERO;
    if (result.terms.size === 1) {
      const [[, v]] = result.terms;
      if (v.exps.size === 0) return v.coeff;
    }
    throw new Error(
      `Poly.evalFull: not all variables were bound (residual vars: ` +
      `${Array.from(new Set(Array.from(result.terms.values()).flatMap((v) => Array.from(v.exps.keys())))).join(", ")})`
    );
  }

  toString() {
    if (this.isZero()) return "0";
    const entries = Array.from(this.terms.values());
    entries.sort((a, b) => {
      const da = Array.from(a.exps.values()).reduce((x, y) => x + y, 0);
      const db = Array.from(b.exps.values()).reduce((x, y) => x + y, 0);
      if (db !== da) return db - da;
      return monomialKey(a.exps) < monomialKey(b.exps) ? -1 : 1;
    });
    const parts = entries.map(({ exps, coeff }) => {
      const varPart = Array.from(exps.entries())
        .sort(([a], [b]) => (a < b ? -1 : 1))
        .map(([n, e]) => (e === 1 ? n : `${n}**${e}`))
        .join("*");
      if (varPart === "") return coeff.toString();
      if (coeff.eq(Fraction.ONE)) return varPart;
      if (coeff.eq(Fraction.ONE.neg())) return `-${varPart}`;
      return `${coeff.toString()}*${varPart}`;
    });
    return parts.join(" + ").replace(/\+ -/g, "- ");
  }
}

/** Determinant of a square matrix of Poly entries via cofactor expansion. */
export function determinantPoly(matrix) {
  const n = matrix.length;
  if (n === 0) return Poly.constant(Fraction.ONE);
  if (n === 1) return matrix[0][0];
  if (n === 2) {
    return Poly.sub(Poly.mul(matrix[0][0], matrix[1][1]), Poly.mul(matrix[0][1], matrix[1][0]));
  }
  let det = Poly.zero();
  for (let j = 0; j < n; j++) {
    const entry = matrix[0][j];
    if (entry.isZero()) continue;
    const minor = matrix.slice(1).map((row) => row.filter((_, c) => c !== j));
    const minorDet = determinantPoly(minor);
    const term = Poly.mul(entry, minorDet);
    det = j % 2 === 0 ? Poly.add(det, term) : Poly.sub(det, term);
  }
  return det;
}
