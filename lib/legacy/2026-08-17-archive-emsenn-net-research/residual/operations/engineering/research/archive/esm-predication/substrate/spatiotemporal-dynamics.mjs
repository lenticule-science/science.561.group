// Finite voidmath — combinatorics on the Act F3.1 preorder.
//
// Generators G = {a, b, c}. Bypass relation: a → b, b → c.
// At each grade n we enumerate all |G|^n = 3^n histories, classify
// into the four positions (F5.1 settled, F5.2 partnered, F5.3 both,
// F5.4 otherwise), build the F3.1 preorder, and compute zeta /
// chain-polynomial / Möbius / settlement-time / partition-function
// data.

import assert from "node:assert/strict";

const G = ["a", "b", "c"];
const BYPASS = new Set(["a|b", "b|c"]);
const bypasses = (x, y) => BYPASS.has(`${x}|${y}`);
const hasPartner = (g) => G.some((g2) => bypasses(g, g2));

// ---- enumeration --------------------------------------------------

function gradeN(n) {
  if (n === 0) return [[]];
  const prev = gradeN(n - 1);
  const out = [];
  for (const g of G) for (const h of prev) out.push([g, ...h]);
  return out;
}
const key = (h) => h.length === 0 ? "ε" : h.join("");

// ---- classification -----------------------------------------------

const settled = (h) => {
  for (let i = 0; i < h.length - 1; i++) if (bypasses(h[i], h[i+1])) return false;
  return true;
};
const partnered = (h) => h.every(hasPartner);
const pos = (h) => {
  const s = settled(h), p = partnered(h);
  return s && p ? "F5.3" : s ? "F5.1*" : p ? "F5.2*" : "F5.4";
};

// ---- one-step successors and F3.1 preorder -------------------------

function successors(h) {
  const out = [];
  for (let i = 0; i < h.length - 1; i++) {
    if (bypasses(h[i], h[i+1])) {
      const n = [...h]; [n[i], n[i+1]] = [n[i+1], n[i]]; out.push(n);
    }
  }
  return out;
}

// Given all histories at grade n, compute the F3.1 preorder as a
// reachability relation R: R[i][j] = true iff history i reaches j by
// zero or more F3.1 steps.
function preorder(histories) {
  const n = histories.length;
  const idx = new Map(histories.map((h, i) => [key(h), i]));
  const R = Array.from({ length: n }, () => new Uint8Array(n));
  for (let i = 0; i < n; i++) R[i][i] = 1;
  // One-step edges.
  const E = Array.from({ length: n }, () => []);
  for (let i = 0; i < n; i++) for (const s of successors(histories[i])) {
    E[i].push(idx.get(key(s)));
  }
  // Transitive closure (Floyd-Warshall over booleans; n is small).
  // First direct edges.
  for (let i = 0; i < n; i++) for (const j of E[i]) R[i][j] = 1;
  // Closure.
  for (let k = 0; k < n; k++) for (let i = 0; i < n; i++) if (R[i][k])
    for (let j = 0; j < n; j++) if (R[k][j]) R[i][j] = 1;
  return { idx, R, E, histories };
}

// ---- SECTION 1: counts at grades 0..6 -----------------------------

console.log("COUNTS");
console.log("grade  |G|^n  F5.1  F5.2  F5.3  F5.4");
const countsByGrade = [];
for (let n = 0; n <= 6; n++) {
  const H = gradeN(n);
  let f51 = 0, f52 = 0, f53 = 0, f54 = 0;
  for (const h of H) {
    const s = settled(h), p = partnered(h);
    if (s && p) f53++;
    else if (s) f51++;
    else if (p) f52++;
    else f54++;
  }
  // Include F5.3 in both F5.1 and F5.2 totals (they're supersets):
  const F51total = f51 + f53;
  const F52total = f52 + f53;
  countsByGrade.push({ n, total: H.length, F51: F51total, F52: F52total, F53: f53 });
  console.log(` ${n}      ${H.length.toString().padStart(4)}  ${F51total.toString().padStart(4)}  ${F52total.toString().padStart(4)}  ${f53.toString().padStart(4)}  ${f54.toString().padStart(4)}`);
}

