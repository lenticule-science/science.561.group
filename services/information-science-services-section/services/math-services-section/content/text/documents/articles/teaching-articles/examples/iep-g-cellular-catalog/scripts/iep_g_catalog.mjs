/**
 * Verifies examples/iep-g-cellular-catalog.md.
 *
 * IEP-G realizability catalog: test which graphs realize the supersymmetric
 * (full-degeneracy) within-degree stratum.
 *
 * Expected:
 *     P_n  : NOT realizable (Sturm tridiagonal-simplicity).
 *     C_n  : realizable for n >= 3 at uniform weights.
 *     K_{1,n} (star): realizable iff n >= 2 (rotational symmetry around center).
 *     K_n  : realizable at uniform weights (S_n symmetry).
 *     partial Delta^k: realizable at uniform weights.
 *
 * Port of iep_g_catalog.py.
 */

import {
  pathP, cycleC, starK, completeK, boundarySimplex, realizeFullDegeneracy,
} from "../../../../../../../../src/cellular-sheaf.mjs";
import { fmtEigs } from "../../../../../../../../src/chain-complex.mjs";
import { valueToNumber as vtn } from "../../../../../../../../src/exact-arith.mjs";

function section(title) {
  console.log();
  console.log("=".repeat(70));
  console.log(title);
  console.log("=".repeat(70));
}

function report(label, sheaf, n = 1) {
  console.log(`\n--- ${label}  (testing degree-${n} squared singular values) ---`);
  console.log(`    chain dims: (${sheaf.dims.join(", ")})`);
  const [status, info] = realizeFullDegeneracy(sheaf, n);
  console.log(`    full-degeneracy: ${status}`);
  console.log(`    info: ${info}`);

  if (Math.max(...sheaf.dims) <= 6) {
    const evs = sheaf.allEigenvaluesAtUniform(n);
    console.log(`    spectrum at uniform weights: ${fmtEigs(evs)}`);
  }
}

function main() {
  section("PATH GRAPHS — predicted UNREALIZABLE (Sturm)");
  for (const n of [2, 3, 4]) report(`P_${n}`, pathP(n), 1);

  section("CYCLE GRAPHS — predicted REALIZABLE at uniform weights");
  for (const n of [3, 4]) report(`C_${n}`, cycleC(n), 1);

  section("STAR GRAPHS K_{1,n} — predicted REALIZABLE for n >= 2");
  for (const n of [2, 3, 4]) report(`K_{1,${n}}`, starK(n), 1);

  section("COMPLETE GRAPHS K_n — predicted REALIZABLE at uniform weights");
  for (const n of [3, 4]) report(`K_${n}`, completeK(n), 1);

  section("BOUNDARY OF 2-SIMPLEX (triangle) — predicted REALIZABLE");
  const ds2 = boundarySimplex(2);
  for (let n = 1; n <= ds2.N; n++) report(`partial Delta^2, degree ${n}`, ds2, n);

  // partial Delta^3 has 4 vertices, 6 edges, 4 triangles — symbolic
  // discriminant too expensive at full pencil. Test only at uniform weights.
  section("BOUNDARY OF 3-SIMPLEX (tetrahedron) — uniform-weight check only");
  const ds3 = boundarySimplex(3);
  for (let n = 1; n <= ds3.N; n++) {
    const evs = ds3.allEigenvaluesAtUniform(n);
    const nonzero = evs.filter((e) => vtn(e) !== 0);
    const allEqual = new Set(nonzero.map((e) => e.toString())).size <= 1;
    console.log(`\n--- partial Delta^3, degree ${n} (uniform weights) ---`);
    console.log(`    chain dims: (${ds3.dims.join(", ")})`);
    console.log(`    spectrum: ${fmtEigs(evs)}`);
    console.log(`    nonzero eigenvalues all equal: ${allEqual ? "True" : "False"}`);
  }
}

main();
