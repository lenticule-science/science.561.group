/**
 * Verifies examples/moduli-of-triangle-boundary.md.
 *
 * Verify the moduli of Laplacianizations on the boundary of the 2-simplex,
 * matching examples/moduli-of-triangle-boundary.md.
 *
 * Expected:
 *     - Chain dim (3, 3) for vertices and edges (boundary of triangle).
 *     - rank d_1 = 2 (kernel = constants in C_0; image = "boundaries" of dim 2 in C_1).
 *     - H_0 = R, H_1 = R (single connected component, single 1-cycle).
 *     - Bipartite multipartition lattice: forces certain Hodge identifications;
 *       after that, eigenvalue stratification by within-degree partition.
 *
 * Port of verify_partial_delta_2.py.
 */

import {
  examplePartialDelta2, hodgeEigenvalues, spectrumSignature, fmtEigs,
} from "../../../../../../../../src/chain-complex.mjs";
import { identity, diag, rank } from "../../../../../../../../src/matrix.mjs";

function fmtSig(sig) {
  return `(${sig.map((B) => `frozenset({${B.map(([n, i]) => `(${n}, ${i})`).join(", ")}})`).join(", ")}${sig.length === 1 ? "," : ""})`;
}

function main() {
  const dMaps = examplePartialDelta2();
  const d1 = dMaps[0];

  console.log("Boundary of 2-simplex (triangle):");
  console.log("  d_1 (3 edges -> 3 vertices):");
  console.log(`Matrix([[${d1.map((row) => row.map(String).join(", ")).join("], [")}]])`);
  console.log();
  const r = rank(d1);
  console.log(`  rank(d_1) = ${r}`);
  console.log(`  H_0 = R^${3 - r}, H_1 = R^${3 - r}  (Betti = (1, 1))`);
  console.log();

  let Qs = [identity(3), identity(3)];
  console.log("--- Uniform inner products Q_0 = Q_1 = I ---");
  for (let n = 0; n < 2; n++) {
    console.log(`  Delta_${n} eigenvalues: ${fmtEigs(hodgeEigenvalues(dMaps, Qs, n))}`);
  }
  console.log(`  Bipartite multipartition: ${fmtSig(spectrumSignature(dMaps, Qs))}`);
  console.log();

  Qs = [diag([1, 2, 3]), identity(3)];
  console.log("--- Q_0 = diag(1, 2, 3), Q_1 = I ---");
  for (let n = 0; n < 2; n++) {
    console.log(`  Delta_${n} eigenvalues: ${fmtEigs(hodgeEigenvalues(dMaps, Qs, n))}`);
  }
  console.log(`  Bipartite multipartition: ${fmtSig(spectrumSignature(dMaps, Qs))}`);
  console.log();

  Qs = [diag([2, 2, 2]), diag([3, 3, 3])];
  console.log("--- Q_0 = 2I, Q_1 = 3I (Sym^3-symmetric weighting) ---");
  for (let n = 0; n < 2; n++) {
    console.log(`  Delta_${n} eigenvalues: ${fmtEigs(hodgeEigenvalues(dMaps, Qs, n))}`);
  }
  console.log(`  Bipartite multipartition: ${fmtSig(spectrumSignature(dMaps, Qs))}`);
}

main();
