// Finite relational math, computational exploration.
//
// The bypass relation's TOPOLOGY determines the growth rate, the
// partition function's pole structure, and the ζ⁻/ζ⁺ Galois split.
// Different bypass graphs produce different arithmetic regimes
// (Fibonacci φ, Padovan ρ, others).
//
// Parameterize over (G, B) where G is generators and B ⊆ G × G is
// the bypass relation. Compute everything combinatorially.

import assert from "node:assert/strict";

function mk(G, edges) {
  const B = new Set(edges.map(([x, y]) => `${x}|${y}`));
  const bypasses = (x, y) => B.has(`${x}|${y}`);
  const hasPartner = (g) => G.some((g2) => bypasses(g, g2));
  const settled = (h) => {
    for (let i = 0; i < h.length - 1; i++) if (bypasses(h[i], h[i+1])) return false;
    return true;
  };
  const partnered = (h) => h.every(hasPartner);
  return { G, B, bypasses, hasPartner, settled, partnered };
}

function gradeN(R, n) {
  if (n === 0) return [[]];
  const prev = gradeN(R, n - 1);
  const out = [];
  for (const g of R.G) for (const h of prev) out.push([g, ...h]);
  return out;
}

// Counts of |F5.1|, |F5.2|, |F5.3| for a bypass system R at grades 0..maxN.
function counts(R, maxN) {
  const rows = [];
  for (let n = 0; n <= maxN; n++) {
    const H = gradeN(R, n);
    let f1 = 0, f2 = 0, f3 = 0;
    for (const h of H) {
      const s = R.settled(h), p = R.partnered(h);
      if (s) f1++;
      if (p) f2++;
      if (s && p) f3++;
    }
    rows.push({ n, total: H.length, F1: f1, F2: f2, F3: f3 });
  }
  return rows;
}

// Transition matrix for |F5.1|_n: rows/cols indexed by last generator.
// M[g][g'] = 1 iff g can follow g' without creating a bypass pair.
// |settled ending in g at grade n| = sum_{g'} M[g][g'] * |settled ending in g' at grade n-1|.
// (Note: "g can follow g'" means NOT bypasses(g', g).)
function transitionMatrix(R) {
  const N = R.G.length;
  const M = Array.from({ length: N }, () => new Array(N).fill(0));
  for (let i = 0; i < N; i++) for (let j = 0; j < N; j++) {
    // Position-wise: at grade n, ending in G[i], previous ended in G[j].
    // Valid iff NOT bypasses(G[j], G[i]).
    if (!R.bypasses(R.G[j], R.G[i])) M[i][j] = 1;
  }
  return M;
}

// Dominant eigenvalue by power iteration.
function dominantEigenvalue(M, iters = 2000) {
  const N = M.length;
  let v = new Array(N).fill(1);
  let lambda = 0;
  for (let k = 0; k < iters; k++) {
    const v2 = new Array(N).fill(0);
    for (let i = 0; i < N; i++) for (let j = 0; j < N; j++) v2[i] += M[i][j] * v[j];
    const norm = Math.max(...v2.map(Math.abs));
    if (norm === 0) return 0;
    lambda = norm;
    v = v2.map((x) => x / norm);
  }
  return lambda;
}

// Reflexive-transitive closure of Act-F3.1 on grade-n histories.
function preorder(R, histories) {
  const idx = new Map(histories.map((h, i) => [h.join("."), i]));
  const N = histories.length;
  const E = Array.from({ length: N }, () => []);
  for (let i = 0; i < N; i++) {
    const h = histories[i];
    for (let k = 0; k < h.length - 1; k++) if (R.bypasses(h[k], h[k+1])) {
      const nxt = [...h]; [nxt[k], nxt[k+1]] = [nxt[k+1], nxt[k]];
      E[i].push(idx.get(nxt.join(".")));
    }
  }
  const reach = Array.from({ length: N }, () => new Uint8Array(N));
  for (let i = 0; i < N; i++) {
    reach[i][i] = 1;
    const st = [i];
    while (st.length) {
      const u = st.pop();
      for (const v of E[u]) if (!reach[i][v]) { reach[i][v] = 1; st.push(v); }
    }
  }
  return { E, reach };
}

