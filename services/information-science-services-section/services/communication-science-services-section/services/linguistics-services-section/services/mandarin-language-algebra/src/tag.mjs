// Mandarin's text codec over the language-neutral communicating substrate.
// The bundle owns preposed determiner/adjective and SVO law, plus its own
// dictionary-based `segment` hook (communicating engages it instead of the
// regex/script tokenizer — see bundle.mjs); communicating owns Mark
// admission, articulation, charged settlement, roles and cohomology.
import {
  admitCommunication,
  articulateCommunication,
  load,
  read,
  settle,
} from "@lenticule-science/communicating";
import { rawBundle } from "./bundle.mjs";

/** The compiled Mandarin fiber consumed by communicating's public readings. */
export const bundle = load(rawBundle);

/** Real per-word POS tag, via the engine's own tag() (closed-class lexicon,
 * then open-class morphotactics, floor = noun). Exposed standalone because
 * lakota-language-algebra's original recovered parity test asserted against
 * it directly, and this die mirrors that surface. */
export function tagWordPos(word) {
  return read(word, bundle).parse.words[0]?.tags ?? [];
}

/** Tokenize on the engine's own tokenizer — for this bundle, that means the
 * dictionary-based `segment` hook (see bundle.mjs), not the Unicode word
 * regex or per-character fallback other fibers without a segment hook use. */
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
