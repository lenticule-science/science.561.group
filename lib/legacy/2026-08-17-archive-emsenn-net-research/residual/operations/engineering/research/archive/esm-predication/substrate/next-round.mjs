// Next round: closed-form Z(q), defect spectrum, Galois split, tower.
//
// Bypass systems tested:
//   FIB  = SELF a→a on {a,b}   (Fibonacci regime; char poly λ² - λ - 1)
//   PAD  = CHAIN a→b→c         (Padovan regime; char poly λ³ - 3λ² + 2λ - 1)

import assert from "node:assert/strict";

// ---- algebra ------------------------------------------------------

function mk(G, edges) {
  const B = new Set(edges.map(([x, y]) => `${x}|${y}`));
  return {
    G,
    B,
    bypasses: (x, y) => B.has(`${x}|${y}`),
    hasPartner: (g) => G.some((g2) => B.has(`${g}|${g2}`)),
    settled: (h) => { for (let i = 0; i < h.length - 1; i++) if (B.has(`${h[i]}|${h[i+1]}`)) return false; return true; },
    partnered(h) { return h.every((g) => this.hasPartner(g)); },
  };
}

function gradeN(R, n) {
  if (n === 0) return [[]];
  const prev = gradeN(R, n - 1);
  const out = [];
  for (const g of R.G) for (const h of prev) out.push([g, ...h]);
  return out;
}

function transitionMatrix(R) {
  const N = R.G.length;
  const M = Array.from({ length: N }, () => new Array(N).fill(0));
  for (let i = 0; i < N; i++) for (let j = 0; j < N; j++) {
    if (!R.bypasses(R.G[j], R.G[i])) M[i][j] = 1;
  }
  return M;
}

function f51Sequence(R, maxN) {
  const M = transitionMatrix(R);
  const N = M.length;
  const out = [1];  // grade 0
  let v = new Array(N).fill(1);
  out.push(v.reduce((a, b) => a + b, 0));  // grade 1
  for (let n = 2; n <= maxN; n++) {
    const next = new Array(N).fill(0);
    for (let i = 0; i < N; i++) for (let j = 0; j < N; j++) next[i] += M[i][j] * v[j];
    v = next;
    out.push(v.reduce((a, b) => a + b, 0));
  }
  return out;
}

// Characteristic polynomial of a matrix via Faddeev-Leverrier.
// Returns coefficients [e_0, e_1, ..., e_n] such that
//   charpoly(λ) = λ^n - e_1 λ^{n-1} + e_2 λ^{n-2} - ... + (-1)^n e_n
function charPoly(M) {
  const n = M.length;
  const traces = [];
  let Mk = M.map((r) => r.slice());
  traces.push(M.reduce((s, _, i) => s + Mk[i][i], 0));
  for (let k = 2; k <= n; k++) {
    const next = Array.from({ length: n }, () => new Array(n).fill(0));
    for (let i = 0; i < n; i++) for (let j = 0; j < n; j++)
      for (let l = 0; l < n; l++) next[i][j] += Mk[i][l] * M[l][j];
    Mk = next;
    traces.push(Mk.reduce((s, _, i) => s + Mk[i][i], 0));
  }
  const e = [1];
  for (let k = 1; k <= n; k++) {
    let s = 0;
    for (let i = 1; i <= k; i++) s += (i % 2 === 1 ? 1 : -1) * e[k-i] * traces[i-1];
    e.push(s / k);
  }
  return e;
}

// From char poly coefficients [e_0, e_1, ..., e_n] with
//   charpoly(λ) = λ^n - e_1 λ^{n-1} + ... + (-1)^n e_n
// the denominator D(x) of the generating function (up to numerator correction)
// is  D(x) = 1 - e_1 x + e_2 x² - ... + (-1)^n e_n x^n.
function denominatorPoly(e) {
  const n = e.length - 1;
  const D = new Array(n + 1);
  for (let k = 0; k <= n; k++) D[k] = (k % 2 === 0 ? 1 : -1) * e[k];
  return D;
}

// Given recurrence D(x) A(x) = N(x), compute N from first few terms of A.
function recoverNumerator(D, seq) {
  const degD = D.length - 1;
  const N = [];
  for (let k = 0; k < degD; k++) {
    let s = 0;
    for (let j = 0; j <= k; j++) s += D[j] * seq[k - j];
    N.push(s);
  }
  return N;  // polynomial coefficients ascending
}

// Evaluate a rational function N(x) / D(x) at x.
function evalRational(N, D, x) {
  let num = 0, den = 0;
  for (let k = N.length - 1; k >= 0; k--) num = num * x + N[k];
  for (let k = D.length - 1; k >= 0; k--) den = den * x + D[k];
  return num / den;
}