// BFS distances in the one-step graph.
function bfsDists(E, i) {
  const n = E.length;
  const d = new Int32Array(n).fill(-1);
  d[i] = 0;
  const q = [i];
  while (q.length) {
    const u = q.shift();
    for (const v of E[u]) if (d[v] < 0) { d[v] = d[u] + 1; q.push(v); }
  }
  return d;
}

// Zeta partition function Z(q) = Σ_{x,y : x≤y} q^{dist(x,y)} at grade n.
function zetaPartition(R, n) {
  const H = gradeN(R, n);
  const { E, reach } = preorder(R, H);
  const N = H.length;
  const Z = new Map();
  for (let i = 0; i < N; i++) {
    const d = bfsDists(E, i);
    for (let j = 0; j < N; j++) if (reach[i][j]) Z.set(d[j], (Z.get(d[j]) || 0) + 1);
  }
  return Z;
}

// Spectral mass at grade n: Σ_h settlement-time(h).
// Settlement-time(h) = BFS distance from h to its nearest F5.1 in the F3.1 graph.
function spectralMass(R, n) {
  const H = gradeN(R, n);
  const { E } = preorder(R, H);
  const N = H.length;
  let mass = 0;
  for (let i = 0; i < N; i++) {
    if (R.settled(H[i])) continue;
    const d = bfsDists(E, i);
    let min = Infinity;
    for (let j = 0; j < N; j++) if (d[j] >= 0 && R.settled(H[j])) min = Math.min(min, d[j]);
    if (min === Infinity) continue;
    mass += min;
  }
  return mass;
}

// Möbius μ on the F3.1 preorder at grade n.
function mobiusTally(R, n) {
  const H = gradeN(R, n);
  const { reach, E } = preorder(R, H);
  const N = H.length;
  const mu = Array.from({ length: N }, () => new Int32Array(N));
  for (let x = 0; x < N; x++) {
    const cone = [];
    for (let j = 0; j < N; j++) if (reach[x][j]) cone.push(j);
    cone.sort((i, j) => reach[i][j] ? -1 : reach[j][i] ? 1 : 0);
    for (const y of cone) {
      if (y === x) { mu[x][y] = 1; continue; }
      let s = 0;
      for (const z of cone) if (z !== y && reach[z][y]) s += mu[x][z];
      mu[x][y] = -s;
    }
  }
  // Verify ζ * μ = δ.
  let bad = 0;
  for (let x = 0; x < N; x++) for (let y = 0; y < N; y++) {
    let s = 0;
    for (let z = 0; z < N; z++) if (reach[x][z]) s += mu[z][y];
    if (s !== (x === y ? 1 : 0)) bad++;
  }
  const tally = new Map();
  for (let i = 0; i < N; i++) for (let j = 0; j < N; j++) if (reach[i][j]) {
    tally.set(mu[i][j], (tally.get(mu[i][j]) || 0) + 1);
  }
  return { tally, bad };
}

// Galois split: swap positions i,j in a history, see how Act-F3.1
// reachability transforms. The "even" part: pairs (x,y) in ζ whose
// reverse (y,x) is also in ζ. The "odd" part: pairs only going one way.
function galoisSplit(R, n) {
  const H = gradeN(R, n);
  const { reach } = preorder(R, H);
  const N = H.length;
  let both = 0, oneWay = 0;
  for (let i = 0; i < N; i++) for (let j = 0; j < N; j++) {
    if (reach[i][j] && reach[j][i]) both++;
    else if (reach[i][j] && !reach[j][i]) oneWay++;
  }
  return { both, oneWay };
}

// ---- compare several bypass systems ------------------------------------

