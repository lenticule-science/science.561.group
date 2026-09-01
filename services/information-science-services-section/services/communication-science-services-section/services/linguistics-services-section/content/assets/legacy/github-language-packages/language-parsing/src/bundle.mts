// bundle.ts — compile a RawBundle into a CompiledBundle with fast lookup functions.
// The compiled bundle is passed through the entire parse pipeline; all language-specific
// decisions (closed class lists, morphology, segmentation) live here.
import type { RawBundle, CompiledBundle, PronounFeatures, BundleAttachment, BundleMeta } from "./types.mjs";

export type { RawBundle, CompiledBundle } from "./types.mjs";

/** Compile a raw language bundle into efficient lookup functions. */
export function load(raw: RawBundle): CompiledBundle {
  const { lexicon, morphology, reference, segmentation } = raw;

  // Build closed-class sets
  const detSet = new Set(lexicon.determiners.map((w) => w.toLowerCase()));
  const prepSet = new Set(lexicon.prepositions.map((w) => w.toLowerCase()));
  const pronSet = new Set(lexicon.pronouns.map((w) => w.toLowerCase()));
  const conjSet = new Set(lexicon.conjunctions.map((w) => w.toLowerCase()));
  const auxSet = new Set(lexicon.auxiliaries.map((w) => w.toLowerCase()));
  const copSet = new Set(lexicon.copula.map((w) => w.toLowerCase()));

  // Build suffix rule matchers
  const suffixMatchers = morphology.suffixRules.map((r) => ({
    re: new RegExp(r.pattern, "i"),
    tag: r.tag,
  }));
  const verbFormMatchers = morphology.verbFormRules.map((r) => ({
    re: new RegExp(r.pattern, "i"),
    form: r.tag,
  }));

  // Build pronoun lookup
  const pronRef = new Map<string, PronounFeatures>(
    Object.entries(reference.pronouns).map(([w, f]) => [w.toLowerCase(), f]),
  );

  // Build irregular lookups
  const irregularPlurals = new Map(Object.entries(morphology.irregularPlurals ?? {}));
  const numberSuffixRe = morphology.numberSuffixPattern === ""
    ? null
    : new RegExp(morphology.numberSuffixPattern, "i");
  const numberWordSet = new Set(morphology.numberWords.map((w) => w.toLowerCase()));

  // Build abbreviation set
  const abbrevSet = new Set(segmentation.abbreviations.map((a) => a.toLowerCase()));

  // Sentence terminator pattern
  const sentTermRe = new RegExp(segmentation.sentenceTerminatorPattern, "gu");

  function closedClassTags(lower: string): readonly string[] {
    if (detSet.has(lower)) return ["det"];
    if (prepSet.has(lower)) return ["prep"];
    if (pronSet.has(lower)) return ["pron"];
    if (conjSet.has(lower)) return ["conj"];
    if (auxSet.has(lower)) return ["aux"];
    return [];
  }

  function morphologyTags(word: string): readonly string[] {
    const tags: string[] = [];
    if (/^\d[\d,.]*$/.test(word) || numberWordSet.has(word.toLowerCase())) {
      tags.push("num");
    }
    for (const { re, tag } of suffixMatchers) {
      if (re.test(word) && !tags.includes(tag)) tags.push(tag);
    }
    if (tags.length === 0) tags.push("noun");
    return tags;
  }

  function numberFeatures(word: string, tags: readonly string[]): readonly ("sg" | "pl")[] {
    const lower = word.toLowerCase();
    // Pronoun with known number
    const pf = pronRef.get(lower);
    if (pf) {
      if (pf.number === null) return [];
      if (pf.number === "both") return ["sg", "pl"];
      return [pf.number];
    }
    if (!tags.includes("noun")) return [];
    // Irregular plural
    if (irregularPlurals.has(lower)) return ["pl"];
    // Uncountable / invariant plurals (sheep, data, etc.)
    if (numberSuffixRe?.test(lower)) return ["pl"];
    // Default singular
    return ["sg"];
  }

  function verbForm(word: string, _tags: readonly string[]): string | null {
    for (const { re, form } of verbFormMatchers) {
      if (re.test(word)) return form;
    }
    return null;
  }

  return {
    raw,
    meta: raw.meta as BundleMeta,
    wordOrder: raw.wordOrder,
    ...(raw.roleBy !== undefined ? { roleBy: raw.roleBy } : {}),
    attachment: raw.attachment as BundleAttachment,
    closedClassTags,
    morphologyTags,
    numberFeatures,
    verbForm,
    isCopula: (lower) => copSet.has(lower),
    isPronoun: (lower) => pronSet.has(lower),
    pronounFeatures: (lower) => pronRef.get(lower) ?? null,
    isAbbreviation: (word) => abbrevSet.has(word.toLowerCase()),
    sentenceTerminators: sentTermRe,
  };
}
