// Shared, tiny markdown-fence scanner. Every rule family that reads a
// fenced code block (diagrams and expected: blocks for Family a/b, sgf
// blocks for Family c) goes through this one extractor so "what counts as
// a fence" is defined once.

/**
 * @typedef {Object} Fence
 * @property {string} lang            - the language tag after ``` (may be "").
 * @property {string} content         - the fence body, without the ``` lines.
 * @property {string[]} contentLines  - content split on "\n" (no trailing newline entry).
 * @property {number} fenceStartLine  - 1-indexed line number of the opening ``` line.
 * @property {number} contentStartLine - 1-indexed line number of the first content line.
 */

const FENCE_OPEN_RE = /^```([^\n`]*)$/;
const FENCE_CLOSE_RE = /^```\s*$/;

/**
 * Extract every fenced code block from markdown `text`, top-level only
 * (nested/backtick-inside-backtick fencing is not a convention this corpus
 * uses -- see the diagram/expected/sgf fences read directly from
 * regression-positions.md and the rest of the corpus during this
 * implementation).
 *
 * @param {string} text
 * @returns {Fence[]}
 */
export function extractFences(text) {
  const lines = text.split("\n");
  /** @type {Fence[]} */
  const fences = [];
  let i = 0;
  while (i < lines.length) {
    const openMatch = FENCE_OPEN_RE.exec(lines[i]);
    if (!openMatch) {
      i += 1;
      continue;
    }
    const lang = openMatch[1].trim();
    const fenceStartLine = i + 1;
    const contentStartLine = i + 2;
    const bodyLines = [];
    let j = i + 1;
    while (j < lines.length && !FENCE_CLOSE_RE.test(lines[j])) {
      bodyLines.push(lines[j]);
      j += 1;
    }
    // j points at the closing fence, or at lines.length if unterminated --
    // an unterminated fence still yields whatever content it had; callers
    // that need "did this parse cleanly" (e.g. SGF) check the content itself.
    fences.push({
      lang,
      content: bodyLines.join("\n"),
      contentLines: bodyLines,
      fenceStartLine,
      contentStartLine,
    });
    i = j + 1;
  }
  return fences;
}

/** True if `line`'s non-whitespace tokens are all single ASCII letters -- the shape of a diagram's column-letter header row (e.g. "A B C D E"). */
export function looksLikeDiagramHeader(line) {
  const tokens = line.trim().split(/\s+/).filter(Boolean);
  if (tokens.length < 2) return false;
  return tokens.every((t) => /^[A-Za-z]$/.test(t));
}

/** True if the fence's first non-blank line is literally "expected:". */
export function looksLikeExpectedBlock(fence) {
  const firstLine = fence.contentLines.find((l) => l.trim().length > 0);
  return firstLine !== undefined && firstLine.trim() === "expected:";
}
