// section-from-text.ts — bridge language-parsing parse output into a language-generation section.
import type { SectionSpec, SectionCell, ClauseSpec } from "./types.mts";
import type { CompiledBundle } from "@lenticule-science/language-algebra";
import { lemma, conjugate } from "@lenticule-science/language-algebra";
import { articulate, parse, TRUE, FALSE, TOP, BOTTOM } from "@lenticule-science/language-topology";
import { roles, polarity, temporal } from "@lenticule-science/language-analysis";
import english from "@lenticule-science/english-language-algebra";

function chargeFor(value: string) {
  if (value === "potential") return TRUE;
  if (value === "active") return FALSE;
  if (value === "stable") return TOP;
  return BOTTOM;
}

function firstSentence(text: string, bundle: CompiledBundle) {
  const base = articulate(text, bundle);
  const sentence = base.spans.find((s) => s.tier === "sentence") ?? base.document;
  return { base, sentence };
}

function predicateBase(
  word: string,
  tags: readonly string[],
  tense: ClauseSpec["tense"],
  bundle: CompiledBundle,
): string {
  const [candidate = word.toLowerCase()] = lemma(word, tags, bundle);
  if (!tags.includes("verb") || tense !== "past") return candidate;

  const lower = word.toLowerCase();
  const regularCandidates = lower.endsWith("ed")
    ? [lower.slice(0, -1), lower.slice(0, -2)].filter((item) => item.length > 0)
    : [];
  return regularCandidates.find((item) => conjugate(item, { tense: "past" }, bundle) === lower)
    ?? candidate;
}

/** Parse prose with language-parsing and lift its role/polarity/tense analysis into a settled section. */
export function sectionFromText(text: string, bundle: CompiledBundle = english): SectionSpec {
  const { base, sentence } = firstSentence(text, bundle);
  const parsed = parse(sentence, base, bundle);
  const roleFrames = roles(parsed);
  const polarityFrames = polarity(parsed);
  const temporalFrames = temporal(parsed);

  const roleByVerb = new Map(roleFrames.map((r) => [r.verb, r]));
  const tenseByVerb = new Map(temporalFrames.map((t) => [t.verb, t]));

  const cells: SectionCell[] = polarityFrames.map((pol, index) => {
    const role = roleByVerb.get(pol.verb) ?? roleFrames[index];
    const tense = tenseByVerb.get(pol.verb)?.tense;
    const verbWord = parsed.words.find((w) => w.text === pol.verb);
    const clauseTense: ClauseSpec["tense"] = tense === "future" ? "future" : tense ?? "present";
    const predicate = predicateBase(pol.verb, verbWord?.tags ?? ["verb"], clauseTense, bundle);
    const obliques = [
      ...(role?.instrument ? [{ prep: "with", object: role.instrument }] : []),
      ...(role?.recipient ? [{ prep: "to", object: role.recipient }] : []),
      ...(role?.location ? [{ prep: "in", object: role.location }] : []),
    ];
    return {
      predicate,
      object: role?.patient ?? null,
      charge: chargeFor(pol.asserted),
      tense: clauseTense,
      ...(obliques.length > 0 ? { obliques } : {}),
    };
  });

  return {
    subject: roleFrames[0]?.agent ?? null,
    cells,
    source: { text, base, sentence, parsed },
  };
}

export default sectionFromText;
