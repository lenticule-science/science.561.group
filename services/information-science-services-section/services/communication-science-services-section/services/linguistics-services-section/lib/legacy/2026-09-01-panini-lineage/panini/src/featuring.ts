// featuring.ts — extract morphological features from a tagged word.
// Features are fiber-algebras: an ambiguous word carries ALL compatible features.
// Number features: "sg" | "pl" (may be both for invariant/ambiguous words).
// Verb form: "3sg" | "base" | "past" | "nonfin" | null (for non-verbs).
import type { CompiledBundle } from "./types.ts";

/** Return morphological features for a word given its POS tags. */
export function features(word: string, tags: readonly string[], bundle: CompiledBundle): readonly string[] {
  const result: string[] = [];

  const numFeats = bundle.numberFeatures(word, tags);
  for (const f of numFeats) {
    if (!result.includes(f)) result.push(f);
  }

  const vf = bundle.verbForm(word, tags);
  if (vf !== null && !result.includes(vf)) result.push(vf);

  return result;
}
