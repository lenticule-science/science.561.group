/**
 * Verifies examples/iep-g-cellular-catalog.md.
 *
 * IEP-G: distinguish "any within-degree multiplicity" from "full degeneracy"
 * on small cellular sheaves.
 *
 * For low-rank cases (rank d_n <= 2), the two coincide.
 * For higher-rank, full degeneracy is strictly stronger.
 *
 * Predictions vs results:
 *     P_n: NEITHER realizable (paths admit no spectral degeneracy at all).
 *     K_3, C_3, partial Delta^2: BOTH realizable at uniform weights.
 *     K_{1,3}: ANY realizable; FULL not (gives mult (2,1) not (3)).
 *
 * Port of iep_g_full_vs_any.py.
 */

import {
  pathP, cycleC, starK, completeK, boundarySimplex,
  realizeAnyMultiplicity, realizeFullDegeneracy,
} from "../../../../../../../../src/cellular-sheaf.mjs";
import { rank as matRank } from "../../../../../../../../src/matrix.mjs";

function report(label, sheaf, n = 1) {
  console.log(`\n--- ${label} (degree ${n}) ---`);
  console.log(`    chain dims: (${sheaf.dims.join(", ")}), rank d_${n} = ${matRank(sheaf.dMaps[n - 1])}`);

  const [anyStatus] = realizeAnyMultiplicity(sheaf, n);
  console.log(`    ANY multiplicity > 1:  ${anyStatus}`);

  const [fullStatus] = realizeFullDegeneracy(sheaf, n);
  console.log(`    FULL nonzero-degeneracy: ${fullStatus}`);
}

function main() {
  console.log("=".repeat(70));
  console.log("Path graphs (admit no spectral multiplicity)");
  console.log("=".repeat(70));
  report("P_3", pathP(3));
  report("P_4", pathP(4));

  console.log();
  console.log("=".repeat(70));
  console.log("Symmetric small graphs (admit some multiplicity at uniform)");
  console.log("=".repeat(70));
  report("C_3", cycleC(3));
  report("C_4", cycleC(4));
  report("K_3", completeK(3));
  report("partial Delta^2", boundarySimplex(2));

  console.log();
  console.log("=".repeat(70));
  console.log("Star K_{1,n} for n >= 3 — partial degeneracy yes, full no");
  console.log("=".repeat(70));
  report("K_{1,3}", starK(3));
}

main();
