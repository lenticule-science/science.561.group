/**
 * exact-arith.mjs
 *
 * Exact rational and quadratic-surd arithmetic, used as the numeric
 * foundation for chain-complex.mjs and cellular-sheaf.mjs. This is the
 * "no sympy" replacement for the exact-value computation (Rational,
 * sqrt(n)) that the Python originals got for free from sympy.
 *
 * Everything here is exact: Fraction is a BigInt-backed rational number
 * (never a float), and QuadraticSurd represents a + b*sqrt(d) exactly with
 * d a squarefree positive integer. No floating point is used except in
 * toNumber()/toFloatString(), which exist only for display and for
 * numeric tolerance comparisons (sorting, grouping) that mirror what the
 * Python originals did with float(x).
 */

// ---------------------------------------------------------------------------
// Fraction: exact rational number as BigInt numerator/denominator.
// ---------------------------------------------------------------------------

function bigAbs(a) {
  return a < 0n ? -a : a;
}

function bigGcd(a, b) {
  a = bigAbs(a);
  b = bigAbs(b);
  while (b) {
    [a, b] = [b, a % b];
  }
  return a === 0n ? 1n : a;
}

export class Fraction {
  /** @param {bigint} num @param {bigint} den (den must be > 0 already, or will be normalized) */
  constructor(num, den = 1n) {
    if (typeof num !== "bigint" || typeof den !== "bigint") {
      throw new TypeError("Fraction constructor requires BigInt args; use Fraction.of()");
    }
    if (den === 0n) throw new RangeError("Fraction: zero denominator");
    if (den < 0n) {
      num = -num;
      den = -den;
    }
    const g = bigGcd(num, den);
    this.num = num / g;
    this.den = den / g;
  }

  /** Build a Fraction from Number|bigint|Fraction. Numbers must be integers. */
  static of(a, b = 1) {
    const toBig = (x) => {
      if (typeof x === "bigint") return x;
      if (typeof x === "number") {
        if (!Number.isInteger(x)) {
          throw new TypeError(`Fraction.of: non-integer Number ${x}; pass a Fraction instead`);
        }
        return BigInt(x);
      }
      if (x instanceof Fraction) {
        if (x.den !== 1n) throw new TypeError("Fraction.of: cannot combine Fraction numerator/denominator with a non-1 den");
        return x.num;
      }
      throw new TypeError(`Fraction.of: unsupported type ${typeof x}`);
    };
    return new Fraction(toBig(a), toBig(b));
  }

  /** Combine two Fractions p/q into a new Fraction (p and q may themselves be Fractions). */
  static fromRatio(p, q) {
    const P = p instanceof Fraction ? p : Fraction.of(p);
    const Q = q instanceof Fraction ? q : Fraction.of(q);
    return P.div(Q);
  }

  static from(x) {
    if (x instanceof Fraction) return x;
    return Fraction.of(x);
  }