function report(name, R, maxCountGrade, zetaGrade) {
  console.log(`\n=== ${name} — G=${R.G.join(",")}, edges=${[...R.B].join(" ")} ===`);
  const c = counts(R, maxCountGrade);
  console.log("grade  |G|^n  F5.1  F5.2  F5.3");
  for (const r of c) {
    console.log(` ${r.n}    ${r.total.toString().padStart(5)}  ${r.F1.toString().padStart(4)}  ${r.F2.toString().padStart(4)}  ${r.F3.toString().padStart(4)}`);
  }

  const M = transitionMatrix(R);
  const lam = dominantEigenvalue(M);
  console.log(`dominant eigenvalue ≈ ${lam.toFixed(5)}`);
  // Measured asymptotic ratio from F5.1 sequence:
  const seq = c.map((r) => r.F1);
  const ratios = [];
  for (let i = 2; i < seq.length; i++) if (seq[i-1] > 0) ratios.push(seq[i]/seq[i-1]);
  if (ratios.length > 0) {
    const last = ratios[ratios.length-1];
    console.log(`measured |F5.1|_n / |F5.1|_{n-1} tail: ${last.toFixed(5)}`);
  }

  if (zetaGrade <= maxCountGrade) {
    const Z = zetaPartition(R, zetaGrade);
    const terms = [...Z.entries()].sort((a, b) => a[0] - b[0]);
    const zStr = terms.map(([k, c]) => `${c}q^${k}`).join(" + ");
    console.log(`Z(q) at grade ${zetaGrade}: ${zStr}`);
    console.log(`Z(1) = ${terms.reduce((a, [_, c]) => a + c, 0)}`);

    const mass = spectralMass(R, zetaGrade);
    console.log(`spectral mass (Σ settlement distance) at grade ${zetaGrade}: ${mass}`);

    const { tally, bad } = mobiusTally(R, zetaGrade);
    assert.equal(bad, 0);
    const muStr = [...tally.entries()].sort((a, b) => a[0] - b[0]).map(([v, c]) => `μ=${v}: ${c}`).join(", ");
    console.log(`Möbius at grade ${zetaGrade}: ${muStr}`);

    const { both, oneWay } = galoisSplit(R, zetaGrade);
    console.log(`Galois split: symmetric pairs (both directions) = ${both}; asymmetric = ${oneWay}`);
    if (both > 0) console.log(`  asymmetric/symmetric ratio: ${(oneWay/both).toFixed(3)}`);
  }
}

// Empty bypass — no forbidden adjacencies.
report("EMPTY bypass (no edges)", mk(["a", "b"], []), 5, 3);

// Single forward bypass a→b. Not a chain.
report("SINGLE a→b", mk(["a", "b"], [["a", "b"]]), 6, 3);

// Self-bypass a→a over {a, b}. Forbidden: "aa".
// Classical Fibonacci tiling.
report("SELF-BYPASS a→a over {a,b}", mk(["a", "b"], [["a", "a"]]), 8, 3);

// Bypass chain a→b→c. From original demo. Padovan/plastic regime.
report("CHAIN a→b→c", mk(["a", "b", "c"], [["a", "b"], ["b", "c"]]), 8, 3);

// Branching a→b and a→c.
report("BRANCHING a→b, a→c", mk(["a", "b", "c"], [["a", "b"], ["a", "c"]]), 6, 3);

// Converging a→c, b→c.
report("CONVERGING a→c, b→c", mk(["a", "b", "c"], [["a", "c"], ["b", "c"]]), 6, 3);

// Directed 3-cycle a→b, b→c, c→a. Every generator has a partner. F5.2 = everything.
report("3-CYCLE a→b→c→a", mk(["a", "b", "c"], [["a", "b"], ["b", "c"], ["c", "a"]]), 6, 3);

// Loop + self on same generator.
report("SELF a→a, CHAIN a→b, b→c", mk(["a", "b", "c"], [["a", "a"], ["a", "b"], ["b", "c"]]), 6, 3);

// ---- generating-function closed forms ----------------------------------

// For a bypass system with transition matrix M, |F5.1|_n is (row-sum of M^n)
// where M acts on the vector (f_{G[0]}, f_{G[1]}, ..., f_{G[N-1]}) with
// initial condition (1, 1, ..., 1) at grade 1.
// The characteristic polynomial of M is the denominator of the generating
// function G(x) = Σ_n |F5.1|_n x^n.
//
// Plastic case (CHAIN a→b→c): char poly of M is u³ - u + 1 = 0 (where
// u = 1 - λ). Real root u ≈ -1.3247, so λ ≈ 2.3247 = 1 + ρ where ρ is
// the plastic number (root of x³ = x + 1).
//
// Fibonacci case (SELF-BYPASS a→a): char poly λ² - λ - 1 = 0, roots φ and -1/φ.

