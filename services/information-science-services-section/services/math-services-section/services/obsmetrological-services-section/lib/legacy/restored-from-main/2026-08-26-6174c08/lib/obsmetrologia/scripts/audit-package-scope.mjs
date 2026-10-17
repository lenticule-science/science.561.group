#!/usr/bin/env node

import { existsSync, readFileSync, readdirSync, statSync } from "node:fs";
import { dirname, extname, join, relative, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const HERE = dirname(fileURLToPath(import.meta.url));
const DEFAULT_ROOT = resolve(HERE, "..");

function filesBelow(root, extensions) {
  if (!existsSync(root)) return [];
  const files = [];
  const pending = [root];
  while (pending.length > 0) {
    const at = pending.pop();
    for (const entry of readdirSync(at, { withFileTypes: true })) {
      if (entry.name === "_archive" || entry.name === ".lake") continue;
      const path = join(at, entry.name);
      if (entry.isDirectory()) pending.push(path);
      else if (entry.isFile() && extensions.has(extname(entry.name))) files.push(path);
    }
  }
  return files.sort();
}

export function auditPackageScope(packageRoot = DEFAULT_ROOT) {
  const root = resolve(packageRoot);
  if (!statSync(root).isDirectory()) throw new Error(`package root is not a directory: ${root}`);
  const policyPath = join(root, "package-scope.json");
  const policy = JSON.parse(readFileSync(policyPath, "utf8"));
  const violations = [];

  for (const forbiddenPath of policy.forbiddenPaths) {
    if (existsSync(join(root, forbiddenPath))) {
      violations.push({ kind: "forbidden-path", path: forbiddenPath });
    }
  }

  const extensions = new Set(policy.extensions);
  const patterns = policy.forbiddenPatterns.map((entry) => ({
    ...entry,
    expression: new RegExp(entry.pattern, entry.flags ?? ""),
  }));
  const activeFiles = [
    ...policy.scanRoots.flatMap((scanRoot) => filesBelow(join(root, scanRoot), extensions)),
    ...(policy.scanFiles ?? []).map((scanFile) => join(root, scanFile)).filter(existsSync),
  ];
  for (const path of [...new Set(activeFiles)].sort()) {
      const text = readFileSync(path, "utf8");
      for (const pattern of patterns) {
        pattern.expression.lastIndex = 0;
        if (pattern.expression.test(text)) {
          violations.push({
            kind: "forbidden-pattern",
            path: relative(root, path),
            pattern: pattern.pattern,
            reason: pattern.reason,
          });
        }
      }
  }

  const importFiles = [
    ...(policy.leanImportRoots ?? []).flatMap((scanRoot) => filesBelow(join(root, scanRoot), new Set([".lean"]))),
    ...(policy.leanImportFiles ?? []).map((scanFile) => join(root, scanFile)).filter(existsSync),
  ];
  for (const path of [...new Set(importFiles)].sort()) {
    const source = readFileSync(path, "utf8");
    for (const match of source.matchAll(/^import\s+([^\s]+)/gm)) {
      const imported = match[1];
      const allowed = policy.allowedLeanImportPrefixes.some(
        (prefix) => imported === prefix || imported.startsWith(`${prefix}.`),
      );
      if (!allowed) {
        violations.push({
          kind: "foreign-lean-import",
          path: relative(root, path),
          imported,
          allowedPrefixes: policy.allowedLeanImportPrefixes,
          reason: "Applications may import Obsmetrologia; Obsmetrologia may not import applications.",
        });
      }
    }
  }

  return {
    policyId: policy.policyId,
    positiveObligation: policy.positiveObligation,
    packageRoot: root,
    ok: violations.length === 0,
    violations,
  };
}

if (process.argv[1] === fileURLToPath(import.meta.url)) {
  const rootArg = process.argv.find((arg) => arg.startsWith("--root="));
  const result = auditPackageScope(rootArg ? rootArg.slice("--root=".length) : DEFAULT_ROOT);
  process.stdout.write(`${JSON.stringify(result, null, 2)}\n`);
  if (process.argv.includes("--fail") && !result.ok) process.exitCode = 1;
}