  add(o) {
    o = Fraction.from(o);
    return new Fraction(this.num * o.den + o.num * this.den, this.den * o.den);
  }
  sub(o) {
    o = Fraction.from(o);
    return new Fraction(this.num * o.den - o.num * this.den, this.den * o.den);
  }
  mul(o) {
    o = Fraction.from(o);
    return new Fraction(this.num * o.num, this.den * o.den);
  }
  div(o) {
    o = Fraction.from(o);
    if (o.num === 0n) throw new RangeError("Fraction: division by zero");
    return new Fraction(this.num * o.den, this.den * o.num);
  }
  neg() {
    return new Fraction(-this.num, this.den);
  }
  inv() {
    if (this.num === 0n) throw new RangeError("Fraction: inverse of zero");
    return new Fraction(this.den, this.num);
  }
  pow(n) {
    if (typeof n !== "number" || !Number.isInteger(n)) throw new TypeError("Fraction.pow: integer exponent required");
    if (n === 0) return Fraction.ONE;
    if (n < 0) return this.inv().pow(-n);
    let result = Fraction.ONE;
    let base = this;
    let e = n;
    while (e > 0) {
      if (e & 1) result = result.mul(base);
      base = base.mul(base);
      e >>= 1;
    }
    return result;
  }
  isZero() {
    return this.num === 0n;
  }
  sign() {
    return this.num === 0n ? 0 : this.num > 0n ? 1 : -1;
  }
  eq(o) {
    o = Fraction.from(o);
    return this.num === o.num && this.den === o.den;
  }
  lt(o) {
    o = Fraction.from(o);
    return this.num * o.den < o.num * this.den;
  }
  gt(o) {
    o = Fraction.from(o);
    return this.num * o.den > o.num * this.den;
  }
  compare(o) {
    o = Fraction.from(o);
    const l = this.num * o.den;
    const r = o.num * this.den;
    return l < r ? -1 : l > r ? 1 : 0;
  }
  isInteger() {
    return this.den === 1n;
  }
  toNumber() {
    // BigInt -> Number can lose precision for huge values, but our matrices
    // are tiny (dims <= ~6), so this is exact-enough / matches sympy's own
    // float() cast used for sorting.
    return Number(this.num) / Number(this.den);
  }
  toString() {
    return this.den === 1n ? this.num.toString() : `${this.num}/${this.den}`;
  }
}
Fraction.ZERO = new Fraction(0n, 1n);
Fraction.ONE = new Fraction(1n, 1n);

// ---------------------------------------------------------------------------
// Integer helpers: divisors, squarefree decomposition.
// ---------------------------------------------------------------------------

function bigSqrtFloor(n) {
  if (n < 0n) throw new RangeError("bigSqrtFloor: negative");
  if (n < 2n) return n;
  let x = n;
  let y = (x + 1n) / 2n;
  while (y < x) {
    x = y;
    y = (x + n / x) / 2n;
  }
  return x;
}

/** All positive divisors of a positive BigInt n. */
function divisors(n) {
  n = bigAbs(n);
  if (n === 0n) return [1n]; // caller should special-case 0 separately
  const small = [];
  const large = [];
  let i = 1n;
  const lim = bigSqrtFloor(n);
  for (; i <= lim; i++) {
    if (n % i === 0n) {
      small.push(i);
      const other = n / i;
      if (other !== i) large.push(other);
    }
  }
  return small.concat(large.reverse());
}

/**
 * Decompose a nonnegative BigInt N as m^2 * d with d squarefree.
 * Returns { m, d }. Trial division up to sqrt(N); fine for our small N.
 */
function squarefreeDecompose(N) {
  if (N < 0n) throw new RangeError("squarefreeDecompose: negative");
  if (N === 0n) return { m: 0n, d: 1n };
  let m = 1n;
  let d = N;
  let p = 2n;
  while (p * p <= d) {
    while (d % (p * p) === 0n) {
      d /= p * p;
      m *= p;
    }
    p += p === 2n ? 1n : 2n;
  }
  return { m, d };
}

/**
 * Exact square root of a nonnegative Fraction, as either a rational
 * Fraction (if a perfect square) or coeff*sqrt(radicand) with radicand a
 * squarefree integer > 1.
 * Returns { rational: true, value: Fraction } | { rational: false, coeff: Fraction, radicand: bigint }
 */
export function exactSqrtFraction(fr) {
  if (fr.sign() < 0) throw new RangeError("exactSqrtFraction: negative argument (would be complex)");
  if (fr.isZero()) return { rational: true, value: Fraction.ZERO };
  // sqrt(p/q) = sqrt(p*q) / q
  const N = fr.num * fr.den;
  const { m, d } = squarefreeDecompose(N);
  if (d === 1n) {
    return { rational: true, value: new Fraction(m, fr.den) };
  }
  return { rational: false, coeff: new Fraction(m, fr.den), radicand: d };
}

