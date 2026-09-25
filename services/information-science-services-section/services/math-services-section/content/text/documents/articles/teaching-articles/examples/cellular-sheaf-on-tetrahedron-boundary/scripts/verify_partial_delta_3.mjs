/**
 * Verifies examples/cellular-sheaf-on-tetrahedron-boundary.md and
 * examples/moduli-strata-classification.md.
 *
 * Verify the moduli of Laplacianizations on the boundary of the 3-simplex
 * (tetrahedron).
 *
 * Expected:
 *     - Chain dim (4, 6, 4) — vertices, edges, triangles of partial Delta^3.
 *     - Boundary maps d_1 (signed incidence edges->vertices), d_2 (triangles->edges).
 *     - Betti: H_0 = R, H_1 = 0, H_2 = R (homology of S^2).
 *     - Bipartite content arises with cross-degree pairings.
 *
 * Port of verify_partial_delta_3.py.
 */

import {
  examplePartialDelta3, hodgeEigenvalues, spectrumSignature, checkChainComplex, fmtEigs,
} from "../../../../../../../../src/chain-complex.mjs";
import { identity, diag, rank, shape } from "../../../../../../../../src/matrix.mjs";

function main() {
  const dMaps = examplePartialDelta3();
  const [d1, d2] = dMaps;

  console.log("Boundary of 3-simplex (tetrahedron):");
  console.log(`  Chain dims: ${shape(d1)[1]}_2 -> ${shape(d1)[0]}_1 -> ${shape(d2)[1]}_0  ... wait`);
  console.log(`  d_1 shape: (${shape(d1).join(", ")})  (cols = edges, rows = vertices)`);
  console.log(`  d_2 shape: (${shape(d2).join(", ")})  (cols = triangles, rows = edges)`);
  console.log();

  checkChainComplex([d1, d2]);
  console.log("  d_1 d_2 = 0 ✓");

  const rankD1 = rank(d1);
  const rankD2 = rank(d2);
  console.log(`  rank(d_1) = ${rankD1}, rank(d_2) = ${rankD2}`);
  console.log(`  Betti numbers: H_0 = R^${4 - rankD1}, H_1 = R^${6 - rankD1 - rankD2}, H_2 = R^${4 - rankD2}`);
  console.log();

  console.log("--- Uniform inner products Q_n = I ---");
  let Qs = [identity(4), identity(6), identity(4)];
  for (let n = 0; n < 3; n++) {
    console.log(`  Delta_${n} eigenvalues: ${fmtEigs(hodgeEigenvalues(dMaps, Qs, n))}`);
  }
  let sig = spectrumSignature(dMaps, Qs);
  console.log(`  Bipartite multipartition (block count): ${sig.length}`);
  for (const B of sig) {
    console.log(`    block of size ${B.length}: [${B.map(([n, i]) => `(${n}, ${i})`).join(", ")}]`);
  }
  console.log();

  console.log("--- Q_0 = diag(1,2,3,4), Q_1 = Q_2 = I ---");
  Qs = [diag([1, 2, 3, 4]), identity(6), identity(4)];
  for (let n = 0; n < 3; n++) {
    console.log(`  Delta_${n} eigenvalues: ${fmtEigs(hodgeEigenvalues(dMaps, Qs, n))}`);
  }
  sig = spectrumSignature(dMaps, Qs);
  console.log(`  Bipartite multipartition (block count): ${sig.length}`);
}

main();