// Recurrences observed. Verify closed forms.
//   |G|^n = 3^n.
//   F5.2 over G: only histories where every generator has a partner.
//     Partnered generators: {a, b}. So |F5.2|_n = 2^n.
//   F5.1 (no adjacent "ab" or "bc") — let f_a, f_b, f_c be settled
//     ending in a/b/c; f_a(n) = f(n-1), f_b(n) = f_b(n-1) + f_c(n-1),
//     f_c(n) = f_a(n-1) + f_c(n-1).
//   F5.3 = F5.1 ∩ F5.2 = settled histories over {a, b}.
//     Settled over {a, b}: no "ab" adjacency. g_a(n) = n, g_b(n) = 1.
//     |F5.3|_n = n + 1.
for (const row of countsByGrade) {
  assert.equal(row.total, Math.pow(3, row.n));
  assert.equal(row.F52, Math.pow(2, row.n));
  assert.equal(row.F53, row.n + 1);
}
console.log("verified:  |grade n| = 3^n,  |F5.2| = 2^n,  |F5.3| = n+1\n");

// ---- SECTION 2: F5.1 recurrence (closed form) ---------------------

// |F5.1|_n satisfies f(n) = f_a(n) + f_b(n) + f_c(n) where
//   f_a(n) = f(n-1)
//   f_b(n) = f_b(n-1) + f_c(n-1)
//   f_c(n) = f_a(n-1) + f_c(n-1)
// Let's observe the sequence.
console.log("F5.1 SEQUENCE");
let fa = 1, fb = 1, fc = 1;
console.log("n   f_a   f_b   f_c   total");
console.log(`1   ${fa}     ${fb}     ${fc}     ${fa + fb + fc}`);
for (let n = 2; n <= 8; n++) {
  const nfa = fa + fb + fc;
  const nfb = fb + fc;
  const nfc = fa + fc;
  fa = nfa; fb = nfb; fc = nfc;
  console.log(`${n}   ${fa.toString().padStart(3)}   ${fb.toString().padStart(3)}   ${fc.toString().padStart(3)}   ${(fa+fb+fc).toString().padStart(4)}`);
}
console.log("");

// ---- SECTION 3: F3.1 preorder at grade 3 --------------------------

console.log("F3.1 PREORDER AT GRADE 3");
const H3 = gradeN(3);
const { R: R3, E: E3 } = preorder(H3);
console.log(`|grade 3| = ${H3.length} histories`);

// Total comparability count: how many (x, y) pairs have x ≤ y?
let comparables = 0;
for (let i = 0; i < H3.length; i++) for (let j = 0; j < H3.length; j++) if (R3[i][j]) comparables++;
console.log(`|{(x,y) : x ≤ y}| = ${comparables}  (size of the zeta relation)`);

// Density — fraction of all pairs that are comparable.
const pairs = H3.length * H3.length;
console.log(`density ζ = ${(comparables / pairs).toFixed(4)}  (${comparables}/${pairs})`);

// One-step edge count.
let edges = 0;
for (const row of E3) edges += row.length;
console.log(`|Act F3.1 edges| = ${edges}  (sum of one-step successor counts)`);

// In-degree / out-degree distribution of the one-step graph.
const outDeg = E3.map((e) => e.length);
const inDeg = new Array(H3.length).fill(0);
for (const row of E3) for (const j of row) inDeg[j]++;
const tally = (arr) => {
  const m = new Map();
  for (const v of arr) m.set(v, (m.get(v) || 0) + 1);
  return [...m.entries()].sort((a, b) => a[0] - b[0]);
};
console.log(`out-degree distribution: ${JSON.stringify(tally(outDeg))}`);
console.log(`in-degree  distribution: ${JSON.stringify(tally(inDeg))}`);
console.log("");

// ---- SECTION 4: chain polynomial --------------------------------

// chain_k(x, y) = number of F3.1 chains of length k from x to y.
// chain_0 = I. chain_1 = A (one-step adjacency matrix, NOT including
// reflexive loops). chain_k = A^k.
//
// Chain polynomial for the whole poset at grade 3:
//   C(q) = sum over all (x,y) and k of q^k chain_k(x,y)
// We compute up to chain-length 4 (longer chains vanish since the
// grade-3 preorder has bounded height).

console.log("CHAIN POLYNOMIAL AT GRADE 3");
function matMul(A, B, n) {
  const C = Array.from({ length: n }, () => new Int32Array(n));
  for (let i = 0; i < n; i++) for (let k = 0; k < n; k++) if (A[i][k]) {
    const aik = A[i][k];
    for (let j = 0; j < n; j++) C[i][j] += aik * B[k][j];
  }
  return C;
}
function matSum(A, n) {
  let s = 0;
  for (let i = 0; i < n; i++) for (let j = 0; j < n; j++) s += A[i][j];
  return s;
}
const N = H3.length;
// A[i][j] = 1 iff one-step edge (no self-loop).
const A = Array.from({ length: N }, () => new Int32Array(N));
for (let i = 0; i < N; i++) for (const j of E3[i]) A[i][j] = 1;