// ---------------------------------------------------------------------------
// QuadraticSurd: exact value a + b*sqrt(d), d squarefree positive integer.
// Only the operations needed by chain-complex.mjs (construction, toNumber,
// toString, equality) are implemented -- these values are terminal
// (eigenvalues), not intermediate values we keep computing with.
// ---------------------------------------------------------------------------

export class QuadraticSurd {
  /** @param {Fraction} a @param {Fraction} b @param {bigint} d (d > 1, squarefree) */
  constructor(a, b, d) {
    this.a = a;
    this.b = b;
    this.d = d;
  }
  toNumber() {
    return this.a.toNumber() + this.b.toNumber() * Math.sqrt(Number(this.d));
  }
  eq(o) {
    return o instanceof QuadraticSurd && this.a.eq(o.a) && this.b.eq(o.b) && this.d === o.d;
  }
  toString() {
    const sqrtStr = `sqrt(${this.d})`;
    if (this.b.isZero()) return this.a.toString();
    const bAbs = this.b.sign() < 0 ? this.b.neg() : this.b;
    const bTerm = bAbs.eq(Fraction.ONE) ? sqrtStr : `${bAbs.toString()}*${sqrtStr}`;
    if (this.a.isZero()) {
      return this.b.sign() < 0 ? `-${bTerm}` : bTerm;
    }
    return this.b.sign() < 0 ? `${this.a.toString()} - ${bTerm}` : `${this.a.toString()} + ${bTerm}`;
  }
}

/** True if x (Fraction | QuadraticSurd) is rational. */
export function isRationalValue(x) {
  return x instanceof Fraction;
}

export function valueToNumber(x) {
  return x instanceof Fraction ? x.toNumber() : x.toNumber();
}

export function valueToString(x) {
  return x.toString();
}