function charPoly(M) {
  const n = M.length;
  // Leverrier-Faddeev for small n by hand: compute p_k = Σ M^k and use
  // Newton identities. For demo purposes, brute-force trace of M^k.
  const traces = [];
  let Mk = M.map((row) => row.slice());
  traces.push(M.reduce((s, _, i) => s + Mk[i][i], 0));  // tr(M)
  for (let k = 2; k <= n; k++) {
    const next = Array.from({ length: n }, () => new Array(n).fill(0));
    for (let i = 0; i < n; i++) for (let j = 0; j < n; j++) {
      for (let l = 0; l < n; l++) next[i][j] += Mk[i][l] * M[l][j];
    }
    Mk = next;
    traces.push(Mk.reduce((s, _, i) => s + Mk[i][i], 0));
  }
  // Use Newton identities: coefficients c_k where char poly is
  //   λ^n - c_1 λ^{n-1} + c_2 λ^{n-2} - ... ± c_n
  // satisfy k·c_k = c_{k-1}·tr(M) - c_{k-2}·tr(M²) + ... ± tr(M^k)·1
  // Actually simpler: (-1)^(n-k) e_k coefficients, where e_k are elementary symmetric
  // functions of eigenvalues, computed by Newton's identity:
  //   k·e_k = Σ_{i=1..k} (-1)^(i-1) e_{k-i} * p_i  where p_i = tr(M^i)
  const e = [1];
  for (let k = 1; k <= n; k++) {
    let s = 0;
    for (let i = 1; i <= k; i++) s += (i % 2 === 1 ? 1 : -1) * e[k-i] * traces[i-1];
    e.push(s / k);
  }
  // char poly: λ^n - e_1 λ^{n-1} + e_2 λ^{n-2} - ... + (-1)^n e_n
  return e;  // e[0]=1, e[1]=tr, ..., e[n]=det
}

console.log("\n=== Characteristic polynomials and eigenvalue identification ===");
for (const [name, R] of [
  ["EMPTY {a,b}",       mk(["a","b"],[])],
  ["SELF a→a",          mk(["a","b"],[["a","a"]])],
  ["CHAIN a→b→c",       mk(["a","b","c"],[["a","b"],["b","c"]])],
  ["3-CYCLE",           mk(["a","b","c"],[["a","b"],["b","c"],["c","a"]])],
]) {
  const M = transitionMatrix(R);
  const e = charPoly(M);
  const n = e.length - 1;
  const terms = [];
  for (let k = 0; k <= n; k++) {
    const coeff = (k % 2 === 0 ? 1 : -1) * e[k];
    if (coeff === 0) continue;
    const sign = coeff >= 0 ? (terms.length ? "+" : "") : "-";
    const abs = Math.abs(coeff);
    const variable = k === n ? "" : k === n-1 ? "λ" : `λ^${n-k}`;
    terms.push(`${sign}${abs === 1 && k !== n ? "" : abs}${variable}`);
  }
  const poly = terms.join(" ") || "0";
  console.log(`  ${name}:  char poly = ${poly}`);
}

// ---- Fibonacci and plastic numbers from settlement dynamics ----

const φ = (1 + Math.sqrt(5)) / 2;
const ρ = (() => {
  // Real root of x³ - x - 1 = 0 via Cardano / Newton.
  let x = 1.3;
  for (let i = 0; i < 100; i++) x = x - (x*x*x - x - 1) / (3*x*x - 1);
  return x;
})();
console.log(`\nconstants:  φ = ${φ.toFixed(8)}  (Fibonacci, x² = x+1)`);
console.log(`            ρ = ${ρ.toFixed(8)}  (plastic,   x³ = x+1)`);
console.log(`            1+ρ = ${(1+ρ).toFixed(8)}  (= λ for chain a→b→c)`);

