import assert from "node:assert/strict";
import { mkdtempSync, mkdirSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import { dirname, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import test from "node:test";

import { auditPackageScope } from "../scripts/audit-package-scope.mjs";

const PACKAGE_ROOT = resolve(dirname(fileURLToPath(import.meta.url)), "..");

test("the active Obsmetrologia package satisfies its pure-mathematics boundary", () => {
  const result = auditPackageScope(PACKAGE_ROOT);
  assert.equal(result.ok, true, JSON.stringify(result.violations));
});

test("the boundary gate rejects a reintroduced Hoare-program module", (context) => {
  const fixture = mkdtempSync(join(tmpdir(), "obsmetrologia-scope-"));
  context.after(() => rmSync(fixture, { recursive: true, force: true }));
  mkdirSync(join(fixture, "Obsmetrologia", "Computing"), { recursive: true });
  mkdirSync(join(fixture, "docs", "blueprint", "src"), { recursive: true });
  mkdirSync(join(fixture, "docs", "verso", "ObsmetrologiaManual"), { recursive: true });
  writeFileSync(
    join(fixture, "package-scope.json"),
    JSON.stringify({
      policyId: "test-boundary",
      positiveObligation: "applications remain outside",
      scanRoots: ["Obsmetrologia", "docs/blueprint/src", "docs/verso/ObsmetrologiaManual"],
      scanFiles: ["Obsmetrologia.lean"],
      leanImportRoots: ["Obsmetrologia"],
      leanImportFiles: ["Obsmetrologia.lean"],
      extensions: [".lean", ".tex"],
      forbiddenPaths: ["Obsmetrologia/Computing/HoareProgram.lean"],
      forbiddenPatterns: [{ pattern: "\\bHoare(?:[- ]program|Program)s?\\b", flags: "i", reason: "application carrier" }],
      allowedLeanImportPrefixes: ["Obsmetrologia", "Lean"],
    }),
  );
  writeFileSync(
    join(fixture, "Obsmetrologia", "Computing", "HoareProgram.lean"),
    "namespace Obsmetrologia.Computing\nstructure HoareProgram where\nend Obsmetrologia.Computing\n",
  );

  const result = auditPackageScope(fixture);
  assert.equal(result.ok, false);
  assert.ok(result.violations.some((item) => item.kind === "forbidden-path"));
  assert.ok(result.violations.some((item) => item.kind === "forbidden-pattern"));
});

test("the boundary gate rejects any application import under an unrelated name", (context) => {
  const fixture = mkdtempSync(join(tmpdir(), "obsmetrologia-import-scope-"));
  context.after(() => rmSync(fixture, { recursive: true, force: true }));
  mkdirSync(join(fixture, "Obsmetrologia"), { recursive: true });
  mkdirSync(join(fixture, "docs", "blueprint", "src"), { recursive: true });
  mkdirSync(join(fixture, "docs", "verso", "ObsmetrologiaManual"), { recursive: true });
  writeFileSync(
    join(fixture, "package-scope.json"),
    JSON.stringify({
      policyId: "test-import-boundary",
      positiveObligation: "applications remain outside",
      scanRoots: ["Obsmetrologia", "docs/blueprint/src", "docs/verso/ObsmetrologiaManual"],
      scanFiles: ["Obsmetrologia.lean"],
      leanImportRoots: ["Obsmetrologia"],
      leanImportFiles: ["Obsmetrologia.lean"],
      extensions: [".lean", ".tex"],
      forbiddenPaths: [],
      forbiddenPatterns: [],
      allowedLeanImportPrefixes: ["Obsmetrologia", "Lean"],
    }),
  );
  writeFileSync(join(fixture, "Obsmetrologia.lean"), "import VendorApplication.Runtime\n");

  const result = auditPackageScope(fixture);
  assert.equal(result.ok, false);
  assert.deepEqual(
    result.violations.map((item) => item.kind),
    ["foreign-lean-import"],
  );
});
