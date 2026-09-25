/**
 * Verifies examples/iep-g-cellular-catalog.md.
 *
 * Bipartite IEP-G via decomposition theorem.
 *
 * theorems/chain-complex-iep-g-decomposition.md says:
 *     A bipartite multipartition Pi is realizable in H_diag iff each
 *     within-degree restriction Pi|_n is univariate-IEP-G realizable.
 *
 * This script tests the decomposition by checking each degree separately on
 * multi-degree cellular chain complexes (boundary of 3-simplex, etc.) where
 * the bipartite content matters.
 *
 * Port of iep_g_bipartite.py.
 */

import { completeK, boundarySimplex } from "../../../../../../../../src/cellular-sheaf.mjs";
import { rank as matRank } from "../../../../../../../../src/matrix.mjs";
import { fmtEigs } from "../../../../../../../../src/chain-complex.mjs";
import { valueToNumber as vtn } from "../../../../../../../../src/exact-arith.mjs";

function fmtMults(evs) {
  const nonzero = evs.filter((e) => vtn(e) !== 0).slice().sort((a, b) => vtn(a) - vtn(b));
  const seen = [];
  const counts = new Map();
  for (const e of nonzero) {
    const key = e.toString();
    if (!counts.has(key)) {
      counts.set(key, 0);
      seen.push(e);
    }
    counts.set(key, counts.get(key) + 1);
  }
  const parts = seen.map((e) => `${e.toString()}: ${counts.get(e.toString())}`);
  return `{${parts.join(", ")}}`;
}

function main() {
  console.log("=".repeat(70));
  console.log("Bipartite IEP-G test: per-degree realizability via decomposition");
  console.log("=".repeat(70));
  console.log();

  console.log("--- K_4 (= 1-skeleton of partial Delta^3) — uniform-weight check ---");
  const k4 = completeK(4);
  console.log(`    chain dims: (${k4.dims.join(", ")}), rank d_1 = ${matRank(k4.dMaps[0])}`);
  const evs = k4.allEigenvaluesAtUniform(1);
  console.log(`    spectrum at uniform: ${fmtEigs(evs)}`);
  console.log(`    nonzero multiplicity profile: ${fmtMults(evs)}`);

  console.log();
  console.log("--- partial Delta^3 (full bipartite test, uniform-weight only) ---");
  const pd3 = boundarySimplex(3);
  console.log(`    chain dims: (${pd3.dims.join(", ")})`);
  console.log(`    rank d_1 = ${matRank(pd3.dMaps[0])}, rank d_2 = ${matRank(pd3.dMaps[1])}`);

  for (const n of [1, 2]) {
    const evsN = pd3.allEigenvaluesAtUniform(n);
    const mults = evsN.some((e) => vtn(e) !== 0) ? fmtMults(evsN) : "{}";
    console.log(`    Delta_${n} spectrum at uniform: ${fmtEigs(evsN)}`);
    console.log(`      nonzero multiplicity profile: ${mults}`);
  }
}

main();
