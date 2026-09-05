import type { CompiledBundle } from "./fiber.mjs";
/** Conjugate a verb lemma to a surface form given tense/person/number.
 * Falls back to suffix rules, then the base form itself. */
export declare function conjugate(base: string, opts: {
    tense: "past" | "present" | "future";
    person?: 1 | 2 | 3;
    number?: "sg" | "pl";
}, bundle: CompiledBundle): string;
/** Pluralize a noun lemma. */
export declare function pluralize(noun: string, bundle: CompiledBundle): string;
/** Choose "a" or "an" for a word based on its pronunciation onset.
 * Uses vowel-onset heuristic; does not handle all edge cases. */
export declare function indefiniteArticle(word: string, _bundle: CompiledBundle): string;
/** Return one or more lemma candidates for a word.
 * Irregular forms are checked first; the word itself is always a candidate.
 * Never empty: unknown words return [word.toLowerCase()]. */
export declare function lemma(word: string, _tags: readonly string[], bundle: CompiledBundle): readonly string[];
//# sourceMappingURL=morphology.d.mts.map