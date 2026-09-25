/**
 * multipartition.mjs
 *
 * Bipartite multipartitions: enumeration, codim/stab formulas, closure poset.
 * Port of multipartition.py. Pure combinatorics over small integers --
 * plain JS numbers are exact here (index sets in this corpus never exceed
 * a handful of elements, well within Number.isSafeInteger range).
 *
 * A bipartite multipartition over a chain complex with chain dimensions
 * (m_0, m_1, ..., m_N) is a partition of the indexing set
 *     I = {(n, i) : 0 <= n <= N, 1 <= i <= m_n}.
 *
 * Each block B in a multipartition Pi has:
 *     - total size |B|
 *     - per-degree multiplicity k_n^B := #{i : (n, i) in B}
 *
 * Codim formulas (theorems/stab-codim-formula.md):
 *     - codim in eigenvalue moduli:  sum_B (|B| - 1)
 *     - stab dim (within ambient H): sum_B sum_n C(k_n^B, 2)
 *
 * Closure poset (theorems/closure-poset-of-strata.md):
 *     Pi <= Pi'  iff  Pi' refines Pi  (Pi has coarser blocks).
 *     Equivalently: every block of Pi' is contained in some block of Pi.
 */

export function comb(n, k) {
  if (k < 0 || k > n) return 0;
  k = Math.min(k, n - k);
  let result = 1;
  for (let i = 0; i < k; i++) result = (result * (n - i)) / (i + 1);
  return Math.round(result);
}

/** The indexing set I for a chain complex with given chain dimensions. */
export function chainIndexSet(dims) {
  const I = [];
  dims.forEach((m, n) => {
    for (let i = 1; i <= m; i++) I.push([n, i]);
  });
  return I;
}

function pairKey([n, i]) {
  return `${n},${i}`;
}

/**
 * Yield every set-partition of `elements` as an array of arrays of pairs
 * ([n,i] tuples), via the same Bell-number recursion as all_partitions().
 */
export function* allPartitions(elements) {
  const elts = Array.from(elements);
  if (elts.length === 0) {
    yield [];
    return;
  }

  function* gen(idx, blocks) {
    if (idx === elts.length) {
      yield blocks.map((b) => b.slice());
      return;
    }
    const e = elts[idx];
    for (let k = 0; k < blocks.length; k++) {
      const newBlocks = blocks.map((b) => b.slice());
      newBlocks[k].push(e);
      yield* gen(idx + 1, newBlocks);
    }
    yield* gen(idx + 1, [...blocks, [e]]);
  }

  yield* gen(0, []);
}

export function blockSize(B) {
  return B.length;
}

/** Return Map {n: k_n^B} for block B. */
export function blockPerDegreeMult(B) {
  const counts = new Map();
  for (const [n] of B) counts.set(n, (counts.get(n) ?? 0) + 1);
  return counts;
}

/** sum_B (|B| - 1) -- codim in the bipartite eigenvalue moduli. */
export function codimEigenvalueModuli(Pi) {
  return Pi.reduce((acc, B) => acc + (B.length - 1), 0);
}

/** sum_B sum_n C(k_n^B, 2) -- stab dim within the ambient H. */
export function stabDim(Pi) {
  let total = 0;
  for (const B of Pi) {
    const ks = blockPerDegreeMult(B);
    for (const k of ks.values()) total += comb(k, 2);
  }
  return total;
}

/** codim in H = codim in eigenvalue moduli + stab dim. */
export function codimInAmbient(Pi) {
  return codimEigenvalueModuli(Pi) + stabDim(Pi);
}

function isSubset(sub, sup) {
  const supKeys = new Set(sup.map(pairKey));
  return sub.every((x) => supKeys.has(pairKey(x)));
}

/**
 * True iff Pi_fine refines Pi_coarse (every block of Pi_fine is contained
 * in some block of Pi_coarse).
 */
export function isRefinement(PiFine, PiCoarse) {
  for (const Bfine of PiFine) {
    if (!PiCoarse.some((Bcoarse) => isSubset(Bfine, Bcoarse))) return false;
  }
  return true;
}

function sortPairs(pairs) {
  return pairs.slice().sort((a, b) => a[0] - b[0] || a[1] - b[1]);
}

