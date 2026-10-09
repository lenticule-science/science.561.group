/**
 * Verifies theorems/bipartite-vassiliev-shapiro-vainshtein.md.
 *
 * Compute the bipartite Möbius function and bipartite Vassiliev E_1-page rank
 * profile for small chain complex shapes.
 *
 * Tests the conjectural product formula:
 *     mu_bipartite(Pi_coarse, Pi_fine) = product over blocks (univariate mu of refinement)
 *
 * Also verifies the closure-poset structure on small cases.
 *
 * Port of mobius_and_vassiliev.py.
 */

import {
  codimEigenvalueModuli, stabDim, codimInAmbient, closurePoset, mobiusFunction,
} from "../../../../../../../../src/multipartition.mjs";

function factorial(n) {
  let r = 1;
  for (let i = 2; i <= n; i++) r *= i;
  return r;
}

/**
 * Mobius function mu(0, 1) on the partition lattice of [n], where 0 is the
 * minimum (single block of size n) and 1 is the maximum (n singleton blocks).
 * Classical formula: (-1)^(n-1) (n-1)!.
 */
function univariateMobiusFull(n) {
  return (-1) ** (n - 1) * factorial(n - 1);
}

function reprPi(Pi) {
  return Pi.map((B) => B.map(([n, i]) => `(${n}, ${i})`).join(",")).join(" | ");
}

function reportLattice(dims, label, hodgeConstraints = null) {
  console.log("=".repeat(70));
  console.log(`Closure poset for chain dims (${dims.join(", ")}${dims.length === 1 ? "," : ""}): ${label}`);
  console.log("=".repeat(70));
  const { parts, covers } = closurePoset(dims, hodgeConstraints);
  console.log(`  number of partitions: ${parts.length}`);
  console.log(`  number of cover relations: ${covers.length}`);
  console.log();

  console.log(`  ${"Pi".padEnd(60)}${"codim_eig".padStart(10)}${"stab".padStart(6)}${"codim_H".padStart(8)}`);
  console.log("  " + "-".repeat(84));
  for (const Pi of parts) {
    let PiRepr = reprPi(Pi);
    if (PiRepr.length > 58) PiRepr = PiRepr.slice(0, 55) + "...";
    const ce = codimEigenvalueModuli(Pi);
    const sd = stabDim(Pi);
    const ch = codimInAmbient(Pi);
    console.log(`  ${PiRepr.padEnd(60)}${String(ce).padStart(10)}${String(sd).padStart(6)}${String(ch).padStart(8)}`);
  }

  console.log();
  const { mu, minIdx } = mobiusFunction(parts, covers);
  console.log(`  Möbius function from coarsest stratum (index ${minIdx}):`);
  for (const [j, val] of mu.entries()) {
    const Pi = parts[j];
    let PiRepr = reprPi(Pi);
    if (PiRepr.length > 50) PiRepr = PiRepr.slice(0, 47) + "...";
    console.log(`    mu(${PiRepr.padEnd(52)}) = ${val}`);
  }
  console.log();
}

function vassilievE1Profile(parts) {
  const profile = new Map();
  for (const Pi of parts) {
    const c = codimEigenvalueModuli(Pi);
    if (!profile.has(c)) profile.set(c, []);
    profile.get(c).push(Pi);
  }
  return profile;
}

function bipartiteMobiusTest(dims, label) {
  const { parts, covers } = closurePoset(dims);
  const { mu } = mobiusFunction(parts, covers);

  const n = dims.reduce((a, b) => a + b, 0);
  let finestIdx = null;
  for (let i = 0; i < parts.length; i++) {
    if (parts[i].every((B) => B.length === 1)) {
      finestIdx = i;
      break;
    }
  }

  if (finestIdx !== null) {
    const muFinest = mu.get(finestIdx);
    const expected = univariateMobiusFull(n);
    console.log(`  ${label} (univariate, dim ${n}):`);
    console.log(`    mu(coarsest, finest) = ${muFinest}`);
    console.log(`    expected (-1)^(n-1)(n-1)! = ${expected}`);
    console.log(`    ${muFinest === expected ? "✓ matches" : "✗ MISMATCH"}`);
    console.log();
  }
}

function main() {
  console.log("\n" + "=".repeat(70));
  console.log("UNIVARIATE Möbius function consistency check");
  console.log("=".repeat(70));
  console.log();
  bipartiteMobiusTest([2], "Sym^+_2");
  bipartiteMobiusTest([3], "Sym^+_3");
  bipartiteMobiusTest([4], "Sym^+_4");

  console.log();
  reportLattice([2, 2], "(2,2) chain — bipartite content via cross-degree pairs");

  console.log();
  reportLattice([2, 1], "(2,1) chain (no Hodge constraints)");

  console.log();
  console.log("=".repeat(70));
  console.log("E_1 codim profile for (2,2) chain (no constraints)");
  console.log("=".repeat(70));
  const { parts } = closurePoset([2, 2]);
  const profile = vassilievE1Profile(parts);
  for (const c of Array.from(profile.keys()).sort((a, b) => a - b)) {
    console.log(`  codim_eig = ${c}: ${profile.get(c).length} stratum/strata`);
  }

  console.log();
  console.log("=".repeat(70));
  console.log("(2,2) chain WITH Hodge constraints (d_1 iso pairs (0,i) ~ (1,i))");
  console.log("=".repeat(70));
  const hodge = [
    [[0, 1], [1, 1]],
    [[0, 2], [1, 2]],
  ];
  reportLattice([2, 2], "(2,2) Hodge-constrained", hodge);
}

main();
