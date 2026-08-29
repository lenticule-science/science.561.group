/**
 * The canonical Markdown carrier for a glossary term.
 *
 * A file is the witness for its frontmatter predications.  `name` is the
 * human primary handle; its filename is a derived filesystem rendering, not
 * a second identity field.  `aliases` are alternate lexical handles.  A
 * `description` is a portable public projection and, when present, must be
 * precisely a definition sentence followed by a context sentence.
 */

const TERM_KIND = "561-group.glossary.term-markdown";

function text(value, label) {
  if (typeof value !== "string") throw new TypeError(`${label} must be a string`);
  const normalized = value.replace(/\r\n?/gu, "\n").trim();
  if (normalized === "") throw new TypeError(`${label} must be non-empty`);
  if (/\n/u.test(normalized)) throw new TypeError(`${label} must occupy one line`);
  return normalized;
}

/** Normalize a primary human handle without converting it into a slug. */
export function normalizeTermName(value) {
  return text(value, "name").replace(/[\t ]+/gu, " ");
}

/** Normalize alternate handles, reject duplicates, and exclude the primary handle. */
export function normalizeTermAliases(value, { name } = {}) {
  if (value === undefined) return Object.freeze([]);
  if (!Array.isArray(value)) throw new TypeError("aliases must be an array of strings");
  const primary = name === undefined ? null : normalizeTermName(name).toLocaleLowerCase();
  const seen = new Set();
  const aliases = [];
  for (const item of value) {
    const alias = text(item, "alias").replace(/[\t ]+/gu, " ");
    const key = alias.toLocaleLowerCase();
    if (key === primary) throw new RangeError("aliases must not repeat name");
    if (seen.has(key)) throw new RangeError(`aliases must be unique: ${alias}`);
    seen.add(key);
    aliases.push(alias);
  }
  return Object.freeze(aliases);
}

function descriptionSentences(value) {
  const normalized = text(value, "description").replace(/[\t ]+/gu, " ");
  const segments = [...new Intl.Segmenter("en", { granularity: "sentence" }).segment(normalized)]
    .map(({ segment }) => segment.trim())
    .filter(Boolean);
  if (segments.length !== 2 || segments.some((sentence) => !/[.!?](?:["'\u201d\u2019)\]])*$/u.test(sentence))) {
    throw new RangeError("description must contain exactly two complete sentences");
  }
  return Object.freeze(segments);
}

/** Admit the exactly-two-sentence, Web-facing description projection. */
export function normalizeTermDescription(value) {
  return descriptionSentences(value).join(" ");
}

/** Derive the portable ASCII filename slug; the human name remains canonical. */
export function slugifyTermName(value) {
  const slug = normalizeTermName(value)
    .normalize("NFKD")
    .replace(/[\u0300-\u036f]/gu, "")
    .replace(/&/gu, " and ")
    .replace(/[\u2019']/gu, "")
    .toLowerCase()
    .replace(/[^a-z0-9]+/gu, "-")
    .replace(/^-+|-+$/gu, "");
  if (slug === "") throw new TypeError("name must produce a non-empty filename slug");
  return slug;
}

export function deriveTermFilename(name) {
  return `${slugifyTermName(name)}.md`;
}

function yamlScalar(value) { return JSON.stringify(value); }

/** Render the minimal, canonical Markdown witness for a term. */
export function renderTermMarkdown({ name, aliases = [], description } = {}) {
  const normalizedName = normalizeTermName(name);
  const normalizedAliases = normalizeTermAliases(aliases, { name: normalizedName });
  const normalizedDescription = description === undefined ? undefined : normalizeTermDescription(description);
  const lines = ["---", `name: ${yamlScalar(normalizedName)}`];
  if (normalizedAliases.length > 0) {
    lines.push("aliases:", ...normalizedAliases.map((alias) => `  - ${yamlScalar(alias)}`));
  }
  if (normalizedDescription !== undefined) lines.push(`description: ${yamlScalar(normalizedDescription)}`);
  lines.push("---", "");
  return `${lines.join("\n")}\n`;
}

function scalar(raw) {
  const trimmed = raw.trim();
  if (trimmed.startsWith('"')) {
    try { const value = JSON.parse(trimmed); return typeof value === "string" ? value : undefined; } catch { return undefined; }
  }
  if (trimmed.startsWith("'")) return trimmed.endsWith("'") ? trimmed.slice(1, -1).replace(/''/gu, "'") : undefined;
  return trimmed === "" ? undefined : trimmed;
}

/** Read the canonical scalar-and-string-list frontmatter grammar. */
export function readTermMarkdown(textValue) {
  if (typeof textValue !== "string") throw new TypeError("text must be a string");
  const text = textValue.replace(/^\uFEFF/gu, "").replace(/\r\n?/gu, "\n");
  const match = /^---[ \t]*\n([\s\S]*?)\n---[ \t]*(?:\n|$)/u.exec(text);
  if (match === null) return Object.freeze({ kind: TERM_KIND, frontmatter: null, name: undefined, aliases: undefined, description: undefined });
  const frontmatter = Object.create(null);
  const lines = match[1].split("\n");
  for (let index = 0; index < lines.length; index += 1) {
    const entry = /^([^:\s][^:]*):[ \t]*(.*)$/u.exec(lines[index]);
    if (entry === null) continue;
    const [, key, raw] = entry;
    if (raw !== "") { frontmatter[key] = scalar(raw); continue; }
    const values = [];
    while (index + 1 < lines.length && /^[ \t]+-[ \t]+/u.test(lines[index + 1])) {
      index += 1;
      values.push(scalar(lines[index].replace(/^[ \t]+-[ \t]+/u, "")));
    }
    frontmatter[key] = values;
  }
  return Object.freeze({ kind: TERM_KIND, frontmatter: Object.freeze(frontmatter), name: frontmatter.name, aliases: frontmatter.aliases, description: frontmatter.description });
}

function finding(rule, message) { return Object.freeze({ rule, message }); }

/**
 * Recognize the strongest term type witnessed by Markdown and, when supplied,
 * its derived filename.  A malformed or absent description leaves a valid
 * Term rather than erasing the term's existence; only DefinedTerm requires it.
 */
export function recognizeTermMarkdown({ text, filename } = {}) {
  const parsed = readTermMarkdown(text);
  const findings = [];
  let name = null, aliases = null, description = null;
  try { name = normalizeTermName(parsed.name); } catch (error) { findings.push(finding("name", error.message)); }
  if (name !== null) {
    try { aliases = normalizeTermAliases(parsed.aliases, { name }); } catch (error) { findings.push(finding("aliases", error.message)); }
    if (filename !== undefined && filename !== deriveTermFilename(name)) findings.push(finding("filename", `filename must be ${deriveTermFilename(name)}`));
  }
  if (parsed.description !== undefined) {
    try { description = normalizeTermDescription(parsed.description); } catch (error) { findings.push(finding("description", error.message)); }
  }
  const term = name !== null && aliases !== null && !findings.some(({ rule }) => rule === "filename");
  const defined = term && description !== null;
  return Object.freeze({ kind: TERM_KIND, type: defined ? "DefinedTerm" : term ? "Term" : null, term, defined, name, aliases, description, filename: filename ?? null, findings: Object.freeze(findings) });
}
