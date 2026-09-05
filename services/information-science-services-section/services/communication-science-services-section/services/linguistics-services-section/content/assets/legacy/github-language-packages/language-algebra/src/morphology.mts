// morphology.ts — the generative word-form algebra.
//
// Inflection builds surface forms from lemmas (conjugate, pluralize, choose an
// article); lemmatization is its partial inverse (surface → lemma candidates).
// These are the nameable generators of the language's word algebra; they act
// over a compiled fiber and return forms, never parse structure.
import type { CompiledBundle } from "./fiber.mjs";

// ── inflection (lemma → surface) ──────────────────────────────────────────────

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
    const pastForm = irreg?.["past"] ?? (lower.endsWith("e") ? lower + "d" : lower + "ed");
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

// ── lemmatization (surface → lemma) ───────────────────────────────────────────

/** Return one or more lemma candidates for a word.
 * Irregular forms are checked first; the word itself is always a candidate.
 * Never empty: unknown words return [word.toLowerCase()]. */
export function lemma(word: string, _tags: readonly string[], bundle: CompiledBundle): readonly string[] {
  const lower = word.toLowerCase();
  const irreg = bundle.raw.morphology.irregularVerbs;

  // Check irregular verb table
  if (irreg) {
    for (const [base, forms] of Object.entries(irreg)) {
      if (Object.values(forms as Record<string, string>).includes(lower) || base === lower) {
        return [base];
      }
    }
  }

  // Check irregular plurals (in reverse: plural → singular)
  const irregPlurals = bundle.raw.morphology.irregularPlurals ?? {};
  for (const [sing, pl] of Object.entries(irregPlurals)) {
    if (pl === lower) return [sing];
  }

  // Default: the lowercased word is its own lemma
  return [lower];
}
