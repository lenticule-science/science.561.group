// Family (e) -- frontmatter conformance by `type`: WQ040-WQ044.
// Normative source: the corpus's own uniform frontmatter conventions,
// observed identically across every type: term / type: lesson file
// (SPEC.md Family e).

import { makeDiagnostic } from "./diagnostic.mjs";
import { readMarkdownFrontmatter } from "@red-cup-engineering/read-markdown-frontmatter-service";
import { checkSiteRootedTermPath } from "./links.mjs";

export function parseFrontmatter(text) {
  const parsed = readMarkdownFrontmatter(text, {
    frontmatterFormats: ["yaml"],
    yamlSourceLocations: true,
  });
  if (parsed.frontmatter === null) return null;
  const keyLines = Object.fromEntries(Object.entries(parsed.keyLocations).map(([key, location]) => [key, location.line]));
  const prefix = text.slice(0, text.length - parsed.body.length);
  return {
    data: trimDecodedStrings(parsed.frontmatter),
    keyLines,
    bodyText: parsed.body,
    bodyStartLine: prefix.split(/\r?\n/u).length,
  };
}

function trimDecodedStrings(value) {
  if (typeof value === "string") return value.trimEnd();
  if (Array.isArray(value)) return value.map(trimDecodedStrings);
  if (value !== null && typeof value === "object") {
    return Object.fromEntries(Object.entries(value).map(([key, item]) => [key, trimDecodedStrings(item)]));
  }
  return value;
}

export function itemsOf(list, fallbackLine) {
  if (!Array.isArray(list)) return [];
  return list.map((entry) => (
    entry !== null && typeof entry === "object" && "value" in entry
      ? entry
      : { value: entry, line: fallbackLine }
  ));
}

export function isNonEmpty(value) {
  if (Array.isArray(value)) return value.length > 0;
  if (typeof value === "string") return value.trim().length > 0;
  return value !== undefined && value !== null && value !== "";
}

const GLOSSARY_TERMS_SOURCE = "content/text/glossary/terms/";
const LESSON_SOURCE = "content/text/documents/articles/teaching-articles/tutorials/weiqi-overview.md";
const CORPUS_SOURCE = "content/ frontmatter conventions (uniform across the corpus)";

const CITATION_SOURCE = "content/text/glossary/terms/ko.md";
const CITATION_RE = /\[([^\]]*@[^\]]*)\]/g;
const CITATION_KEY_RE = /@([\w:-]+)/g;

/**
 * @param {string} text
 * @param {string} file
 * @param {string} sectionRoot
 * @returns {import("./diagnostic.mjs").Diagnostic[]}
 */
export function checkFrontmatter(text, file, sectionRoot) {
  const diagnostics = [];
  const parsed = parseFrontmatter(text);
  if (!parsed) {
    diagnostics.push(
      makeDiagnostic({
        code: "WQ044",
        severity: "error",
        file,
        message: `File has no "---"-delimited frontmatter block at all; required fields (title, type, date-created, date-updated, authors) are all missing.`,
        source: CORPUS_SOURCE,
        start: { line: 1, column: 1 },
      }),
    );
    return diagnostics;
  }
  const { data, keyLines, bodyText, bodyStartLine } = parsed;
  const type = typeof data.type === "string" ? data.type : undefined;

  // WQ044: required fields, every content markdown file.
  for (const field of ["title", "type", "date-created", "date-updated", "authors"]) {
    if (!isNonEmpty(data[field])) {
      diagnostics.push(
        makeDiagnostic({
          code: "WQ044",
          severity: "error",
          file,
          message: `Required frontmatter field "${field}" is missing or empty.`,
          source: CORPUS_SOURCE,
          start: { line: 1, column: 1 },
        }),
      );
    }
  }

  // WQ040: type: term must declare a non-empty defines:.
  if (type === "term" && !isNonEmpty(data.defines)) {
    diagnostics.push(
      makeDiagnostic({
        code: "WQ040",
        severity: "error",
        file,
        message: `type: term file has no non-empty "defines:" list in frontmatter.`,
        source: GLOSSARY_TERMS_SOURCE,
        start: { line: keyLines.type ?? 1, column: 1 },
      }),
    );
  }

  // WQ041: type: lesson must declare a non-empty teaches:.
  if (type === "lesson" && !isNonEmpty(data.teaches)) {
    diagnostics.push(
      makeDiagnostic({
        code: "WQ041",
        severity: "error",
        file,
        message: `type: lesson file has no non-empty "teaches:" list in frontmatter.`,
        source: LESSON_SOURCE,
        start: { line: keyLines.type ?? 1, column: 1 },
      }),
    );
  }

  // WQ042: lesson requires:/uses-mechanic: entries, in-section only, per
  // WQ031's same site-rooted terms/ mapping (see links.mjs). uses-mechanic
  // entries are, by this corpus's own convention, always terms/ paths and
  // so are always checked; requires: entries that fall outside the
  // terms/ sub-prefix (most commonly a cross-section curriculum path, e.g.
  // "/games/curricula/what-is-a-game.md") have no defined mapping anywhere
  // in this corpus (there is no content/.../curricula/ directory at all)
  // and are therefore left unverified, per the constitution's own Open
  // obligations -- reported neither broken nor confirmed, exactly as
  // SPEC.md's Family (d) scope note requires.
  if (type === "lesson") {
    for (const field of ["uses-mechanic", "requires"]) {
      const items = itemsOf(data[field], keyLines[field] ?? 1);
      for (const { value, line } of items) {
        if (typeof value !== "string") continue;
        const result = checkSiteRootedTermPath(value, sectionRoot);
        if (result && !result.ok) {
          diagnostics.push(
            makeDiagnostic({
              code: "WQ042",
              severity: "error",
              file,
              message: `Frontmatter "${field}:" entry "${value}" does not resolve to a real glossary file.`,
              source: GLOSSARY_TERMS_SOURCE,
              start: { line, column: 1 },
            }),
          );
        }
      }
    }
  }

  // WQ043: every [@key] inline citation in the body has a matching key
  // under frontmatter references:.
  const references = data.references && typeof data.references === "object" && !Array.isArray(data.references) ? data.references : {};
  const bodyLines = bodyText.split("\n");
  bodyLines.forEach((line, idx) => {
    CITATION_RE.lastIndex = 0;
    let m;
    while ((m = CITATION_RE.exec(line)) !== null) {
      CITATION_KEY_RE.lastIndex = 0;
      let km;
      while ((km = CITATION_KEY_RE.exec(m[1])) !== null) {
        const key = km[1];
        if (!(key in references)) {
          diagnostics.push(
            makeDiagnostic({
              code: "WQ043",
              severity: "error",
              file,
              message: `Inline citation [@${key}] has no matching "${key}:" entry under frontmatter references:.`,
              source: CITATION_SOURCE,
              start: { line: bodyStartLine + idx, column: m.index + 1 },
            }),
          );
        }
      }
    }
  });

  return diagnostics;
}