// ---------------------------------------------------------------------------
// Exact solving of a univariate polynomial with Fraction coefficients:
// rational-root extraction (with multiplicity) followed by an exact
// quadratic-formula solve of any leftover quadratic factor. Throws loudly
// (does not approximate) if a leftover factor of degree >= 3 remains --
// none of the target scripts hit this case (verified empirically against
// the sympy baselines), but silently guessing would violate the
// "no plausible-looking wrong numbers" rule.
//
// @param {Fraction[]} coeffsHighToLow - coefficients from highest power to
//   the constant term, i.e. p(x) = c[0] x^n + c[1] x^{n-1} + ... + c[n].
// @returns {{value: Fraction|QuadraticSurd, mult: number}[]}
// ---------------------------------------------------------------------------
export function solveExactPolynomial(coeffsHighToLow) {
  // Strip leading zero coefficients (degree bookkeeping safety).
  let coeffs = coeffsHighToLow.slice();
  while (coeffs.length > 1 && coeffs[0].isZero()) coeffs = coeffs.slice(1);
  const n = coeffs.length - 1;
  if (n === 0) return []; // nonzero constant: no roots

  // Factor out powers of x (i.e. root 0) directly -- avoids relying on
  // divisor enumeration of a zero constant term.
  const roots = [];
  while (coeffs.length > 1 && coeffs[coeffs.length - 1].isZero()) {
    roots.push({ value: Fraction.ZERO, mult: 1 });
    coeffs = coeffs.slice(0, -1);
  }
  const mergeZero = () => {
    // Combine any zero-root entries we pushed above into one multiplicity.
    const zeroCount = roots.filter((r) => r.value instanceof Fraction && r.value.isZero()).length;
    if (zeroCount > 0) {
      const rest = roots.filter((r) => !(r.value instanceof Fraction && r.value.isZero()));
      rest.push({ value: Fraction.ZERO, mult: zeroCount });
      return rest;
    }
    return roots;
  };

  if (coeffs.length === 1) {
    return mergeZero();
  }

  // Build integer-cleared coefficients (common denominator) to run the
  // rational root theorem candidate search.
  let denLcm = 1n;
  const lcmBig = (a, b) => (a / bigGcd(a, b)) * b;
  for (const c of coeffs) denLcm = lcmBig(denLcm, c.den);
  const intCoeffs = coeffs.map((c) => (c.num * (denLcm / c.den)));

  const leadAbs = bigAbs(intCoeffs[0]);
  const constAbs = bigAbs(intCoeffs[intCoeffs.length - 1]);

  let candidates;
  if (constAbs === 0n) {
    // Shouldn't happen here (we already peeled off root-0 factors above),
    // but guard anyway: 0 is the only "extra" candidate.
    candidates = [Fraction.ZERO];
  } else {
    const pDivs = divisors(constAbs);
    const qDivs = divisors(leadAbs);
    const seen = new Set();
    candidates = [];
    for (const p of pDivs) {
      for (const q of qDivs) {
        for (const sign of [1n, -1n]) {
          const fr = new Fraction(sign * p, q);
          const key = fr.toString();
          if (!seen.has(key)) {
            seen.add(key);
            candidates.push(fr);
          }
        }
      }
    }
  }

  const hornerEval = (cs, x) => {
    let acc = cs[0];
    for (let i = 1; i < cs.length; i++) acc = acc.mul(x).add(cs[i]);
    return acc;
  };
  const syntheticDivide = (cs, r) => {
    // cs has length m+1 (degree m). Returns quotient of length m (degree m-1).
    const out = [cs[0]];
    for (let i = 1; i < cs.length - 1; i++) {
      out.push(cs[i].add(out[i - 1].mul(r)));
    }
    // remainder = cs[last] + out[last]*r, expected to be exactly zero (checked by caller)
    return out;
  };

  let current = coeffs;
  for (const r of candidates) {
    while (current.length > 1 && hornerEval(current, r).isZero()) {
      roots.push({ value: r, mult: 1 });
      current = syntheticDivide(current, r);
    }
    if (current.length === 1) break;
  }

  const residualDeg = current.length - 1;
  if (residualDeg === 0) {
    // fully factored into rational roots
  } else if (residualDeg === 1) {
    const [a, b] = current;
    roots.push({ value: b.neg().div(a), mult: 1 });
  } else if (residualDeg === 2) {
    const [a, b, c] = current;
    const disc = b.mul(b).sub(Fraction.of(4).mul(a).mul(c));
    const twoA = a.mul(Fraction.of(2));
    const sq = exactSqrtFraction(disc);
    if (sq.rational) {
      roots.push({ value: b.neg().add(sq.value).div(twoA), mult: 1 });
      roots.push({ value: b.neg().sub(sq.value).div(twoA), mult: 1 });
    } else {
      const aPart = b.neg().div(twoA);
      const bPart = sq.coeff.div(twoA);
      roots.push({ value: new QuadraticSurd(aPart, bPart, sq.radicand), mult: 1 });
      roots.push({ value: new QuadraticSurd(aPart, bPart.neg(), sq.radicand), mult: 1 });
    }
  } else {
    throw new Error(
      `solveExactPolynomial: residual factor of degree ${residualDeg} with no rational root ` +
      `(coeffs [${current.map(String).join(", ")}]) -- exact radical solving beyond quadratic ` +
      `is not implemented; this port only covers the cases that actually occur in the ` +
      `math-services-section corpus (verified empirically against the sympy baselines).`
    );
  }

  // Merge duplicate root values (multiplicities) for tidiness.
  const merged = [];
  for (const { value, mult } of roots) {
    const existing = merged.find((m) => valuesEqual(m.value, value));
    if (existing) existing.mult += mult;
    else merged.push({ value, mult });
  }
  return merged;
}

export function valuesEqual(x, y) {
  if (x instanceof Fraction && y instanceof Fraction) return x.eq(y);
  if (x instanceof QuadraticSurd && y instanceof QuadraticSurd) return x.eq(y);
  return false;
}
