#!/usr/bin/env node

import { mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const root = process.cwd();
const coverageDir = join(root, "sites", "docs", "coverage");
const auditPath = join(coverageDir, "lean-frontier-audit.json");
const outJsonPath = join(coverageDir, "collatz-frontier-audit.json");
const outMarkdownPath = join(coverageDir, "collatz-frontier-audit.md");

const oneLockChecks = [
  {
    file: "Obsmetrologia/Closure/Collatz/Reduction.lean",
    kind: "def",
    declaration: "ParentBarrierOneLockCollapse",
    role: "named proposition: ParentBarrierGap -> NoPositiveInfiniteBarrierStream",
  },
  {
    file: "Obsmetrologia/Closure/Collatz/Reduction.lean",
    kind: "theorem",
    declaration: "frontierInputs_iff_parentBarrierGap_and_oneLock",
    role: "frontier package is gap plus named one-lock",
  },
  {
    file: "Obsmetrologia/Closure/Collatz/Settling.lean",
    kind: "theorem",
    declaration: "parentBarrierOneLockCollapse_iff_parentBarrierGap_alone_solves_kappa_package",
    role: "one-lock is equivalent to the parent-gap kappa package",
  },
  {
    file: "Obsmetrologia/AperiodicOrder/Tiling/CollatzTwoAdicLock.lean",
    kind: "theorem",
    declaration: "parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_alone_solves_kappa_package",
    role: "one-lock is equivalent to the cylinder-lift kappa package",
  },
  {
    file: "Obsmetrologia/AperiodicOrder/Tiling/CollatzTwoAdicLock.lean",
    kind: "theorem",
    declaration: "kappaPackage_of_twoAdicCylinderLiftGap_and_oneLock",
    role: "forward kappa package from cylinder-lift gap plus named one-lock",
  },
];

function fail(message) {
  console.error(`Collatz frontier audit: ${message}`);
  process.exitCode = 1;
}

function escapeRegex(text) {
  return text.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

function declarationExists({ file, kind, declaration }) {
  const source = readFileSync(join(root, file), "utf8");
  const pattern = new RegExp(`\\b${escapeRegex(kind)}\\s+${escapeRegex(declaration)}\\b`);
  return pattern.test(source);
}

let audit;
try {
  audit = JSON.parse(readFileSync(auditPath, "utf8"));
} catch (error) {
  fail(`could not read ${auditPath}; run scripts/audit-lean-frontier.mjs first`);
  process.exit();
}

const trustSites = audit.trustSites ?? [];

if (trustSites.length !== 0) {
  fail(`expected no hard trust surfaces, found ${trustSites.length}`);
}

const oneLockResults = oneLockChecks.map((check) => {
  let present = false;
  let error = null;
  try {
    present = declarationExists(check);
  } catch (caught) {
    error = caught instanceof Error ? caught.message : String(caught);
  }
  if (!present) {
    fail(
      `expected one-lock accounting declaration ${check.file} / ${check.declaration}`,
    );
  }
  return { ...check, present, error };
});

const result = {
  trustSites,
  oneLockAccounting: {
    status:
      "checked as named proposition/equivalence layer; this audit does not mark the one-lock implication proved",
    checks: oneLockResults,
  },
};

mkdirSync(coverageDir, { recursive: true });
writeFileSync(outJsonPath, `${JSON.stringify(result, null, 2)}\n`, "utf8");
writeFileSync(
  outMarkdownPath,
  [
    "# Collatz Frontier Audit",
    "",
    `- Hard trust surfaces: ${trustSites.length}`,
    "- One-lock status: checked as named proposition/equivalence layer, not as a proved implication.",
    "",
    "## One-Lock Accounting Checks",
    "",
    "| declaration | kind | file | present | role |",
    "|---|---|---|---:|---|",
    ...oneLockResults.map((check) =>
      `| \`${check.declaration}\` | ${check.kind} | \`${check.file}\` | ${
        check.present ? "yes" : "no"
      } | ${check.role} |`,
    ),
    "",
  ].join("\n"),
  "utf8",
);

if (process.exitCode) {
  process.exit();
}

console.log(
  "Collatz frontier audit: no hard trust surfaces; one-lock accounting checked -> ParentBarrierOneLockCollapse",
);