function polyStr(P) {
  const terms = [];
  for (let k = 0; k < P.length; k++) {
    const c = P[k];
    if (c === 0) continue;
    const sign = c > 0 ? (terms.length ? " + " : "") : (terms.length ? " - " : "-");
    const abs = Math.abs(c);
    const xpart = k === 0 ? "" : k === 1 ? "x" : `x^${k}`;
    const cstr = (abs === 1 && k > 0) ? "" : abs;
    terms.push(`${sign}${cstr}${xpart}`);
  }
  return terms.join("") || "0";
}

// ---- systems -----------------------------------------------------

const FIB = mk(["a", "b"], [["a", "a"]]);
const PAD = mk(["a", "b", "c"], [["a", "b"], ["b", "c"]]);

console.log("=== closed-form generating functions ===\n");
for (const [name, R] of [["FIB (self a→a)", FIB], ["PAD (chain a→b→c)", PAD]]) {
  const seq = f51Sequence(R, 20);
  const e = charPoly(transitionMatrix(R));
  const D = denominatorPoly(e);
  const N = recoverNumerator(D, seq);
  console.log(`${name}:`);
  console.log(`  |F5.1|_n = ${seq.slice(0, 10).join(", ")}, ...`);
  console.log(`  char poly (λ): ${e.map((c, k) => `${(k%2===1?-1:1)*c}·λ^${e.length-1-k}`).join(" + ").replace(/\+ -/g, "- ")}`);
  console.log(`  denominator D(x) = ${polyStr(D)}`);
  console.log(`  numerator   N(x) = ${polyStr(N)}`);

  // Verify G(x) = N(x)/D(x) matches seq at several evaluation points.
  for (const x of [0.1, 0.2, 0.3]) {
    let partial = 0;
    for (let k = 0; k < seq.length; k++) partial += seq[k] * Math.pow(x, k);
    const closed = evalRational(N, D, x);
    const ok = Math.abs(partial - closed) / Math.abs(closed) < 1e-3;
    console.log(`  G(${x}): partial(n≤${seq.length-1})=${partial.toFixed(6)}, closed=${closed.toFixed(6)} ${ok ? "✓" : "✗"}`);
  }
  console.log("");
}

// Site-factored Z(β) for Fibonacci per Part 303: Z = 1/[(1-z)²(1-z-z²)].
console.log("Part 303 partition function factorization (Fibonacci):");
console.log("  Z(z) = 1 / [(1-z)² · (1-z-z²)]");
console.log("  site factor 1/(1-z)²  → 1, 2, 3, 4, ...  (arithmetic progression of histories)");
console.log("  fiber factor 1/(1-z-z²) → 1, 1, 2, 3, 5, 8, ...  (Fibonacci)");
{
  const N = 15;
  const site = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  const fib = [1, 1];
  for (let k = 2; k < N; k++) fib.push(fib[k-1] + fib[k-2]);
  const Z = new Array(N).fill(0);
  for (let n = 0; n < N; n++) for (let k = 0; k <= n; k++) Z[n] += site[k] * fib[n - k];
  console.log(`  Z coefficients: ${Z.slice(0, 10).join(", ")}, ...`);
  console.log(`  pole location z = 1/φ = ${(2 / (1 + Math.sqrt(5))).toFixed(6)}  (β_c = ln(φ) = ${Math.log((1+Math.sqrt(5))/2).toFixed(6)})`);
}

console.log("\n=== defect operator δ — spectral mass Tr(δ) ===\n");
// λ_a(h) = settlement distance from h to its nearest F5.1 terminal.
// Tr(δ) at grade n = sum over h of λ_a(h).
function bfsDists(R, histories, E) {
  const N = histories.length;
  const dists = Array.from({ length: N }, () => new Int32Array(N).fill(-1));
  for (let i = 0; i < N; i++) {
    dists[i][i] = 0;
    const q = [i];
    while (q.length) {
      const u = q.shift();
      for (const v of E[u]) if (dists[i][v] < 0) { dists[i][v] = dists[i][u] + 1; q.push(v); }
    }
  }
  return dists;
}
function buildEdges(R, histories) {
  const idx = new Map(histories.map((h, i) => [h.join("."), i]));
  const E = Array.from({ length: histories.length }, () => []);
  for (let i = 0; i < histories.length; i++) {
    const h = histories[i];
    for (let k = 0; k < h.length - 1; k++) if (R.bypasses(h[k], h[k+1])) {
      const nxt = [...h]; [nxt[k], nxt[k+1]] = [nxt[k+1], nxt[k]];
      E[i].push(idx.get(nxt.join(".")));
    }
  }
  return E;
}
function spectralMassAt(R, n) {
  const H = gradeN(R, n);
  const E = buildEdges(R, H);
  const D = bfsDists(R, H, E);
  let mass = 0;
  let nonzeroCells = 0;
  for (let i = 0; i < H.length; i++) {
    if (R.settled(H[i])) continue;
    let min = Infinity;
    for (let j = 0; j < H.length; j++) if (D[i][j] >= 0 && R.settled(H[j])) min = Math.min(min, D[i][j]);
    if (min < Infinity) { mass += min; nonzeroCells++; }
  }
  return { mass, nonzeroCells, total: H.length };
}

