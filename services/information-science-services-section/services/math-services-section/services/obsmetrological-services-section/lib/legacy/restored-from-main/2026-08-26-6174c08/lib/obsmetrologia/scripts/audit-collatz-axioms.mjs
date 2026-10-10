#!/usr/bin/env node

import { mkdirSync, unlinkSync, writeFileSync } from "node:fs";
import { join } from "node:path";
import { spawnSync } from "node:child_process";

const root = process.cwd();
const coverageDir = join(root, "sites", "docs", "coverage");
const tempLeanPath = join(coverageDir, ".collatz-axiom-audit.lean");
const outJsonPath = join(coverageDir, "collatz-axiom-audit.json");
const outMarkdownPath = join(coverageDir, "collatz-axiom-audit.md");

const allowedAxioms = new Set(["propext", "Quot.sound"]);

const declarations = [
  {
    name: "Obsmetrologia.Closure.Collatz.closureOrdinalStage_iff_totalStoppingStage",
    role: "stagewise kappa equals total stopping stage",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.exists_totalStoppingStage_iff_closureOrdinalStage",
    role: "existential total stopping / closure-stage bridge",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.kappaPackage_of_parentBarrierGap_and_oneLock",
    role: "forward kappa package from parent gap plus one-lock",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.kappaPackage_of_residueGap_and_oneLock",
    role: "forward kappa package from residue gap plus one-lock",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.parentBarrierOneLockCollapse_iff_parentBarrierGap_alone_solves_kappa_package",
    role: "one-lock equivalence at the parent-gap face",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.badCylinderSeed_of_semigroup_certificate",
    role: "bad semigroup membership yields a non-descending cylinder seed",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.semigroup_certificate_of_badCylinderSeed",
    role: "non-descending cylinder seed yields bad semigroup membership",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.inTwoGenSemigroup_iff_badCylinderSeed",
    role: "semigroup membership equals bad-cylinder membership",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_no_badCylinderSeed",
    role: "parent gap as bad-cylinder language emptiness",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.parentBarrier_inverseResidue_is_backwardSeed",
    role: "inverse residue is the first-passage backward seed",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.inTwoGenSemigroup_iff_badBackwardSeed",
    role: "semigroup membership equals bad backward seed",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_no_badBackwardSeed",
    role: "parent gap as bad backward seed language emptiness",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_backwardSeeds_descend",
    role: "parent gap equals descent of first-passage backward seeds",
  },
  {
    name: "Obsmetrologia.Ord.ofNat_le_ofNat_iff",
    role: "finite ordinal embedding reflects finite order",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.firstPassageBackwardSeed_descent_iff_fullCarry",
    role: "backward-seed descent equals ordinal full carry",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.firstPassageBackwardCarryQuotient_eq_descentAmount",
    role: "backward carry quotient equals descent amount",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.firstPassageBackwardSeed_fullCarry_iff_carryQuotient_positive",
    role: "full carry equals positive carry quotient",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.firstPassageBackwardSeed_carryQuotient_positive_iff_not_bad",
    role: "positive carry quotient equals not-bad backward seed",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.firstPassageBackwardSeedCell_active_iff_bad",
    role: "claim-without-token boundary cell equals bad backward seed",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.firstPassageBackwardSeedCell_stable_iff_not_bad",
    role: "token-plus-claim boundary cell equals not-bad backward seed",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_backwardCarryQuotients_positive",
    role: "parent gap equals positive ordinal backward carry quotients",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_backwardMargins_fullCarry",
    role: "parent gap equals full ordinal carry of backward margins",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_no_activeBackwardSeedCell",
    role: "parent gap equals absence of claim-without-token boundary cells",
  },
  {
    name: "Obsmetrologia.Blowup.active_nontrivial_forward_cellType_top",
    role: "stable nontrivial forward firing lands in absurd as top firing",
  },
  {
    name: "Obsmetrologia.Blowup.active_cellType_top_iff_stable",
    role: "stable top firing exactly means absurd target",
  },
  {
    name: "Obsmetrologia.Blowup.potential_nontrivial_forward_cellType_top",
    role: "active nontrivial forward firing lands in absurd as top firing",
  },
  {
    name: "Obsmetrologia.Blowup.claimSide_firing_negates_to_tokenSide",
    role: "FOUR negation carries claim-side firing to token-side firing",
  },
  {
    name: "Obsmetrologia.Blowup.active_top_firing_negates_to_potential_top_firing",
    role: "FOUR negation carries stable top firing to active top firing",
  },
  {
    name: "Obsmetrologia.Blowup.active_d4_bypass_cycle",
    role: "D4 rotation carries stable through potential, active, absurd",
  },
  {
    name: "Obsmetrologia.Blowup.active_d4_bypass_first_firing",
    role: "D4 stable bypass reaches the token-side firing first",
  },
  {
    name: "Obsmetrologia.Order.CommutingNuclei.transferring_without_saturating_not_pi_fixed",
    role: "transferring-fixed but unsaturated point is not joint-closure fixed",
  },
  {
    name: "Obsmetrologia.Order.CommutingNuclei.transferring_without_saturating_pi_ascends",
    role: "transferring-fixed but unsaturated point ascends under joint closure",
  },
  {
    name: "Obsmetrologia.Order.NuclearQuartet.active_not_stable_fixed_of_not_potential",
    role: "stable but not active corner is not absurd fixed",
  },
  {
    name: "Obsmetrologia.Order.NuclearQuartet.active_not_potential_stable_ascends",
    role: "stable but not active corner ascends under absurd operator",
  },
  {
    name: "Obsmetrologia.AperiodicOrder.Tiling.badBackwardSeedCell_induces_fSideFiring",
    role: "bad backward-seed boundary induces ungrounded claim-side firing",
  },
  {
    name: "Obsmetrologia.AperiodicOrder.Tiling.badBackwardSeedCell_negates_to_tSideFiring",
    role: "bad backward-seed boundary is gauge-carried to token-side firing",
  },
  {
    name: "Obsmetrologia.AperiodicOrder.Tiling.badBackwardSeedCell_d4_bypasses_to_tSideFiring",
    role: "bad backward-seed boundary D4-bypasses to token-side firing",
  },
  {
    name: "Obsmetrologia.AperiodicOrder.Tiling.badBackwardSeedCell_activeToStable_isTopFiring",
    role: "bad backward-seed stable boundary fires upward to absurd as top",
  },
  {
    name: "Obsmetrologia.AperiodicOrder.Tiling.badBackwardSeedCell_isTransferring",
    role: "bad backward-seed boundary is the transferring nucleus corner",
  },
  {
    name: "Obsmetrologia.AperiodicOrder.Tiling.parentBarrierGap_iff_noUngroundedClaimSideFiringAtParentBarrier",
    role: "parent gap equals absence of ungrounded claim-side firings",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.firstPassage_seed_residue",
    role: "first-passage seeds solve the parent-barrier residue equation",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.parentBarrier_residue_realizes_firstPassage",
    role: "inverse residue realizes the first-passage cylinder",
  },
  {
    name: "Obsmetrologia.Closure.Collatz.parentBarrier_residue_descent_iff_gap",
    role: "inverse-residue descent equals the residue inequality",
  },
  {
    name: "Obsmetrologia.AperiodicOrder.Tiling.parentBarrierGap_iff_parentBarrierTwoAdicCylinderLiftGap",
    role: "parent gap equals positive two-adic cylinder-lift face",
  },
  {
    name: "Obsmetrologia.AperiodicOrder.Tiling.twoAdicPositiveCylinderLift_iff_modulus_le_sub",
    role: "positive cylinder lift equals congruence plus full carry",
  },
  {
    name: "Obsmetrologia.AperiodicOrder.Tiling.parentBarrierTwoAdicCylinderLiftGap_iff_carryGap",
    role: "positive cylinder-lift face equals the carry inequality face",
  },
  {
    name: "Obsmetrologia.AperiodicOrder.Tiling.parentBarrierTwoAdicCarryQuotientOrdinal_eq_backwardCarryQuotient",
    role: "two-adic quotient ordinal equals backward carry quotient",
  },
  {
    name: "Obsmetrologia.AperiodicOrder.Tiling.parentBarrierTwoAdicCarryQuotientPositive_iff_ordinal",
    role: "two-adic quotient positivity as finite ordinal positivity",
  },
  {
    name: "Obsmetrologia.AperiodicOrder.Tiling.parentBarrierTwoAdicCarryQuotientPositive_iff_backwardCarryQuotients_positive",
    role: "two-adic quotient face equals positive backward carry quotients",
  },
  {
    name: "Obsmetrologia.AperiodicOrder.Tiling.parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCylinderLiftGap",
    role: "residue carry face equals positive two-adic cylinder lift",
  },
  {
    name: "Obsmetrologia.AperiodicOrder.Tiling.parentBarrierResidueGap_iff_parentBarrierTwoAdicCylinderLiftGap",
    role: "residue inequality face equals positive two-adic cylinder lift",
  },
  {
    name: "Obsmetrologia.AperiodicOrder.Tiling.parentBarrierTwoAdicCylinderLiftGap_iff_cylinderSeeds_descend",
    role: "two-adic cylinder-lift face equals cylinder-seed descent",
  },
  {
    name: "Obsmetrologia.AperiodicOrder.Tiling.parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_alone_solves_kappa_package",
    role: "one-lock equivalence at the cylinder-lift face",
  },
  {
    name: "Obsmetrologia.AperiodicOrder.Tiling.kappaPackage_of_twoAdicCarryGap_and_oneLock",
    role: "forward kappa package from two-adic carry gap plus one-lock",
  },
  {
    name: "Obsmetrologia.AperiodicOrder.Tiling.kappaPackage_of_twoAdicUniqueResidueGap_and_oneLock",
    role: "forward kappa package from unique residue gap plus one-lock",
  },
  {
    name: "Obsmetrologia.AperiodicOrder.Tiling.kappaPackage_of_twoAdicCarryQuotientPositive_and_oneLock",
    role: "forward kappa package from positive carry quotient plus one-lock",
  },
  {
    name: "Obsmetrologia.AperiodicOrder.Tiling.kappaPackage_of_twoAdicCylinderLiftGap_and_oneLock",
    role: "forward kappa package from positive cylinder lift plus one-lock",
  },
];

