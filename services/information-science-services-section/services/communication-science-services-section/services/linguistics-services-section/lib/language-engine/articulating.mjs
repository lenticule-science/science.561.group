// language-engine/articulating.mjs — segment text into a 2-D base of spans.
// Mechanically ported (types stripped) from the recovered
// @lenticule-science/language-topology/src/articulating.mts. Logic is unchanged.
// The output is offset-true: every span's text === original[start:end].
// Tiers (coarse → fine): document → block → sentence → clause → word.
// All edges (containment + sequence) are built eagerly; no information is lost.

/** Build a frozen span. */
export function span(tier, text, start, end) {
  return Object.freeze({ tier, start, end, text });
}

/** A rule-span (synthesized — no offsets, carries a rule id as text). */
export function ruleSpan(ruleId) {
  return Object.freeze({ tier: "rule", start: null, end: null, text: ruleId });
}

// ── Tokenize (Unicode-aware) ──────────────────────────────────────────────────

/** Unicode-aware tokenizer: extracts words as spans, preserving absolute offsets.
 * A word token is one or more Unicode letter/mark/number runs, connected by
 * word-internal joiners (apostrophes, hyphens). */
export function tokenize(text, baseOffset) {
  const wordRe = /[\p{L}\p{M}\p{N}](?:['ʼ‐-]?[\p{L}\p{M}\p{N}])*/gu;
  const result = [];
  let m;
  while ((m = wordRe.exec(text)) !== null) {
    const start = baseOffset + m.index;
    const end = start + m[0].length;
    result.push(span("word", m[0], start, end));
  }
  return result;
}

// ── Segment engine ────────────────────────────────────────────────────────────

/** Split a parent span's text using a regex, yielding child spans with absolute offsets.
 * The regex matches SEPARATORS (the content between matches becomes a child span).
 * Empty spans after trimming are discarded. */
function splitOn(parent, tier, separatorRe) {
  const text = parent.text;
  const baseStart = parent.start ?? 0;
  const parts = [];
  let last = 0;
  const re = new RegExp(separatorRe.source, separatorRe.flags.includes("g") ? separatorRe.flags : separatorRe.flags + "g");
  let m;
  while ((m = re.exec(text)) !== null) {
    if (m.index > last) {
      const raw = text.slice(last, m.index);
      const trimmed = raw.trimStart();
      const trimmedEnd = raw.trimEnd();
      const startOff = raw.length - raw.trimStart().length;
      const endOff = raw.length - trimmedEnd.length;
      if (trimmed.trim().length > 0) {
        parts.push(span(tier, trimmed.trim(), baseStart + last + startOff, baseStart + m.index - endOff));
      }
    }
    last = m.index + m[0].length;
  }
  if (last < text.length) {
    const raw = text.slice(last);
    const trimmed = raw.trim();
    const startOff = raw.length - raw.trimStart().length;
    if (trimmed.length > 0) {
      parts.push(span(tier, trimmed, baseStart + last + startOff, baseStart + text.length - (raw.length - raw.trimEnd().length)));
    }
  }
  return parts;
}

// ── Tier splitters ────────────────────────────────────────────────────────────

const BLOCK_RE = /\n[ \t]*\n/g;
const CLAUSE_RE = /[,;:—–]|--/g;

/** Split into blocks (paragraph breaks). */
function splitBlocks(doc) {
  return splitOn(doc, "block", BLOCK_RE);
}

/** Split a block into sentences using bundle's terminator pattern.
 * Preserves the terminator as part of the sentence text. */
function splitSentences(block, bundle) {
  const text = block.text;
  const baseStart = block.start ?? 0;
  const sentences = [];
  const re = new RegExp(bundle.sentenceTerminators.source, "gu");
  let last = 0;
  let m;
  while ((m = re.exec(text)) !== null) {
    const termEnd = m.index + m[0].length;
    // Guard: don't split on decimal points (e.g. 3.14) or abbreviations
    const before = text.slice(0, m.index);
    const word = before.split(/\s+/).pop() ?? "";
    if (bundle.isAbbreviation(word)) continue;
    if (/\d$/.test(before) && m[0] === ".") continue;
    const raw = text.slice(last, termEnd).trim();
    if (raw.length > 0) {
      const startOff = text.slice(last, termEnd).length - text.slice(last, termEnd).trimStart().length;
      sentences.push(span("sentence", raw, baseStart + last + startOff, baseStart + termEnd));
    }
    last = termEnd;
  }
  // Remainder (unterminated last sentence)
  if (last < text.length) {
    const raw = text.slice(last).trim();
    const startOff = text.slice(last).length - text.slice(last).trimStart().length;
    if (raw.length > 0) {
      sentences.push(span("sentence", raw, baseStart + last + startOff, baseStart + text.length));
    }
  }
  return sentences;
}

/** Split a sentence into clauses (comma/semicolon/colon/dash). */
function splitClauses(sentence) {
  return splitOn(sentence, "clause", CLAUSE_RE);
}

/** Split a clause into word-spans (whitespace-delimited). */
function splitWords(clause) {
  return tokenize(clause.text, clause.start ?? 0);
}

// ── Articulate ────────────────────────────────────────────────────────────────

/** Segment text into the full span hierarchy and build containment + sequence edges. */
export function articulate(text, bundle) {
  const doc = span("document", text, 0, text.length);
  const spans = [doc];
  const inside = [];
  const after = [];

  const rawBlocks = splitBlocks(doc);
  const blocks = rawBlocks.length > 0
    ? [...rawBlocks]
    : [span("block", text.trim(), 0, text.length)];

  for (const block of blocks) {
    spans.push(block);
    inside.push({ child: block, parent: doc });

    const rawSentences = splitSentences(block, bundle);
    const sentences = rawSentences.length > 0
      ? [...rawSentences]
      : [span("sentence", block.text, block.start, block.end)];

    let prevSentence = null;
    for (const sentence of sentences) {
      spans.push(sentence);
      inside.push({ child: sentence, parent: block });
      if (prevSentence !== null) after.push({ span: sentence, prev: prevSentence });
      prevSentence = sentence;

      const rawClauses = splitClauses(sentence);
      const clauses = rawClauses.length > 0
        ? [...rawClauses]
        : [span("clause", sentence.text, sentence.start, sentence.end)];

      let prevClause = null;
      for (const clause of clauses) {
        spans.push(clause);
        inside.push({ child: clause, parent: sentence });
        if (prevClause !== null) after.push({ span: clause, prev: prevClause });
        prevClause = clause;

        const words = splitWords(clause);
        let prevWord = null;
        for (const word of words) {
          spans.push(word);
          inside.push({ child: word, parent: clause });
          if (prevWord !== null) after.push({ span: word, prev: prevWord });
          prevWord = word;
        }
      }
    }
  }

  return { text, document: doc, spans, inside, after };
}