console.log("Tr(δ) = Σ settlement distance over non-settled histories, at each grade:");
console.log("grade   FIB (self a→a)           PAD (chain)");
for (let n = 0; n <= 5; n++) {
  const f = spectralMassAt(FIB, n);
  const p = spectralMassAt(PAD, n);
  console.log(`  ${n}     mass=${f.mass}  (${f.nonzeroCells}/${f.total})  |  mass=${p.mass}  (${p.nonzeroCells}/${p.total})`);
}
console.log("");

// ---- Galois split — try several definitions --------------------
console.log("=== Galois Z⁺ / Z⁻ decomposition — candidate definitions ===\n");
function preorder(R, histories) {
  const E = buildEdges(R, histories);
  const N = histories.length;
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
// Candidate 1: signed partition with sign(h) = +1 if partnered else -1.
//   Z⁺ = pairs with same sign; Z⁻ = pairs with opposite sign.
// Candidate 2: τ(h) = +1 if F5.3, -1 if F5.4, 0 otherwise.
//   Z⁺ = sum of τ(x)τ(y) over ζ-pairs when τ(x)τ(y) ≥ 0; Z⁻ when < 0.
// Candidate 3: even/odd grade of shortest path (parity-split of Z(q)).

function signPartnered(R, h) { return R.partnered(h) ? 1 : -1; }
function signShadow(R, h) {
  const s = R.settled(h), p = R.partnered(h);
  if (s && p) return 1;   // F5.3
  if (!s && !p) return -1;  // F5.4
  return 0;
}
function galoisCandidate1(R, n) {
  const H = gradeN(R, n);
  const { reach } = preorder(R, H);
  const N = H.length;
  let Zp = 0, Zm = 0;
  for (let i = 0; i < N; i++) for (let j = 0; j < N; j++) if (reach[i][j]) {
    const prod = signPartnered(R, H[i]) * signPartnered(R, H[j]);
    if (prod > 0) Zp += 1; else Zm += 1;
  }
  return { Zp, Zm };
}
function galoisCandidate2(R, n) {
  const H = gradeN(R, n);
  const { reach } = preorder(R, H);
  const N = H.length;
  let Zp = 0, Zm = 0;
  for (let i = 0; i < N; i++) for (let j = 0; j < N; j++) if (reach[i][j]) {
    const prod = signShadow(R, H[i]) * signShadow(R, H[j]);
    if (prod > 0) Zp += 1; else if (prod < 0) Zm += 1;
  }
  return { Zp, Zm };
}
function galoisCandidate3(R, n) {
  // parity of BFS distance
  const H = gradeN(R, n);
  const E = buildEdges(R, H);
  const D = bfsDists(R, H, E);
  const N = H.length;
  let Zp = 0, Zm = 0;
  for (let i = 0; i < N; i++) for (let j = 0; j < N; j++) if (D[i][j] >= 0) {
    if (D[i][j] % 2 === 0) Zp += 1; else Zm += 1;
  }
  return { Zp, Zm };
}

const φ = (1 + Math.sqrt(5)) / 2;
const ρ = (() => { let x = 1.3; for (let i = 0; i < 100; i++) x = x - (x**3 - x - 1) / (3*x*x - 1); return x; })();
console.log(`predicted asymptotic Z⁻/Z⁺: FIB = -1/φ³ = ${(-1/φ**3).toFixed(5)};  PAD = -1/(1+ρ)³ = ${(-1/(1+ρ)**3).toFixed(5)}`);
console.log("");
for (const [label, fn] of [
  ["candidate 1 (partner-sign)", galoisCandidate1],
  ["candidate 2 (shadow-sign {F5.3:+1, F5.4:-1})", galoisCandidate2],
  ["candidate 3 (parity of dist)", galoisCandidate3],
]) {
  console.log(`  ${label}:`);
  for (const [name, R] of [["FIB", FIB], ["PAD", PAD]]) {
    const rows = [];
    for (let n = 2; n <= 5; n++) {
      const { Zp, Zm } = fn(R, n);
      const ratio = Zp > 0 ? -Zm / Zp : NaN;
      rows.push(`grade ${n}: -${Zm}/${Zp} = ${ratio.toFixed(4)}`);
    }
    console.log(`    ${name}: ${rows.join("; ")}`);
  }
  console.log("");
}

// ---- tower step (Act F9.1) ---------------------------------------
console.log("=== tower step: F5.3 at grade ≤ N as new generators ===\n");
function F53At(R, maxGrade) {
  const out = [];
  for (let n = 0; n <= maxGrade; n++) for (const h of gradeN(R, n)) {
    if (R.settled(h) && R.partnered(h)) out.push(h);
  }
  return out;
}
for (const [name, R] of [["FIB", FIB], ["PAD", PAD]]) {
  const F3 = F53At(R, 4);
  console.log(`${name}: |F5.3|_{≤4} = ${F3.length}`);
  const display = F3.map((h) => h.length === 0 ? "ε" : h.join(""));
  console.log(`  ${display.slice(0, 20).join(", ")}${F3.length > 20 ? ", ..." : ""}`);
  // Inherited bypass per Quality F9.3: two level-2 generators are bypass-related
  // iff their level-1 histories "contain" bypass-related pairs at a boundary.
  // For a simple interpretation: g1 → g2 at level 2 if the concatenation g1·g2
  // has a level-1 bypass at their boundary (i.e., last(g1) bypasses first(g2)).
  let edges = 0;
  for (const g1 of F3) for (const g2 of F3) {
    if (g1.length === 0 || g2.length === 0) continue;
    if (R.bypasses(g1[g1.length - 1], g2[0])) edges++;
  }
  console.log(`  inherited bypass edges (boundary-adjacency): ${edges}`);
  // Level-2 transition matrix — dimensions |F3| × |F3| is too big to enumerate,
  // but we can report growth rate as dominant eigenvalue of adjacency.
  const N2 = F3.length;
  const M2 = Array.from({ length: N2 }, () => new Array(N2).fill(0));
  for (let i = 0; i < N2; i++) for (let j = 0; j < N2; j++) {
    const g1 = F3[j], g2 = F3[i];
    if (g1.length === 0 || g2.length === 0) { M2[i][j] = 1; continue; }
    M2[i][j] = R.bypasses(g1[g1.length - 1], g2[0]) ? 0 : 1;
  }
  let v = new Array(N2).fill(1);
  for (let k = 0; k < 500; k++) {
    const v2 = new Array(N2).fill(0);
    for (let i = 0; i < N2; i++) for (let j = 0; j < N2; j++) v2[i] += M2[i][j] * v[j];
    const nrm = Math.max(...v2.map(Math.abs));
    if (nrm === 0) break;
    v = v2.map((x) => x / nrm);
  }
  const v2 = new Array(N2).fill(0);
  for (let i = 0; i < N2; i++) for (let j = 0; j < N2; j++) v2[i] += M2[i][j] * v[j];
  const lambda2 = Math.max(...v2.map(Math.abs));
  console.log(`  level-2 dominant eigenvalue ≈ ${lambda2.toFixed(5)}`);
  console.log("");
}

// ---- final summary -----------------------------------------------
console.log("=== summary ===");
console.log(`  FIB closed form:  G_FIB(x) = (1+x)/(1-x-x²)          pole at 1/φ ≈ ${(1/φ).toFixed(5)}`);
console.log(`  PAD closed form:  G_PAD(x) = (1+...)/(1-3x+2x²-x³)   pole at 1/(1+ρ) ≈ ${(1/(1+ρ)).toFixed(5)}`);
console.log(`  Fibonacci: growth φ ≈ ${φ.toFixed(5)}, β_c = ln(φ) ≈ ${Math.log(φ).toFixed(5)}`);
console.log(`  Padovan:   growth 1+ρ ≈ ${(1+ρ).toFixed(5)}, β_c = ln(1+ρ) ≈ ${Math.log(1+ρ).toFixed(5)}`);
console.log(`  Galois Z⁻/Z⁺: none of 3 candidate definitions converge to predicted -1/λ³.`);
console.log(`    (The Part 302 Galois split uses a specific automorphism σ↔Δ not captured`);
console.log(`    by the partnered-sign or shadow-type heuristics tried here. Needs more work.)`);
console.log("");
console.log("done");
