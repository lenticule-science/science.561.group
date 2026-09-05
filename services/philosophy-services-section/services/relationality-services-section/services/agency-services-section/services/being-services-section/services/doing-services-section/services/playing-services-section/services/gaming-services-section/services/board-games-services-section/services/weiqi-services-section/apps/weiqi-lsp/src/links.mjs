// Family (d) -- markdown relative links and termRef resolution: WQ030-WQ032.
// Normative source: scripts/check-links.mts (absorbed verbatim as WQ030)
// plus weiqi-kernel's events.mts termRef convention (SPEC.md Family d).

import { existsSync, statSync } from "node:fs";
import { dirname, join, resolve, relative } from "node:path";
import { makeDiagnostic } from "./diagnostic.mjs";

const CHECK_LINKS_SOURCE = "scripts/check-links.mts";
const GLOSSARY_DIR_SOURCE = "content/text/glossary/terms/";
const EVENTS_SOURCE = "apps/weiqi-kernel/src/events.mts";

/** This section's own mounted site-rooted prefix for glossary terms, per WQ031. */
const TERM_PREFIX = "/games/topics/board-games/weiqi/terms/";

const LINK_RE = /\[[^\]]*\]\(([^)]+)\)/g;

/**
 * WQ030: `scripts/check-links.mts`'s four steps, unchanged in scope --
 * every markdown `[text](target)` link, skipping external/mailto/anchor/
 * absolute-`/`-rooted targets, must resolve to a real file relative to the
 * containing file's own directory.
 *
 * @param {string} text
 * @param {string} file - path relative to the section root, used in diagnostics.
 * @param {string} absolutePath - the file's real filesystem path.
 * @returns {import("./diagnostic.mjs").Diagnostic[]}
 */
export function checkRelativeLinks(text, file, absolutePath) {
  const diagnostics = [];
  const lines = text.split("\n");
  lines.forEach((line, idx) => {
    let m;
    LINK_RE.lastIndex = 0;
    while ((m = LINK_RE.exec(line)) !== null) {
      const target = m[1].trim();
      if (/^(https?:|mailto:|#|\/)/.test(target)) continue;
      const [pathPart] = target.split("#");
      if (!pathPart) continue;
      const resolved = resolve(dirname(absolutePath), pathPart);
      if (!existsSync(resolved) || !statSync(resolved).isFile()) {
        diagnostics.push(
          makeDiagnostic({
            code: "WQ030",
            severity: "error",
            file,
            message: `Broken relative link "${target}" does not resolve to a file.`,
            source: CHECK_LINKS_SOURCE,
            start: { line: idx + 1, column: m.index + 1 },
          }),
        );
      }
    }
  });
  return diagnostics;
}

/**
 * WQ031: does a `/`-rooted path under this section's own mounted prefix
 * resolve to a real glossary file? Returns null when `pathStr` does not
 * fall under the prefix at all (out of this rule's scope, not a pass/fail).
 *
 * @param {string} pathStr
 * @param {string} sectionRoot
 * @returns {{ok: boolean, resolvedPath: string}|null}
 */
export function checkSiteRootedTermPath(pathStr, sectionRoot) {
  if (!pathStr.startsWith(TERM_PREFIX)) return null;
  const slug = pathStr.slice(TERM_PREFIX.length);
  const resolvedPath = join(sectionRoot, "content", "text", "glossary", "terms", slug);
  return { ok: existsSync(resolvedPath) && statSync(resolvedPath).isFile(), resolvedPath };
}

/**
 * Build a WQ031 diagnostic for a failed checkSiteRootedTermPath result.
 * @param {string} pathStr
 * @param {string} file
 * @param {number} line
 */
export function makeWq031Diagnostic(pathStr, file, line) {
  return makeDiagnostic({
    code: "WQ031",
    severity: "error",
    file,
    message: `Site-rooted term path "${pathStr}" does not map to a real glossary file under ${GLOSSARY_DIR_SOURCE}.`,
    source: GLOSSARY_DIR_SOURCE,
    start: { line, column: 1 },
  });
}

/**
 * WQ032: every value in weiqi-kernel's events.mts TERM_PATH table resolves,
 * from the kernel package root, to a real glossary file.
 *
 * @param {typeof import("../../weiqi-kernel/src/index.mts")} kernel
 * @param {string} kernelPackageRoot - apps/weiqi-kernel, i.e. two levels above src/index.mts.
 * @param {string} sectionRoot
 * @returns {import("./diagnostic.mjs").Diagnostic[]}
 */
export function checkKernelTermPaths(kernel, kernelPackageRoot, sectionRoot) {
  const diagnostics = [];
  for (const [term, relPath] of Object.entries(kernel.TERM_PATH)) {
    const resolvedPath = resolve(kernelPackageRoot, relPath);
    if (!existsSync(resolvedPath) || !statSync(resolvedPath).isFile()) {
      diagnostics.push(
        makeDiagnostic({
          code: "WQ032",
          severity: "error",
          file: relative(sectionRoot, kernelPackageRoot) + "/src/events.mts",
          message: `TERM_PATH["${term}"] = "${relPath}" does not resolve to a real glossary file (resolved: ${relative(sectionRoot, resolvedPath)}).`,
          source: EVENTS_SOURCE,
        }),
      );
    }
  }
  return diagnostics;
}
