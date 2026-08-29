import { read as readOver } from "@emsenn/communicating";
import type { ParsedWord } from "@emsenn/communicating/speaking/listening/parsing";
import { action, jsonResource, type Action, type JsonValue } from "@emsenn/relating";

import lakota from "./compiled.mjs";

export type LakotaAgreementRole = "actor" | "undergoer";
export type LakotaParticipantValue = "speaker" | "listener" | "third-or-unmarked";
export type LakotaFrameCertainty = "witnessed" | "underdetermined";

export interface LakotaFrameRule {
  readonly root: string;
  readonly frame: string;
  readonly valence: string;
  readonly certainty: LakotaFrameCertainty;
  readonly roles: readonly string[];
  readonly witnesses: readonly string[];
}

export interface LakotaImplicitParticipant {
  readonly role: LakotaAgreementRole;
  readonly value: LakotaParticipantValue;
  readonly sourceFeature: string;
  readonly implicit: true;
  readonly certainty: LakotaFrameCertainty;
}

export interface LakotaVerbFrame {
  readonly surface: string;
  readonly sentenceIndex: number;
  readonly index: number;
  readonly root: string;
  readonly template: string | null;
  readonly frame: string;
  readonly valence: string;
  readonly certainty: LakotaFrameCertainty;
  readonly participants: readonly LakotaImplicitParticipant[];
  readonly features: readonly string[];
  readonly witnesses: readonly string[];
}

export interface LakotaFrameAnalysis {
  readonly kind: "communicating-in-lakota.frame-analysis";
  readonly input: string;
  readonly frames: readonly LakotaVerbFrame[];
}

const frameRules = Object.freeze([
  Object.freeze({
    root: "čhíŋ",
    frame: "desire/want",
    valence: "actor plus possible desired complement; complement underdetermined when absent",
    certainty: "underdetermined",
    roles: Object.freeze(["actor", "possible-complement"]),
    witnesses: Object.freeze([
      "LDL 121 packet, Class I singular verb examples",
      "dev/content/researching/notes/lakota-corpus.md/2026-06-26-black-elk-letters.md:21",
      "dev/content/researching/notes/lakota-corpus.md/2026-06-26-lakota-corpus.md:171",
    ]),
  }),
  Object.freeze({
    root: "yuhá",
    frame: "possession/having",
    valence: "actor/possessor plus possible possessed theme; theme underdetermined when absent",
    certainty: "underdetermined",
    roles: Object.freeze(["actor-or-possessor", "possible-theme"]),
    witnesses: Object.freeze([
      "LDL 121 packet, Class II y-stem singular verb examples",
      "dev/content/researching/notes/lakota-corpus.md/2026-06-26-black-elk-letters.md:53",
      "dev/content/researching/notes/lakota-corpus.md/2026-06-26-lakota-corpus.md:265",
    ]),
  }),
  Object.freeze({
    root: "úŋ",
    frame: "stative-being/location",
    valence: "undergoer/state-holder; state or location complement underdetermined when absent",
    certainty: "underdetermined",
    roles: Object.freeze(["undergoer-or-state-holder", "possible-state-or-location"]),
    witnesses: Object.freeze([
      "LDL 121 packet, Class III singular verb examples",
      "dev/content/researching/notes/lakota-corpus.md/2026-06-26-lakota-corpus.md:272",
      "dev/content/researching/notes/lakota-corpus.md/2026-06-26-lakota-corpus.md:273",
    ]),
  }),
  Object.freeze({
    root: "ečíyapi",
    frame: "naming/calling",
    valence: "undergoer/name-bearer plus possible name content; name content underdetermined when absent",
    certainty: "underdetermined",
    roles: Object.freeze(["undergoer-or-name-bearer", "possible-name-content"]),
    witnesses: Object.freeze([
      "LDL 121 packet, singular forms for ečíyapi",
      "dev/content/researching/notes/lakota-corpus.md/2026-06-26-black-elk-letters.md:85",
    ]),
  }),
] satisfies readonly LakotaFrameRule[]);

const frameRuleByRoot = new Map<string, LakotaFrameRule>(
  frameRules.map((rule) => [rule.root, rule]),
);

export const lakotaFrameRules: readonly LakotaFrameRule[] = frameRules;

function featureValue(features: readonly string[], prefix: string): string | null {
  const found = features.find((feature) => feature.startsWith(prefix));
  return found === undefined ? null : found.slice(prefix.length);
}

function participantFromFeature(feature: string): LakotaImplicitParticipant | null {
  const actor = "agreement:actor:";
  const undergoer = "agreement:undergoer:";
  const role: LakotaAgreementRole | null = feature.startsWith(actor)
    ? "actor"
    : feature.startsWith(undergoer)
      ? "undergoer"
      : null;
  if (role === null) return null;

  const value = feature.slice(role === "actor" ? actor.length : undergoer.length);
  const participantValue: LakotaParticipantValue =
    value === "1sg" ? "speaker" : value === "2sg" ? "listener" : "third-or-unmarked";

  return Object.freeze({
    role,
    value: participantValue,
    sourceFeature: feature,
    implicit: true as const,
    certainty: value === "3sg-or-unmarked" ? "underdetermined" : "witnessed",
  });
}

function frameInputText(input: unknown): string {
  if (typeof input === "string") return input;
  if (typeof input !== "object" || input === null) return "";
  const record = input as Record<string, unknown>;
  return typeof record["text"] === "string" ? record["text"] : "";
}

function sentenceTexts(input: string): readonly string[] {
  return Object.freeze((input.match(/[^.!?]+[.!?]?/gu) ?? [])
    .map((sentence) => sentence.trim())
    .filter((sentence) => sentence.length > 0));
}

function analyzeSentenceFrames(input: string, sentenceIndex: number): readonly LakotaVerbFrame[] {
  const result = readOver(input, lakota).parse;
  const frames = result.words.flatMap((word: ParsedWord) => {
    if (!word.tags.includes("verb")) return [];
    const root = featureValue(word.feats, "root:");
    if (root === null) return [];
    const rule = frameRuleByRoot.get(root);
    if (rule === undefined) return [];

    const participants = word.feats
      .map(participantFromFeature)
      .filter((participant: LakotaImplicitParticipant | null): participant is LakotaImplicitParticipant =>
        participant !== null);
    const template = featureValue(word.feats, "template:");

    return [Object.freeze({
      surface: word.text,
      sentenceIndex,
      index: word.i,
      root,
      template,
      frame: rule.frame,
      valence: rule.valence,
      certainty: rule.certainty,
      participants: Object.freeze(participants),
      features: word.feats,
      witnesses: rule.witnesses,
    })];
  });
  return Object.freeze(frames);
}

export function analyzeLakotaFrames(input: string): LakotaFrameAnalysis {
  const frames = sentenceTexts(input).flatMap((sentence, sentenceIndex) =>
    analyzeSentenceFrames(sentence, sentenceIndex));
  return Object.freeze({
    kind: "communicating-in-lakota.frame-analysis" as const,
    input,
    frames: Object.freeze(frames),
  });
}

export const analyzeLakotaFramesAction: Action = action({
  verb: "analyze-lakota-frames",
  inputFormat: "json",
  outputFormat: "json",
  summary: "Analyze finite witnessed Lakota verb frames.",
  description: "Domain: JSON string or object with text. Codomain: manifest-backed Lakota verb-frame carriers with agreement-derived implicit participants; this is finite evidence readback, not a complete semantic parser.",
  run: (input: unknown): JsonValue =>
    jsonResource(analyzeLakotaFrames(frameInputText(input)), "Lakota frame analysis"),
});
