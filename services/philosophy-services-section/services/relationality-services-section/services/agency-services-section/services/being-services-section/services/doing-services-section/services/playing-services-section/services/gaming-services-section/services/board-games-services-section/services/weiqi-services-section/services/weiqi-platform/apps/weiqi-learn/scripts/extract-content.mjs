#!/usr/bin/env node
// Extracts public/data/glossary.json from this section's own glossary
// corpus (content/text/glossary/terms/*.md) — no hand-transcription, so the
// glossary stays in sync whenever a term file changes. Re-run any time; it
// always rewrites the file fresh from the corpus.
//
// Each term's markdown has YAML frontmatter (only `title` is read from it)
// followed by prose: a first paragraph that serves as the definition, more
// paragraphs, then a "## Related terms" section of `- [name](./slug.md) -
// gloss` bullets. This script needs none of that structure beyond what's
// extracted below, so it parses by regex rather than pulling in a markdown
// or YAML dependency (the app tree is zero-dep throughout).

import { readdir, readFile, writeFile } from "node:fs/promises";
import { fileURLToPath } from "node:url";
import path from "node:path";

const here = path.dirname(fileURLToPath(import.meta.url));
const appRoot = path.resolve(here, "..");
// Same section-root climb as scripts/build.mjs's kernelSrcDir: four levels
// up from apps/weiqi-learn reaches weiqi-services-section.
const sectionRoot = path.resolve(appRoot, "../../../../");
const glossaryDir = path.resolve(sectionRoot, "content/text/glossary/terms");
const outPath = path.resolve(appRoot, "public/data/glossary.json");

// The path this script writes for every term must read identically to
// TERM_PATH in apps/weiqi-kernel/src/events.mts, so a UI can look up a
// semantic event's termRef straight against this field. That file only
// lists the seven terms the kernel currently annotates moves with, but its
// path *shape* — relative from a source file one section-level down from
// content/ — is what every term here must match, not just those seven.
function termRefPath(slug) {
  return `../../content/text/glossary/terms/${slug}.md`;
}

function stripQuotes(s) {
  const t = s.trim();
  if ((t.startsWith('"') && t.endsWith('"')) || (t.startsWith("'") && t.endsWith("'"))) {
    return t.slice(1, -1);
  }
  return t;
}

function splitFrontmatter(source) {
  const m = /^---\r?\n([\s\S]*?)\r?\n---\r?\n([\s\S]*)$/.exec(source);
  if (!m) throw new Error("No YAML frontmatter block found");
  return { frontmatter: m[1], body: m[2] };
}

function extractTitle(frontmatter, fallback) {
  const m = /^title:\s*(.+)$/m.exec(frontmatter);
  return m ? stripQuotes(m[1]) : fallback;
}

// Markdown links -> plain text, keeping the visible label (which, for the
// links this corpus uses, is always the linked term's own display name).
function flattenLinks(text) {
  return text.replace(/\[([^\]]+)\]\([^)]*\)/g, "$1");
}

// Pandoc-style citation markers ("[@key]" or "[@key1; @key2]") aren't
// markdown links (no "(url)"), so flattenLinks leaves them alone; they add
// no reader-facing meaning to a one-paragraph definition, so drop them too.
function stripCitations(text) {
  return text.replace(/\s*\[@[^\]]+\]/g, "");
}

// A stray "*word*" emphasis span (superko.md's "*any*") is markdown syntax
// same as a link is; plain text keeps the word, drops the asterisks.
function stripEmphasis(text) {
  return text.replace(/\*([^*]+)\*/g, "$1");
}

function firstParagraph(body) {
  const trimmed = body.replace(/^\s+/, "");
  const end = trimmed.search(/\n\s*\n/);
  const raw = end === -1 ? trimmed : trimmed.slice(0, end);
  const flattened = stripEmphasis(stripCitations(flattenLinks(raw)));
  return flattened.replace(/\s+/g, " ").trim();
}

// Related-terms bullets are always same-directory links, "[label](./slug.md)".
// Any other markdown link shape (e.g. "../topics/weiqi.md") intentionally
// does not match, since it isn't naming a sibling glossary term.
function relatedNames(body) {
  const m = /## Related terms\s*\n([\s\S]*)$/i.exec(body);
  if (!m) return [];
  const section = m[1];
  const names = [];
  const re = /\[[^\]]+\]\(\.\/([a-z0-9-]+)\.md\)/g;
  let match;
  while ((match = re.exec(section)) !== null) {
    if (!names.includes(match[1])) names.push(match[1]);
  }
  return names;
}

async function extractTerm(fileName) {
  const slug = fileName.slice(0, -3); // "x.md" -> "x"
  const source = await readFile(path.join(glossaryDir, fileName), "utf8");
  const { frontmatter, body } = splitFrontmatter(source);
  return {
    name: slug,
    title: extractTitle(frontmatter, slug),
    definition: firstParagraph(body),
    related: relatedNames(body),
    path: termRefPath(slug),
  };
}

async function main() {
  const entries = await readdir(glossaryDir, { withFileTypes: true });
  const termFiles = entries
    .filter((e) => e.isFile() && e.name.endsWith(".md") && !e.name.toLowerCase().includes("archive"))
    .map((e) => e.name)
    .sort();

  if (termFiles.length === 0) {
    throw new Error(`No glossary term files found in ${glossaryDir}`);
  }

  const terms = await Promise.all(termFiles.map(extractTerm));
  terms.sort((a, b) => a.name.localeCompare(b.name));

  const names = new Set(terms.map((t) => t.name));
  for (const term of terms) {
    for (const rel of term.related) {
      if (!names.has(rel)) {
        throw new Error(`Term "${term.name}" relates to unknown term "${rel}" (no such glossary file)`);
      }
    }
  }

  await writeFile(outPath, JSON.stringify(terms, null, 2) + "\n", "utf8");
  console.log(`Extracted ${terms.length} glossary term(s) from ${glossaryDir} to ${outPath}`);
}

main().catch((err) => {
  console.error(err.stack ?? String(err));
  process.exit(1);
});
