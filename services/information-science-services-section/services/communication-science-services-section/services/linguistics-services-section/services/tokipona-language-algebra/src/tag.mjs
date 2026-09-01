// Toki Pona's text codec over the language-neutral communicating substrate.
// The bundle owns isolating morphology and structural-particle data;
// communicating owns Mark admission, articulation, charged settlement, roles
// and cohomology.
import {
  admitCommunication,
  articulateCommunication,
  load,
  read,
  settle,
} from "@lenticule-science/communicating";
import { rawBundle } from "./bundle.mjs";

/** The compiled Toki Pona fiber consumed by communicating's public readings. */
export const bundle = load(rawBundle);

/** Real per-word POS tag, via the engine's own tag() (closed-class lexicon,
 * then open-class suffix morphology, floor = noun). Exposed standalone
 * because the original recovered parity test asserted against it directly. */
export function tagWordPos(word) {
  return read(word, bundle).parse.words[0]?.tags ?? [];
}

/** Tokenize on the engine's own Unicode-aware word tokenizer (word = a run of
 * letters/marks/numbers joined by ' / ʼ / ‐ / -), which naturally excludes
 * sentence-terminating punctuation — no separate strip-then-split step. */
export function tokenize(text) {
  return articulateCommunication(admitCommunication(text), bundle).spans
    .filter((s) => s.tier === "word")
    .map((s) => s.text);
}

/**
 * Parse `text` for real: articulate into sentence spans, run the full
 * construe→descend→fold pipeline on each sentence, and extract syntax-derived
 * semantic role frames (agent/patient/instrument/recipient/location) via
 * the shared engine's roles(). Returns one entry per sentence found (or one
 * entry for the whole text if no sentence terminator was present).
 *
 * This is a real, deterministic function of (text, rawBundle) — byte-
 * identical in yields byte-identical out — computed by actually running the
 * settlement engine (not a flat per-word lookup).
 */
export function tagText(text) {
  const sentences = settle(text, bundle).readings.map(({ span: sentenceSpan }) => {
    const reading = read(sentenceSpan.text, bundle);
    const result = reading.parse;
    return {
      text: sentenceSpan.text,
      words: result.words.map((w) => ({ text: w.text, tags: w.tags, feats: w.feats, connected: w.connected, roles: w.roles })),
      arcs: result.arcs.map((a) => ({ rel: a.rel, head: a.headText, dependent: a.depText, status: a.status })),
      roles: reading.roles,
      tower: result.tower,
      cohomology: reading.cohomology,
    };
  });

  return { meta: rawBundle.meta, wordOrder: rawBundle.wordOrder, sentences };
}