// Compute A^k and sum for k = 1..4.
let pow = A;
const chainCounts = [matSum(pow, N)];  // k=1 total
console.log(`chain_1 (single F3.1 steps across poset):  ${chainCounts[0]}`);
for (let k = 2; k <= 6; k++) {
  pow = matMul(pow, A, N);
  const s = matSum(pow, N);
  chainCounts.push(s);
  console.log(`chain_${k} (total F3.1 sequences of length ${k}):  ${s}`);
  if (s === 0) break;
}
console.log(`max chain length with nonzero count: ${chainCounts.filter((x) => x > 0).length}`);
console.log(`total paths of all positive lengths:   ${chainCounts.reduce((a, b) => a + b, 0)}`);
console.log("");

// ---- SECTION 5: Möbius function at grade 3 -------------------------

// μ(x, y) is defined on the F3.1 preorder such that ζ * μ = δ. For a
// preorder that isn't a strict poset (some equivalences), μ isn't
// uniquely defined in general; here the F3.1 preorder is a strict
// partial order (Act F3.1 terminates and is acyclic up to equivalence
// classes; for our bypass chain the equivalence classes are singletons).
//
// Compute μ directly: μ(x, x) = 1; μ(x, y) = -sum_{x <= z < y} μ(x, z).

console.log("MÖBIUS AT GRADE 3");
const mu = Array.from({ length: N }, () => new Int32Array(N));

// Topological sort on R3: order histories so that x ≤ y implies x
// comes before or at y. Since R3 has reflexive loops, filter them.
function topoOrder() {
  const order = [];
  const visited = new Uint8Array(N);
  const rec = (i) => {
    if (visited[i]) return;
    visited[i] = 1;
    for (const j of E3[i]) rec(j);
    order.push(i);
  };
  for (let i = 0; i < N; i++) rec(i);
  return order.reverse();  // predecessors first
}
// Actually for Möbius: we need μ(x, y) for all x ≤ y. Walk x in
// topo order, then for each y with x ≤ y, compute μ(x, y).

// Simpler: for each x, fill μ(x, ·) in topological order over x's
// down-set (histories reachable from x).
for (let x = 0; x < N; x++) {
  // Get the upward cone of x: {y : x ≤ y} in topological order.
  const cone = [];
  for (let j = 0; j < N; j++) if (R3[x][j]) cone.push(j);
  // Order so x comes first and edges go forward.
  cone.sort((i, j) => R3[i][j] ? -1 : R3[j][i] ? 1 : 0);
  for (const y of cone) {
    if (y === x) { mu[x][y] = 1; continue; }
    let s = 0;
    for (const z of cone) {
      if (z === y) continue;
      if (R3[z][y] && z !== y) s += mu[x][z];
    }
    mu[x][y] = -s;
  }
}

// Tally μ values.
const muTally = new Map();
for (let i = 0; i < N; i++) for (let j = 0; j < N; j++) if (R3[i][j]) {
  muTally.set(mu[i][j], (muTally.get(mu[i][j]) || 0) + 1);
}
console.log(`μ value tally across pairs in ζ:`);
for (const [v, c] of [...muTally.entries()].sort((a, b) => a[0] - b[0])) {
  console.log(`   μ = ${v.toString().padStart(3)}  appears ${c} times`);
}

// Verify ζ * μ = δ: for all (x, y),  Σ_z ζ(x, z) μ(z, y) = δ(x, y).
let mobiusOK = 0, mobiusBad = 0;
for (let x = 0; x < N; x++) for (let y = 0; y < N; y++) {
  let s = 0;
  for (let z = 0; z < N; z++) if (R3[x][z]) s += mu[z][y];
  const expected = x === y ? 1 : 0;
  if (s === expected) mobiusOK++; else mobiusBad++;
}
console.log(`ζ * μ = δ verification: ${mobiusOK}/${mobiusOK + mobiusBad} pairs`);
assert.equal(mobiusBad, 0);
console.log("");

// ---- SECTION 6: settlement-time distribution ----------------------

// For each history h, d(h) = min # of F3.1 steps to reach a Thing
// F5.1 (settled). Histories already settled have d = 0. Non-confluent
// histories have different terminal paths; d is the SHORTEST.

