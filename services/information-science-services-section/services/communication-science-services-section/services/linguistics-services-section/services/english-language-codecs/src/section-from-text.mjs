// section-from-text.mjs — bridge the shared engine's parse output into a
// language-generation section. Mechanically ported (types stripped) from the
// recovered
// content/assets/legacy/github-language-packages/english-language-codecs/src/section-from-text.mts.
// Logic is unchanged.
import { lemma, conjugate, articulate, parse, roles, polarity, temporal, TRUE, FALSE, TOP, BOTTOM } from "../../../lib/language-engine/index.mjs";
import { bundle as english } from "./realize.mjs";

function chargeFor(value) {
  if (value === "potential") return TRUE;
  if (value === "active") return FALSE;
  if (value === "stable") return TOP;
  return BOTTOM;
}

function firstSentence(text, bundle) {
  const base = articulate(text, bundle);
  const sentence = base.spans.find((s) => s.tier === "sentence") ?? base.document;
  return { base, sentence };
}

function predicateBase(word, tags, tense, bundle) {
  const [candidate = word.toLowerCase()] = lemma(word, tags, bundle);
  if (!tags.includes("verb") || tense !== "past") return candidate;

  const lower = word.toLowerCase();
  const regularCandidates = lower.endsWith("ed")
    ? [lower.slice(0, -1), lower.slice(0, -2)].filter((item) => item.length > 0)
    : [];
  return regularCandidates.find((item) => conjugate(item, { tense: "past" }, bundle) === lower)
    ?? candidate;
}

/** Parse prose with the shared engine and lift its role/polarity/tense analysis into a settled section. */
export function sectionFromText(text, bundle = english) {
  const { base, sentence } = firstSentence(text, bundle);
  const parsed = parse(sentence, base, bundle);
  const roleFrames = roles(parsed);
  const polarityFrames = polarity(parsed);
  const temporalFrames = temporal(parsed);

  const roleByVerb = new Map(roleFrames.map((r) => [r.verb, r]));
  const tenseByVerb = new Map(temporalFrames.map((t) => [t.verb, t]));

  const cells = polarityFrames.map((pol, index) => {
    const role = roleByVerb.get(pol.verb) ?? roleFrames[index];
    const tense = tenseByVerb.get(pol.verb)?.tense;
    const verbWord = parsed.words.find((w) => w.text === pol.verb);
    const clauseTense = tense === "future" ? "future" : tense ?? "present";
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
