// Family (d) -- markdown relative links and termRef resolution: WQ030-WQ032.
// Normative source: scripts/check-links.mts (absorbed verbatim as WQ030)
// plus the Weiqi engine's events module termRef convention (SPEC.md Family d).

import { existsSync, statSync } from "node:fs";
import { dirname, join, resolve, relative } from "node:path";
import { makeDiagnostic } from "./diagnostic.mjs";

const CHECK_LINKS_SOURCE = "scripts/check-links.mts";
const GLOSSARY_DIR_SOURCE = "content/text/glossary/terms/";
const EVENTS_SOURCE = "@red-cup-engineering/weiqi-engine/src/events.mts";
const SCIENCE_TERM_PREFIX = "science://lenticule-science/weiqi/terms/";

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
 * WQ032: every value in the engine's TERM_PATH table resolves to a real
 * glossary file. Published engines use the durable science:// term identity;
 * a relative value remains supported for an explicit local override.
 *
 * @param {typeof import("@red-cup-engineering/weiqi-engine")} kernel
 * @param {string} kernelPackageRoot - package root for an explicit local override.
 * @param {string} sectionRoot
 * @returns {import("./diagnostic.mjs").Diagnostic[]}
 */
export function checkKernelTermPaths(kernel, kernelPackageRoot, sectionRoot) {
  const diagnostics = [];
  for (const [term, relPath] of Object.entries(kernel.TERM_PATH)) {
    const resolvedPath = relPath.startsWith(SCIENCE_TERM_PREFIX)
      ? join(sectionRoot, "content", "text", "glossary", "terms", `${relPath.slice(SCIENCE_TERM_PREFIX.length)}.md`)
      : resolve(kernelPackageRoot, relPath);
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