console.log("SETTLEMENT TIME AT GRADE 3");
function settlementTime(startIdx) {
  const dist = new Int32Array(N).fill(-1);
  dist[startIdx] = 0;
  const queue = [startIdx];
  while (queue.length) {
    const i = queue.shift();
    if (settled(H3[i])) return dist[i];
    for (const j of E3[i]) if (dist[j] < 0) { dist[j] = dist[i] + 1; queue.push(j); }
  }
  return -1;  // unreachable — shouldn't happen; every history has at least itself if settled
}

const dTally = new Map();
for (let i = 0; i < N; i++) {
  const d = settlementTime(i);
  dTally.set(d, (dTally.get(d) || 0) + 1);
}
console.log(`distance to nearest F5.1:`);
for (const [d, c] of [...dTally.entries()].sort((a, b) => a[0] - b[0])) {
  console.log(`   d = ${d}:  ${c} histories`);
}
console.log("");

// ---- SECTION 7: zeta-like partition function ----------------------

// Z(q) = sum over (x, y) in ζ of q^{shortest path length from x to y}
// where the path length is in the F3.1 directed edges (not reflexive).
// Collect shortest-path lengths, then the polynomial coefficients.

console.log("ZETA PARTITION FUNCTION Z(q) AT GRADE 3");
const Zcoeffs = new Map();  // path-length → count
function bfsLengths(i) {
  const dist = new Int32Array(N).fill(-1);
  dist[i] = 0;
  const queue = [i];
  while (queue.length) {
    const u = queue.shift();
    for (const v of E3[u]) if (dist[v] < 0) { dist[v] = dist[u] + 1; queue.push(v); }
  }
  return dist;
}
for (let i = 0; i < N; i++) {
  const d = bfsLengths(i);
  for (let j = 0; j < N; j++) if (d[j] >= 0) {
    Zcoeffs.set(d[j], (Zcoeffs.get(d[j]) || 0) + 1);
  }
}
console.log("coefficient of q^k in Z(q) = # of (x, y) pairs at F3.1-shortest-distance k:");
const Zterms = [];
for (const [k, c] of [...Zcoeffs.entries()].sort((a, b) => a[0] - b[0])) {
  console.log(`   q^${k} : ${c}`);
  Zterms.push(`${c}q^${k}`);
}
console.log(`\nZ(q) = ${Zterms.join(" + ")}`);
// evaluate at q = 1 to recover the size of ζ (comparability count).
const Zat1 = [...Zcoeffs.values()].reduce((a, b) => a + b, 0);
console.log(`Z(1) = ${Zat1}  (matches |{(x,y) : x ≤ y}| = ${comparables})`);
assert.equal(Zat1, comparables);
console.log("");

// ---- SECTION 8: incomparable-pairs / non-confluent signature -----

console.log("NON-CONFLUENT F5.1 TERMINALS REACHED FROM each grade-3 history");
const terminalsByStart = new Map();  // # of distinct F5.1 terminals per history
for (let i = 0; i < N; i++) {
  const seen = new Set();
  const visited = new Uint8Array(N);
  const stack = [i];
  while (stack.length) {
    const u = stack.pop();
    if (visited[u]) continue;
    visited[u] = 1;
    if (settled(H3[u])) seen.add(key(H3[u]));
    for (const v of E3[u]) stack.push(v);
  }
  terminalsByStart.set(i, seen.size);
}
const tt = tally([...terminalsByStart.values()]);
console.log(`distribution of |terminals reachable| per starting history:`);
for (const [t, c] of tt) console.log(`   ${t} terminal${t === 1 ? "" : "s"}: ${c} histories`);
// The non-confluent ones (those with ≥ 2 terminals) are the interesting ones.
const nonconfluent = [...terminalsByStart.entries()].filter(([_, v]) => v >= 2);
console.log(`\n${nonconfluent.length} histories are non-confluent (reach ≥ 2 F5.1s):`);
for (const [i, t] of nonconfluent) console.log(`   ${key(H3[i]).padEnd(5)}  → ${t} F5.1 terminals`);
console.log("");

// ---- SECTION 9: rank polynomial of the poset ----------------------

// Rank r(x) = length of longest chain ending at x. r(F5.1) = final rank.
// Rank polynomial: R(q) = sum_x q^{r(x)}.

