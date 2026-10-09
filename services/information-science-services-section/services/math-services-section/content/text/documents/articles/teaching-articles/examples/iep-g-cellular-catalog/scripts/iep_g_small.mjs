/**
 * Verifies examples/iep-g-cellular-catalog.md.
 *
 * IEP-G realizability for small graphs only.
 *
 * Restricts to cases where the pencil polynomial and its discriminant/
 * relations are cheap to compute:
 *     P_2, P_3, P_4
 *     C_3, C_4
 *     K_{1,2}, K_{1,3}
 *     K_3
 *     partial Delta^2
 *
 * Skip larger cases (K_4, partial Delta^3) where the symbolic computation
 * is too expensive — those are tested at uniform weights only.
 *
 * Port of iep_g_small.py.
 */

import {
  pathP, cycleC, starK, completeK, boundarySimplex, realizeFullDegeneracy,
} from "../../../../../../../../src/cellular-sheaf.mjs";
import { rank as matRank } from "../../../../../../../../src/matrix.mjs";

function check(label, sheaf, n = 1, expect = null) {
  console.log(`\n--- ${label} (degree ${n}) ---`);
  console.log(`    chain dims: (${sheaf.dims.join(", ")})`);
  console.log(`    rank d_${n}: ${matRank(sheaf.dMaps[n - 1])}`);
  const [status, info] = realizeFullDegeneracy(sheaf, n);
  let expectation = "";
  if (expect !== null) {
    expectation = ` (expected ${expect})  ${status === expect ? "✓" : "✗ MISMATCH"}`;
  }
  console.log(`    full nonzero degeneracy: ${status}${expectation}`);
  console.log(`    info: ${info}`);
}

function main() {
  console.log("=".repeat(70));
  console.log("PATH GRAPHS — predicted UNREALIZABLE (Sturm)");
  console.log("=".repeat(70));
  check("P_2", pathP(2), 1, "realizable"); // only 1 nonzero ev — trivial
  check("P_3", pathP(3), 1, "unrealizable");
  check("P_4", pathP(4), 1, "unrealizable");

  console.log();
  console.log("=".repeat(70));
  console.log("CYCLE GRAPHS — predicted REALIZABLE");
  console.log("=".repeat(70));
  check("C_3", cycleC(3), 1, "realizable");
  check("C_4", cycleC(4), 1, "realizable");

  console.log();
  console.log("=".repeat(70));
  console.log("STARS — predicted REALIZABLE for n >= 2");
  console.log("=".repeat(70));
  check("K_{1,2}", starK(2), 1, "realizable");
  check("K_{1,3}", starK(3), 1, "realizable");

  console.log();
  console.log("=".repeat(70));
  console.log("COMPLETE GRAPHS K_3 — predicted REALIZABLE");
  console.log("=".repeat(70));
  check("K_3", completeK(3), 1, "realizable");

  console.log();
  console.log("=".repeat(70));
  console.log("partial Delta^2 (= K_3 cellular)");
  console.log("=".repeat(70));
  check("partial Delta^2", boundarySimplex(2), 1, "realizable");
}

main();