const β_φ = Math.log(φ);
const β_ρ = Math.log(1 + ρ);
console.log(`\ncritical temperatures (β = ln of dominant eigenvalue):`);
console.log(`  Fibonacci regime: β_c = ln(φ)       ≈ ${β_φ.toFixed(6)}`);
console.log(`  Padovan regime:   β_c = ln(1+ρ)     ≈ ${β_ρ.toFixed(6)}`);

// Galois ratios — catalog says temporal fraction = -1/φ³ in Fibonacci regime.
const tempFracFib = -1 / (φ*φ*φ);
const tempFracPad = -1 / (Math.pow(1+ρ, 3));
console.log(`\ntemporal fraction predictions (finite-relational-math):`);
console.log(`  Fibonacci: -1/φ³ = ${tempFracFib.toFixed(6)}`);
console.log(`  Padovan:   -1/(1+ρ)³ = ${tempFracPad.toFixed(6)}`);

// Empirical Galois ratio from our data for the chain.
console.log("\nempirical Galois split at chain a→b→c, grade 4:");
{
  const R = mk(["a","b","c"], [["a","b"],["b","c"]]);
  for (const g of [3, 4, 5]) {
    const { both, oneWay } = galoisSplit(R, g);
    const ratio = -oneWay / (both + oneWay);
    console.log(`  grade ${g}: asym=${oneWay}, sym=${both}, -asym/(sym+asym) = ${ratio.toFixed(6)}`);
  }
  console.log(`  (compare to prediction -1/(1+ρ)³ = ${tempFracPad.toFixed(6)})`);
}

// ---- generating function for |F5.1|_n of the chain -----------------

// For a linear recurrence with transition matrix M and initial vector v,
// Σ_n x^n M^n v has generating function (I - xM)^{-1} v.
// |F5.1|_n = 1·M^n·v where 1 is the row of ones.
// Total generating function is 1 · (I - xM)^{-1} · v.

function matSolve(A, b) {
  const n = b.length;
  const mat = A.map((row, i) => [...row, b[i]]);
  for (let i = 0; i < n; i++) {
    let piv = i;
    for (let k = i+1; k < n; k++) if (Math.abs(mat[k][i]) > Math.abs(mat[piv][i])) piv = k;
    [mat[i], mat[piv]] = [mat[piv], mat[i]];
    for (let k = i+1; k < n; k++) {
      const factor = mat[k][i] / mat[i][i];
      for (let j = i; j <= n; j++) mat[k][j] -= factor * mat[i][j];
    }
  }
  const x = new Array(n).fill(0);
  for (let i = n-1; i >= 0; i--) {
    let s = mat[i][n];
    for (let j = i+1; j < n; j++) s -= mat[i][j] * x[j];
    x[i] = s / mat[i][i];
  }
  return x;
}

function generatingFunctionAtX(R, x) {
  // G(x) = 1 + x·Σ_{n≥1} |F5.1|_n x^{n-1}
  //      = 1 + x · 1·(I - xM)^{-1} · v   where v = [1,...,1]
  const M = transitionMatrix(R);
  const N = M.length;
  const A = Array.from({ length: N }, (_, i) => {
    const row = new Array(N).fill(0);
    row[i] = 1;
    for (let j = 0; j < N; j++) row[j] -= x * M[i][j];
    return row;
  });
  const v = new Array(N).fill(1);
  const y = matSolve(A, v);
  return 1 + x * y.reduce((a, b) => a + b, 0);
}

console.log("\ngenerating function G(x) = Σ |F5.1|_n x^n for chain a→b→c:");
console.log("  x         G(x)       expected: 1 / (1 - x - x² - x³... for plastic)");
for (const x of [0, 0.1, 0.2, 0.3, 0.35, 0.4, 0.42]) {
  let G;
  try { G = generatingFunctionAtX(mk(["a","b","c"], [["a","b"],["b","c"]]), x); }
  catch (_) { G = NaN; }
  console.log(`  x=${x.toFixed(2)}    G(x)=${G.toFixed(6)}`);
}
const criticalX = 1 / (1 + ρ);
console.log(`  critical x = 1/(1+ρ) = ${criticalX.toFixed(6)}: G(x) blows up here (radius of convergence)`);