console.log("RANK POLYNOMIAL AT GRADE 3");
const ranks = new Int32Array(N);
// Topological sort on R3, then DP rank from sinks back.
// Since F3.1 goes "up", max rank at sinks = 0; rank at source = longest path from it.
// Actually: rank of x = length of longest chain from x to some sink. Compute with DP.
for (let i = N - 1; i >= 0; i--) { /* placeholder for order */ }
// Use memoized recursion.
const memo = new Int32Array(N).fill(-1);
function rank(i) {
  if (memo[i] !== -1) return memo[i];
  let m = 0;
  for (const j of E3[i]) m = Math.max(m, 1 + rank(j));
  memo[i] = m;
  return m;
}
for (let i = 0; i < N; i++) ranks[i] = rank(i);
const rankTally = new Map();
for (const r of ranks) rankTally.set(r, (rankTally.get(r) || 0) + 1);
const rankTerms = [...rankTally.entries()].sort((a, b) => a[0] - b[0]);
console.log(`rank (longest path from history to any F5.1):`);
for (const [r, c] of rankTerms) console.log(`   r = ${r}:  ${c} histories`);
const rankPoly = rankTerms.map(([r, c]) => `${c}q^${r}`).join(" + ");
console.log(`R(q) = ${rankPoly}`);
console.log(`R(1) = ${rankTerms.reduce((a, [_, c]) => a + c, 0)}  (= ${N})`);
console.log("");

// ---- SECTION 10: cross-grade closed forms -------------------------

// Announce the closed-form trio for our bypass chain:
//   |grade n| = 3^n
//   |F5.2|_n  = 2^n
//   |F5.3|_n  = n + 1
// and derive a generating function for |F5.1|_n. Verify against
// computed data through grade 7.

console.log("CROSS-GRADE GENERATING FUNCTIONS");
let prev = [1, 1, 1];  // [f_a, f_b, f_c] at grade 1
const f51seq = [3];
for (let n = 2; n <= 10; n++) {
  const [a, b, c] = prev;
  const na = a + b + c;
  const nb = b + c;
  const nc = a + c;
  prev = [na, nb, nc];
  f51seq.push(na + nb + nc);
}
console.log(`|F5.1|_n for n = 1..10:  ${f51seq.join(", ")}`);
// Check against OEIS-style: Recurrence is f(n) = 2f(n-1) + f(n-2) - f(n-3)?
// Let me verify empirically: f(3) = 16 = 2(7) + 3 - 1 = 14 + 3 - 1 = 16 ✓
// f(4) = 37 = 2(16) + 7 - 3 = 32 + 4 = 36. Not 37. So that's wrong.
// Try a different recurrence.  f(n) = f(n-1) + f(n-1) - ... let's just record.
// Observed sequence: 3, 7, 16, 37, 86, 200, 465, 1081, 2513, 5842.
// Ratios: 2.33, 2.29, 2.31, 2.32, 2.33, 2.33, 2.32, 2.32, 2.33...
// Limit ratio is golden-ratio-adjacent: let's check. 1 + sqrt(2) ≈ 2.414.
// (1 + sqrt(5))/2 ≈ 1.618. Not either. Check char poly of the matrix:
//   [f_a]   [1 1 1] [f_a]
//   [f_b] = [0 1 1] [f_b]
//   [f_c]   [1 0 1] [f_c]
// Characteristic polynomial: det(M - λI) = 0.
// | 1-λ  1    1  |
// | 0    1-λ  1  | = 0
// | 1    0    1-λ|
// = (1-λ)[(1-λ)^2 - 0] - 1[0 - 1] + 1[0 - (1-λ)]
// = (1-λ)^3 + 1 - (1-λ)
// Let u = 1-λ: u^3 + 1 - u = 0  →  u^3 - u + 1 = 0.
// So λ satisfies (1-λ)^3 - (1-λ) + 1 = 0 which is a cubic in λ.
// Its largest root is ~2.324 (matches the ratio).
console.log("characteristic recurrence for |F5.1|_n:");
console.log("  state vector (f_a, f_b, f_c) evolves under");
console.log("    f_a(n) = f_a(n-1) + f_b(n-1) + f_c(n-1)");
console.log("    f_b(n) =             f_b(n-1) + f_c(n-1)");
console.log("    f_c(n) = f_a(n-1) +             f_c(n-1)");
console.log("  characteristic polynomial of the transition matrix: u³ - u + 1 = 0");
console.log("  dominant eigenvalue ≈ 2.324 — sets the asymptotic growth rate of |F5.1|_n");
console.log("");

// Empirical check on growth ratio.
const ratios = [];
for (let i = 1; i < f51seq.length; i++) ratios.push(f51seq[i] / f51seq[i-1]);
console.log(`consecutive-ratio sequence: ${ratios.map((r) => r.toFixed(4)).join(", ")}`);
console.log(`ratio → dominant eigenvalue of the recurrence matrix.`);
console.log("");

console.log("done");