/** Canonical form: blocks sorted, each block as a sorted array of [n,i]. */
export function partitionCanonical(Pi) {
  const blocks = Pi.map((B) => sortPairs(B));
  blocks.sort((a, b) => cmpPairArrays(a, b));
  return blocks;
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

function partitionKey(canon) {
  return JSON.stringify(canon);
}

/**
 * Enumerate all bipartite multipartitions consistent with `hodgeConstraints`
 * and return the closure poset.
 *
 * `hodgeConstraints` is null/undefined or an array of arrays giving forced
 * identifications (each entry is a set of indices that must lie in the same
 * block).
 *
 * Returns { parts, covers } where parts is an array of canonical partitions
 * and covers is an array of [i, j] pairs such that parts[i] is covered by
 * parts[j] (j is a one-step refinement of i).
 */
export function closurePoset(dims, hodgeConstraints = null) {
  const I = chainIndexSet(dims);
  let raw = Array.from(allPartitions(I));

  if (hodgeConstraints && hodgeConstraints.length) {
    const respects = (Pi) =>
      hodgeConstraints.every((forced) => Pi.some((B) => isSubset(forced, B)));
    raw = raw.filter(respects);
  }

  const seen = new Map();
  for (const Pi of raw) {
    const canon = partitionCanonical(Pi);
    seen.set(partitionKey(canon), canon);
  }
  const canon = Array.from(seen.values()).sort((a, b) => {
    if (a.length !== b.length) return a.length - b.length;
    const sizesA = a.map((b2) => b2.length);
    const sizesB = b.map((b2) => b2.length);
    for (let i = 0; i < sizesA.length; i++) {
      if (sizesA[i] !== sizesB[i]) return sizesA[i] - sizesB[i];
    }
    return 0;
  });

  const parts = canon; // already arrays of arrays of [n,i]
  const n = parts.length;
  const refinesIndex = Array.from({ length: n }, () => new Set());
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n; j++) {
      if (i !== j && isRefinement(parts[j], parts[i])) refinesIndex[i].add(j);
    }
  }

  const covers = [];
  for (let i = 0; i < n; i++) {
    const direct = new Set(refinesIndex[i]);
    for (const j of Array.from(direct)) {
      for (const k of refinesIndex[i]) {
        if (k !== j && k !== i && isRefinement(parts[k], parts[j])) direct.delete(k);
      }
    }
    for (const j of direct) covers.push([i, j]);
  }

  return { parts, covers };
}

function reprPi(Pi) {
  return Pi.map((B) => B.map(([n, i]) => `(${n}, ${i})`).join(",")).join(" | ");
}

/** Print a table of all bipartite multipartitions with codim/stab info. */
export function codimTable(dims, hodgeConstraints = null) {
  const { parts } = closurePoset(dims, hodgeConstraints);
  console.log(`Chain dims: (${dims.join(", ")}${dims.length === 1 ? "," : ""})`);
  console.log(`Index set size: ${dims.reduce((a, b) => a + b, 0)}`);
  console.log(`Number of partitions: ${parts.length}`);
  if (hodgeConstraints && hodgeConstraints.length) {
    console.log(`Hodge constraints: ${hodgeConstraints.length} forced identifications`);
  }
  console.log();
  console.log(
    `${"Pi".padEnd(60)} ${"codim_eig".padStart(10)} ${"stab".padStart(6)} ${"codim_H".padStart(8)}`
  );
  console.log("-".repeat(88));
  for (const Pi of parts) {
    let PiRepr = reprPi(Pi);
    if (PiRepr.length > 58) PiRepr = PiRepr.slice(0, 55) + "...";
    const ce = codimEigenvalueModuli(Pi);
    const sd = stabDim(Pi);
    const ch = codimInAmbient(Pi);
    console.log(`${PiRepr.padEnd(60)} ${String(ce).padStart(10)} ${String(sd).padStart(6)} ${String(ch).padStart(8)}`);
  }
}

/**
 * Compute the Mobius function mu(0, Pi) for each Pi in the closure poset.
 *
 * Convention: 0 (the minimum element) is the partition with the largest
 * blocks (= the coarsest partition); Pi refines 0. Returns
 * { mu: Map<index, number>, minIdx }.
 */
export function mobiusFunction(parts, covers) {
  const n = parts.length;

  let minIdx = 0;
  for (let i = 1; i < n; i++) {
    if (isRefinement(parts[minIdx], parts[i])) minIdx = i;
  }

  const leq = new Map();
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n; j++) {
      leq.set(`${i},${j}`, i === j || isRefinement(parts[j], parts[i]));
    }
  }

  const mu = new Map();
  const order = Array.from({ length: n }, (_, i) => i).sort(
    (a, b) => codimEigenvalueModuli(parts[b]) - codimEigenvalueModuli(parts[a])
  );
  for (const j of order) {
    if (j === minIdx) {
      mu.set(j, 1);
    } else {
      let sum = 0;
      for (let i = 0; i < n; i++) {
        if (i !== j && mu.has(i) && leq.get(`${minIdx},${i}`) && leq.get(`${i},${j}`)) {
          sum += mu.get(i);
        }
      }
      mu.set(j, -sum);
    }
  }
  return { mu, minIdx };
}

function main() {
  console.log("=== Univariate Sym^+_2 (single chain space, dim 2) ===");
  codimTable([2]);
  console.log();
  console.log("=== Univariate Sym^+_3 (dim 3) ===");
  codimTable([3]);
}

const isMain = import.meta.url === `file://${process.argv[1]}`;
if (isMain) {
  main();
}