function fail(message) {
  console.error(`Collatz axiom audit: ${message}`);
  process.exitCode = 1;
}

function parseAxiomList(raw) {
  const text = raw.trim();
  if (text === "[]" || text === "") {
    return [];
  }
  return text
    .replace(/^\[/, "")
    .replace(/\]$/, "")
    .split(",")
    .map((item) => item.trim())
    .filter(Boolean);
}

mkdirSync(coverageDir, { recursive: true });
writeFileSync(
  tempLeanPath,
  [
    "import Obsmetrologia.Closure.Collatz.BackwardMargin",
    "import Obsmetrologia.Closure.Collatz.BackwardSeed",
    "import Obsmetrologia.AperiodicOrder.Tiling.CollatzTwoAdicLock",
    "",
    ...declarations.map((declaration) => `#print axioms ${declaration.name}`),
    "",
  ].join("\n"),
  "utf8",
);

const run = spawnSync("lake", ["env", "lean", tempLeanPath], {
  cwd: root,
  encoding: "utf8",
});

const output = `${run.stdout ?? ""}\n${run.stderr ?? ""}`;

try {
  unlinkSync(tempLeanPath);
} catch {
  // Best-effort cleanup; audit results below remain authoritative.
}

if (run.error) {
  fail(run.error.message);
}

