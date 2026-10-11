#!/usr/bin/env node
// Projects this section's own canonical sources — the six
// data/records/glossary/terms/<term>.v1.json translation-variance records,
// plus each term carrier's own frontmatter `keywords` — into RDF
// individuals conforming to data/ontology/dao/ontology.ttl, and writes
// data/ontology/dao/graph.ttl.
//
// This mirrors bibliography-engineering-services-section's own convention
// for its generated `.bib`: "Do not edit by hand." Edit a term's JSON
// record or its .md frontmatter, then rerun this script; never edit
// graph.ttl directly.
import { readFileSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const DAO = join(dirname(fileURLToPath(import.meta.url)), "..");
const TERMS = ["dao", "de", "wu-wei", "ziran", "pu", "daodejing"];

const BOOKS = {
  "content/text/documents/articles/books/2026-book-of-changes.md": { id: "book-2026-book-of-changes", classicalWork: "Yijing" },
  "content/text/documents/articles/books/the-way-of-collapse.md": { id: "book-the-way-of-collapse", classicalWork: "Daodejing" },
};

function turtleString(value) {
  return `"${String(value).replace(/\\/g, "\\\\").replace(/"/g, '\\"')}"`;
}

/** Extracts a YAML frontmatter `keywords:` list (kebab-case filename stems only), without a full YAML parser — the one field this projector needs from a term's .md that its own .v1.json record does not already carry. */
export function extractFrontmatterKeywords(markdownText) {
  const match = markdownText.match(/^keywords:\n((?:\s*-\s*.+\n)+)/mu);
  if (!match) return [];
  return [...match[1].matchAll(/-\s*(\S+)/gu)].map(([, keyword]) => keyword);
}

export function projectDaoGlossaryGraph({ dao = DAO, terms = TERMS } = {}) {
  const records = terms.map((term) => JSON.parse(readFileSync(`${dao}/data/records/glossary/terms/${term}.v1.json`, "utf8")));
  const keywordsByTerm = Object.fromEntries(
    terms.map((term) => [term, extractFrontmatterKeywords(readFileSync(`${dao}/content/text/glossary/terms/${term}.md`, "utf8"))]),
  );

  const translations = new Map(); // citekey -> {translator, year}
  for (const record of records) {
    for (const t of record.translations) {
      if (!translations.has(t.citekey)) translations.set(t.citekey, { translator: t.translator, year: t.year });
    }
  }

  const lines = [];
  lines.push("@prefix daod: <https://emsenn.net/ns/domain/daoist#> .");
  lines.push("@prefix ex:   <https://emsenn.net/ns/instance/dao-services-section#> .");
  lines.push("");
  lines.push("# GENERATED — do not edit by hand. Regenerate with");
  lines.push("# scripts/project-dao-glossary-graph.mjs after editing a term's");
  lines.push("# data/records/glossary/terms/<term>.v1.json or content/text/glossary/terms/<term>.md.");
  lines.push("# One simplification, stated plainly: daod:groundingMethod is asserted once per");
  lines.push("# Term (from its first translation's grounding), since every term in this glossary");
  lines.push("# happens to ground all of its renderings the same way; a term that ever mixes");
  lines.push("# grounding methods across renderings would need a richer per-rendering shape.");
  lines.push("");

  lines.push("# --- Translations ---");
  for (const [citekey, { translator, year }] of translations) {
    lines.push(`ex:${citekey} a daod:Translation ;`);
    lines.push(`    daod:translator ${turtleString(translator)} ;`);
    lines.push(`    daod:translationYear ${year} .`);
    lines.push("");
  }

  lines.push("# --- Books ---");
  for (const { id, classicalWork } of Object.values(BOOKS)) {
    lines.push(`ex:${id} a daod:Book ;`);
    lines.push(`    daod:classicalWork ${turtleString(classicalWork)} .`);
    lines.push("");
  }

  lines.push("# --- Terms ---");
  for (const record of records) {
    const stmts = [];
    stmts.push(`daod:hanzi ${turtleString(record.hanzi)}`);
    stmts.push(`daod:pinyin ${turtleString(record.pinyin)}`);
    for (const locus of record.locus) stmts.push(`daod:locus ${turtleString(locus)}`);
    const classicalWork = record.locus.some((l) => l === "title" || l.startsWith("Daodejing")) ? "Daodejing" : record.locus.some((l) => l.startsWith("Yijing")) ? "Yijing" : null;
    if (classicalWork) stmts.push(`daod:classicalWork ${turtleString(classicalWork)}`);
    for (const citekey of new Set(record.translations.map((t) => t.citekey))) stmts.push(`daod:cites ex:${citekey}`);
    if (record.translations[0]?.grounding) stmts.push(`daod:groundingMethod ${turtleString(record.translations[0].grounding)}`);
    stmts.push(`daod:houseGrade ${turtleString(record.houseTranslation.grade)}`);
    stmts.push(`daod:isNewToGlossary ${record.houseTranslation.isNewToThisGlossary}`);
    if (record.houseTranslation.formalAnchor) stmts.push(`daod:formalAnchor ${turtleString(record.houseTranslation.formalAnchor)}`);
    if (record.houseTranslation.citesCarrier && BOOKS[record.houseTranslation.citesCarrier]) stmts.push(`daod:formalizedIn ex:${BOOKS[record.houseTranslation.citesCarrier].id}`);
    for (const keyword of keywordsByTerm[record.term]) stmts.push(`daod:requires ex:${keyword}`);

    lines.push(`ex:${record.term} a daod:Term ;`);
    lines.push(`${stmts.map((s) => `    ${s}`).join(" ;\n")} .`);
    lines.push("");
  }

  lines.push("# --- Questions ---");
  lines.push("ex:does-unusually-fast-tea-cooling-have-a-meaning a daod:Question .");
  lines.push("");

  const text = `${lines.join("\n")}\n`;
  writeFileSync(`${dao}/data/ontology/dao/graph.ttl`, text);
  return { path: `${dao}/data/ontology/dao/graph.ttl`, terms: records.length, translations: translations.size, books: Object.keys(BOOKS).length };
}

if (import.meta.url === `file://${process.argv[1]}`) {
  const result = projectDaoGlossaryGraph();
  process.stdout.write(`${JSON.stringify(result, null, 2)}\n`);
}
