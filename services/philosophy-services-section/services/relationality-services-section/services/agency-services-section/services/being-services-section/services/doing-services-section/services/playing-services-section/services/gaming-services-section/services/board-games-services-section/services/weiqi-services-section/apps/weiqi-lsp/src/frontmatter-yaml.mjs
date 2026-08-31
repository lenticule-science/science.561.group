// A minimal, purpose-built parser for THIS corpus's own frontmatter
// conventions -- not a general YAML parser (this package is
// zero-dependency and has no YAML library to reach for). Handles exactly
// the shapes read directly out of the corpus during implementation: block
// mappings, block sequences ("- item", at the key's own indent OR indented
// one level deeper -- both styles appear across this corpus's files),
// inline flow sequences ("[a, b]"), one level of nested mapping
// (references: { key: { authors: [...], title: ... } }), and ">"/"|"
// folded block scalars. Quoted and unquoted scalars are both accepted.

function indentOf(line) {
  const m = /^( *)/.exec(line);
  return m[1].length;
}

function stripQuotes(s) {
  const t = s.trim();
  if (t.length >= 2 && ((t[0] === '"' && t[t.length - 1] === '"') || (t[0] === "'" && t[t.length - 1] === "'"))) {
    return t.slice(1, -1);
  }
  return t;
}

function parseFlowList(s) {
  const inner = s.trim().replace(/^\[/, "").replace(/\]$/, "");
  if (inner.trim() === "") return [];
  return inner.split(",").map((x) => stripQuotes(x.trim()));
}

/**
 * @param {string[]} lines - frontmatter lines only (no --- delimiters).
 * @param {number} i - index into `lines` to start at.
 * @param {number} baseIndent
 * @returns {{value: any, keyLines: Record<string, number>, next: number}}
 */
function parseBlock(lines, i, baseIndent) {
  while (i < lines.length && lines[i].trim() === "") i++;
  if (i >= lines.length) return { value: {}, keyLines: {}, next: i };

  if (lines[i].trim().startsWith("-")) {
    const arr = [];
    while (i < lines.length) {
      if (lines[i].trim() === "") {
        i++;
        continue;
      }
      const ind = indentOf(lines[i]);
      if (ind < baseIndent) break;
      if (ind > baseIndent) {
        i++;
        continue;
      }
      const trimmed = lines[i].trim();
      if (!trimmed.startsWith("-")) break;
      const line = i + 1;
      const rest = trimmed.slice(1).trim();
      i++;
      if (rest === "") {
        const sub = parseBlock(lines, i, baseIndent + 2);
        arr.push({ value: sub.value, line });
        i = sub.next;
      } else if (rest.startsWith("[")) {
        arr.push({ value: parseFlowList(rest), line });
      } else {
        arr.push({ value: stripQuotes(rest), line });
      }
    }
    return { value: arr, keyLines: {}, next: i };
  }

  const obj = {};
  const keyLines = {};
  while (i < lines.length) {
    if (lines[i].trim() === "") {
      i++;
      continue;
    }
    const ind = indentOf(lines[i]);
    if (ind < baseIndent) break;
    if (ind > baseIndent) {
      i++;
      continue;
    }
    const mm = /^\s*([\w.-]+):[ \t]?(.*)$/.exec(lines[i]);
    if (!mm) {
      i++;
      continue;
    }
    const key = mm[1];
    const rest = mm[2];
    const line = i + 1;
    i++;
    if (rest === "") {
      let j = i;
      while (j < lines.length && lines[j].trim() === "") j++;
      if (j < lines.length && indentOf(lines[j]) > baseIndent) {
        const sub = parseBlock(lines, j, indentOf(lines[j]));
        obj[key] = sub.value;
        i = sub.next;
      } else if (j < lines.length && indentOf(lines[j]) === baseIndent && lines[j].trim().startsWith("-")) {
        const sub = parseBlock(lines, j, baseIndent);
        obj[key] = sub.value;
        i = sub.next;
      } else {
        obj[key] = "";
      }
    } else if (rest.startsWith("[")) {
      obj[key] = parseFlowList(rest);
    } else if (rest === ">" || rest === "|") {
      const chunks = [];
      while (i < lines.length && (lines[i].trim() === "" || indentOf(lines[i]) > baseIndent)) {
        if (lines[i].trim() !== "") chunks.push(lines[i].trim());
        i++;
      }
      obj[key] = chunks.join(" ");
    } else {
      obj[key] = stripQuotes(rest);
    }
    keyLines[key] = line;
  }
  return { value: obj, keyLines, next: i };
}

/**
 * @param {string} text - a whole markdown file's text.
 * @returns {{data: Record<string, any>, keyLines: Record<string, number>, bodyText: string, bodyStartLine: number}|null}
 *   null if `text` has no "---"-delimited frontmatter block at all.
 */
export function parseFrontmatter(text) {
  const m = /^---\r?\n([\s\S]*?)\r?\n---\r?\n?/.exec(text);
  if (!m) return null;
  const fmLines = m[1].split("\n");
  const { value, keyLines } = parseBlock(fmLines, 0, 0);
  const frontmatterLineCount = m[0].split("\n").length - 1;
  return {
    data: value,
    keyLines,
    bodyText: text.slice(m[0].length),
    bodyStartLine: frontmatterLineCount + 1,
  };
}

/** Normalize a parsed list field (block-sequence {value,line}[] OR flow-list string[] OR missing) to {value,line}[]. */
export function itemsOf(list, fallbackLine) {
  if (!Array.isArray(list)) return [];
  return list.map((e) => (e !== null && typeof e === "object" && "value" in e ? e : { value: e, line: fallbackLine }));
}

/** True if a parsed field value counts as present-and-non-empty for WQ040/041/044's purposes. */
export function isNonEmpty(value) {
  if (Array.isArray(value)) return value.length > 0;
  if (typeof value === "string") return value.trim().length > 0;
  return value !== undefined && value !== null && value !== "";
}