// ---- direct verification via series partial sums ---

// Iterate the transition matrix to get |F5.1|_n for large n without
// enumerating histories.
function countsViaMatrix(R, maxN) {
  const M = transitionMatrix(R);
  const N = M.length;
  let v = new Array(N).fill(1);  // f_g(1) = 1 for each g
  const out = [{ n: 0, F1: 1 }];
  out.push({ n: 1, F1: v.reduce((a, b) => a + b, 0) });
  for (let n = 2; n <= maxN; n++) {
    const next = new Array(N).fill(0);
    for (let i = 0; i < N; i++) for (let j = 0; j < N; j++) next[i] += M[i][j] * v[j];
    v = next;
    out.push({ n, F1: v.reduce((a, b) => a + b, 0) });
  }
  return out;
}

console.log("\npartial-sum check: G(x) vs Σ_{n=0..50} |F5.1|_n · x^n for chain");
{
  const R = mk(["a","b","c"], [["a","b"],["b","c"]]);
  const c = countsViaMatrix(R, 50);
  for (const x of [0.1, 0.2, 0.3]) {
    let partialSum = 0;
    for (const r of c) partialSum += r.F1 * Math.pow(x, r.n);
    const exact = generatingFunctionAtX(R, x);
    console.log(`  x=${x}: partial(0..50) = ${partialSum.toFixed(6)};  matrix G(x) = ${exact.toFixed(6)}`);
  }
}

// Asymptotic ratios at high grade without enumeration.
console.log("\nasymptotic |F5.1|_n ratio convergence (from matrix iteration):");
{
  const R = mk(["a","b","c"], [["a","b"],["b","c"]]);
  const c = countsViaMatrix(R, 30);
  const ratios = [];
  for (let i = 1; i < c.length; i++) if (c[i-1].F1 > 0) ratios.push(c[i].F1 / c[i-1].F1);
  for (const n of [5, 10, 15, 20, 25]) {
    if (ratios[n] !== undefined) console.log(`  at n=${n}: ratio = ${ratios[n].toFixed(8)}`);
  }
  console.log(`  target: 1 + ρ = ${(1+ρ).toFixed(8)}`);
}

// ---- tower step: F5.3 as new generators ----------------------------

// Act F9.1: take F5.3 histories at some grade limit, treat as next-level
// generators. What's the |F5.3|_n at level 2?
// For chain a→b→c at grade ≤3, F5.3 = {ε, a, aa, aaa, b, ba, baa, bb, bba, bbb} (10 items).
// With inherited bypass: those that were bypass-related at level 1.
// Level-1 bypass: a→b, b→c. Which level-2 generators preserve that?
// Only level-2 objects that CONTAIN a bypass-related pair at an adjacency.
// Here the F5.3 set is entirely a's and b's (c never appears in F5.3 since
// c has no partner). Pairs: (g1, g2) where g1 "bypasses" g2 at level 2
// iff one of the underlying level-1 bypasses was present in g1's shape
// relative to g2's. This is a structural inheritance relation, not a
// simple string concatenation.

console.log("\nF5.3 set at chain a→b→c, grade ≤3:");
{
  const R = mk(["a","b","c"], [["a","b"],["b","c"]]);
  const F3 = [];
  for (let n = 0; n <= 3; n++) for (const h of gradeN(R, n)) {
    if (R.settled(h) && R.partnered(h)) F3.push(h);
  }
  console.log(`  |F5.3| = ${F3.length}: {${F3.map((h) => h.length === 0 ? "ε" : h.join("")).join(", ")}}`);
  console.log(`  notable: all elements are in {a, b}; c never appears because c has no partner`);
  console.log(`  structurally: F5.3 at chain ⊆ F5.1 ∩ (restriction to partnered generators)`);
  console.log(`  which for this chain reduces to the Fibonacci sub-regime (SELF-BYPASS a→a analog)`);
}

console.log("\ndone");
