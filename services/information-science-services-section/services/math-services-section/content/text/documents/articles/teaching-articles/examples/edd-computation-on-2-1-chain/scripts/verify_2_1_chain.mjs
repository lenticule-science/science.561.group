/**
 * Verify the (2,1) chain complex used in the EDD = 40 example.
 *
 * Chain: (C_0, C_1, C_2) = (2, 3, 1)
 *     d_1 = [[1, 0, 0], [0, 1, 0]]
 *     d_2 = [0, 0, 1]^T
 *
 * Verifies:
 *     - Stratification I (eigenvalue multipartition) on the SPD interior:
 *       generic Hilbert structure -> open stratum;
 *       tuned weights -> Pi_T (supersymmetric) sub-stratum.
 *     - Stratification II (Pataki + Schubert) at the boundary:
 *       identifying which boundary stratum corresponds to each EDD-singular component.
 *
 * Port of verify_2_1_chain.py.
 */

import {
  example2_1Chain, hodgeEigenvalues, spectrumSignature, fmtEigs,
} from "../../../../../../../../src/chain-complex.mjs";
import { identity, diag, fromInts } from "../../../../../../../../src/matrix.mjs";
import { enumerateFullStratificationIi } from "../../../../../../../../src/stratification-ii.mjs";

function fmtSig(sig) {
  return `(${sig.map((B) => `frozenset({${B.map(([n, i]) => `(${n}, ${i})`).join(", ")}})`).join(", ")}${sig.length === 1 ? "," : ""})`;
}

function stratificationIDemo() {
  console.log("=".repeat(70));
  console.log("Stratification I (interior eigenvalue multipartition)");
  console.log("=".repeat(70));
  const dMaps = example2_1Chain();

  console.log("\n--- Generic Hilbert: Q_0 = diag(1, 2), Q_1 = diag(1, 1, 3), Q_2 = (1) ---");
  let Qs = [diag([1, 2]), diag([1, 1, 3]), fromInts([[1]])];
  for (let n = 0; n < 3; n++) {
    console.log(`  Delta_${n} eigenvalues: ${fmtEigs(hodgeEigenvalues(dMaps, Qs, n))}`);
  }
  let sig = spectrumSignature(dMaps, Qs);
  console.log(`  Bipartite multipartition: ${fmtSig(sig)}`);

  console.log("\n--- Tuned for supersymmetric: Q_0 = I, Q_1 = I, Q_2 = (1) ---");
  Qs = [identity(2), identity(3), fromInts([[1]])];
  for (let n = 0; n < 3; n++) {
    console.log(`  Delta_${n} eigenvalues: ${fmtEigs(hodgeEigenvalues(dMaps, Qs, n))}`);
  }
  sig = spectrumSignature(dMaps, Qs);
  console.log(`  Bipartite multipartition: ${fmtSig(sig)}`);
}

function describePataki(rTuple, aZ) {
  const descs = [];
  const m = [2, 3, 1];
  rTuple.forEach((r, n) => {
    if (r < m[n]) descs.push(`Q_${n} rank ${r}`);
  });
  if (descs.length === 0) descs.push("interior");
  const schubert = [];
  aZ.forEach(([a, z], n) => {
    if (a > 0 || z > 0) schubert.push(`deg ${n}: a=${a}, z=${z}`);
  });
  if (schubert.length) descs.push("Schubert: " + schubert.join("; "));
  return descs.join("; ");
}

function stratificationIiDemo() {
  console.log();
  console.log("=".repeat(70));
  console.log("Stratification II (boundary structure of $\\overline{\\mathcal H}$)");
  console.log("=".repeat(70));
  console.log();
  console.log("Chain dims (2, 3, 1), boundary ranks (rho_1, rho_2) = (2, 1)");
  console.log("Total dim of $\\overline{\\mathcal H}$ = C(3,2) + C(4,2) + C(2,2) = 3 + 6 + 1 = 10");
  console.log();
  const strata = enumerateFullStratificationIi([2, 3, 1], [2, 1, 0], 3);
  strata.sort((x, y) => x[2] - y[2] || cmpTuple(x[0], y[0]));

  console.log("Codim-1 boundary strata (rank drops by 1):");
  for (const [rTuple, aZ, total] of strata) {
    if (total === 1) {
      const label = describePataki(rTuple, aZ);
      console.log(`  r = (${rTuple.join(", ")})  Schubert (${aZ.map((p) => `(${p.join(", ")})`).join(", ")})  codim ${total}  -- ${label}`);
    }
  }

  console.log();
  console.log("Codim-3 boundary strata (matching EDD components 1, 2, 3):");
  for (const [rTuple, aZ, total] of strata) {
    if (total === 3) {
      const label = describePataki(rTuple, aZ);
      console.log(`  r = (${rTuple.join(", ")})  Schubert (${aZ.map((p) => `(${p.join(", ")})`).join(", ")})  codim ${total}  -- ${label}`);
    }
  }
}

function cmpTuple(a, b) {
  for (let i = 0; i < Math.min(a.length, b.length); i++) {
    if (a[i] !== b[i]) return a[i] - b[i];
  }
  return a.length - b.length;
}

function main() {
  stratificationIDemo();
  stratificationIiDemo();
}

main();