if (run.status !== 0) {
  fail(`Lean exited with status ${run.status}\n${output}`);
}

const resultByName = new Map();
const noAxiomPattern = /'([^']+)'\s+does not depend on any axioms/g;
for (const match of output.matchAll(noAxiomPattern)) {
  resultByName.set(match[1], []);
}

const pattern = /'([^']+)'\s+depends on axioms:\s+\[([^\]]*)\]/g;
for (const match of output.matchAll(pattern)) {
  resultByName.set(match[1], parseAxiomList(match[2]));
}

const results = declarations.map((declaration) => {
  const axioms = resultByName.get(declaration.name);
  if (!axioms) {
    fail(`missing axiom output for ${declaration.name}`);
    return { ...declaration, axioms: [], status: "missing" };
  }
  const unexpected = axioms.filter((axiom) => !allowedAxioms.has(axiom));
  if (unexpected.length !== 0) {
    fail(`${declaration.name} depends on unexpected axioms: ${unexpected.join(", ")}`);
  }
  return {
    ...declaration,
    axioms,
    status: unexpected.length === 0 ? "ok" : "unexpected",
  };
});

const result = {
  allowedAxioms: [...allowedAxioms],
  declarations: results,
};

writeFileSync(outJsonPath, `${JSON.stringify(result, null, 2)}\n`, "utf8");
writeFileSync(
  outMarkdownPath,
  [
    "# Collatz Axiom Audit",
    "",
    `- Checked declarations: ${results.length}`,
    `- Allowed axioms: ${[...allowedAxioms].map((name) => `\`${name}\``).join(", ")}`,
    "",
    "| declaration | status | axioms | role |",
    "|---|---|---|---|",
    ...results.map((result) =>
      `| \`${result.name}\` | ${result.status} | ${result.axioms
        .map((axiom) => `\`${axiom}\``)
        .join(", ")} | ${result.role} |`,
    ),
    "",
  ].join("\n"),
  "utf8",
);

if (process.exitCode) {
  process.exit();
}

console.log(
  `Collatz axiom audit: ${results.length} green declaration(s) depend only on ${[...allowedAxioms].join(", ")}`,
);
