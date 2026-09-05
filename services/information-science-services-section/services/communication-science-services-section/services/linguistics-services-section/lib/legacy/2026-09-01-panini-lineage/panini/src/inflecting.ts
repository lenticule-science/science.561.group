// inflecting.ts — surface realization morphology: conjugate verbs, pluralize nouns,
// choose articles. These are the GENERATION inverses of lemmatization and featuring.
import type { CompiledBundle } from "./types.ts";

/** Conjugate a verb lemma to a surface form given tense/person/number.
 * Falls back to suffix rules, then the base form itself. */
export function conjugate(
  base: string,
  opts: { tense: "past" | "present" | "future"; person?: 1 | 2 | 3; number?: "sg" | "pl" },
  bundle: CompiledBundle,
): string {
  const lower = base.toLowerCase();
  const irreg = bundle.raw.morphology.irregularVerbs?.[lower];
  if (opts.tense === "past") {
    const pastForm = irreg?.["past"] ?? lower + "ed";
    return pastForm;
  }
  if (opts.tense === "present" && opts.person === 3 && opts.number === "sg") {
    const form3sg = irreg?.["3sg"];
    if (form3sg) return form3sg;
    // Default: add -s/-es
    if (/(?:s|sh|ch|x|z)$/.test(lower)) return lower + "es";
    if (/[^aeiou]y$/.test(lower)) return lower.slice(0, -1) + "ies";
    return lower + "s";
  }
  // base form
  return lower;
}

/** Pluralize a noun lemma. */
export function pluralize(noun: string, bundle: CompiledBundle): string {
  const lower = noun.toLowerCase();
  const irreg = bundle.raw.morphology.irregularPlurals?.[lower];
  if (irreg) return irreg;
  // Regular rules
  if (/(?:s|sh|ch|x|z)$/.test(lower)) return lower + "es";
  if (/[^aeiou]y$/.test(lower)) return lower.slice(0, -1) + "ies";
  if (/(?:f|fe)$/.test(lower)) return lower.replace(/(?:f|fe)$/, "ves");
  return lower + "s";
}

/** Choose "a" or "an" for a word based on its pronunciation onset.
 * Uses vowel-onset heuristic; does not handle all edge cases. */
export function indefiniteArticle(word: string, _bundle: CompiledBundle): string {
  const lower = word.toLowerCase();
  // Exceptions where written vowel is not a vowel sound: "a university", "a one-time"
  const consonantOnsetVowelWords = /^(uni|one|use|used|usu|euro|euph|eur)/;
  if (consonantOnsetVowelWords.test(lower)) return "a";
  // Vowel onset
  if (/^[aeiou]/i.test(lower)) return "an";
  return "a";
}
