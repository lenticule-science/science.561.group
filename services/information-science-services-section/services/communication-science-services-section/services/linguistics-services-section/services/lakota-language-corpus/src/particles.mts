import { action, jsonResource, type Action, type JsonValue } from "@emsenn/relating";

export type LakotaParticleFunction =
  | "attested-declarative-final"
  | "attested-interrogative-final"
  | "attested-emphatic-final";

export interface LakotaParticleWitness {
  readonly label: string;
  readonly locator: string;
}

export interface LakotaParticleRule {
  readonly form: string;
  readonly normalizedForm: string;
  readonly position: "sentence-final";
  readonly function: LakotaParticleFunction;
  readonly certainty: "underdetermined";
  readonly features: readonly string[];
  readonly witnesses: readonly LakotaParticleWitness[];
}

export interface LakotaParticleToken {
  readonly text: string;
  readonly normalizedForm: string;
  readonly index: number;
  readonly position: LakotaParticleRule["position"];
  readonly function: LakotaParticleRule["function"];
  readonly certainty: LakotaParticleRule["certainty"];
  readonly features: readonly string[];
  readonly witnesses: readonly LakotaParticleWitness[];
}

export interface LakotaParticleAnalysis {
  readonly kind: "communicating-in-lakota.particle-analysis";
  readonly input: string;
  readonly particles: readonly LakotaParticleToken[];
}

const particleRules = Object.freeze([
  {
    form: "weló",
    normalizedForm: "yeló",
    position: "sentence-final",
    function: "attested-declarative-final",
    certainty: "underdetermined",
    features: Object.freeze([
      "particle:attested-declarative-final",
      "particle:orthographic-variant:weló",
      "function:underdetermined",
    ]),
    witnesses: Object.freeze([
      Object.freeze({
        label: "Black Elk letters local research note",
        locator: "dev/content/researching/notes/lakota-corpus.md/2026-06-26-black-elk-letters.md:21",
      }),
    ]),
  },
  {
    form: "yeló",
    normalizedForm: "yeló",
    position: "sentence-final",
    function: "attested-declarative-final",
    certainty: "underdetermined",
    features: Object.freeze(["particle:attested-declarative-final", "function:underdetermined"]),
    witnesses: Object.freeze([
      Object.freeze({
        label: "Black Elk letters local research note",
        locator: "dev/content/researching/notes/lakota-corpus.md/2026-06-26-black-elk-letters.md:75",
      }),
    ]),
  },
  {
    form: "he",
    normalizedForm: "he",
    position: "sentence-final",
    function: "attested-interrogative-final",
    certainty: "underdetermined",
    features: Object.freeze(["particle:attested-interrogative-final", "function:underdetermined"]),
    witnesses: Object.freeze([
      Object.freeze({
        label: "Lakota corpus local research note",
        locator: "dev/content/researching/notes/lakota-corpus.md/2026-06-26-lakota-corpus.md:171",
      }),
    ]),
  },
  {
    form: "hwo",
    normalizedForm: "hwo",
    position: "sentence-final",
    function: "attested-interrogative-final",
    certainty: "underdetermined",
    features: Object.freeze(["particle:attested-interrogative-final", "function:underdetermined"]),
    witnesses: Object.freeze([
      Object.freeze({
        label: "Lakota corpus local research note",
        locator: "dev/content/researching/notes/lakota-corpus.md/2026-06-26-lakota-corpus.md:242",
      }),
    ]),
  },
  {
    form: "kštó",
    normalizedForm: "kštó",
    position: "sentence-final",
    function: "attested-emphatic-final",
    certainty: "underdetermined",
    features: Object.freeze(["particle:attested-emphatic-final", "function:underdetermined"]),
    witnesses: Object.freeze([
      Object.freeze({
        label: "Lakota corpus local research note",
        locator: "dev/content/researching/notes/lakota-corpus.md/2026-06-26-lakota-corpus.md:196",
      }),
    ]),
  },
] satisfies readonly LakotaParticleRule[]);

const particleRuleByForm = new Map<string, LakotaParticleRule>(
  particleRules.map((rule) => [rule.form, rule]),
);

function wordsOf(input: string): readonly string[] {
  return input.match(/[\p{L}\p{M}'’]+/gu) ?? [];
}

export const lakotaParticleRules: readonly LakotaParticleRule[] = particleRules;

export function analyzeLakotaParticles(input: string): LakotaParticleAnalysis {
  const particles = wordsOf(input).flatMap((text, index) => {
    const rule = particleRuleByForm.get(text.toLowerCase());
    if (rule === undefined) return [];
    return [Object.freeze({
      text,
      normalizedForm: rule.normalizedForm,
      index,
      position: rule.position,
      function: rule.function,
      certainty: rule.certainty,
      features: rule.features,
      witnesses: rule.witnesses,
    })];
  });

  return Object.freeze({
    kind: "communicating-in-lakota.particle-analysis" as const,
    input,
    particles: Object.freeze(particles),
  });
}

function particleInputText(input: unknown): string {
  if (typeof input === "string") return input;
  if (typeof input !== "object" || input === null) return "";
  const record = input as Record<string, unknown>;
  return typeof record["text"] === "string" ? record["text"] : "";
}

export const analyzeLakotaParticlesAction: Action = action({
  verb: "analyze-lakota-particles",
  inputFormat: "json",
  outputFormat: "json",
  summary: "Analyze finite witnessed Lakota sentence-final particles.",
  description: "Domain: JSON string or object with text. Codomain: line-cited, underdetermined Lakota particle witnesses; this is finite evidence readback, not a complete particle grammar.",
  run: (input: unknown): JsonValue =>
    jsonResource(analyzeLakotaParticles(particleInputText(input)), "Lakota particle analysis"),
});
